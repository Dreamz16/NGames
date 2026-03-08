using UnityEngine;
using UnityEngine.UI;

namespace NGames.UI
{
    /// <summary>
    /// Runtime sprite generators — no texture assets required.
    /// </summary>
    public static class UIUtils
    {
        private const int TEX = 64;
        private const int RAD = 16;   // corner radius in the 64×64 source texture

        /// <summary>
        /// Creates a 9-sliced rounded-rectangle sprite.
        /// border = pixel inset for the 9-slice (should equal RAD = 16).
        /// </summary>
        public static Sprite RoundedRect(Color fill, Color outline, int outlinePx = 3)
        {
            var tex = new Texture2D(TEX, TEX, TextureFormat.RGBA32, false);
            tex.filterMode = FilterMode.Bilinear;
            tex.wrapMode   = TextureWrapMode.Clamp;

            for (int y = 0; y < TEX; y++)
            for (int x = 0; x < TEX; x++)
            {
                float d = RectSDF(x + 0.5f, y + 0.5f, TEX, TEX, RAD);

                Color c;
                if      (d >  1.0f)       c = Color.clear;
                else if (d >  0.0f)       c = new Color(outline.r, outline.g, outline.b, outline.a * (1f - d));
                else if (d > -outlinePx)  c = outline;
                else                      c = fill;

                tex.SetPixel(x, y, c);
            }

            tex.Apply();

            return Sprite.Create(
                tex,
                new Rect(0, 0, TEX, TEX),
                new Vector2(0.5f, 0.5f),
                100f, 0,
                SpriteMeshType.FullRect,
                new Vector4(RAD, RAD, RAD, RAD));   // 9-slice borders
        }

        /// <summary>Signed-distance field for a rounded rectangle. Negative = inside.</summary>
        private static float RectSDF(float px, float py, float w, float h, float r)
        {
            float qx = Mathf.Abs(px - w * 0.5f) - w * 0.5f + r;
            float qy = Mathf.Abs(py - h * 0.5f) - h * 0.5f + r;
            float inner = Mathf.Min(Mathf.Max(qx, qy), 0f);
            float outer = Mathf.Sqrt(Mathf.Max(qx, 0f) * Mathf.Max(qx, 0f) +
                                     Mathf.Max(qy, 0f) * Mathf.Max(qy, 0f));
            return inner + outer - r;
        }

        /// <summary>Creates a small square texture used as a rotated-diamond tail for speech bubbles.</summary>
        public static Sprite Diamond(Color color)
        {
            const int S = 24;
            var tex = new Texture2D(S, S, TextureFormat.RGBA32, false);
            tex.filterMode = FilterMode.Bilinear;
            tex.wrapMode   = TextureWrapMode.Clamp;
            float half = S * 0.5f;

            for (int y = 0; y < S; y++)
            for (int x = 0; x < S; x++)
            {
                float dx = Mathf.Abs(x + 0.5f - half) / half;
                float dy = Mathf.Abs(y + 0.5f - half) / half;
                float alpha = Mathf.Clamp01(1f - (dx + dy) * 0.72f) * color.a;
                tex.SetPixel(x, y, new Color(color.r, color.g, color.b, alpha));
            }

            tex.Apply();
            return Sprite.Create(tex, new Rect(0, 0, S, S), new Vector2(0.5f, 0.5f), 100f);
        }

        /// <summary>1×64 vertical gradient: bottom colour → top colour. Use Image.Type.Simple, preserveAspect=false.</summary>
        public static Sprite VerticalGradient(Color bottom, Color top)
        {
            const int H = 64;
            var tex = new Texture2D(1, H, TextureFormat.RGBA32, false)
                { filterMode = FilterMode.Bilinear, wrapMode = TextureWrapMode.Clamp };
            for (int y = 0; y < H; y++)
                tex.SetPixel(0, y, Color.Lerp(bottom, top, y / (float)(H - 1)));
            tex.Apply();
            return Sprite.Create(tex, new Rect(0, 0, 1, H), new Vector2(0.5f, 0.5f), 100f);
        }

        /// <summary>Radial vignette: transparent centre, darkColor at edges. inner/outer are normalised radii.</summary>
        public static Sprite RadialVignette(int texSize, float inner, float outer, Color darkColor)
        {
            var tex = new Texture2D(texSize, texSize, TextureFormat.RGBA32, false)
                { filterMode = FilterMode.Bilinear, wrapMode = TextureWrapMode.Clamp };
            float half = texSize * 0.5f;
            for (int y = 0; y < texSize; y++)
            for (int x = 0; x < texSize; x++)
            {
                float dx = (x + 0.5f - half) / half;
                float dy = (y + 0.5f - half) / half;
                float a  = Mathf.SmoothStep(inner, outer, Mathf.Sqrt(dx * dx + dy * dy)) * darkColor.a;
                tex.SetPixel(x, y, new Color(darkColor.r, darkColor.g, darkColor.b, a));
            }
            tex.Apply();
            return Sprite.Create(tex, new Rect(0, 0, texSize, texSize), new Vector2(0.5f, 0.5f), 100f);
        }

        /// <summary>Small soft-circle sprite for ambient dust motes.</summary>
        public static Sprite MoteSprite(Color color)
        {
            const int S = 16;
            var tex = new Texture2D(S, S, TextureFormat.RGBA32, false)
                { filterMode = FilterMode.Bilinear, wrapMode = TextureWrapMode.Clamp };
            float half = S * 0.5f;
            for (int y = 0; y < S; y++)
            for (int x = 0; x < S; x++)
            {
                float d = Mathf.Sqrt(Mathf.Pow(x + 0.5f - half, 2) + Mathf.Pow(y + 0.5f - half, 2)) / half;
                tex.SetPixel(x, y, new Color(color.r, color.g, color.b, Mathf.Clamp01(1f - d * 1.2f) * color.a));
            }
            tex.Apply();
            return Sprite.Create(tex, new Rect(0, 0, S, S), new Vector2(0.5f, 0.5f), 100f);
        }

        /// <summary>Add an Image component (or fetch existing) and configure it with a 9-sliced sprite.</summary>
        public static Image SetRoundedRect(GameObject go, Color fill, Color outline, int outlinePx = 3)
        {
            var img = go.GetComponent<Image>();
            if (img == null) img = go.AddComponent<Image>();
            img.sprite   = RoundedRect(fill, outline, outlinePx);
            img.type     = Image.Type.Sliced;
            img.color    = Color.white;    // tint through the sprite's own colour
            return img;
        }
    }
}
