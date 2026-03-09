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

        // Lookahead buffer: when narrator batching reads a character line, it is
        // stored here and consumed on the next ContinueStory() call.
        private string       _pendingLine;
        private List<string> _pendingTags;

        // Last character who had an explicit # speaker: tag.
        // Used to keep their portrait visible on quoted continuation lines.
        private string _lastSpeakerName = string.Empty;

        // ── Bond / stat variable tracking ──────────────────────────────────────
        private static readonly string[] BondVars = { "lawrence", "fang", "marcus", "tiberius" };
        private static readonly string[] StatVars  = { "dex", "flow", "end", "stag", "xp", "commitment" };
        private readonly Dictionary<string, int> _varSnapshot = new();

        // ── Public state ───────────────────────────────────────────────────────
        public bool             IsStoryActive    => _story != null;
        public bool             CanContinue      => _pendingLine != null || (_story?.canContinue ?? false);
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
            SnapshotVariables();
            BindVariableObservers();

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

            string line;
            List<string> allTags;

            // Use the lookahead buffer if a character line was pre-read during narrator batching.
            if (_pendingLine != null)
            {
                line    = _pendingLine;
                allTags = _pendingTags ?? new List<string>();
                _pendingLine = null;
                _pendingTags = null;
            }
            else
            {
                if (!_story.canContinue) { HandleStoryEnd(); return string.Empty; }

                allTags = new List<string>();
                line    = _story.Continue().Trim();
                if (_story.currentTags != null) allTags.AddRange(_story.currentTags);

                // Skip tag-only blank lines, accumulating their tags.
                while (string.IsNullOrEmpty(line) && _story.canContinue)
                {
                    line = _story.Continue().Trim();
                    if (_story.currentTags != null) allTags.AddRange(_story.currentTags);
                }
            }

            bool speakerTagFound = ProcessTags(allTags);

            // A continuation line is untagged quoted dialogue from the last known speaker.
            bool isDialogueContinuation = !speakerTagFound
                && !string.IsNullOrEmpty(_lastSpeakerName)
                && !string.IsNullOrEmpty(line)
                && line.TrimStart().StartsWith("\"");

            if (isDialogueContinuation)
                GameEventBus.Publish(new SpeakerChangedEvent { SpeakerName = _lastSpeakerName });
            else if (!speakerTagFound)
            {
                _lastSpeakerName = string.Empty;
                GameEventBus.Publish(new SpeakerChangedEvent { SpeakerName = string.Empty });
            }

            // ── Narrator batching ──────────────────────────────────────────────
            // If this line has no speaker (and is not a dialogue continuation),
            // read ahead and concatenate all consecutive narrator lines.
            if (!speakerTagFound && !isDialogueContinuation && !string.IsNullOrEmpty(line))
            {
                var sb = new System.Text.StringBuilder(line);

                while (_story.canContinue && _story.currentChoices.Count == 0)
                {
                    var nextTags = new List<string>();
                    string nextLine = _story.Continue().Trim();
                    if (_story.currentTags != null) nextTags.AddRange(_story.currentTags);

                    // Skip blank/tag-only lines, accumulating their tags.
                    while (string.IsNullOrEmpty(nextLine) && _story.canContinue)
                    {
                        nextLine = _story.Continue().Trim();
                        if (_story.currentTags != null) nextTags.AddRange(_story.currentTags);
                    }

                    bool nextHasSpeaker = nextTags.Exists(t =>
                        t.Trim().ToLowerInvariant().StartsWith("speaker:"));

                    if (nextHasSpeaker)
                    {
                        // This is a character line — store it for the next ContinueStory() call.
                        _pendingLine = nextLine;
                        _pendingTags = nextTags;
                        break;
                    }

                    if (!string.IsNullOrEmpty(nextLine))
                        sb.Append("\n\n").Append(nextLine);
                }

                line = sb.ToString();
            }
            // ── End narrator batching ──────────────────────────────────────────

            if (!string.IsNullOrEmpty(line))
                GameEventBus.Publish(new StoryLineReadEvent { Text = line, EpisodeId = _currentEpisode?.EpisodeId });

            if (!_story.canContinue && _story.currentChoices.Count == 0 && _pendingLine == null)
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
            _pendingLine     = null;
            _pendingTags     = null;
            _lastSpeakerName = string.Empty;
            _story.ChoosePathString(knotName);
            ContinueStory();
        }

        // ── Internal ───────────────────────────────────────────────────────────
        private void UnloadCurrentStory()
        {
            _story           = null;
            _currentEpisode  = null;
            _pendingLine     = null;
            _pendingTags     = null;
            _lastSpeakerName = string.Empty;
            _varSnapshot.Clear();
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
                    _lastSpeakerName = value;
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

        private void SnapshotVariables()
        {
            _varSnapshot.Clear();
            foreach (var name in BondVars)
                TrySnapshot(name);
            foreach (var name in StatVars)
                TrySnapshot(name);
        }

        private void TrySnapshot(string name)
        {
            try
            {
                var val = _story.variablesState[name];
                if (val != null) _varSnapshot[name] = System.Convert.ToInt32(val);
            }
            catch { }
        }

        private void BindVariableObservers()
        {
            if (_story == null) return;
            foreach (var name in BondVars)  RegisterObserver(name, isBond: true);
            foreach (var name in StatVars)  RegisterObserver(name, isBond: false);
        }

        private void RegisterObserver(string name, bool isBond)
        {
            var captured = name;
            try
            {
                _story.ObserveVariable(captured, (_, val) =>
                {
                    int newInt;
                    try { newInt = System.Convert.ToInt32(val); } catch { return; }

                    if (_varSnapshot.TryGetValue(captured, out int prev) && newInt == prev) return;
                    int delta = newInt - (_varSnapshot.TryGetValue(captured, out int p2) ? p2 : 0);
                    _varSnapshot[captured] = newInt;

                    if (isBond)
                        GameEventBus.Publish(new BondChangedEvent { CharacterName = captured, Delta = delta, NewValue = newInt });
                    else
                        GameEventBus.Publish(new StatChangedEvent { StatName = captured, Delta = delta, NewValue = newInt });
                });
            }
            catch { /* variable may not exist in this episode */ }
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
