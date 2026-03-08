using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

namespace NGames.Editor
{
    /// <summary>
    /// NGames > Generate Narrative Prefabs
    ///
    /// Scans all .ink files, extracts unique # scene: and # speaker: tags,
    /// downloads AI-generated images from Pollinations.ai (using surrounding
    /// narrative prose as the prompt), saves them to Resources/Backgrounds/
    /// and Resources/Characters/, then creates Unity prefabs.
    ///
    /// Already-downloaded images are skipped (cache-friendly).
    /// </summary>
    public class NarrativePrefabGenerator : EditorWindow
    {
        [MenuItem("NGames/Generate Narrative Prefabs")]
        public static void ShowWindow() =>
            GetWindow<NarrativePrefabGenerator>("Narrative Prefab Generator");

        // ── State ───────────────────────────────────────────────────────────────
        // scene key → best narrative context snippet found across all ink files
        private Dictionary<string, string> _sceneContexts    = new();
        private List<string>               _characters        = new();
        private Vector2                    _scroll;
        private string                     _status = "Click 'Scan Ink Files' to begin.";

        // ── GUI ─────────────────────────────────────────────────────────────────
        private void OnGUI()
        {
            EditorGUILayout.Space(4);
            EditorGUILayout.LabelField("Narrative Prefab Generator", EditorStyles.boldLabel);
            EditorGUILayout.LabelField(
                "Generates background & character art from Ink scene/speaker tags.\n" +
                "Uses surrounding narrative prose to build descriptive AI prompts.",
                EditorStyles.wordWrappedMiniLabel);
            EditorGUILayout.Space(6);

            if (GUILayout.Button("Scan Ink Files", GUILayout.Height(28)))
                ScanInkFiles();

            EditorGUILayout.Space(4);

            _scroll = EditorGUILayout.BeginScrollView(_scroll, GUILayout.MaxHeight(300));
            if (_sceneContexts.Count > 0)
            {
                EditorGUILayout.LabelField($"Scenes ({_sceneContexts.Count}):", EditorStyles.boldLabel);
                foreach (var kv in _sceneContexts)
                {
                    var ctx = string.IsNullOrEmpty(kv.Value) ? "(name only)" : kv.Value;
                    EditorGUILayout.LabelField($"  • {kv.Key}", EditorStyles.miniLabel);
                    EditorGUILayout.LabelField($"    ↳ {Truncate(ctx, 90)}", EditorStyles.miniLabel);
                }
                EditorGUILayout.Space(4);
            }
            if (_characters.Count > 0)
            {
                EditorGUILayout.LabelField($"Characters ({_characters.Count}):", EditorStyles.boldLabel);
                foreach (var c in _characters)
                    EditorGUILayout.LabelField("  • " + c, EditorStyles.miniLabel);
            }
            EditorGUILayout.EndScrollView();

            EditorGUILayout.Space(6);

            using (new EditorGUI.DisabledScope(_sceneContexts.Count == 0 && _characters.Count == 0))
            {
                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("Backgrounds", GUILayout.Height(26)))
                    GenerateBackgrounds();
                if (GUILayout.Button("Characters", GUILayout.Height(26)))
                    GenerateCharacters();
                EditorGUILayout.EndHorizontal();
                if (GUILayout.Button("Generate All", GUILayout.Height(30)))
                {
                    GenerateBackgrounds();
                    GenerateCharacters();
                }
            }

            EditorGUILayout.Space(4);
            EditorGUILayout.HelpBox(_status, MessageType.Info);
        }

        // ── Scan ────────────────────────────────────────────────────────────────
        private void ScanInkFiles()
        {
            _sceneContexts.Clear();
            _characters.Clear();

            var charSet = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

            var guids = AssetDatabase.FindAssets("t:DefaultAsset", new[] { "Assets/Ink" });
            foreach (var guid in guids)
            {
                var path = AssetDatabase.GUIDToAssetPath(guid);
                if (!path.EndsWith(".ink", StringComparison.OrdinalIgnoreCase)) continue;

                var lines = File.ReadAllLines(path);
                for (int i = 0; i < lines.Length; i++)
                {
                    var line = lines[i];

                    // Speaker tags
                    var spkMatch = Regex.Match(line, @"#\s*scene:\s*(.+)", RegexOptions.IgnoreCase);
                    if (spkMatch.Success)
                    {
                        var key = spkMatch.Groups[1].Value.Trim()
                            .Split('|')[0].Trim()           // strip |fade etc.
                            .ToLowerInvariant().Replace(" ", "_");

                        // Only keep the first (richest) context found for each key
                        if (!_sceneContexts.ContainsKey(key))
                            _sceneContexts[key] = ExtractContext(lines, i + 1);
                    }

                    var charMatch = Regex.Match(line, @"#\s*speaker:\s*(.+)", RegexOptions.IgnoreCase);
                    if (charMatch.Success)
                        charSet.Add(charMatch.Groups[1].Value.Trim().ToLowerInvariant());
                }
            }

            _characters = new List<string>(charSet);
            _characters.Sort();

            _status = $"Found {_sceneContexts.Count} scene(s) and {_characters.Count} character(s).";
            Repaint();
        }

