// ────────────────────────────────────────────────────────────────────────────
// Stone of Commitment — Master Entry File
// Source: stone_of_commitment_demo.twee (SugarCube 2.37.3, Studio Zisha 2026)
// Ink conversion for the NGames Unity project.
//
// How to use:
//   Assign this file (compiled .ink.json) to an EpisodeManifest ScriptableObject.
//   NarrativeManager will load it and begin at `layer_map`.
//
// Conversion notes:
//   - SugarCube HTML/CSS stripped; presentational formatting removed.
//   - Speaker attribution: use # speaker: tags to drive DialogueView.
//   - Music/audio cues: use # music: and # audio: tags to drive AudioManager.
//   - Scene changes: use # scene: tags to drive SceneManager.
//   - Achievements: use # achievement: tags to drive AchievementManager.
//   - $avatarName → get_player_name() external function.
//   - $skyResonance → sky_resonance integer (1=match, 2=lawrence_leads, 3=anchor).
//   - $kiraBound → kira_bound integer (0=player, 1=marcus, 2=fang).
//   - <<journal>> macros → # achievement: tags + narrative text in flow.
//   - <<heartbeat>> / <<chestpress>> macros → # music: / tracked via counters.
//   - Two-layer narrative (game + IRL) preserved inline as italic prose.
//   - No Recovery Fracture mechanic preserved via no_recovery_unlocked flag.
//   - All 110+ source passages converted across 3 part files.
// ────────────────────────────────────────────────────────────────────────────
INCLUDE Stone_of_Commitment_Part1.ink
INCLUDE Stone_of_Commitment_Part2.ink
INCLUDE Stone_of_Commitment_Part3.ink
