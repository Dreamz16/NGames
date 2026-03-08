using System.Collections;
using System.Collections.Generic;
using NGames.Core.Events;
using UnityEngine;
using UnityEngine.UI;

namespace NGames.UI
{
    /// <summary>
    /// Adds immersive atmosphere on top of the narrative view:
    ///   • Full-screen radial vignette (always-on, subtle)
    ///   • Ambient floating dust/particle motes (scene-reactive colour and density)
    ///   • Screen shake on tense / action mood cues
    ///
    /// Self-bootstraps via RuntimeInitializeOnLoadMethod — no scene wiring required.
    /// </summary>
    public class AmbientEffectsController : MonoBehaviour
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        private static void Bootstrap()
        {
            if (FindFirstObjectByType<AmbientEffectsController>() != null) return;
            var go = new GameObject("[AmbientEffects]");
            DontDestroyOnLoad(go);
            go.AddComponent<AmbientEffectsController>();
        }

        // ── Scene atmosphere presets ────────────────────────────────────────────
        // (keyword, mote colour, mote count, drift speed px/s)
        private static readonly (string key, Color color, int count, float speed)[] SceneAtmosphere =
        {
            ("verdant_verge",   new Color(0.45f, 1.00f, 0.35f, 0.50f), 32, 16f),  // vivid green pollen
            ("forest",          new Color(0.40f, 0.95f, 0.30f, 0.45f), 28, 14f),  // bright leaf dust
            ("warden_cave",     new Color(0.60f, 0.50f, 1.00f, 0.38f), 20,  7f),  // glowing cave spores
            ("cave",            new Color(0.55f, 0.45f, 0.90f, 0.35f), 18,  6f),  // purple cave dust
            ("night_camp",      new Color(1.00f, 0.85f, 0.25f, 0.45f), 16, 10f),  // warm firefly gold
            ("karakum_desert",  new Color(1.00f, 0.82f, 0.38f, 0.40f), 22, 28f),  // golden sand drift
            ("salt_flats",      new Color(0.88f, 0.95f, 1.00f, 0.32f), 12,  9f),  // cool shimmer
            ("highwind_pass",   new Color(0.75f, 0.92f, 1.00f, 0.45f), 40, 38f),  // bright wind streaks
            ("sunken_tribunal", new Color(0.30f, 0.65f, 1.00f, 0.42f), 18,  9f),  // deep blue shimmer
            ("bridge_inn",      new Color(1.00f, 0.80f, 0.28f, 0.38f), 14,  5f),  // warm candlelight
            ("rhea_port",       new Color(0.55f, 0.88f, 1.00f, 0.38f), 20, 22f),  // ocean spray
            ("mo_stor",         new Color(1.00f, 0.65f, 0.20f, 0.38f), 16,  8f),  // warm tavern glow
        };

        private static readonly Color DefaultMoteColor = new Color(1.00f, 0.90f, 0.55f, 0.28f);  // warm gold default
        private const int DefaultMoteCount = 14;
        private const float DefaultMoteSpeed = 10f;

        // ── State ───────────────────────────────────────────────────────────────
        private Canvas         _overlayCanvas;
        private RectTransform  _motesParent;

        private readonly List<Coroutine> _moteRoutines = new();

        // ── Lifecycle ───────────────────────────────────────────────────────────
        private void Awake()
        {
            BuildOverlayCanvas();
            BuildVignette();
            BuildMotesParent();
        }

        private void OnEnable()
        {
            GameEventBus.Subscribe<SceneTransitionEvent>(OnScene);
        }

        private void OnDisable()
        {
            GameEventBus.Unsubscribe<SceneTransitionEvent>(OnScene);
        }

        // ── Canvas / layer setup ────────────────────────────────────────────────
        private void BuildOverlayCanvas()
        {
            var cgo = new GameObject("AmbientCanvas");
            cgo.transform.SetParent(transform, false);
            _overlayCanvas            = cgo.AddComponent<Canvas>();
            _overlayCanvas.renderMode = RenderMode.ScreenSpaceOverlay;
            _overlayCanvas.sortingOrder = 50;   // above game UI; below menus
            cgo.AddComponent<CanvasScaler>();
        }