        /// <summary>
        /// Walk forward from startLine and collect the first substantive narrative
        /// paragraph (skipping tag lines, variable lines, blank lines, and Ink syntax).
        /// Returns at most ~200 characters of clean prose.
        /// </summary>
        private static string ExtractContext(string[] lines, int startLine)
        {
            var parts = new List<string>();
            int collected = 0;

            for (int i = startLine; i < Math.Min(startLine + 20, lines.Length); i++)
            {
                var raw = lines[i].Trim();

                // Skip empty, Ink-only, tag-only, variable assignment lines
                if (string.IsNullOrWhiteSpace(raw)) continue;
                if (raw.StartsWith("#"))              continue;   // tag
                if (raw.StartsWith("~"))              continue;   // variable
                if (raw.StartsWith("->"))             continue;   // divert
                if (raw.StartsWith("*") || raw.StartsWith("+")) continue; // choice
                if (raw.StartsWith("//"))             continue;   // comment
                if (raw.StartsWith("="))              continue;   // knot/stitch

                // Strip inline Ink tags and rich-text markup for cleaner prose
                var clean = Regex.Replace(raw, @"#[^#\n]+", "");
                clean = Regex.Replace(clean, @"<[^>]+>", "");
                clean = clean.Trim();
                if (string.IsNullOrEmpty(clean)) continue;

                parts.Add(clean);
                collected += clean.Length;
                if (collected >= 200) break;
            }

            return string.Join(" ", parts);
        }

        // ── Backgrounds ─────────────────────────────────────────────────────────
        private void GenerateBackgrounds()
        {
            const string outDir    = "Assets/Resources/Backgrounds";
            const string prefabDir = "Assets/Prefabs/Backgrounds";
            Directory.CreateDirectory(outDir);
            Directory.CreateDirectory(prefabDir);

            var scenes = new List<string>(_sceneContexts.Keys);
            int done = 0, skipped = 0, total = scenes.Count;

            foreach (var key in scenes)
            {
                var filePath = $"{outDir}/{key}.png";
                if (File.Exists(filePath)) { skipped++; done++; continue; }

                _status = $"Downloading background: {key} ({done + 1}/{total})…";
                Repaint();

                var context = _sceneContexts[key];
                var url     = BuildBackgroundUrl(key, context, seed: Math.Abs(key.GetHashCode()) % 9999);

                if (Download(url, filePath, key))
                    done++;
            }

            AssetDatabase.Refresh();
            ConfigureImportedTextures(outDir, isSprite: false);
            AssetDatabase.Refresh();
            CreateBackgroundPrefabs(outDir, prefabDir);

            _status = $"Backgrounds: {done}/{total} ready ({skipped} cached).";
            Repaint();
        }

        // ── Characters ──────────────────────────────────────────────────────────
        private void GenerateCharacters()
        {
            const string outDir    = "Assets/Resources/Characters";
            const string prefabDir = "Assets/Prefabs/Characters";
            Directory.CreateDirectory(outDir);
            Directory.CreateDirectory(prefabDir);

            int done = 0, skipped = 0, total = _characters.Count;

            foreach (var ch in _characters)
            {
                var filePath = $"{outDir}/{ch}.png";
                if (File.Exists(filePath)) { skipped++; done++; continue; }

                _status = $"Downloading character: {ch} ({done + 1}/{total})…";
                Repaint();

                var url = BuildCharacterUrl(ch, seed: Math.Abs(ch.GetHashCode()) % 9999);

                if (Download(url, filePath, ch))
                    done++;
            }

            AssetDatabase.Refresh();
            ConfigureImportedTextures(outDir, isSprite: true);
            AssetDatabase.Refresh();
            CreateCharacterPrefabs(outDir, prefabDir);

            _status = $"Characters: {done}/{total} ready ({skipped} cached).";
            Repaint();
        }

