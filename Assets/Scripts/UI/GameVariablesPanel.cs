using System.Text;
using NGames.Core.Narrative;
using NGames.Core.State;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

namespace NGames.UI
{
    /// <summary>
    /// Developer overlay showing all live game variables.
    /// Toggle with backtick (`) or F2. Refreshes every 0.5 s while visible.
    /// Self-bootstraps — no scene wiring required.
    /// </summary>
    public class GameVariablesPanel : MonoBehaviour
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        private static void Bootstrap()
        {
            if (FindFirstObjectByType<GameVariablesPanel>() != null) return;
            var go = new GameObject("[GameVariablesPanel]");
            DontDestroyOnLoad(go);
            go.AddComponent<GameVariablesPanel>();
        }

        private GameObject      _root;
        private TextMeshProUGUI _content;
        private RectTransform   _contentRt;
        private bool            _visible;
        private float           _refreshTimer;
        private const float     RefreshInterval = 0.5f;

        private void Awake() => BuildUI();

        // ── UI construction ────────────────────────────────────────────────────
        private void BuildUI()
        {
            // Overlay canvas
            var cgo    = new GameObject("Canvas");
            cgo.transform.SetParent(transform, false);
            var canvas = cgo.AddComponent<Canvas>();
            canvas.renderMode   = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 200;
            var scaler = cgo.AddComponent<CanvasScaler>();
            scaler.uiScaleMode         = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = new Vector2(1920, 1080);
            cgo.AddComponent<GraphicRaycaster>();

            // Panel — right 28% of screen
            _root = new GameObject("Panel");
            _root.transform.SetParent(cgo.transform, false);
            _root.AddComponent<Image>().color = new Color(0.04f, 0.04f, 0.07f, 0.95f);
            var panelRt = _root.GetComponent<RectTransform>();
            panelRt.anchorMin = new Vector2(0.72f, 0f);
            panelRt.anchorMax = Vector2.one;
            panelRt.offsetMin = panelRt.offsetMax = Vector2.zero;

            // Header
            var headerGo = new GameObject("Header");
            headerGo.transform.SetParent(_root.transform, false);
            headerGo.AddComponent<Image>().color = new Color(0.15f, 0.08f, 0.30f, 1f);
            var headerRt = headerGo.GetComponent<RectTransform>();
            headerRt.anchorMin = new Vector2(0f, 0.96f);
            headerRt.anchorMax = Vector2.one;
            headerRt.offsetMin = headerRt.offsetMax = Vector2.zero;

            var headerTextGo = new GameObject("HeaderText");
            headerTextGo.transform.SetParent(headerGo.transform, false);
            var headerTmp = headerTextGo.AddComponent<TextMeshProUGUI>();
            headerTmp.text      = "GAME VARIABLES  <size=70%><color=#888>[ ` or F2 ]</color></size>";
            headerTmp.fontSize  = 17;
            headerTmp.fontStyle = FontStyles.Bold;
            headerTmp.color     = new Color(0.88f, 0.80f, 1f, 1f);
            headerTmp.alignment = TextAlignmentOptions.MidlineLeft;
            var headerTextRt = headerTextGo.GetComponent<RectTransform>();
            headerTextRt.anchorMin = Vector2.zero;
            headerTextRt.anchorMax = Vector2.one;
            headerTextRt.offsetMin = new Vector2(10, 0);
            headerTextRt.offsetMax = Vector2.zero;

            // Scroll view
            var scrollGo = new GameObject("ScrollView");
            scrollGo.transform.SetParent(_root.transform, false);
            var scrollRt = scrollGo.AddComponent<RectTransform>();
            scrollRt.anchorMin = new Vector2(0f, 0f);
            scrollRt.anchorMax = new Vector2(1f, 0.96f);
            scrollRt.offsetMin = scrollRt.offsetMax = Vector2.zero;

            var scrollRect = scrollGo.AddComponent<ScrollRect>();
            scrollRect.horizontal          = false;
            scrollRect.scrollSensitivity   = 30f;
            scrollRect.movementType        = ScrollRect.MovementType.Clamped;

            // Viewport
            var viewportGo = new GameObject("Viewport");
            viewportGo.transform.SetParent(scrollGo.transform, false);
            var viewportImg = viewportGo.AddComponent<Image>();
            viewportImg.color = Color.clear;
            var mask = viewportGo.AddComponent<Mask>();
            mask.showMaskGraphic = false;
            var viewportRt = viewportGo.GetComponent<RectTransform>();
            viewportRt.anchorMin = Vector2.zero;
            viewportRt.anchorMax = Vector2.one;
            viewportRt.offsetMin = viewportRt.offsetMax = Vector2.zero;
            scrollRect.viewport = viewportRt;

            // Content rect — height is driven by the TMP preferred height
            var contentGo = new GameObject("Content");
            contentGo.transform.SetParent(viewportGo.transform, false);
            _contentRt            = contentGo.AddComponent<RectTransform>();
            _contentRt.anchorMin  = new Vector2(0f, 1f);
            _contentRt.anchorMax  = new Vector2(1f, 1f);
            _contentRt.pivot      = new Vector2(0.5f, 1f);
            _contentRt.offsetMin  = _contentRt.offsetMax = Vector2.zero;
            var csf = contentGo.AddComponent<ContentSizeFitter>();
            csf.verticalFit = ContentSizeFitter.FitMode.PreferredSize;
            scrollRect.content = _contentRt;

            // The text
            var textGo = new GameObject("Text");
            textGo.transform.SetParent(contentGo.transform, false);
            _content             = textGo.AddComponent<TextMeshProUGUI>();
            _content.fontSize    = 15;
            _content.color       = new Color(0.85f, 0.95f, 0.85f, 1f);
            _content.alignment   = TextAlignmentOptions.TopLeft;
            _content.richText    = true;
            _content.overflowMode = TextOverflowModes.Overflow;
            _content.textWrappingMode = TMPro.TextWrappingModes.Normal;
            var textRt           = textGo.GetComponent<RectTransform>();
            textRt.anchorMin     = Vector2.zero;
            textRt.anchorMax     = Vector2.one;
            textRt.offsetMin     = new Vector2(10,  8);
            textRt.offsetMax     = new Vector2(-6, -4);

            _root.SetActive(false);
        }

