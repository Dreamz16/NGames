using System.Collections;
using System.Collections.Generic;
using NGames.Core.Events;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace NGames.UI
{
    /// <summary>
    /// Self-bootstrapping toast notification system.
    /// Shows RPG-style popups for bond changes, stat gains, and achievements.
    /// Toasts slide in from the right, hold, then slide out.
    /// </summary>
    public class ToastNotificationManager : MonoBehaviour
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        private static void Bootstrap()
        {
            if (FindFirstObjectByType<ToastNotificationManager>() != null) return;
            var go = new GameObject("[ToastNotificationManager]");
            DontDestroyOnLoad(go);
            go.AddComponent<ToastNotificationManager>();
        }

        // ── Character accent colours (duplicated for independence) ─────────────
        private static readonly Dictionary<string, Color> CharColors = new()
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
        };

        private static readonly Color GoldColor = new(0.95f, 0.80f, 0.25f);
        private static readonly Color StatColor = new(0.40f, 0.70f, 0.95f);

        private struct ToastData
        {
            public string Icon;
            public string Title;
            public string Subtitle;
            public Color  Accent;
        }

        private Transform          _container;
        private Queue<ToastData>   _queue   = new();
        private bool               _showing;

        // ── Lifecycle ──────────────────────────────────────────────────────────
        private void Awake()
        {
            var cgo    = new GameObject("ToastCanvas");
            cgo.transform.SetParent(transform, false);
            var canvas = cgo.AddComponent<Canvas>();
            canvas.renderMode   = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 96;
            var scaler = cgo.AddComponent<CanvasScaler>();
            scaler.uiScaleMode         = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = new Vector2(1920, 1080);
            scaler.screenMatchMode     = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight;
            scaler.matchWidthOrHeight  = 0.5f;
            cgo.AddComponent<GraphicRaycaster>();

            var containerGo = new GameObject("ToastAnchor");
            containerGo.transform.SetParent(cgo.transform, false);
            _container = containerGo.transform;
            var rt = containerGo.AddComponent<RectTransform>();
            rt.anchorMin        = new Vector2(1f, 1f);
            rt.anchorMax        = new Vector2(1f, 1f);
            rt.pivot            = new Vector2(1f, 1f);
            rt.anchoredPosition = new Vector2(-24f, -24f);
            rt.sizeDelta        = new Vector2(300f, 0f);

            var vlg = containerGo.AddComponent<VerticalLayoutGroup>();
            vlg.spacing            = 6f;
            vlg.childAlignment     = TextAnchor.UpperRight;
            vlg.childControlWidth  = true;
            vlg.childControlHeight = false;
            vlg.reverseArrangement = false;
        }

        private void OnEnable()
        {
            GameEventBus.Subscribe<BondChangedEvent>(OnBond);
            GameEventBus.Subscribe<StatChangedEvent>(OnStat);
            GameEventBus.Subscribe<AchievementUnlockedEvent>(OnAchievement);
        }

        private void OnDisable()
        {
            GameEventBus.Unsubscribe<BondChangedEvent>(OnBond);
            GameEventBus.Unsubscribe<StatChangedEvent>(OnStat);
            GameEventBus.Unsubscribe<AchievementUnlockedEvent>(OnAchievement);
        }

        // ── Event handlers ─────────────────────────────────────────────────────
        private void OnBond(BondChangedEvent ev)
        {
            var accent = CharColors.TryGetValue(ev.CharacterName, out var c) ? c : GoldColor;
            string sign    = ev.Delta > 0 ? "+" : "";
            string icon    = ev.Delta > 0 ? "♥" : "↓";
            string name    = char.ToUpperInvariant(ev.CharacterName[0]) + ev.CharacterName[1..];
            Enqueue(new ToastData
            {
                Icon     = icon,
                Title    = $"{name}",
                Subtitle = $"Bond {sign}{ev.Delta}  (total {ev.NewValue})",
                Accent   = accent,
            });
        }

        private void OnStat(StatChangedEvent ev)
        {
            string sign = ev.Delta > 0 ? "+" : "";
            string label = ev.StatName.ToUpperInvariant();
            string icon  = ev.Delta > 0 ? "↑" : "↓";
            Enqueue(new ToastData
            {
                Icon     = icon,
                Title    = label,
                Subtitle = $"{sign}{ev.Delta}",
                Accent   = StatColor,
            });
        }

        private void OnAchievement(AchievementUnlockedEvent ev)
        {
            string name = ev.AchievementId.Replace("_", " ");
            name = char.ToUpperInvariant(name[0]) + name[1..];
            Enqueue(new ToastData
            {
                Icon     = "★",
                Title    = "Achievement",
                Subtitle = name,
                Accent   = GoldColor,
            });
        }

        // ── Queue / display ────────────────────────────────────────────────────
        private void Enqueue(ToastData data)
        {
            _queue.Enqueue(data);
            if (!_showing) StartCoroutine(DrainQueue());
        }

        private IEnumerator DrainQueue()
        {
            _showing = true;
            while (_queue.Count > 0)
            {
                var data = _queue.Dequeue();
                yield return StartCoroutine(ShowToast(data));
                yield return new WaitForSeconds(0.08f);
            }
            _showing = false;
        }

        private IEnumerator ShowToast(ToastData data)
        {
            // Build toast GameObject
            var toast = BuildToast(data);
            var cg    = toast.GetComponent<CanvasGroup>();
            var rt    = toast.GetComponent<RectTransform>();

            // Slide in from right
            float slideW = 320f;
            rt.anchoredPosition = new Vector2(slideW, 0f);
            cg.alpha = 0f;

            float e = 0f, dur = 0.25f;
            while (e < dur)
            {
                e += Time.deltaTime;
                float t = 1f - Mathf.Pow(1f - Mathf.Clamp01(e / dur), 3f);
                rt.anchoredPosition = Vector2.Lerp(new Vector2(slideW, 0f), Vector2.zero, t);
                cg.alpha = t;
                yield return null;
            }
            rt.anchoredPosition = Vector2.zero;
            cg.alpha = 1f;

            // Hold
            yield return new WaitForSeconds(2.8f);

            // Fade + slide out
            e = 0f; dur = 0.35f;
            while (e < dur)
            {
                e += Time.deltaTime;
                float t = Mathf.Clamp01(e / dur);
                rt.anchoredPosition = Vector2.Lerp(Vector2.zero, new Vector2(slideW * 0.6f, 0f), t);
                cg.alpha = 1f - t;
                yield return null;
            }

            Destroy(toast);
        }

        // ── Toast construction ─────────────────────────────────────────────────
        private GameObject BuildToast(ToastData data)
        {
            var root = new GameObject("Toast");
            root.transform.SetParent(_container, false);

            var rootRt = root.AddComponent<RectTransform>();
            rootRt.sizeDelta = new Vector2(300f, 68f);

            var cg = root.AddComponent<CanvasGroup>();
            cg.alpha = 0f;

            // Layout element so VerticalLayoutGroup sizes it
            var le = root.AddComponent<LayoutElement>();
            le.preferredHeight = 68f;
            le.minHeight       = 68f;

            // Background
            var bg = root.AddComponent<Image>();
            bg.color        = new Color(0.05f, 0.03f, 0.12f, 0.94f);
            bg.raycastTarget = false;

            // Left accent bar
            var barGo = new GameObject("Bar");
            barGo.transform.SetParent(root.transform, false);
            var barImg = barGo.AddComponent<Image>();
            barImg.color        = data.Accent;
            barImg.raycastTarget = false;
            var barRt = barGo.GetComponent<RectTransform>();
            barRt.anchorMin = Vector2.zero;
            barRt.anchorMax = new Vector2(0f, 1f);
            barRt.offsetMin = Vector2.zero;
            barRt.offsetMax = new Vector2(5f, 0f);

            // Top highlight line
            var lineGo = new GameObject("TopLine");
            lineGo.transform.SetParent(root.transform, false);
            var lineImg = lineGo.AddComponent<Image>();
            lineImg.color = new Color(data.Accent.r, data.Accent.g, data.Accent.b, 0.35f);
            lineImg.raycastTarget = false;
            var lineRt = lineGo.GetComponent<RectTransform>();
            lineRt.anchorMin = new Vector2(0f, 1f);
            lineRt.anchorMax = Vector2.one;
            lineRt.offsetMin = new Vector2(5f, -2f);
            lineRt.offsetMax = Vector2.zero;

            // Icon
            var iconGo = new GameObject("Icon");
            iconGo.transform.SetParent(root.transform, false);
            var iconTmp = iconGo.AddComponent<TextMeshProUGUI>();
            iconTmp.text      = data.Icon;
            iconTmp.fontSize  = 24;
            iconTmp.color     = data.Accent;
            iconTmp.alignment = TextAlignmentOptions.Center;
            iconTmp.raycastTarget = false;
            var iconRt = iconGo.GetComponent<RectTransform>();
            iconRt.anchorMin = new Vector2(0f, 0f);
            iconRt.anchorMax = new Vector2(0f, 1f);
            iconRt.offsetMin = new Vector2(12f, 0f);
            iconRt.offsetMax = new Vector2(46f, 0f);

            // Title
            var titleGo = new GameObject("Title");
            titleGo.transform.SetParent(root.transform, false);
            var titleTmp = titleGo.AddComponent<TextMeshProUGUI>();
            titleTmp.text      = data.Title.ToUpperInvariant();
            titleTmp.fontSize  = 14;
            titleTmp.fontStyle = FontStyles.Bold;
            titleTmp.color     = new Color(
                Mathf.Lerp(data.Accent.r, 1f, 0.6f),
                Mathf.Lerp(data.Accent.g, 1f, 0.6f),
                Mathf.Lerp(data.Accent.b, 1f, 0.6f), 1f);
            titleTmp.alignment    = TextAlignmentOptions.MidlineLeft;
            titleTmp.raycastTarget = false;
            var titleRt = titleGo.GetComponent<RectTransform>();
            titleRt.anchorMin = new Vector2(0f, 0.5f);
            titleRt.anchorMax = Vector2.one;
            titleRt.offsetMin = new Vector2(52f, 2f);
            titleRt.offsetMax = new Vector2(-8f, -4f);

            // Subtitle
            var subGo = new GameObject("Subtitle");
            subGo.transform.SetParent(root.transform, false);
            var subTmp = subGo.AddComponent<TextMeshProUGUI>();
            subTmp.text      = data.Subtitle;
            subTmp.fontSize  = 12;
            subTmp.color     = new Color(0.78f, 0.78f, 0.85f, 1f);
            subTmp.alignment = TextAlignmentOptions.MidlineLeft;
            subTmp.raycastTarget = false;
            var subRt = subGo.GetComponent<RectTransform>();
            subRt.anchorMin = new Vector2(0f, 0f);
            subRt.anchorMax = new Vector2(1f, 0.5f);
            subRt.offsetMin = new Vector2(52f, 4f);
            subRt.offsetMax = new Vector2(-8f, -2f);

            return root;
        }
    }
}
