using System.Collections.Generic;
using System.Text.RegularExpressions;
using NGames.Core.Events;
using UnityEngine;

#if UNITY_WEBGL && !UNITY_EDITOR
using System.Runtime.InteropServices;
#endif

namespace NGames.UI
{
    /// <summary>
    /// Self-bootstrapping character voice system.
    /// Uses OS TTS (macOS: `say`, Windows: PowerShell/SAPI, WebGL: Web Speech API).
    /// Speaks only tagged character lines — narrator text is always silent.
    /// </summary>
    public class VoiceManager : MonoBehaviour
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        private static void Bootstrap()
        {
            if (FindFirstObjectByType<VoiceManager>() != null) return;
            var go = new GameObject("[VoiceManager]");
            DontDestroyOnLoad(go);
            go.AddComponent<VoiceManager>();
        }

        // ── Per-character voice configuration ─────────────────────────────────
        private struct VoiceConfig
        {
            public string MacOSVoice;
            public int    Rate;        // words per minute
        }

        private static readonly Dictionary<string, VoiceConfig> CharVoices = new()
        {
            // Name           macOS voice       wpm  — chosen for character feel
            { "fang",       new VoiceConfig { MacOSVoice = "Samantha", Rate = 195 } }, // sharp, direct
            { "marcus",     new VoiceConfig { MacOSVoice = "Alex",     Rate = 112 } }, // deep, measured
            { "lawrence",   new VoiceConfig { MacOSVoice = "Daniel",   Rate = 162 } }, // British, refined
            { "tiberius",   new VoiceConfig { MacOSVoice = "Fred",     Rate = 128 } }, // gruff, older
            { "ishani",     new VoiceConfig { MacOSVoice = "Samantha", Rate = 168 } }, // protagonist
            { "water",      new VoiceConfig { MacOSVoice = "Victoria", Rate = 138 } }, // ethereal
            { "sky",        new VoiceConfig { MacOSVoice = "Victoria", Rate = 145 } }, // ethereal
            { "stone",      new VoiceConfig { MacOSVoice = "Fred",     Rate = 105 } }, // slow, ancient
            { "tidewarden", new VoiceConfig { MacOSVoice = "Tom",      Rate = 132 } },
            { "sera",       new VoiceConfig { MacOSVoice = "Kate",     Rate = 158 } },
            { "tariq",      new VoiceConfig { MacOSVoice = "Alex",     Rate = 145 } },
            { "batu",       new VoiceConfig { MacOSVoice = "Alex",     Rate = 128 } }, // contemplative
            { "kira",       new VoiceConfig { MacOSVoice = "Samantha", Rate = 192 } }, // energetic
            { "yildiz",     new VoiceConfig { MacOSVoice = "Karen",    Rate = 158 } },
            { "almas",      new VoiceConfig { MacOSVoice = "Victoria", Rate = 150 } }, // otherworldly
            { "warden",     new VoiceConfig { MacOSVoice = "Tom",      Rate = 130 } },
            { "player",     new VoiceConfig { MacOSVoice = "Samantha", Rate = 165 } },
        };

        private static readonly VoiceConfig DefaultFemale = new() { MacOSVoice = "Samantha", Rate = 160 };
        private static readonly VoiceConfig DefaultMale   = new() { MacOSVoice = "Alex",     Rate = 148 };

        // ── State ─────────────────────────────────────────────────────────────
        private string _currentSpeaker = string.Empty;

#if UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
        private System.Diagnostics.Process _sayProcess;
#endif

        // ── Lifecycle ──────────────────────────────────────────────────────────
        private void OnEnable()
        {
            GameEventBus.Subscribe<SpeakerChangedEvent>(OnSpeaker);
            GameEventBus.Subscribe<StoryLineReadEvent>(OnLine);
            GameEventBus.Subscribe<SceneTransitionEvent>(_ => StopSpeech());
            GameEventBus.Subscribe<StoryEndedEvent>(_ => StopSpeech());
            GameEventBus.Subscribe<ChoicePresentedEvent>(_ => StopSpeech());
        }

        private void OnDisable()
        {
            GameEventBus.Unsubscribe<SpeakerChangedEvent>(OnSpeaker);
            GameEventBus.Unsubscribe<StoryLineReadEvent>(OnLine);
            GameEventBus.Unsubscribe<SceneTransitionEvent>(_ => StopSpeech());
            GameEventBus.Unsubscribe<StoryEndedEvent>(_ => StopSpeech());
            GameEventBus.Unsubscribe<ChoicePresentedEvent>(_ => StopSpeech());
        }