        private void BuildVignette()
        {
            float intensity = 0.65f;

            var go = new GameObject("Vignette");
            go.transform.SetParent(_overlayCanvas.transform, false);
            var img = go.AddComponent<Image>();
            img.sprite         = UIUtils.RadialVignette(256, 0.42f, 1.05f,
                                     new Color(0f, 0f, 0f, intensity));
            img.type           = Image.Type.Simple;
            img.preserveAspect = false;
            img.raycastTarget  = false;
            var rt = go.GetComponent<RectTransform>();
            rt.anchorMin = Vector2.zero;
            rt.anchorMax = Vector2.one;
            rt.offsetMin = rt.offsetMax = Vector2.zero;
        }

        private void BuildMotesParent()
        {
            var go = new GameObject("MotesParent");
            go.transform.SetParent(_overlayCanvas.transform, false);
            _motesParent = go.AddComponent<RectTransform>();
            _motesParent.anchorMin = Vector2.zero;
            _motesParent.anchorMax = Vector2.one;
            _motesParent.offsetMin = _motesParent.offsetMax = Vector2.zero;
        }

        // ── Event handlers ──────────────────────────────────────────────────────
        private void OnScene(SceneTransitionEvent ev)
        {
            var key = (ev.SceneName ?? "").ToLowerInvariant().Replace(" ", "_");
            SpawnMotes(key);
        }

        // ── Motes ───────────────────────────────────────────────────────────────
        private void SpawnMotes(string sceneKey)
        {
            foreach (var r in _moteRoutines) if (r != null) StopCoroutine(r);
            _moteRoutines.Clear();
            if (_motesParent != null)
                foreach (Transform child in _motesParent) Destroy(child.gameObject);

            if (_motesParent == null) return;

            var moteColor = DefaultMoteColor;
            var moteCount = DefaultMoteCount;
            var moteSpeed = DefaultMoteSpeed;

            foreach (var (key, color, count, speed) in SceneAtmosphere)
            {
                if (sceneKey.Contains(key))
                {
                    moteColor = color;
                    moteCount = count;
                    moteSpeed = speed;
                    break;
                }
            }

            for (int i = 0; i < moteCount; i++)
                _moteRoutines.Add(StartCoroutine(FloatingMote(moteColor, moteSpeed)));
        }

        private IEnumerator FloatingMote(Color color, float speed)
        {
            var go  = new GameObject("Mote");
            go.transform.SetParent(_motesParent, false);
            var img = go.AddComponent<Image>();
            img.sprite        = UIUtils.MoteSprite(color);
            img.type          = Image.Type.Simple;
            img.raycastTarget = false;

            float size = Random.Range(2f, 7f);
            var rt = go.GetComponent<RectTransform>();
            rt.sizeDelta = new Vector2(size, size);

            // Randomise drift direction — mostly upward with gentle sideways sway
            var dir      = new Vector2(Random.Range(-0.4f, 0.4f), 1f).normalized;
            float life   = Random.Range(7f, 20f);
            float elapsed = Random.Range(0f, life);  // stagger start times

            // Initial position
            rt.anchorMin = rt.anchorMax = new Vector2(Random.Range(0f, 1f), Random.Range(0f, 1f));
            rt.anchoredPosition = Vector2.zero;

            while (true)
            {
                elapsed += Time.deltaTime;
                if (elapsed >= life)
                {
                    elapsed = 0;
                    size    = Random.Range(2f, 7f);
                    rt.sizeDelta = new Vector2(size, size);
                    dir     = new Vector2(Random.Range(-0.4f, 0.4f), 1f).normalized;
                    rt.anchorMin = rt.anchorMax = new Vector2(Random.Range(0f, 1f), Random.Range(-0.05f, 0.05f));
                    rt.anchoredPosition = Vector2.zero;
                }

                float t     = elapsed / life;
                float alpha = color.a * Mathf.Sin(t * Mathf.PI);   // fade in then out
                img.color   = new Color(color.r, color.g, color.b, alpha);

                // Move in normalised anchor space
                var anchor = rt.anchorMin;
                anchor += dir * (speed / Screen.height) * Time.deltaTime;
                rt.anchorMin = rt.anchorMax = anchor;
                rt.anchoredPosition = Vector2.zero;

                yield return null;
            }
        }

    }
}
