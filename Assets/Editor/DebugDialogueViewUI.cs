using UnityEngine;
using UnityEditor;
using NGames.UI;

public class DebugDialogueViewUI 
{
    [MenuItem("Tools/Debug Dialogue View UI")]
    public static void DebugUI()
    {
        var view = Object.FindFirstObjectByType<DialogueView>();
        if (view != null) {
            Debug.Log("Found DialogueView on: " + view.gameObject.name);
            foreach (Transform child in view.transform) {
                Debug.Log(" - Child: " + child.name);
            }
        } else {
            Debug.Log("DialogueView not found in scene.");
        }
    }
}