        private void OnDestroy() => StopSpeech();

        // ── Event handlers ─────────────────────────────────────────────────────
        private void OnSpeaker(SpeakerChangedEvent ev)
        {
            _currentSpeaker = ev.SpeakerName?.ToLowerInvariant() ?? string.Empty;

            // If speaker cleared (narrator coming), silence any in-progress speech
            if (string.IsNullOrEmpty(_currentSpeaker)) StopSpeech();
        }

        private void OnLine(StoryLineReadEvent ev)
        {
            // Narrator lines are intentionally silent — let the player read them
            if (string.IsNullOrEmpty(_currentSpeaker)) return;

            Speak(ev.Text, _currentSpeaker);
        }

        // ── Speech dispatch ────────────────────────────────────────────────────
        private void Speak(string rawText, string characterKey)
        {
            StopSpeech();
            var text = StripMarkup(rawText);
            if (string.IsNullOrWhiteSpace(text)) return;

            var cfg = CharVoices.TryGetValue(characterKey, out var v) ? v : DefaultFemale;

#if UNITY_WEBGL && !UNITY_EDITOR
            JS_SpeakWebGL(text, cfg.Rate);
#elif UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
            SpeakMacOS(text, cfg.MacOSVoice, cfg.Rate);
#elif UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN
            SpeakWindows(text, cfg.Rate);
#endif
        }

#if UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
        private void SpeakMacOS(string text, string voice, int rate)
        {
            // Single-quote the text; escape any embedded single quotes
            var escaped = text.Replace("'", "'\\''");
            var info = new System.Diagnostics.ProcessStartInfo("say",
                $"-v \"{voice}\" -r {rate} '{escaped}'")
            {
                UseShellExecute = false,
                CreateNoWindow  = true,
            };
            _sayProcess = new System.Diagnostics.Process { StartInfo = info };
            try   { _sayProcess.Start(); }
            catch (System.Exception e)
            { Debug.LogWarning($"[VoiceManager] say failed: {e.Message}"); }
        }
#endif

#if UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN
        private void SpeakWindows(string text, int rate)
        {
            // Map wpm (~80–300) to SAPI rate (-10 to +10)
            int sapiRate = Mathf.RoundToInt(Mathf.Lerp(-10f, 10f, (rate - 80f) / 220f));
            var escaped  = text.Replace("\"", "'");
            var script   = $"Add-Type -AssemblyName System.speech; " +
                           $"$s=New-Object System.Speech.Synthesis.SpeechSynthesizer; " +
                           $"$s.Rate={sapiRate}; " +
                           $"$s.Speak(\\\"{escaped}\\\")";
            var info = new System.Diagnostics.ProcessStartInfo("powershell",
                $"-Command \"{script}\"")
            {
                UseShellExecute = false,
                CreateNoWindow  = true,
            };
            try   { new System.Diagnostics.Process { StartInfo = info }.Start(); }
            catch (System.Exception e)
            { Debug.LogWarning($"[VoiceManager] PowerShell TTS failed: {e.Message}"); }
        }
#endif

        private void StopSpeech()
        {
#if UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
            if (_sayProcess != null && !_sayProcess.HasExited)
            {
                try { _sayProcess.Kill(); } catch { }
            }
            _sayProcess = null;
#elif UNITY_WEBGL && !UNITY_EDITOR
            JS_StopWebGLSpeech();
#endif
        }

        // ── WebGL JS bridge ────────────────────────────────────────────────────
#if UNITY_WEBGL && !UNITY_EDITOR
        [DllImport("__Internal")] private static extern void JS_SpeakWebGL(string text, int rate);
        [DllImport("__Internal")] private static extern void JS_StopWebGLSpeech();
#endif

        // ── Helpers ────────────────────────────────────────────────────────────
        private static string StripMarkup(string text)
        {
            if (string.IsNullOrEmpty(text)) return text;
            text = Regex.Replace(text, "<[^>]+>", "");               // HTML / TMP tags
            text = Regex.Replace(text, @"\s+", " ").Trim();           // collapse whitespace
            return text;
        }
    }
}
