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
        private GameObject _active3DCharacter;
        private Camera _charCamera;
        private RenderTexture _charRenderTexture;
        private readonly Vector3 _stagePosition = new Vector3(100f, 100f, 0f);

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

        private void OnEnd(StoryEndedEvent _)
        {
            _view?.ShowCharacterImage(false);
            Destroy3DCharacter();
        }

        private void OnScene(SceneTransitionEvent _)
        {
            _view?.ShowCharacterImage(false);
            Destroy3DCharacter();
        }

        private void Destroy3DCharacter()
        {
            if (_active3DCharacter != null)
            {
                Destroy(_active3DCharacter);
                _active3DCharacter = null;
            }
        }

        private void SetupStage()
        {
            if (_charCamera != null) return;
            
            var camGo = new GameObject("CharacterStageCamera");
            camGo.transform.position = _stagePosition + new Vector3(0f, 0f, -10f); 
            _charCamera = camGo.AddComponent<Camera>();
            _charCamera.clearFlags = CameraClearFlags.SolidColor;
            _charCamera.backgroundColor = new Color(0, 0, 0, 0); // Transparent
            _charCamera.orthographic = true;
            _charCamera.orthographicSize = 2.5f; // zoom level for portrait
            _charCamera.cullingMask = 1 << 31; // Render only the character layer
            
            _charRenderTexture = new RenderTexture(512, 512, 16, RenderTextureFormat.ARGB32);
            _charCamera.targetTexture = _charRenderTexture;
        }

        private void SetLayerRecursively(GameObject obj, int newLayer)
        {
            obj.layer = newLayer;
            foreach (Transform child in obj.transform)
            {
                SetLayerRecursively(child.gameObject, newLayer);
            }
        }

        private void ShowCharacter(string name)
        {
            if (_view == null) return;

            var key    = name.ToLowerInvariant();

            // -- NEW 3D CHARACTER LOGIC --
            var prefab3D = Resources.Load<GameObject>($"Characters3D/{key}");
            if (prefab3D != null)
            {
                Destroy3DCharacter();
                SetupStage();
                
                // Spawn character far away at the hidden stage
                _active3DCharacter = Instantiate(prefab3D, _stagePosition + new Vector3(0, -1.2f, 3f), Quaternion.identity);
                SetLayerRecursively(_active3DCharacter, 31);
                
                // Route the render texture to the dialogue UI
                _view.SetCharacterRenderTexture(_charRenderTexture);
                return;
            }
            else
            {
                Destroy3DCharacter();
            }
            // -- END NEW 3D CHARACTER LOGIC --
            
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
