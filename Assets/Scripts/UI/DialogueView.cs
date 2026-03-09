using System;
using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace NGames.UI
{
    /// <summary>
    /// Unified bottom panel: two character portrait slots (left / right) + dialogue text + choices.
    /// Slot 0 = left, Slot 1 = right (portrait flipped to face inward).
    /// Alpha is controlled externally by CharacterDisplayManager to highlight the active speaker.
    /// </summary>
    public class DialogueView : MonoBehaviour
    {
        [Header("Dialogue")]
        [SerializeField] private TextMeshProUGUI _dialogueText;
        [SerializeField] private GameObject      _dialoguePanel;

        [Header("Choices")]
        [SerializeField] private Transform        _choicesContainer;
        [SerializeField] private ChoiceButtonView _choiceButtonPrefab;

        [Header("End Screen")]
        [SerializeField] private GameObject _endPanel;
        [SerializeField] private Button     _nextEpisodeButton;
        [SerializeField] private Button     _mainMenuButton;

        [Header("Advance Indicator")]
        [SerializeField] private GameObject _advanceIndicator;

        private readonly List<ChoiceButtonView> _choiceButtons = new();

        // ── Two character slots ────────────────────────────────────────────────
        private readonly GameObject[]      _charSlot  = new GameObject[2];
        private readonly Image[]           _portrait  = new Image[2];
        private readonly Image[]           _phBg      = new Image[2];
        private readonly TextMeshProUGUI[] _phInitial = new TextMeshProUGUI[2];
        private readonly CanvasGroup[]     _slotCg    = new CanvasGroup[2];

        // Slot anchors inside the dialogue panel rect
        private static readonly Vector2[] SlotAnchorMin = { new(0f,    0f), new(0.78f, 0f) };
        private static readonly Vector2[] SlotAnchorMax = { new(0.22f, 1f), new(1f,    1f) };

        // Text area anchors — adjusted based on which slots are visible
        private static readonly Vector2 TxtMinNone  = new(0.02f, 0.06f);
        private static readonly Vector2 TxtMaxNone  = new(0.97f, 0.92f);
        private static readonly Vector2 TxtMinLeft  = new(0.24f, 0.06f);
        private static readonly Vector2 TxtMaxLeft  = new(0.97f, 0.92f);
        private static readonly Vector2 TxtMinRight = new(0.02f, 0.06f);
        private static readonly Vector2 TxtMaxRight = new(0.76f, 0.92f);
        private static readonly Vector2 TxtMinBoth  = new(0.24f, 0.06f);
        private static readonly Vector2 TxtMaxBoth  = new(0.76f, 0.92f);

        private RectTransform _dialogueRt;
        private CanvasGroup   _panelCg;
        private Coroutine     _textAnimRoutine;

        // ── Speaker nameplate ──────────────────────────────────────────────────
        private GameObject      _nameplate;
        private Image           _nameplateBg;
        private Image           _nameplateBar;
        private TextMeshProUGUI _nameplateLabel;
        private RectTransform   _nameplateRt;

        // ── Panel accent line (top edge, changes color with active speaker) ────
        private Image _panelAccentLine;

        // ── Lifecycle ──────────────────────────────────────────────────────────
        private void Awake()
        {
            if (_dialogueText == null) _dialogueText = FindTMP("DialogueText");
            if (_choicesContainer == null)
            {
                var t = transform.parent?.Find("ChoicesContainer");
                if (t != null) _choicesContainer = t;
            }
            if (_endPanel == null)
            {
                var t = transform.parent?.Find("EndPanel");
                if (t != null) _endPanel = t.gameObject;
            }
            if (_choiceButtonPrefab == null)
            {
                var prefab = Resources.Load<GameObject>("ChoiceButton");
                if (prefab != null) _choiceButtonPrefab = prefab.GetComponent<ChoiceButtonView>();
            }
            if (_advanceIndicator == null)
            {
                var t = transform.Find("AdvanceIndicator");
                if (t != null) _advanceIndicator = t.gameObject;
            }

            var existingCg = GetComponent<CanvasGroup>();
            _panelCg = (existingCg != null) ? existingCg : gameObject.AddComponent<CanvasGroup>();

            if (_dialogueText != null)
                _dialogueRt = _dialogueText.GetComponent<RectTransform>();

            BuildCharacterSlots();
            BuildNameplate();
            BuildPanelAccentLine();
        }

        // ── Character slots ────────────────────────────────────────────────────
        private void BuildCharacterSlots()
        {
            for (int i = 0; i < 2; i++)
            {
                var slot = new GameObject($"CharacterSlot{i}");
                slot.transform.SetParent(transform, false);
                if (i == 0) slot.transform.SetAsFirstSibling();

                var slotRt = slot.AddComponent<RectTransform>();
                slotRt.anchorMin = SlotAnchorMin[i];
                slotRt.anchorMax = SlotAnchorMax[i];
                slotRt.offsetMin = slotRt.offsetMax = Vector2.zero;

                _slotCg[i] = slot.AddComponent<CanvasGroup>();
                _slotCg[i].alpha = 1f;
                slot.SetActive(false);
                _charSlot[i] = slot;

                // Portrait image
                var imgGo = new GameObject("Portrait");
                imgGo.transform.SetParent(slot.transform, false);
                _portrait[i] = imgGo.AddComponent<Image>();
                _portrait[i].preserveAspect = true;
                _portrait[i].raycastTarget  = false;
                _portrait[i].color          = Color.white;
                var imgRt = imgGo.GetComponent<RectTransform>();
                imgRt.anchorMin = Vector2.zero;
                imgRt.anchorMax = Vector2.one;
                imgRt.offsetMin = imgRt.offsetMax = Vector2.zero;
                // Slot 1 (right side) faces inward
                if (i == 1) imgGo.transform.localScale = new Vector3(-1f, 1f, 1f);

                // Placeholder — coloured bg + initial letter
                var phGo = new GameObject("Placeholder");
                phGo.transform.SetParent(slot.transform, false);
                _phBg[i] = phGo.AddComponent<Image>();
                _phBg[i].raycastTarget = false;
                var phRt = phGo.GetComponent<RectTransform>();
                phRt.anchorMin = Vector2.zero;
                phRt.anchorMax = Vector2.one;
                phRt.offsetMin = phRt.offsetMax = Vector2.zero;

                var initGo = new GameObject("Initial");
                initGo.transform.SetParent(phGo.transform, false);
                _phInitial[i] = initGo.AddComponent<TextMeshProUGUI>();
                _phInitial[i].alignment        = TextAlignmentOptions.Center;
                _phInitial[i].fontStyle        = FontStyles.Bold;
                _phInitial[i].enableAutoSizing = true;
                _phInitial[i].fontSizeMin      = 24;
                _phInitial[i].fontSizeMax      = 120;
                _phInitial[i].raycastTarget    = false;
                var initRt = initGo.GetComponent<RectTransform>();
                initRt.anchorMin = new Vector2(0.1f, 0.2f);
                initRt.anchorMax = new Vector2(0.9f, 0.8f);
                initRt.offsetMin = initRt.offsetMax = Vector2.zero;
            }
        }

        private void BuildNameplate()
        {
            _nameplate = new GameObject("SpeakerNameplate");
            _nameplate.transform.SetParent(transform, false);
            _nameplateRt = _nameplate.AddComponent<RectTransform>();
            _nameplateRt.anchorMin = new Vector2(0.02f, 0.86f);
            _nameplateRt.anchorMax = new Vector2(0.44f, 0.99f);
            _nameplateRt.offsetMin = _nameplateRt.offsetMax = Vector2.zero;
            _nameplate.SetActive(false);

            _nameplateBg = _nameplate.AddComponent<Image>();
            _nameplateBg.raycastTarget = false;
            _nameplateBg.color = new Color(0.04f, 0.02f, 0.12f, 0.94f);

            // Left accent bar
            var barGo = new GameObject("AccentBar");
            barGo.transform.SetParent(_nameplate.transform, false);
            _nameplateBar = barGo.AddComponent<Image>();
            _nameplateBar.raycastTarget = false;
            var barRt = barGo.GetComponent<RectTransform>();
            barRt.anchorMin = Vector2.zero;
            barRt.anchorMax = new Vector2(0f, 1f);
            barRt.offsetMin = Vector2.zero;
            barRt.offsetMax = new Vector2(5f, 0f);

            // Name text
            var labelGo = new GameObject("NameLabel");
            labelGo.transform.SetParent(_nameplate.transform, false);
            _nameplateLabel = labelGo.AddComponent<TextMeshProUGUI>();
            _nameplateLabel.alignment     = TextAlignmentOptions.MidlineLeft;
            _nameplateLabel.fontStyle     = FontStyles.Bold;
            _nameplateLabel.fontSize      = 15;
            _nameplateLabel.color         = Color.white;
            _nameplateLabel.raycastTarget = false;
            _nameplateLabel.overflowMode  = TextOverflowModes.Ellipsis;
            var labelRt = labelGo.GetComponent<RectTransform>();
            labelRt.anchorMin = Vector2.zero;
            labelRt.anchorMax = Vector2.one;
            labelRt.offsetMin = new Vector2(12f, 3f);
            labelRt.offsetMax = new Vector2(-4f, -3f);
        }

        private void BuildPanelAccentLine()
        {
            var lineGo = new GameObject("PanelAccentLine");
            lineGo.transform.SetParent(transform, false);
            lineGo.transform.SetSiblingIndex(0);
            _panelAccentLine = lineGo.AddComponent<Image>();
            _panelAccentLine.raycastTarget = false;
            _panelAccentLine.color = new Color(0.25f, 0.18f, 0.55f, 0.5f);
            var rt = lineGo.GetComponent<RectTransform>();
            rt.anchorMin = new Vector2(0f, 1f);
            rt.anchorMax = Vector2.one;
            rt.offsetMin = new Vector2(0f, -3f);
            rt.offsetMax = Vector2.zero;
        }

        /// <summary>Show the speaker nameplate with the character's accent colour.</summary>
        public void SetSpeakerNameplate(string name, Color accentColor, bool rightAligned = false)
        {
            if (_nameplate == null) return;

            if (string.IsNullOrEmpty(name))
            {
                _nameplate.SetActive(false);
                if (_panelAccentLine != null)
                    _panelAccentLine.color = new Color(0.25f, 0.18f, 0.55f, 0.35f);
                return;
            }

            _nameplate.SetActive(true);
            _nameplateLabel.text = name.ToUpperInvariant();

            var dark = new Color(accentColor.r * 0.10f, accentColor.g * 0.10f, accentColor.b * 0.10f, 0.96f);
            _nameplateBg.color  = dark;
            _nameplateBar.color = accentColor;
            _nameplateLabel.color = new Color(
                Mathf.Lerp(accentColor.r, 1f, 0.65f),
                Mathf.Lerp(accentColor.g, 1f, 0.65f),
                Mathf.Lerp(accentColor.b, 1f, 0.65f), 1f);

            if (rightAligned)
            {
                _nameplateRt.anchorMin = new Vector2(0.56f, 0.86f);
                _nameplateRt.anchorMax = new Vector2(0.98f, 0.99f);
                _nameplateLabel.alignment = TextAlignmentOptions.MidlineRight;
                // Move accent bar to right side
                var barRt = _nameplateBar.GetComponent<RectTransform>();
                barRt.anchorMin = new Vector2(1f, 0f);
                barRt.anchorMax = Vector2.one;
                barRt.offsetMin = new Vector2(-5f, 0f);
                barRt.offsetMax = Vector2.zero;
                _nameplateLabel.GetComponent<RectTransform>().offsetMin = new Vector2(4f,  3f);
                _nameplateLabel.GetComponent<RectTransform>().offsetMax = new Vector2(-12f, -3f);
            }
            else
            {
                _nameplateRt.anchorMin = new Vector2(0.02f, 0.86f);
                _nameplateRt.anchorMax = new Vector2(0.44f, 0.99f);
                _nameplateLabel.alignment = TextAlignmentOptions.MidlineLeft;
                var barRt = _nameplateBar.GetComponent<RectTransform>();
                barRt.anchorMin = Vector2.zero;
                barRt.anchorMax = new Vector2(0f, 1f);
                barRt.offsetMin = Vector2.zero;
                barRt.offsetMax = new Vector2(5f, 0f);
                _nameplateLabel.GetComponent<RectTransform>().offsetMin = new Vector2(12f, 3f);
                _nameplateLabel.GetComponent<RectTransform>().offsetMax = new Vector2(-4f,  -3f);
            }

            if (_panelAccentLine != null)
                _panelAccentLine.color = new Color(accentColor.r * 0.7f, accentColor.g * 0.7f, accentColor.b * 0.7f, 0.65f);
        }

        /// <summary>Show or hide a character slot (0 = left, 1 = right).</summary>
        public void ShowCharacterSlot(int slot, bool show)
        {
            if (slot < 0 || slot >= 2 || _charSlot[slot] == null) return;
            _charSlot[slot].SetActive(show);
            UpdateTextAnchors();
        }

        /// <summary>Display a sprite portrait in the given slot.</summary>
        public void SetSlotSprite(int slot, Sprite sprite)
        {
            if (slot < 0 || slot >= 2) return;
            if (_portrait[slot] != null) { _portrait[slot].sprite = sprite; _portrait[slot].gameObject.SetActive(true); }
            if (_phBg[slot]     != null) _phBg[slot].gameObject.SetActive(false);
            ShowCharacterSlot(slot, true);
        }

        /// <summary>Display a coloured placeholder with the character's initial.</summary>
        public void SetSlotPlaceholder(int slot, string name, Color accentColor)
        {
            if (slot < 0 || slot >= 2) return;
            if (_portrait[slot] != null) _portrait[slot].gameObject.SetActive(false);
            if (_phBg[slot] != null)
            {
                _phBg[slot].color = new Color(
                    accentColor.r * 0.18f, accentColor.g * 0.18f, accentColor.b * 0.18f, 0.95f);
                _phBg[slot].gameObject.SetActive(true);
            }
            if (_phInitial[slot] != null)
            {
                _phInitial[slot].text  = string.IsNullOrEmpty(name) ? "?" : name[..1].ToUpper();
                _phInitial[slot].color = new Color(accentColor.r, accentColor.g, accentColor.b, 0.85f);
            }
            ShowCharacterSlot(slot, true);
        }

        /// <summary>Set the CanvasGroup alpha of a slot (1 = highlighted, ~0.4 = faded).</summary>
        public void SetSlotAlpha(int slot, float alpha)
        {
            if (slot < 0 || slot >= 2 || _slotCg[slot] == null) return;
            _slotCg[slot].alpha = alpha;
        }

        private void UpdateTextAnchors()
        {
            if (_dialogueRt == null) return;
            bool a = _charSlot[0] != null && _charSlot[0].activeSelf;
            bool b = _charSlot[1] != null && _charSlot[1].activeSelf;
            _dialogueRt.anchorMin = (a && b) ? TxtMinBoth  : a ? TxtMinLeft  : b ? TxtMinRight  : TxtMinNone;
            _dialogueRt.anchorMax = (a && b) ? TxtMaxBoth  : a ? TxtMaxLeft  : b ? TxtMaxRight  : TxtMaxNone;
        }

        private TextMeshProUGUI FindTMP(string childName)
        {
            var t = transform.Find(childName);
            return t != null ? t.GetComponent<TextMeshProUGUI>() : null;
        }

        // ── Dialogue text ──────────────────────────────────────────────────────
        public void SetDialogueText(string text)
        {
            if (_dialogueText != null)
            {
                _dialogueText.gameObject.SetActive(true);
                _dialogueText.text = text;
            }
        }

        public void SetDialogueAlignment(TextAlignmentOptions alignment)
        {
            if (_dialogueText != null)
                _dialogueText.alignment = alignment;
        }

        public void AnimateLineIn()
        {
            if (_textAnimRoutine != null) StopCoroutine(_textAnimRoutine);
            _textAnimRoutine = StartCoroutine(LineEntranceRoutine());
        }

        private IEnumerator LineEntranceRoutine()
        {
            if (_panelCg == null) yield break;
            var rt = GetComponent<RectTransform>();
            var basePos = rt != null ? rt.anchoredPosition : Vector2.zero;
            if (rt != null) rt.anchoredPosition = basePos + new Vector2(0f, -6f);
            _panelCg.alpha = 0.4f;

            float e = 0f, dur = 0.22f;
            while (e < dur)
            {
                e += Time.deltaTime;
                float t = Mathf.SmoothStep(0f, 1f, e / dur);
                _panelCg.alpha = Mathf.Lerp(0.4f, 1f, t);
                if (rt != null) rt.anchoredPosition = Vector2.Lerp(basePos + new Vector2(0f, -6f), basePos, t);
                yield return null;
            }
            _panelCg.alpha = 1f;
            if (rt != null) rt.anchoredPosition = basePos;
        }

        public void ShowAdvanceIndicator(bool show)
        {
            if (_advanceIndicator != null) _advanceIndicator.SetActive(show);
        }

        public void SetAdvanceAlpha(float alpha)
        {
            if (_advanceIndicator == null) return;
            var cg = _advanceIndicator.GetComponent<CanvasGroup>();
            if (cg != null) { cg.alpha = alpha; return; }
            var tmp = _advanceIndicator.GetComponent<TextMeshProUGUI>();
            if (tmp != null) { var c = tmp.color; tmp.color = new Color(c.r, c.g, c.b, alpha); return; }
            var img = _advanceIndicator.GetComponent<UnityEngine.UI.Image>();
            if (img != null) { var c = img.color; img.color = new Color(c.r, c.g, c.b, alpha); }
        }

        // ── TMP typewriter helpers ─────────────────────────────────────────────
        public void SetMaxVisibleCharacters(int count)
        {
            if (_dialogueText != null) _dialogueText.maxVisibleCharacters = count;
        }

        public int GetVisibleCharacterCount()
        {
            if (_dialogueText == null) return 0;
            _dialogueText.ForceMeshUpdate();
            return _dialogueText.textInfo.characterCount;
        }

        public char GetCharAt(int index)
        {
            if (_dialogueText == null || index < 0) return '\0';
            var info = _dialogueText.textInfo;
            if (index >= info.characterCount) return '\0';
            return info.characterInfo[index].character;
        }

        public void ShowAllCharacters()
        {
            if (_dialogueText != null) _dialogueText.maxVisibleCharacters = int.MaxValue;
        }

        // Legacy no-ops — nameplate is now driven by CharacterDisplayManager
        public void SetSpeakerName(string name) { }
        public void SetPortrait(string portraitKey) { }

        public void ForceMeshUpdate()
        {
            if (_dialogueText != null) _dialogueText.ForceMeshUpdate();
        }

        // ── Choices ────────────────────────────────────────────────────────────
        public void ShowChoices(List<Choice> choices, Action<int> onChoiceSelected)
        {
            HideChoices();
            if (_dialogueText != null) _dialogueText.gameObject.SetActive(false);
            _choicesContainer.gameObject.SetActive(true);

            for (int i = 0; i < choices.Count; i++)
            {
                var btn = Instantiate(_choiceButtonPrefab, _choicesContainer);
                var le  = btn.gameObject.AddComponent<UnityEngine.UI.LayoutElement>();
                le.preferredHeight = 62;
                le.minHeight       = 48;
                btn.Setup(i, choices[i].text, onChoiceSelected);
                btn.AnimateIn(i);
                _choiceButtons.Add(btn);
            }
        }

        public void HideChoices()
        {
            foreach (var btn in _choiceButtons) Destroy(btn.gameObject);
            _choiceButtons.Clear();
            if (_choicesContainer != null) _choicesContainer.gameObject.SetActive(false);
            if (_dialogueText    != null) _dialogueText.gameObject.SetActive(true);
        }

        // ── End screen ─────────────────────────────────────────────────────────
        public void ShowEndPanel()
        {
            if (_endPanel != null) _endPanel.SetActive(true);
        }

        public void HideEndPanel()
        {
            if (_endPanel != null) _endPanel.SetActive(false);
        }

        public void SetNextEpisodeAction(Action action)
        {
            if (_nextEpisodeButton == null) return;
            _nextEpisodeButton.onClick.RemoveAllListeners();
            _nextEpisodeButton.onClick.AddListener(() => action());
        }

        public void SetMainMenuAction(Action action)
        {
            if (_mainMenuButton == null) return;
            _mainMenuButton.onClick.RemoveAllListeners();
            _mainMenuButton.onClick.AddListener(() => action());
        }
    }
}
