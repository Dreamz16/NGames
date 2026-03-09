// ────────────────────────────────────────────────────────────────────────────
// globals.ink
// Cross-episode persistent variables.
// INCLUDE this file at the top of every episode .ink file.
// Values are synced from SaveData by NarrativeManager on episode load.
// ────────────────────────────────────────────────────────────────────────────
// Player identity
VAR player_name     = "Player"
// Cross-episode story flags (set via # flag: key tags or external functions)
VAR met_the_stranger    = false
VAR knows_the_secret    = false
VAR chose_to_trust      = false
VAR alliance_formed     = false
// Relationship trackers (-3 to +3 range)
VAR rapport_with_alex   = 0
VAR rapport_with_morgan = 0
// Counters
VAR total_choices_made  = 0
VAR clues_found         = 0
