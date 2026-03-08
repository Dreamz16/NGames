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

        private GameObject       _root;
        private TextMeshProUGUI  _content;
        private bool             _visible;
        private float            _refreshTimer;
        private const float      RefreshInterval = 0.5f;

        private void Awake() => BuildUI();

        // ── UI construction ────────────────────────────────────────────────────
        private void BuildUI()
        {
            // Overlay canvas — always on top
            var cgo    = new GameObject("Canvas");
            cgo.transform.SetParent(transform, false);
            var canvas = cgo.AddComponent<Canvas>();
            canvas.renderMode   = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 200;
            var scaler = cgo.AddComponent<CanvasScaler>();
            scaler.uiScaleMode         = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = new Vector2(1920, 1080);
            cgo.AddComponent<GraphicRaycaster>();

            // Panel root — right quarter of screen
            _root = new GameObject("Panel");
            _root.transform.SetParent(cgo.transform, false);
            var panelImg = _root.AddComponent<Image>();
            panelImg.color = new Color(0.05f, 0.05f, 0.08f, 0.93f);
            var panelRt = _root.GetComponent<RectTransform>();
            panelRt.anchorMin = new Vector2(0.72f, 0f);
            panelRt.anchorMax = new Vector2(1f,    1f);
            panelRt.offsetMin = panelRt.offsetMax = Vector2.zero;

            // Header bar
            var header = MakeRect("Header", _root.transform);
            header.anchorMin = new Vector2(0f, 0.96f);
            header.anchorMax = Vector2.one;
            header.offsetMin = header.offsetMax = Vector2.zero;
            var headerImg = header.gameObject.AddComponent<Image>();
            headerImg.color = new Color(0.12f, 0.08f, 0.25f, 1f);

            var titleGo  = MakeRect("Title", header.transform);
            titleGo.anchorMin = Vector2.zero; titleGo.anchorMax = Vector2.one;
            titleGo.offsetMin = new Vector2(12, 0); titleGo.offsetMax = Vector2.zero;
            var titleTmp = titleGo.gameObject.AddComponent<TextMeshProUGUI>();
            titleTmp.text      = "GAME VARIABLES  <size=70%><color=#888>[` or F2 to hide]</color></size>";
            titleTmp.fontSize  = 18;
            titleTmp.alignment = TextAlignmentOptions.MidlineLeft;
            titleTmp.color     = new Color(0.9f, 0.85f, 1f, 1f);
            titleTmp.fontStyle = FontStyles.Bold;

            // Scroll view
            var scrollGo = new GameObject("Scroll");
            scrollGo.transform.SetParent(_root.transform, false);
            var scrollRt = scrollGo.AddComponent<RectTransform>();
            scrollRt.anchorMin = new Vector2(0f, 0f);
            scrollRt.anchorMax = new Vector2(1f, 0.96f);
            scrollRt.offsetMin = scrollRt.offsetMax = Vector2.zero;

            var scrollRect = scrollGo.AddComponent<ScrollRect>();
            scrollRect.horizontal = false;

            // Viewport
            var viewport = MakeRect("Viewport", scrollGo.transform);
            viewport.anchorMin = Vector2.zero; viewport.anchorMax = Vector2.one;
            viewport.offsetMin = viewport.offsetMax = Vector2.zero;
            viewport.gameObject.AddComponent<Image>().color = Color.clear;
            var mask = viewport.gameObject.AddComponent<Mask>();
            mask.showMaskGraphic = false;
            scrollRect.viewport = viewport;

            // Content
            var contentGo = MakeRect("Content", viewport.transform);
            contentGo.anchorMin = new Vector2(0f, 1f);
            contentGo.anchorMax = new Vector2(1f, 1f);
            contentGo.pivot     = new Vector2(0.5f, 1f);
            contentGo.offsetMin = contentGo.offsetMax = Vector2.zero;
            var csf = contentGo.gameObject.AddComponent<ContentSizeFitter>();
            csf.verticalFit = ContentSizeFitter.FitMode.PreferredSize;
            var vlg = contentGo.gameObject.AddComponent<VerticalLayoutGroup>();
            vlg.padding            = new RectOffset(12, 12, 8, 8);
            vlg.childForceExpandWidth = true;
            vlg.childControlWidth     = true;
            vlg.childControlHeight    = true;
            scrollRect.content = contentGo;

            // Text body
            var textGo = new GameObject("Text");
            textGo.transform.SetParent(contentGo.transform, false);
            _content = textGo.AddComponent<TextMeshProUGUI>();
            _content.fontSize  = 15;
            _content.color     = new Color(0.85f, 0.95f, 0.85f, 1f);
            _content.alignment = TextAlignmentOptions.TopLeft;
            _content.richText  = true;
            textGo.AddComponent<LayoutElement>().flexibleWidth = 1;

            _root.SetActive(false);
        }

        // ── Toggle & refresh ───────────────────────────────────────────────────
        private void Update()
        {
            bool toggle =
                (Keyboard.current != null && (
                    Keyboard.current.backquoteKey.wasPressedThisFrame ||
                    Keyboard.current.f2Key.wasPressedThisFrame));

            if (toggle)
            {
                _visible = !_visible;
                _root.SetActive(_visible);
                if (_visible) Refresh();
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
            sb.AppendLine(Row("Choices",     nm?.CurrentChoices?.Count.ToString() ?? "0"));

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
                    sb.AppendLine(BulletRow(ep));
            }

            // ── Flags ─────────────────────────────────────────────────────────
            if (save?.Flags?.Count > 0)
            {
                sb.AppendLine();
                sb.AppendLine(Section("FLAGS"));
                foreach (var kv in save.Flags)
                    sb.AppendLine(Row(kv.Key, kv.Value ? "<color=#88ff88>true</color>" : "<color=#ff8888>false</color>"));
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
        }

        // ── Formatting helpers ─────────────────────────────────────────────────
        private static string Section(string title) =>
            $"<color=#bb99ff><b>── {title} ──</b></color>";

        private static string Row(string key, string value) =>
            $"  <color=#aaaacc>{key}:</color> <color=#ffffff>{value}</color>";

        private static string BulletRow(string value) =>
            $"  <color=#aaaacc>•</color> <color=#ffffff>{value}</color>";

        private static RectTransform MakeRect(string n, Transform parent)
        {
            var go = new GameObject(n);
            go.transform.SetParent(parent, false);
            return go.AddComponent<RectTransform>();
        }
    }
}
