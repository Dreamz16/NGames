using UnityEngine;
using UnityEditor;

public class DebugSceneUI 
{
    [MenuItem("Tools/Debug Scene UI")]
    public static void DebugUI()
    {
        var canvas = Object.FindFirstObjectByType<Canvas>();
        if (canvas != null) {
            var bg = canvas.transform.Find("Background");
            if (bg != null) {
                var img = bg.GetComponent<UnityEngine.UI.Image>();
                Debug.Log("Background Image exists: " + (img != null));
                if (img != null) Debug.Log("Background color: " + img.color);
            }
        }
    }
}
