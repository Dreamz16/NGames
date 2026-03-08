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
    /// Unified bottom panel: character portrait on left, dialogue text or choices on right.
    /// No speaker name or accent bar.
    /// </summary>
    public class DialogueView : MonoBehaviour
    {
        [Header("Dialogue")]
        [SerializeField] private TextMeshProUGUI _dialogueText;
        [SerializeField] private GameObject      _dialoguePanel;

        [Header("Choices")]
        [SerializeField] private Transform       _choicesContainer;
        [SerializeField] private ChoiceButtonView _choiceButtonPrefab;

        [Header("End Screen")]
        [SerializeField] private GameObject _endPanel;
        [SerializeField] private Button     _nextEpisodeButton;
        [SerializeField] private Button     _mainMenuButton;

        [Header("Advance Indicator")]
        [SerializeField] private GameObject _advanceIndicator;

        private readonly List<ChoiceButtonView> _choiceButtons = new();

        // Character portrait — created at runtime
        private Image         _characterImage;
        private RectTransform _dialogueRt;
        private CanvasGroup   _panelCg;
        private Coroutine     _textAnimRoutine;

        // Anchor presets for dialogue text
        private static readonly Vector2 TextAnchorMinFull    = new(0.02f, 0.06f);
        private static readonly Vector2 TextAnchorMaxFull    = new(0.97f, 0.92f);
        private static readonly Vector2 TextAnchorMinWithChar = new(0.27f, 0.06f);
        private static readonly Vector2 TextAnchorMaxWithChar = new(0.97f, 0.92f);

        private void Awake()
        {
            // Self-wire
            if (_dialogueText == null)     _dialogueText     = FindTMP("DialogueText");
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

            _panelCg = GetComponent<CanvasGroup>() ?? gameObject.AddComponent<CanvasGroup>();

            if (_dialogueText != null)
                _dialogueRt = _dialogueText.GetComponent<RectTransform>();

            BuildCharacterImage();
        }

        private void BuildCharacterImage()
        {
            var go = new GameObject("CharacterPortrait");
            go.transform.SetParent(transform, false);
            go.transform.SetAsFirstSibling();

            _characterImage              = go.AddComponent<Image>();
            _characterImage.preserveAspect = true;
            _characterImage.raycastTarget  = false;
            _characterImage.color          = Color.white;

            var rt = go.GetComponent<RectTransform>();
            rt.anchorMin = new Vector2(0f,    0f);
            rt.anchorMax = new Vector2(0.25f, 1f);
            rt.offsetMin = rt.offsetMax = Vector2.zero;

            go.SetActive(false);
        }

        private TextMeshProUGUI FindTMP(string childName)
        {
            var t = transform.Find(childName);
            return t != null ? t.GetComponent<TextMeshProUGUI>() : null;
        }

        // ── Character portrait ─────────────────────────────────────────────────
        public void SetCharacterSprite(Sprite sprite)
        {
            if (_characterImage == null) return;
            _characterImage.sprite = sprite;
        }

        public void ShowCharacterImage(bool show)
        {
            if (_characterImage == null) return;
            _characterImage.gameObject.SetActive(show);
            if (_dialogueRt == null) return;
            _dialogueRt.anchorMin = show ? TextAnchorMinWithChar : TextAnchorMinFull;
            _dialogueRt.anchorMax = show ? TextAnchorMaxWithChar : TextAnchorMaxFull;
        }

        // ── Dialogue ───────────────────────────────────────────────────────────
        public void SetDialogueText(string text)
        {
            if (_dialogueText != null)
            {
                _dialogueText.gameObject.SetActive(true);
                _dialogueText.text = text;
            }
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

        // ── TMP Typewriter helpers ─────────────────────────────────────────────
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

        // No-ops kept for compatibility
        public void SetSpeakerName(string name) { }
        public void SetPortrait(string portraitKey) { }

        // ── Choices ────────────────────────────────────────────────────────────
        public void ShowChoices(List<Choice> choices, Action<int> onChoiceSelected)
        {
            HideChoices();

            // Hide dialogue text — choices take the right side
            if (_dialogueText != null) _dialogueText.gameObject.SetActive(false);

            _choicesContainer.gameObject.SetActive(true);

            for (int i = 0; i < choices.Count; i++)
            {
                var btn = Instantiate(_choiceButtonPrefab, _choicesContainer);

                // Explicit height so VerticalLayoutGroup (ChildControlHeight=1) has something to work with
                var le = btn.gameObject.AddComponent<UnityEngine.UI.LayoutElement>();
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

            if (_choicesContainer != null)
                _choicesContainer.gameObject.SetActive(false);

            // Restore dialogue text
            if (_dialogueText != null) _dialogueText.gameObject.SetActive(true);
        }

        // ── End Screen ─────────────────────────────────────────────────────────
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
