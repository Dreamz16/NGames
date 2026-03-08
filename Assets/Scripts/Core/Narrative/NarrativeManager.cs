using System;
using System.Collections.Generic;
using Ink.Runtime;
using NGames.Core.Events;
using NGames.Core.State;
using NGames.Episodes;
using NGames.Settings;
using UnityEngine;

namespace NGames.Core.Narrative
{
    /// <summary>
    /// Singleton runtime for all Ink story operations.
    ///
    /// Responsibilities:
    ///   - Load/unload episode stories
    ///   - Drive story progression (Continue / Choice)
    ///   - Parse Ink tags into typed game events
    ///   - Bind external C# functions callable from Ink
    ///   - Expose save/load of Ink story state
    ///
    /// This class has NO UI dependencies — all output goes through GameEventBus.
    /// </summary>
    public class NarrativeManager : MonoBehaviour
    {
        public static NarrativeManager Instance { get; private set; }

        [SerializeField] private NarrativeConfig _config;

        private Story          _story;
        private EpisodeManifest _currentEpisode;

        // ── Public state ───────────────────────────────────────────────────────
        public bool             IsStoryActive    => _story != null;
        public bool             CanContinue      => _story?.canContinue ?? false;
        public List<Choice>     CurrentChoices   => _story?.currentChoices ?? new List<Choice>();
        public string           CurrentEpisodeId => _currentEpisode?.EpisodeId;

        // ── Lifecycle ──────────────────────────────────────────────────────────
        private void Awake()
        {
            if (Instance != null && Instance != this) { Destroy(gameObject); return; }
            Instance = this;
            DontDestroyOnLoad(gameObject);
            if (_config == null)
                _config = Resources.Load<NarrativeConfig>("Config/NarrativeConfig");
        }

        // ── Public API ─────────────────────────────────────────────────────────

        /// <summary>Load an episode, optionally restoring a previously saved state.</summary>
        public void LoadEpisode(EpisodeManifest episode, string savedStateJson = null)
        {
            if (episode?.InkAsset == null)
            {
                Debug.LogError("[NarrativeManager] EpisodeManifest or InkAsset is null.");
                return;
            }

            UnloadCurrentStory();

            _currentEpisode = episode;
            _story = new Story(episode.InkAsset.text);

            if (!string.IsNullOrEmpty(savedStateJson))
                _story.state.LoadJson(savedStateJson);

            BindExternalFunctions();
            SyncPersistentVariablesToInk();

            GameEventBus.Publish(new EpisodeLoadedEvent { EpisodeId = episode.EpisodeId });
            Log($"Episode '{episode.EpisodeTitle}' loaded.");
        }

        /// <summary>
        /// Advance the story by one line.
        /// Fires StoryLineReadEvent and, if choices appear, ChoicePresentedEvent.
        /// Returns the raw text line (trimmed).
        /// </summary>
        public string ContinueStory()
        {
            if (_story == null) { Debug.LogWarning("[NarrativeManager] No story loaded."); return string.Empty; }
            if (!_story.canContinue) { HandleStoryEnd(); return string.Empty; }

            // Auto-skip blank lines (tag-only lines produce empty text).
            // Accumulate tags from every Continue() call so speaker/scene tags
            // on their own line are not lost when the next call overwrites currentTags.
            var allTags = new List<string>();
            string line = _story.Continue().Trim();
            if (_story.currentTags != null) allTags.AddRange(_story.currentTags);

            while (string.IsNullOrEmpty(line) && _story.canContinue)
            {
                line = _story.Continue().Trim();
                if (_story.currentTags != null) allTags.AddRange(_story.currentTags);
            }

            bool speakerTagFound = ProcessTags(allTags);
            if (!speakerTagFound)
                GameEventBus.Publish(new SpeakerChangedEvent { SpeakerName = string.Empty });

            if (!string.IsNullOrEmpty(line))
                GameEventBus.Publish(new StoryLineReadEvent { Text = line, EpisodeId = _currentEpisode?.EpisodeId });

            if (!_story.canContinue && _story.currentChoices.Count == 0)
                HandleStoryEnd();
            else if (_story.currentChoices.Count > 0)
                GameEventBus.Publish(new ChoicePresentedEvent { EpisodeId = _currentEpisode?.EpisodeId, Choices = _story.currentChoices });

            return line;
        }

        /// <summary>Select a choice by index and immediately continue the story.</summary>
        public void MakeChoice(int choiceIndex)
        {
            if (_story == null) return;
            if (choiceIndex < 0 || choiceIndex >= _story.currentChoices.Count)
            {
                Debug.LogError($"[NarrativeManager] Invalid choice index {choiceIndex}.");
                return;
            }

            GameEventBus.Publish(new ChoiceMadeEvent
            {
                EpisodeId   = _currentEpisode?.EpisodeId,
                ChoiceIndex = choiceIndex,
                ChoiceText  = _story.currentChoices[choiceIndex].text
            });

            _story.ChooseChoiceIndex(choiceIndex);
            ContinueStory();
        }

