// ────────────────────────────────────────────────────────────────────────────
// main.ink
// Entry point for the narrative engine.
// This file is NOT played directly — it documents the episode architecture.
// Each episode is a standalone .ink file loaded by EpisodeLoader.
// ────────────────────────────────────────────────────────────────────────────
//
// Episode loading flow:
//   EpisodeRegistry  →  EpisodeManifest  →  EpisodeLoader  →  NarrativeManager
//
// To add a new episode:
//   1. Create Assets/Ink/Episodes/Episode_XXX/Episode_XXX.ink
//   2. Compile it to Episode_XXX.ink.json (Ink plugin does this automatically)
//   3. Create an EpisodeManifest ScriptableObject and assign the .ink.json
//   4. Drag the manifest into EpisodeRegistry.Episodes list
//   Done — the episode appears in the episode select screen.
// ────────────────────────────────────────────────────────────────────────────
-> END