        // ── Toggle & refresh ───────────────────────────────────────────────────
        private void Update()
        {
            bool toggle = Keyboard.current != null && (
                Keyboard.current.backquoteKey.wasPressedThisFrame ||
                Keyboard.current.f2Key.wasPressedThisFrame);

            if (toggle)
            {
                _visible = !_visible;
                _root.SetActive(_visible);
                if (_visible) { Refresh(); _refreshTimer = 0f; }
            }

            if (_visible)
            {
                _refreshTimer += Time.unscaledDeltaTime;
                if (_refreshTimer >= RefreshInterval)
                {
                    _refreshTimer = 0f;
                    Refresh();
                }
            }
        }

        private void Refresh()
        {
            var sb = new StringBuilder();

            // ── Episode ──────────────────────────────────────────────────────
            var nm = NarrativeManager.Instance;
            sb.AppendLine(Section("EPISODE"));
            sb.AppendLine(Row("ID",          nm?.CurrentEpisodeId ?? "—"));
            sb.AppendLine(Row("Active",      nm?.IsStoryActive.ToString() ?? "—"));
            sb.AppendLine(Row("CanContinue", nm?.CanContinue.ToString()   ?? "—"));
            sb.AppendLine(Row("Choices",    (nm?.CurrentChoices?.Count ?? 0).ToString()));

            // ── Player ───────────────────────────────────────────────────────
            var save = GameStateManager.Instance?.SaveData;
            sb.AppendLine();
            sb.AppendLine(Section("PLAYER"));
            sb.AppendLine(Row("Name", save?.PlayerName ?? "—"));

            // ── Completed Episodes ────────────────────────────────────────────
            if (save?.CompletedEpisodes?.Count > 0)
            {
                sb.AppendLine();
                sb.AppendLine(Section("COMPLETED EPISODES"));
                foreach (var ep in save.CompletedEpisodes)
                    sb.AppendLine($"  <color=#aaaacc>•</color> <color=#ffffff>{ep}</color>");
            }

            // ── Flags ─────────────────────────────────────────────────────────
            if (save?.Flags?.Count > 0)
            {
                sb.AppendLine();
                sb.AppendLine(Section("FLAGS"));
                foreach (var kv in save.Flags)
                    sb.AppendLine(Row(kv.Key,
                        kv.Value ? "<color=#88ff88>true</color>"
                                 : "<color=#ff8888>false</color>"));
            }

            // ── Counters ──────────────────────────────────────────────────────
            if (save?.Counters?.Count > 0)
            {
                sb.AppendLine();
                sb.AppendLine(Section("COUNTERS"));
                foreach (var kv in save.Counters)
                    sb.AppendLine(Row(kv.Key, kv.Value.ToString()));
            }

            // ── Strings ───────────────────────────────────────────────────────
            if (save?.Strings?.Count > 0)
            {
                sb.AppendLine();
                sb.AppendLine(Section("STRINGS"));
                foreach (var kv in save.Strings)
                    sb.AppendLine(Row(kv.Key, kv.Value));
            }

            // ── Ink Variables ─────────────────────────────────────────────────
            var inkVars = nm?.GetAllInkVariables();
            if (inkVars?.Count > 0)
            {
                sb.AppendLine();
                sb.AppendLine(Section("INK VARIABLES"));
                foreach (var kv in inkVars)
                    sb.AppendLine(Row(kv.Key, kv.Value?.ToString() ?? "null"));
            }

            _content.text = sb.ToString();

            // Force layout so ContentSizeFitter resizes the content rect immediately
            Canvas.ForceUpdateCanvases();
            LayoutRebuilder.ForceRebuildLayoutImmediate(_contentRt);
        }

        private static string Section(string t) =>
            $"<color=#cc99ff><b>── {t} ──</b></color>";

        private static string Row(string key, string value) =>
            $"  <color=#9999bb>{key}:</color> {value}";
    }
}
