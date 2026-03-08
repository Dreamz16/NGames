using System.Collections.Generic;
using NGames.Core.Events;
using NGames.Core.State;
using UnityEngine;

namespace NGames.UI
{
    /// <summary>
    /// Sets the character portrait inside DialogueView.
    /// Shows a real sprite if found in Resources/Characters/{key},
    /// otherwise shows a coloured placeholder with the character's initial.
    /// During player choices shows Ishani (the player character).
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

        private void OnSpeaker(SpeakerChangedEvent ev)
        {
            EnsureView();
            if (string.IsNullOrEmpty(ev.SpeakerName))
            {
                _view?.ShowCharacterImage(false);
                return;
            }
            ShowCharacter(ev.SpeakerName);
        }

        private void OnChoices(ChoicePresentedEvent _)
        {
            EnsureView();
            var playerName = GameStateManager.Instance?.SaveData?.PlayerName ?? "Ishani";
            ShowCharacter(playerName);
        }

        private void OnEnd(StoryEndedEvent _)        => _view?.ShowCharacterImage(false);
        private void OnScene(SceneTransitionEvent _) => _view?.ShowCharacterImage(false);

        private void ShowCharacter(string name)
        {
            if (_view == null) return;

            var key    = name.ToLowerInvariant();
            var tex    = Resources.Load<Texture2D>($"Characters/{key}");

            if (tex != null)
            {
                var sprite = Sprite.Create(
                    tex, new Rect(0, 0, tex.width, tex.height),
                    new Vector2(0.5f, 0f), 100f);
                _view.SetCharacterSprite(sprite);
            }
            else
            {
                // No image — show placeholder with initial and accent colour
                _view.ShowCharacterPlaceholder(name, GetColor(key));
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
