# Episode Writing Guide

Quick reference for content authors working in Ink.

---

## Episode File Template

```ink
// ────────────────────────────────────────────────────────────────────────────
// Episode XXX — "Title"
// Author:  Your Name
// Release: Week X
// Synopsis: One sentence description.
// Prerequisite: ep_0XX (or "none")
// ────────────────────────────────────────────────────────────────────────────

INCLUDE ../../Shared/globals.ink
INCLUDE ../../Shared/functions.ink

EXTERNAL get_player_name()
EXTERNAL has_completed_episode(episode_id)
EXTERNAL get_flag(flag_name)
EXTERNAL get_counter(counter_name)
EXTERNAL increment_counter(counter_name)

// Episode-local variables
VAR my_local_flag = false

-> ep_intro

=== ep_intro ===
// Your story starts here.
-> END
```

---

## Tag Reference

| Tag | Syntax | Effect |
|-----|--------|--------|
| Speaker name | `# speaker: Alex` | Sets the speaker nameplate |
| Portrait | `# speaker_portrait: alex_happy` | Loads `Resources/Portraits/alex_happy` |
| Sound effect | `# audio: door_creak` | Plays SFX cue |
| Background music | `# music: ep01_theme` | Plays/swaps BGM |
| Scene change | `# scene: forest\|fade` | Transitions to scene (fade/cut/slide) |
| Achievement | `# achievement: found_letter` | Unlocks achievement |
| Persistent flag | `# flag: met_alex = true` | Persists to SaveData across episodes |

---

## Persistent Data

### Reading flags from previous episodes
```ink
{ get_flag("met_the_stranger"):
    "We've met before."
- else:
    "You're a stranger to me."
}
```

### Reading cross-episode variables
```ink
{ met_the_stranger:
    // This works if globals.ink is included
}
```

### Calling counters
```ink
~ increment_counter("times_lied")
{ get_counter("times_lied") >= 3:
    -> bad_ending
}
```

---

## Relationship System

```ink
// Change rapport (clamped to -3 ... +3)
~ change_rapport(rapport_with_alex, 1)   // more trust
~ change_rapport(rapport_with_alex, -1)  // less trust

// Branch on relationship level
{ rapport_with_alex >= 2:
    Alex smiles warmly.
- rapport_with_alex >= 0:
    Alex nods cautiously.
- else:
    Alex looks away.
}

// Display relationship label
"Alex considers you {rapport_label(rapport_with_alex)}."
```

---

## Episode Prerequisites

Set in the `EpisodeManifest` ScriptableObject (`Prerequisites` list).

You can also guard content inside Ink:
```ink
{ has_completed_episode("ep_001"):
    "I remember what you told me last time."
- else:
    "This is the first time we've spoken."
}
```

---

## Naming Conventions

| Item | Convention | Example |
|------|-----------|---------|
| Episode ID | `ep_NNN` (zero-padded) | `ep_001` |
| Knot names | `epNN_description` | `ep01_intro` |
| Local variables | `snake_case` | `found_halcyon_file` |
| Global flags | `snake_case` | `met_the_stranger` |
| Audio cues | `epNN_description` | `ep01_ambient_static` |
| Scene names | `snake_case` | `radio_room` |
| Achievements | `snake_case_verb` | `found_first_clue` |

---

## Checklist Before Submitting an Episode

- [ ] `INCLUDE ../../Shared/globals.ink` at top
- [ ] `INCLUDE ../../Shared/functions.ink` at top
- [ ] All `EXTERNAL` functions declared
- [ ] Episode ends with `-> END`
- [ ] `# scene: black_title_card | fade` before `-> END`
- [ ] `EpisodeManifest` created and configured
- [ ] Manifest added to `EpisodeRegistry`
- [ ] Ink compiles without errors (check Unity console)
- [ ] Playtested all choice branches
- [ ] Any new persistent flags added to `globals.ink`
