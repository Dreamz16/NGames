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
    /// Reads parenthetical stage directions ("(angry) ...") to shape pitch and rate.
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
            public int    Rate;    // words per minute
            public float  Pitch;  // 0.40 (very deep) – 1.60 (high); 1.00 = neutral
        }

        // ── Emotion keyword table ──────────────────────────────────────────────
        // (keyword, rate multiplier, pitch delta)
        private static readonly (string kw, float rateMult, float pitchDelta)[] EmotionMap =
        {
            ("fast",       1.35f,  0.05f),
            ("quick",      1.35f,  0.05f),
            ("urgent",     1.30f,  0.05f),
            ("angry",      1.12f, -0.10f),
            ("fierce",     1.15f, -0.12f),
            ("growl",      1.00f, -0.18f),
            ("snarl",      0.98f, -0.20f),
            ("furious",    1.20f, -0.10f),
            ("tense",      1.20f,  0.05f),
            ("anxious",    1.15f,  0.06f),
            ("strained",   1.10f,  0.04f),
            ("surprised",  0.90f,  0.15f),
            ("shocked",    0.85f,  0.18f),
            ("sad",        0.78f, -0.10f),
            ("resigned",   0.72f, -0.12f),
            ("hollow",     0.75f, -0.08f),
            ("flat",       0.80f, -0.06f),
            ("slow",       0.68f, -0.05f),
            ("careful",    0.75f,  0.00f),
            ("measured",   0.82f,  0.00f),
            ("quiet",      0.78f, -0.05f),
            ("whisper",    0.68f, -0.06f),
            ("soft",       0.78f,  0.00f),
            ("barely",     0.72f, -0.03f),
            ("warm",       0.90f,  0.02f),
            ("gentle",     0.85f,  0.02f),
            ("calm",       0.85f,  0.00f),
            ("bitter",     1.05f,  0.08f),
            ("sharp",      1.05f,  0.08f),
            ("cutting",    1.05f,  0.07f),
            ("dry",        0.95f,  0.00f),
            ("laughing",   1.10f,  0.12f),
            ("amused",     1.05f,  0.10f),
            ("wry",        0.95f,  0.03f),
            ("low",        0.82f, -0.07f),
            ("broken",     0.70f, -0.12f),
        };

        private static readonly Regex StageDirectionRe =
            new Regex(@"^(""?)\(([^)]+)\)\s*", RegexOptions.Compiled);

        // ── Per-character voice configuration ─────────────────────────────────
        // Neural/Enhanced voices must be downloaded in System Settings > Accessibility >
        // Spoken Content > System Voice > Manage Voices.
        // Recommended downloads: Ava (US), Evan (US), Allison (US), Daniel (UK), Aaron (US)
        private static readonly Dictionary<string, VoiceConfig> CharVoices = new()
        {
            // Fang — female werewolf: husky, assertive, fast.
            //   Zoe (Enhanced) is expressive; pitch pulled below neutral for a feral edge.
            { "fang",       new VoiceConfig { MacOSVoice = "Zoe",     Rate = 188, Pitch = 0.82f } },

            // Marcus — man-bear: Evan (Enhanced) at very low pitch gives a natural
            //   deep rumble — far more human-sounding than the synthesised Fred voice.
            { "marcus",     new VoiceConfig { MacOSVoice = "Evan",    Rate =  85, Pitch = 0.58f } },

            // Lawrence — Korean male: Yuna is macOS's Korean voice (female timbre).
            //   Pitch pulled down to read more masculine while keeping the accent.
            { "lawrence",   new VoiceConfig { MacOSVoice = "Yuna",    Rate = 152, Pitch = 0.78f } },

            // Tiberius — weathered bartender: Daniel (UK) has a warm, natural baritone —
            //   measured and world-weary without sounding robotic.
            { "tiberius",   new VoiceConfig { MacOSVoice = "Daniel",  Rate = 118, Pitch = 0.82f } },

            // Ishani — protagonist: Ava (Enhanced) is the most natural-sounding US
            //   English female voice available on macOS.
            { "ishani",     new VoiceConfig { MacOSVoice = "Ava",     Rate = 162, Pitch = 1.00f } },

            // Elemental spirits — Allison (Enhanced) reads as clear and human;
            //   pitch adjustments give each element its distinct ethereal quality.
            { "water",      new VoiceConfig { MacOSVoice = "Allison", Rate = 128, Pitch = 1.15f } },
            { "sky",        new VoiceConfig { MacOSVoice = "Allison", Rate = 138, Pitch = 1.22f } },
            { "stone",      new VoiceConfig { MacOSVoice = "Evan",    Rate =  88, Pitch = 0.48f } },

            // Supporting cast
            { "tidewarden", new VoiceConfig { MacOSVoice = "Daniel",  Rate = 125, Pitch = 0.88f } },
            { "sera",       new VoiceConfig { MacOSVoice = "Allison", Rate = 152, Pitch = 1.05f } },
            { "tariq",      new VoiceConfig { MacOSVoice = "Aaron",   Rate = 140, Pitch = 0.90f } },
            { "batu",       new VoiceConfig { MacOSVoice = "Aaron",   Rate = 115, Pitch = 0.85f } },
            { "kira",       new VoiceConfig { MacOSVoice = "Ava",     Rate = 192, Pitch = 1.10f } },
            { "yildiz",     new VoiceConfig { MacOSVoice = "Karen",   Rate = 155, Pitch = 1.00f } },
            { "almas",      new VoiceConfig { MacOSVoice = "Allison", Rate = 142, Pitch = 1.18f } },
            { "warden",     new VoiceConfig { MacOSVoice = "Daniel",  Rate = 122, Pitch = 0.88f } },
            { "player",     new VoiceConfig { MacOSVoice = "Ava",     Rate = 162, Pitch = 1.00f } },
        };

        private static readonly VoiceConfig DefaultFemale =
            new() { MacOSVoice = "Ava",   Rate = 155, Pitch = 1.00f };
        private static readonly VoiceConfig DefaultMale   =
            new() { MacOSVoice = "Aaron", Rate = 142, Pitch = 0.92f };

        // ── Sync properties (read by DialogueController's TypewriterRoutine) ──
        /// <summary>
        /// Chars-per-second the typewriter should use so text reveal ends at the
        /// same time as TTS speech for the current line.
        /// -1 when no voice is speaking (narrator) — typewriter uses its own default.
        /// </summary>
        public static float SyncedCPS            { get; private set; } = -1f;

        /// <summary>Estimated TTS duration for the current line in seconds.</summary>
        public static float EstimatedTtsDuration { get; private set; } = 0f;

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
            if (string.IsNullOrEmpty(_currentSpeaker)) StopSpeech();
        }

        private void OnLine(StoryLineReadEvent ev)
        {
            if (string.IsNullOrEmpty(_currentSpeaker))
            {
                // Narrator — no voice, reset sync so typewriter uses its own speed
                SyncedCPS            = -1f;
                EstimatedTtsDuration = 0f;
                return;
            }
            Speak(ev.Text, _currentSpeaker);
        }

        // ── Speech dispatch ────────────────────────────────────────────────────
        private void Speak(string rawText, string characterKey)
        {
            StopSpeech();
            var text = StripMarkup(rawText);
            if (string.IsNullOrWhiteSpace(text)) return;

            var cfg  = CharVoices.TryGetValue(characterKey, out var v) ? v : DefaultFemale;
            text     = ExtractEmotion(text, ref cfg);

            // Compute typewriter sync — must be set before DialogueController's
            // TypewriterRoutine resumes (it yields one frame to read these values).
            EstimatedTtsDuration = EstimateTtsDuration(text, cfg.Rate);
            SyncedCPS            = EstimatedTtsDuration > 0f
                ? ComputeSyncedCPS(text, EstimatedTtsDuration)
                : -1f;

#if UNITY_WEBGL && !UNITY_EDITOR
            JS_SpeakWebGL(text, cfg.Rate, cfg.Pitch);
#elif UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
            SpeakMacOS(text, cfg.MacOSVoice, cfg.Rate, cfg.Pitch);
#elif UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN
            SpeakWindows(text, cfg.Rate);
#endif
        }

        // ── Emotion extraction ─────────────────────────────────────────────────
        /// <summary>
        /// Reads a leading stage direction — e.g. "(angry) Get out." or
        /// "(genuinely surprised) That should have worked." — strips it from
        /// the spoken text, and adjusts Rate/Pitch on the config copy.
        /// </summary>
        private static string ExtractEmotion(string text, ref VoiceConfig cfg)
        {
            var m = StageDirectionRe.Match(text);
            if (!m.Success) return text;

            string openQuote = m.Groups[1].Value;           // "" or empty
            string cue       = m.Groups[2].Value            // e.g. "(angry)"
                                .Trim('(', ')')
                                .ToLowerInvariant();
            string remainder = text.Substring(m.Length);

            // Re-attach the opening quote the regex consumed
            if (openQuote.Length > 0 && !remainder.StartsWith("\""))
                remainder = "\"" + remainder;

            float rateMult   = 1.0f;
            float pitchDelta = 0.0f;
            bool  anyMatch   = false;

            foreach (var (kw, rm, pd) in EmotionMap)
            {
                if (cue.Contains(kw))
                {
                    rateMult   += (rm - 1.0f);  // accumulate deltas
                    pitchDelta += pd;
                    anyMatch    = true;
                }
            }

            if (anyMatch)
            {
                cfg.Rate  = Mathf.RoundToInt(cfg.Rate  * Mathf.Clamp(rateMult, 0.50f, 2.00f));
                cfg.Pitch = Mathf.Clamp(cfg.Pitch + pitchDelta, 0.40f, 1.60f);
            }

            return string.IsNullOrWhiteSpace(remainder) ? text : remainder;
        }

        // ── macOS ──────────────────────────────────────────────────────────────