        // ── Variable bridge ────────────────────────────────────────────────────
        public object GetVariable(string name)          => _story?.variablesState[name];
        public void   SetVariable(string name, object v) { if (_story != null) _story.variablesState[name] = v; }

        /// <summary>Returns a snapshot of all live Ink story variables.</summary>
        public Dictionary<string, object> GetAllInkVariables()
        {
            var result = new Dictionary<string, object>();
            if (_story == null) return result;
            foreach (string name in _story.variablesState)
                result[name] = _story.variablesState[name];
            return result;
        }

        // ── Save / Load ────────────────────────────────────────────────────────
        public string GetStoryStateJson() => _story?.state.ToJson();

        // ── Ink Knot / Divert ──────────────────────────────────────────────────
        public void JumpToKnot(string knotName)
        {
            if (_story == null) return;
            _story.ChoosePathString(knotName);
            ContinueStory();
        }

        // ── Internal ───────────────────────────────────────────────────────────
        private void UnloadCurrentStory()
        {
            _story          = null;
            _currentEpisode = null;
        }

        // Returns true if a speaker tag was found
        private bool ProcessTags(List<string> tags)
        {
            if (tags == null) return false;
            bool speakerFound = false;
            foreach (var tag in tags)
                if (ParseTag(tag)) speakerFound = true;
            return speakerFound;
        }

        /// <summary>
        /// Tag convention: "key: value"
        /// Supported keys: speaker, portrait, audio, music, scene, achievement, flag
        /// </summary>
        // Returns true if this tag set the speaker
        private bool ParseTag(string tag)
        {
            var parts = tag.Split(':');
            var key   = parts[0].Trim().ToLowerInvariant();
            var value = parts.Length > 1 ? parts[1].Trim() : string.Empty;

            switch (key)
            {
                case "speaker":
                    GameEventBus.Publish(new SpeakerChangedEvent { SpeakerName = value });
                    return true;
                case "speaker_portrait":
                    GameEventBus.Publish(new SpeakerChangedEvent { SpeakerName = string.Empty, PortraitKey = value });
                    break;
                case "audio":
                    GameEventBus.Publish(new AudioCueEvent { CueName = value, IsMusic = false });
                    break;
                case "music":
                    GameEventBus.Publish(new AudioCueEvent { CueName = value, IsMusic = true });
                    break;
                case "scene":
                    var sceneParts = value.Split('|');
                    GameEventBus.Publish(new SceneTransitionEvent
                    {
                        SceneName       = sceneParts[0].Trim(),
                        TransitionStyle = sceneParts.Length > 1 ? sceneParts[1].Trim() : "fade"
                    });
                    break;
                case "achievement":
                    GameEventBus.Publish(new AchievementUnlockedEvent { AchievementId = value });
                    break;
                case "flag":
                    var flagParts = value.Split('=');
                    bool flagVal  = flagParts.Length < 2 || flagParts[1].Trim() != "false";
                    GameEventBus.Publish(new FlagSetEvent { FlagName = flagParts[0].Trim(), Value = flagVal });
                    GameStateManager.Instance?.SetFlag(flagParts[0].Trim(), flagVal);
                    break;
                default:
                    Log($"Unhandled tag: {tag}");
                    break;
            }
            return false;
        }

        /// <summary>Expose C# helpers to Ink scripts via external functions.</summary>
        private void BindExternalFunctions()
        {
            if (_story == null) return;

            _story.BindExternalFunction("get_player_name", () =>
                GameStateManager.Instance?.SaveData?.PlayerName ?? "Player");

            _story.BindExternalFunction("has_completed_episode", (string epId) =>
                GameStateManager.Instance?.HasCompletedEpisode(epId) ?? false);

            _story.BindExternalFunction("get_flag", (string flagName) =>
                GameStateManager.Instance?.GetFlag(flagName) ?? false);

            _story.BindExternalFunction("get_counter", (string counterName) =>
                GameStateManager.Instance?.GetCounter(counterName) ?? 0);

            _story.BindExternalFunction("increment_counter", (string counterName) =>
                GameStateManager.Instance?.IncrementCounter(counterName) ?? 0);

            _story.BindExternalFunction("episode_number", () =>
                _currentEpisode?.EpisodeNumber ?? 1);
        }

        /// <summary>Push persistent cross-episode data into Ink variables at load time.</summary>
        private void SyncPersistentVariablesToInk()
        {
            if (_story == null || GameStateManager.Instance?.SaveData == null) return;
            var save = GameStateManager.Instance.SaveData;

            // Sync flags
            foreach (var flag in save.Flags)
            {
                try { _story.variablesState[flag.Key] = flag.Value; }
                catch { /* variable may not exist in this episode */ }
            }
        }

        private void HandleStoryEnd()
        {
            GameStateManager.Instance?.MarkEpisodeCompleted(_currentEpisode?.EpisodeId);
            GameEventBus.Publish(new StoryEndedEvent { EpisodeId = _currentEpisode?.EpisodeId });
            Log($"Episode '{_currentEpisode?.EpisodeTitle}' ended.");
        }

        private void Log(string msg)
        {
            if (_config?.VerboseLogging == true) Debug.Log($"[NarrativeManager] {msg}");
        }
    }
}
