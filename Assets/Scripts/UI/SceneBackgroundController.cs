using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using NGames.Core.Events;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace NGames.UI
{
    /// <summary>
    /// Transitions the scene background gradient and shows a scene name card
    /// whenever a # scene: tag fires a SceneTransitionEvent.
    /// Finds its Image children by name — no serialized wiring required.
    /// </summary>
    public class SceneBackgroundController : MonoBehaviour
    {
        // ── Scene colour palette (top-colour, bottom-colour) ──────────────────
        private static readonly Dictionary<string, (Color top, Color bot)> Palette = new()
        {
            { "title_card",        (new Color(0.04f, 0.02f, 0.14f), new Color(0.10f, 0.06f, 0.24f)) },
            { "rhea_port",         (new Color(0.06f, 0.10f, 0.22f), new Color(0.22f, 0.12f, 0.04f)) },
            { "verdant_verge",     (new Color(0.03f, 0.12f, 0.05f), new Color(0.02f, 0.07f, 0.03f)) },
            { "warden_cave",       (new Color(0.06f, 0.03f, 0.14f), new Color(0.03f, 0.02f, 0.10f)) },
            { "bridge_inn",        (new Color(0.16f, 0.08f, 0.02f), new Color(0.09f, 0.04f, 0.01f)) },
            { "mo_stor",           (new Color(0.14f, 0.07f, 0.02f), new Color(0.08f, 0.04f, 0.01f)) },
            { "sunken_tribunal",   (new Color(0.02f, 0.05f, 0.16f), new Color(0.01f, 0.03f, 0.10f)) },
            { "highwind_pass",     (new Color(0.08f, 0.10f, 0.20f), new Color(0.14f, 0.16f, 0.26f)) },
            { "salt_flats",        (new Color(0.14f, 0.13f, 0.10f), new Color(0.08f, 0.07f, 0.05f)) },
            { "karakum_desert",    (new Color(0.20f, 0.12f, 0.02f), new Color(0.12f, 0.07f, 0.01f)) },
            { "duut_mankhan",      (new Color(0.05f, 0.04f, 0.10f), new Color(0.10f, 0.08f, 0.18f)) },
            { "gobi",              (new Color(0.18f, 0.11f, 0.02f), new Color(0.10f, 0.06f, 0.01f)) },
            { "jade_gate",         (new Color(0.04f, 0.08f, 0.06f), new Color(0.02f, 0.05f, 0.04f)) },
            { "gaochang",          (new Color(0.14f, 0.06f, 0.02f), new Color(0.08f, 0.03f, 0.01f)) },
            { "flaming_mountains", (new Color(0.22f, 0.08f, 0.01f), new Color(0.14f, 0.04f, 0.01f)) },
            { "night_camp",        (new Color(0.02f, 0.02f, 0.08f), new Color(0.04f, 0.03f, 0.12f)) },
            { "tiger_ambush",      (new Color(0.08f, 0.05f, 0.02f), new Color(0.04f, 0.02f, 0.01f)) },
            { "cave",              (new Color(0.03f, 0.03f, 0.05f), new Color(0.02f, 0.02f, 0.04f)) },
            { "journal_panel",     (new Color(0.06f, 0.04f, 0.12f), new Color(0.03f, 0.02f, 0.08f)) },
        };

        private Image            _bgTop;
        private Image            _bgBot;
        private Image            _bgSprite;     // full-screen art layer
        private RectTransform    _bgSpriteRt;   // for Ken Burns
        private TextMeshProUGUI  _sceneLabel;
        private CanvasGroup      _sceneGroup;

        private GameObject _active3DScene;

        private Coroutine _bgCoroutine;
        private Coroutine _nameCoroutine;
        private Coroutine _kenBurnsCoroutine;

        // ── Lifecycle ──────────────────────────────────────────────────────────
        private void Awake()
        {
            var canvas = FindFirstObjectByType<Canvas>()?.transform;
            if (canvas == null) return;

            var bg = canvas.Find("Background");
            if (bg != null)
            {
                _bgTop = bg.Find("TopHalf")?.GetComponent<Image>();
                _bgBot = bg.Find("BotHalf")?.GetComponent<Image>();

                // Create a full-screen art layer behind the gradient panels
                var artGo = new GameObject("SceneArt");
                artGo.transform.SetParent(bg, false);
                artGo.transform.SetAsFirstSibling();
                _bgSprite = artGo.AddComponent<Image>();
                _bgSprite.preserveAspect = false;   // stretch to fill
                _bgSprite.raycastTarget  = false;
                _bgSprite.color          = Color.white;
                _bgSprite.gameObject.SetActive(false);
                _bgSpriteRt = artGo.GetComponent<RectTransform>();
                _bgSpriteRt.anchorMin = Vector2.zero;
                _bgSpriteRt.anchorMax = Vector2.one;
                _bgSpriteRt.offsetMin = _bgSpriteRt.offsetMax = Vector2.zero;
            }

            var card = canvas.Find("SceneNameCard");
            if (card != null)
            {
                _sceneGroup = card.GetComponent<CanvasGroup>();
                _sceneLabel = card.Find("SceneNameText")?.GetComponent<TextMeshProUGUI>();
            }

            // Start black so the first scene transition fades in visibly
            ApplyImmediate((Color.black, Color.black));
        }

        private void OnEnable()  => GameEventBus.Subscribe<SceneTransitionEvent>(OnScene);
        private void OnDisable() => GameEventBus.Unsubscribe<SceneTransitionEvent>(OnScene);

        // ── Handler ───────────────────────────────────────────────────────────
        // Must match SceneTransitionOverlay.FadeIn + SceneTransitionOverlay.Hold
        private const float BlackoutDuration = 0.65f;

        private void OnScene(SceneTransitionEvent ev)
        {
            if (_bgCoroutine   != null) StopCoroutine(_bgCoroutine);
            if (_nameCoroutine != null) StopCoroutine(_nameCoroutine);
            _bgCoroutine = StartCoroutine(DelayedSceneChange(ev));
        }

        private IEnumerator DelayedSceneChange(SceneTransitionEvent ev)
        {
            // Wait for the black overlay to fully cover before swapping scene content.
            yield return new WaitForSeconds(BlackoutDuration);

            var key = (ev.SceneName ?? "").ToLowerInvariant().Replace(" ", "_");

            var canvas   = FindFirstObjectByType<Canvas>()?.transform;
            var bgParent = canvas != null ? canvas.Find("Background") : null;

            // -- 3D scene logic --
            var prefab3D = Resources.Load<GameObject>($"Scenes3D/{key}");
            if (prefab3D != null)
            {
                if (_active3DScene != null) Destroy(_active3DScene);
                _active3DScene       = Instantiate(prefab3D);
                _active3DScene.layer = 0;

                var sr      = _active3DScene.GetComponentInChildren<SpriteRenderer>();
                var mainCam = Camera.main;
                if (sr != null && mainCam != null)
                {
                    float camHH    = mainCam.orthographic ? mainCam.orthographicSize
                                     : Mathf.Tan(mainCam.fieldOfView * 0.5f * Mathf.Deg2Rad) * 10f;
                    float topOffset = camHH - sr.bounds.extents.y;
                    _active3DScene.transform.position = new Vector3(
                        mainCam.transform.position.x, mainCam.transform.position.y + topOffset, 10f);
                }
                else
                {
                    _active3DScene.transform.position = new Vector3(0, 0, 10f);
                }

                if (_bgSprite != null) _bgSprite.gameObject.SetActive(false);
                if (_bgTop    != null) _bgTop.gameObject.SetActive(false);
                if (_bgBot    != null) _bgBot.gameObject.SetActive(false);
                if (bgParent  != null) { var i = bgParent.GetComponent<Image>(); if (i) i.enabled = false; }
                if (_kenBurnsCoroutine != null) StopCoroutine(_kenBurnsCoroutine);

                _nameCoroutine = StartCoroutine(ShowSceneName(ev.SceneName));
                yield break;
            }

            // Fallback to 2D — restore canvas background if we came from 3D
            if (bgParent != null) { var i = bgParent.GetComponent<Image>(); if (i) i.enabled = true; }
            if (_active3DScene != null) { Destroy(_active3DScene); _active3DScene = null; }

            var bgTex    = Resources.Load<Texture2D>($"Backgrounds/{key}");
            var bgSprite = bgTex != null
                ? Sprite.Create(bgTex, new Rect(0, 0, bgTex.width, bgTex.height), new Vector2(0.5f, 0.5f), 100f)
                : null;

            if (bgSprite != null)
            {
                if (_kenBurnsCoroutine != null) StopCoroutine(_kenBurnsCoroutine);
                StartCoroutine(FadeSpriteBackground(bgSprite, 0.7f));
            }
            else
            {
                var colors = Palette.TryGetValue(key, out var c) ? c
                    : (new Color(0.04f, 0.03f, 0.12f), new Color(0.08f, 0.05f, 0.18f));
                StartCoroutine(FadeBackground(colors, 0.9f));
            }

            _nameCoroutine = StartCoroutine(ShowSceneName(ev.SceneName));
        }

        // ── Coroutines ────────────────────────────────────────────────────────
        private IEnumerator FadeSpriteBackground(Sprite sprite, float dur)
        {
            // Hide gradient, cross-fade to new sprite
            if (_bgSprite == null) yield break;

            _bgSprite.sprite = sprite;
            _bgSprite.color  = new Color(1, 1, 1, 0);
            _bgSprite.gameObject.SetActive(true);

            float e = 0;
            while (e < dur)
            {
                e += Time.deltaTime;
                float t = Mathf.SmoothStep(0, 1, e / dur);
                _bgSprite.color = new Color(1, 1, 1, t);
                if (_bgTop != null) _bgTop.color = new Color(_bgTop.color.r, _bgTop.color.g, _bgTop.color.b, 1 - t);
                if (_bgBot != null) _bgBot.color = new Color(_bgBot.color.r, _bgBot.color.g, _bgBot.color.b, 1 - t);
                yield return null;
            }

            _bgSprite.color = Color.white;
            if (_bgTop != null) _bgTop.gameObject.SetActive(false);
            if (_bgBot != null) _bgBot.gameObject.SetActive(false);

            // Reset and start Ken Burns after fade-in completes
            if (_bgSpriteRt != null)
            {
                _bgSpriteRt.localScale      = Vector3.one;
                _bgSpriteRt.anchoredPosition = Vector2.zero;
                _kenBurnsCoroutine = StartCoroutine(KenBurns(_bgSpriteRt));
            }
        }

        private IEnumerator KenBurns(RectTransform rt)
        {
            var endScale = new Vector3(1.07f, 1.07f, 1f);
            var endPos   = new Vector2(Random.Range(-20f, 20f), Random.Range(-10f, 10f));
            const float dur = 28f;
            float e = 0f;
            while (e < dur)
            {
                e += Time.deltaTime;
                float t = e / dur;
                rt.localScale        = Vector3.Lerp(Vector3.one, endScale, t);
                rt.anchoredPosition  = Vector2.Lerp(Vector2.zero, endPos, t);
                yield return null;
            }
        }

        private IEnumerator FadeBackground((Color top, Color bot) target, float dur)
        {
            var startTop = _bgTop != null ? _bgTop.color : Color.black;
            var startBot = _bgBot != null ? _bgBot.color : Color.black;
            float elapsed = 0;

            while (elapsed < dur)
            {
                elapsed += Time.deltaTime;
                float t = Mathf.SmoothStep(0, 1, elapsed / dur);
                if (_bgTop != null) _bgTop.color = Color.Lerp(startTop, target.top, t);
                if (_bgBot != null) _bgBot.color = Color.Lerp(startBot, target.bot, t);
                yield return null;
            }
        }

        private IEnumerator ShowSceneName(string raw)
        {
            if (_sceneGroup == null || _sceneLabel == null) yield break;

            _sceneLabel.text = FormatName(raw);

            // Fade in
            float e = 0;
            while (e < 0.45f) { e += Time.deltaTime; _sceneGroup.alpha = e / 0.45f; yield return null; }
            _sceneGroup.alpha = 1f;

            yield return new WaitForSeconds(1.6f);

            // Fade out
            e = 0;
            while (e < 0.55f) { e += Time.deltaTime; _sceneGroup.alpha = 1 - e / 0.55f; yield return null; }
            _sceneGroup.alpha = 0f;
        }

        // ── Helpers ───────────────────────────────────────────────────────────
        private void ApplyImmediate((Color top, Color bot) c)
        {
            if (_bgTop != null) _bgTop.color = c.top;
            if (_bgBot != null) _bgBot.color = c.bot;
        }

        private static string FormatName(string raw)
            => Regex.Replace(raw ?? "", "[_]", " ").Trim();
    }
}