        // ── Prompt builders ─────────────────────────────────────────────────────
        private static string BuildBackgroundUrl(string key, string context, int seed)
        {
            var sceneName = key.Replace("_", " ");

            string prompt;
            if (!string.IsNullOrWhiteSpace(context))
            {
                // Use narrative prose as the core description, scene name as anchor
                var snippet = Truncate(StripDialogue(context), 180);
                prompt = $"anime visual novel background, {sceneName}, {snippet}, " +
                         "no characters, no people, painterly style, cinematic lighting, " +
                         "atmospheric, wide establishing shot, highly detailed, no text, no watermark";
            }
            else
            {
                prompt = $"anime visual novel background, {sceneName}, " +
                         "atmospheric cinematic lighting, painterly style, " +
                         "wide establishing shot, no characters, no text, no watermark";
            }

            return $"https://image.pollinations.ai/prompt/{Uri.EscapeDataString(prompt)}" +
                   $"?width=1920&height=1080&nologo=true&model=flux&seed={seed}";
        }

        private static string BuildCharacterUrl(string name, int seed)
        {
            var prompt = $"{name}, visual novel character portrait, upper body, " +
                         "anime art style, dramatic lighting, expressive face, " +
                         "detailed costume, plain dark background, no watermark";
            return $"https://image.pollinations.ai/prompt/{Uri.EscapeDataString(prompt)}" +
                   $"?width=512&height=768&nologo=true&model=flux&seed={seed}";
        }

        /// Remove quoted dialogue lines (speaker lines) so the context stays descriptive.
        private static string StripDialogue(string text)
            => Regex.Replace(text, @"""[^""]*""", "").Trim();

        // ── Prefab creation ─────────────────────────────────────────────────────
        private static void CreateBackgroundPrefabs(string resourceDir, string prefabDir)
        {
            foreach (var file in Directory.GetFiles(resourceDir, "*.png"))
            {
                var name      = Path.GetFileNameWithoutExtension(file);
                var assetPath = ToAssetPath(file);
                var tex       = AssetDatabase.LoadAssetAtPath<Texture2D>(assetPath);
                if (tex == null) continue;

                var go  = new GameObject(name + "_BG");
                var img = go.AddComponent<RawImage>();
                img.texture       = tex;
                img.raycastTarget = false;
                var rt = go.GetComponent<RectTransform>();
                rt.anchorMin = Vector2.zero;
                rt.anchorMax = Vector2.one;
                rt.offsetMin = rt.offsetMax = Vector2.zero;

                var prefabPath = $"{prefabDir}/{name}.prefab";
                PrefabUtility.SaveAsPrefabAsset(go, prefabPath);
                DestroyImmediate(go);
            }
        }

        private static void CreateCharacterPrefabs(string resourceDir, string prefabDir)
        {
            foreach (var file in Directory.GetFiles(resourceDir, "*.png"))
            {
                var name      = Path.GetFileNameWithoutExtension(file);
                var assetPath = ToAssetPath(file);
                var sprite    = AssetDatabase.LoadAssetAtPath<Sprite>(assetPath);
                if (sprite == null) continue;

                var go  = new GameObject(name + "_Character");
                var img = go.AddComponent<Image>();
                img.sprite         = sprite;
                img.preserveAspect = true;
                img.raycastTarget  = false;
                go.AddComponent<CanvasGroup>();

                var prefabPath = $"{prefabDir}/{name}.prefab";
                PrefabUtility.SaveAsPrefabAsset(go, prefabPath);
                DestroyImmediate(go);
            }
        }

        // ── Texture importer ────────────────────────────────────────────────────
        private static void ConfigureImportedTextures(string dir, bool isSprite)
        {
            foreach (var file in Directory.GetFiles(dir, "*.png"))
            {
                var assetPath = ToAssetPath(file);
                var importer  = AssetImporter.GetAtPath(assetPath) as TextureImporter;
                if (importer == null) continue;

                importer.textureType    = isSprite ? TextureImporterType.Sprite : TextureImporterType.Default;
                importer.mipmapEnabled  = false;
                importer.filterMode     = FilterMode.Bilinear;
                importer.maxTextureSize = isSprite ? 2048 : 4096;
                importer.SaveAndReimport();
            }
        }

        // ── Helpers ─────────────────────────────────────────────────────────────
        private bool Download(string url, string localPath, string label)
        {
            try
            {
                using var wc = new WebClient();
                wc.Headers.Add("User-Agent", "NGames-PrefabGenerator/1.0");
                var data = wc.DownloadData(url);
                File.WriteAllBytes(localPath, data);
                return true;
            }
            catch (Exception ex)
            {
                Debug.LogWarning($"[PrefabGen] '{label}' download failed: {ex.Message}");
                return false;
            }
        }

        private static string Truncate(string s, int max)
            => s.Length <= max ? s : s[..max].TrimEnd() + "…";

        private static string ToAssetPath(string path)
        {
            var p   = path.Replace('\\', '/');
            int idx = p.IndexOf("Assets/", StringComparison.Ordinal);
            return idx >= 0 ? p[idx..] : p;
        }
    }
}
