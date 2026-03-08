using System.Collections;
using NGames.Core.Events;
using NGames.UI;
using UnityEngine;
using UnityEngine.InputSystem;

namespace NGames.Core.Narrative
{
    /// <summary>
    /// Drives dialogue flow with zero-click reading:
    ///   - Text appears instantly.
    ///   - Lines auto-advance after a reading-time delay (proportional to word count).
    ///   - A tap/click skips the delay and advances immediately.
    ///   - Choices always wait for a deliberate selection — no accidental advances.
    /// </summary>
    [RequireComponent(typeof(DialogueView))]
    public class DialogueController : MonoBehaviour
    {
        [SerializeField] private DialogueView _view;

        // Tuning
        private const float WordsPerSecond  = 3.0f;   // reading speed
        private const float MinDelay        = 1.8f;   // shortest pause (very short lines)
        private const float MaxDelay        = 6.0f;   // longest pause (very long lines)

        private bool      _awaitingChoice;
        private bool      _autoAdvancing;
        private Coroutine _autoAdvanceCo;
        private Coroutine _pulseCoroutine;

        // ── Lifecycle ──────────────────────────────────────────────────────────
        private void Awake()
        {
            if (_view == null) _view = GetComponent<DialogueView>();
        }

        private void OnEnable()
        {
            GameEventBus.Subscribe<StoryLineReadEvent>(OnLineRead);
            GameEventBus.Subscribe<ChoicePresentedEvent>(OnChoicesPresented);
            GameEventBus.Subscribe<StoryEndedEvent>(OnStoryEnded);
            GameEventBus.Subscribe<SpeakerChangedEvent>(OnSpeakerChanged);
        }

        private void OnDisable()
        {
            GameEventBus.Unsubscribe<StoryLineReadEvent>(OnLineRead);
            GameEventBus.Unsubscribe<ChoicePresentedEvent>(OnChoicesPresented);
            GameEventBus.Unsubscribe<StoryEndedEvent>(OnStoryEnded);
            GameEventBus.Unsubscribe<SpeakerChangedEvent>(OnSpeakerChanged);
        }

        // ── Input — tap skips the delay ────────────────────────────────────────
        private void Update()
        {
            if (_awaitingChoice || !_autoAdvancing) return;

            bool tapped =
                (Keyboard.current    != null && (
                    Keyboard.current.spaceKey.wasPressedThisFrame ||
                    Keyboard.current.enterKey.wasPressedThisFrame)) ||
                (Mouse.current       != null && Mouse.current.leftButton.wasPressedThisFrame) ||
                (Touchscreen.current != null && Touchscreen.current.primaryTouch.press.wasPressedThisFrame);

            if (tapped) SkipDelay();
        }

        // ── Event Handlers ─────────────────────────────────────────────────────
        private void OnLineRead(StoryLineReadEvent ev)
        {
            _awaitingChoice = false;
            StopAutoAdvance();

            _view.HideChoices();
            _view.SetDialogueText(ev.Text);
            _view.ShowAllCharacters();
            _view.AnimateLineIn();
            SetAdvance(false);

            if (NarrativeManager.Instance?.CanContinue == true)
            {
                float delay = ReadingDelay(ev.Text);
                _autoAdvanceCo = StartCoroutine(AutoAdvanceRoutine(delay));
            }
        }

        private void OnChoicesPresented(ChoicePresentedEvent ev)
        {
            _awaitingChoice = true;
            StopAutoAdvance();
            SetAdvance(false);
            _view.ShowChoices(ev.Choices, OnChoiceSelected);
        }

        private void OnChoiceSelected(int index)
        {
            _awaitingChoice = false;
            _view.HideChoices();
            NarrativeManager.Instance?.MakeChoice(index);
        }

        private void OnStoryEnded(StoryEndedEvent _)
        {
            _awaitingChoice = false;
            StopAutoAdvance();
            SetAdvance(false);
            _view.ShowEndPanel();
        }

        private void OnSpeakerChanged(SpeakerChangedEvent ev)
        {
            _view.SetSpeakerName(ev.SpeakerName ?? string.Empty);
            if (!string.IsNullOrEmpty(ev.PortraitKey))
                _view.SetPortrait(ev.PortraitKey);
        }

        // ── Auto-advance ───────────────────────────────────────────────────────
        private IEnumerator AutoAdvanceRoutine(float delay)
        {
            _autoAdvancing = true;

            float elapsed = 0f;
            while (elapsed < delay)
            {
                elapsed += Time.deltaTime;
                yield return null;
            }

            _autoAdvancing = false;
            if (!_awaitingChoice && NarrativeManager.Instance?.CanContinue == true)
                NarrativeManager.Instance.ContinueStory();
        }

        private void SkipDelay()
        {
            StopAutoAdvance();
            if (!_awaitingChoice && NarrativeManager.Instance?.CanContinue == true)
                NarrativeManager.Instance.ContinueStory();
        }

        private void StopAutoAdvance()
        {
            if (_autoAdvanceCo != null) { StopCoroutine(_autoAdvanceCo); _autoAdvanceCo = null; }
            _autoAdvancing = false;
        }

        // ── Helpers ────────────────────────────────────────────────────────────
        private static float ReadingDelay(string text)
        {
            int words = System.Text.RegularExpressions.Regex.Replace(
                text ?? "", "<.*?>", "").Trim().Split(
                    new[] { ' ', '\t', '\n' },
                    System.StringSplitOptions.RemoveEmptyEntries).Length;
            return Mathf.Clamp(words / WordsPerSecond, MinDelay, MaxDelay);
        }

        // ── Advance indicator ──────────────────────────────────────────────────
        private void SetAdvance(bool show)
        {
            _view.ShowAdvanceIndicator(show);
            if (_pulseCoroutine != null) { StopCoroutine(_pulseCoroutine); _pulseCoroutine = null; }
            if (show) _pulseCoroutine = StartCoroutine(PulseAdvance());
        }

        private IEnumerator PulseAdvance()
        {
            while (true)
            {
                float e = 0;
                while (e < 0.6f) { e += Time.deltaTime; _view.SetAdvanceAlpha(Mathf.Lerp(0.3f, 1f, e / 0.6f)); yield return null; }
                e = 0;
                while (e < 0.4f) { e += Time.deltaTime; _view.SetAdvanceAlpha(Mathf.Lerp(1f, 0.3f, e / 0.4f)); yield return null; }
            }
        }
    }
}
