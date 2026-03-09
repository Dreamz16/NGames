using System.Collections.Generic;
using NGames.Core.Events;
using NGames.Core.State;
using UnityEngine;

namespace NGames.UI
{
    /// <summary>
    /// Manages two character portrait slots inside DialogueView.
    ///
    /// Slot 0 = left, Slot 1 = right.
    ///
    /// When a speaker tag fires:
    ///   - If the character is already in a slot → highlight that slot, fade the other.
    ///   - If the character is new → place them in the first empty slot, or replace
    ///     the currently-faded slot if both are occupied.
    ///
    /// During choices → Ishani (the player) appears in slot 0; slot 1 is hidden.
    /// During narrator / story end → both slots hidden.
    /// </summary>
    public class CharacterDisplayManager : MonoBehaviour
    {
        private static readonly Dictionary<string, Color> CharacterColors = new()
        {
            { "ishani",   new Color(0.85f, 0.55f, 0.20f) },
            { "lawrence", new Color(0.90f, 0.68f, 0.18f) },
            { "fang",     new Color(0.20f, 0.78f, 0.62f) },
            { "marcus",   new Color(0.45f, 0.55f, 0.90f) },
            { "tiberius", new Color(0.80f, 0.25f, 0.25f) },
            { "kira",     new Color(0.90f, 0.40f, 0.70f) },
            { "almas",    new Color(0.65f, 0.50f, 0.90f) },
            { "batu",     new Color(0.55f, 0.72f, 0.35f) },
            { "jiwon",    new Color(0.85f, 0.55f, 0.30f) },
            { "nadia",    new Color(0.75f, 0.40f, 0.75f) },
            { "x",        new Color(0.30f, 0.70f, 1.00f) },
            { "y",        new Color(0.95f, 0.40f, 0.40f) },
        };

        private DialogueView _view;

        // Slot state
        private readonly string[] _slotKey   = new string[2]; // character key per slot; null = empty
        private int               _activeSlot = 0;

        private const float ActiveAlpha   = 1.00f;
        private const float InactiveAlpha = 0.18f;

        // ── Lifecycle ──────────────────────────────────────────────────────────
        private void Start()
        {
            _view = FindFirstObjectByType<DialogueView>();
        }

        private void OnEnable()
        {
            GameEventBus.Subscribe<SpeakerChangedEvent>(OnSpeaker);
            GameEventBus.Subscribe<ChoicePresentedEvent>(OnChoices);
            GameEventBus.Subscribe<StoryEndedEvent>(OnEnd);
            GameEventBus.Subscribe<SceneTransitionEvent>(OnScene);
        }

        private void OnDisable()
        {
            GameEventBus.Unsubscribe<SpeakerChangedEvent>(OnSpeaker);
            GameEventBus.Unsubscribe<ChoicePresentedEvent>(OnChoices);
            GameEventBus.Unsubscribe<StoryEndedEvent>(OnEnd);
            GameEventBus.Unsubscribe<SceneTransitionEvent>(OnScene);
        }

        // ── Event handlers ─────────────────────────────────────────────────────
        private void OnSpeaker(SpeakerChangedEvent ev)
        {
            EnsureView();

            if (string.IsNullOrEmpty(ev.SpeakerName))
            {
                // Narrator — hide both slots
                _view?.ShowCharacterSlot(0, false);
                _view?.ShowCharacterSlot(1, false);
                return;
            }

            string key = ev.SpeakerName.ToLowerInvariant();

            // Find existing slot for this character
            int targetSlot = -1;
            for (int i = 0; i < 2; i++)
                if (_slotKey[i] == key) { targetSlot = i; break; }

            if (targetSlot < 0)
            {
                // New character: prefer an empty slot, otherwise replace the inactive one
                for (int i = 0; i < 2; i++)
                    if (_slotKey[i] == null) { targetSlot = i; break; }

                if (targetSlot < 0)
                    targetSlot = (_activeSlot == 0) ? 1 : 0;

                _slotKey[targetSlot] = key;
                ShowCharacterInSlot(ev.SpeakerName, targetSlot);
            }

            _activeSlot = targetSlot;
            RefreshAlphas();
        }

        private void OnChoices(ChoicePresentedEvent _)
        {
            EnsureView();
            var playerName = GameStateManager.Instance?.SaveData?.PlayerName ?? "Ishani";
            _slotKey[0]  = playerName.ToLowerInvariant();
            _slotKey[1]  = null;
            _activeSlot  = 0;
            ShowCharacterInSlot(playerName, 0);
            _view?.ShowCharacterSlot(1, false);
            _view?.SetSlotAlpha(0, ActiveAlpha);
        }

        private void OnEnd(StoryEndedEvent _)
        {
            _view?.ShowCharacterSlot(0, false);
            _view?.ShowCharacterSlot(1, false);
            _slotKey[0] = _slotKey[1] = null;
        }

        private void OnScene(SceneTransitionEvent _)
        {
            _view?.ShowCharacterSlot(0, false);
            _view?.ShowCharacterSlot(1, false);
            _slotKey[0] = _slotKey[1] = null;
        }

        // ── Helpers ────────────────────────────────────────────────────────────
        private void ShowCharacterInSlot(string name, int slot)
        {
            if (_view == null) return;
            var key = name.ToLowerInvariant();
            var tex = Resources.Load<Texture2D>($"Characters/{key}");
            if (tex != null)
            {
                var sprite = Sprite.Create(
                    tex, new Rect(0, 0, tex.width, tex.height), new Vector2(0.5f, 0f), 100f);
                _view.SetSlotSprite(slot, sprite);
            }
            else
            {
                _view.SetSlotPlaceholder(slot, name, GetColor(key));
            }
        }

        private void RefreshAlphas()
        {
            for (int i = 0; i < 2; i++)
            {
                if (_slotKey[i] != null)
                    _view?.SetSlotAlpha(i, i == _activeSlot ? ActiveAlpha : InactiveAlpha);
            }
        }

        private void EnsureView()
        {
            if (_view == null) _view = FindFirstObjectByType<DialogueView>();
        }

        private static Color GetColor(string key)
        {
            foreach (var kvp in CharacterColors)
                if (key.Contains(kvp.Key)) return kvp.Value;
            return new Color(0.6f, 0.6f, 0.75f);
        }
    }
}