#if UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
        private void SpeakMacOS(string text, string voice, int rate, float pitch)
        {
            // Map pitch 0.40–1.60 → [[pbas 10–90]]  (Speech Synthesis Manager command)
            int pbas    = Mathf.RoundToInt(Mathf.Lerp(10f, 90f, (pitch - 0.40f) / 1.20f));
            var escaped = text.Replace("'", "'\\''");
            var args    = $"-v \"{voice}\" -r {rate} '[[pbas {pbas}]]{escaped}'";
            var info    = new System.Diagnostics.ProcessStartInfo("say", args)
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

        // ── Windows ────────────────────────────────────────────────────────────
#if UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN
        private void SpeakWindows(string text, int rate)
        {
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

        // ── Sync calculation ───────────────────────────────────────────────────
        /// <summary>
        /// Estimates how many seconds TTS will take to speak <paramref name="text"/>
        /// at <paramref name="wpm"/> words per minute.
        /// </summary>
        private static float EstimateTtsDuration(string text, int wpm)
        {
            if (string.IsNullOrWhiteSpace(text) || wpm <= 0) return 0f;
            var words = text.Trim().Split(
                new[] { ' ', '\t', '\n' },
                System.StringSplitOptions.RemoveEmptyEntries).Length;
            return words > 0 ? words / (wpm / 60f) : 0f;
        }

        /// <summary>
        /// Returns the chars-per-second the typewriter should run at so that
        /// all characters are revealed in exactly <paramref name="targetSecs"/> seconds,
        /// using the same punctuation-pause weights the typewriter applies.
        /// Clamped to [20, 90] for readability.
        /// </summary>
        private static float ComputeSyncedCPS(string text, float targetSecs)
        {
            if (string.IsNullOrWhiteSpace(text) || targetSecs <= 0f) return -1f;

            // Mirror DialogueController's typewriter weight per character
            float weight = 0f;
            foreach (char c in text)
            {
                if      (c == '.' || c == '!' || c == '?' || c == '…') weight += 5.0f;
                else if (c == ',' || c == ';' || c == ':')              weight += 2.5f;
                else if (c == ' ' || c == '\n')                         weight += 0.3f;
                else                                                     weight += 1.0f;
            }

            return Mathf.Clamp(weight / targetSecs, 20f, 90f);
        }

        // ── Stop ───────────────────────────────────────────────────────────────
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
        [DllImport("__Internal")] private static extern void JS_SpeakWebGL(string text, int rate, float pitch);
        [DllImport("__Internal")] private static extern void JS_StopWebGLSpeech();
#endif

        // ── Helpers ────────────────────────────────────────────────────────────
        private static string StripMarkup(string text)
        {
            if (string.IsNullOrEmpty(text)) return text;
            text = Regex.Replace(text, "<[^>]+>", "");               // HTML / TMP tags
            text = Regex.Replace(text, @"\s+", " ").Trim();
            return text;
        }
    }
}
