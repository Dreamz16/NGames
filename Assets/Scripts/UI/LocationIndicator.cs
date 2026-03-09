using System.Collections;
using System.Text.RegularExpressions;
using NGames.Core.Events;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace NGames.UI
{
    /// <summary>
    /// Self-bootstrapping persistent location indicator in the top-left corner.
    /// Shows the current scene name in small text; fades in after each scene transition.
    /// </summary>
    public class LocationIndicator : MonoBehaviour
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        private static void Bootstrap()
        {
            if (FindFirstObjectByType<LocationIndicator>() != null) return;
            var go = new GameObject("[LocationIndicator]");
            DontDestroyOnLoad(go);
            go.AddComponent<LocationIndicator>();
        }

        private TextMeshProUGUI _label;
        private CanvasGroup     _cg;
        private Coroutine       _routine;

        private void Awake()
        {
            var cgo    = new GameObject("LocationCanvas");
            cgo.transform.SetParent(transform, false);
            var canvas = cgo.AddComponent<Canvas>();
            canvas.renderMode   = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 90;
            var scaler = cgo.AddComponent<CanvasScaler>();
            scaler.uiScaleMode         = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = new Vector2(1920, 1080);
            scaler.matchWidthOrHeight  = 0.5f;
            cgo.AddComponent<GraphicRaycaster>();

            // Container — top-left corner
            var panelGo = new GameObject("LocationPanel");
            panelGo.transform.SetParent(cgo.transform, false);
            var rt = panelGo.AddComponent<RectTransform>();
            rt.anchorMin        = new Vector2(0f, 1f);
            rt.anchorMax        = new Vector2(0f, 1f);
            rt.pivot            = new Vector2(0f, 1f);
            rt.anchoredPosition = new Vector2(16f, -16f);
            rt.sizeDelta        = new Vector2(340f, 32f);

            _cg       = panelGo.AddComponent<CanvasGroup>();
            _cg.alpha = 0f;

            // Subtle dark backing
            var bg = panelGo.AddComponent<Image>();
            bg.color        = new Color(0f, 0f, 0f, 0.35f);
            bg.raycastTarget = false;

            // Left accent nub
            var nubGo = new GameObject("Nub");
            nubGo.transform.SetParent(panelGo.transform, false);
            var nubImg = nubGo.AddComponent<Image>();
            nubImg.color        = new Color(0.5f, 0.4f, 0.8f, 0.8f);
            nubImg.raycastTarget = false;
            var nubRt = nubGo.GetComponent<RectTransform>();
            nubRt.anchorMin = Vector2.zero;
            nubRt.anchorMax = new Vector2(0f, 1f);
            nubRt.offsetMin = Vector2.zero;
            nubRt.offsetMax = new Vector2(3f, 0f);

            // Label
            var labelGo = new GameObject("Label");
            labelGo.transform.SetParent(panelGo.transform, false);
            _label              = labelGo.AddComponent<TextMeshProUGUI>();
            _label.fontSize     = 13;
            _label.fontStyle    = FontStyles.Italic;
            _label.color        = new Color(0.80f, 0.78f, 0.90f, 1f);
            _label.alignment    = TextAlignmentOptions.MidlineLeft;
            _label.raycastTarget = false;
            var labelRt = labelGo.GetComponent<RectTransform>();
            labelRt.anchorMin = Vector2.zero;
            labelRt.anchorMax = Vector2.one;
            labelRt.offsetMin = new Vector2(10f, 2f);
            labelRt.offsetMax = new Vector2(-4f, -2f);
        }

        private void OnEnable()  => GameEventBus.Subscribe<SceneTransitionEvent>(OnScene);
        private void OnDisable() => GameEventBus.Unsubscribe<SceneTransitionEvent>(OnScene);

        private void OnScene(SceneTransitionEvent ev)
        {
            if (_routine != null) StopCoroutine(_routine);
            _routine = StartCoroutine(UpdateLocation(ev.SceneName));
        }

        private IEnumerator UpdateLocation(string rawName)
        {
            // Wait for blackout to clear before showing updated location
            yield return new WaitForSeconds(SceneTransitionOverlay.BlackoutDuration + 0.1f);

            _label.text = FormatName(rawName);

            // Fade in
            float e = 0f;
            while (e < 0.5f) { e += Time.deltaTime; _cg.alpha = e / 0.5f; yield return null; }
            _cg.alpha = 1f;

            _routine = null;
        }

        private static string FormatName(string raw)
            => Regex.Replace(raw ?? "", "[_]", " ").Trim();
    }
}
