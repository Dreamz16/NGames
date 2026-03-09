// ────────────────────────────────────────────────────────────────────────────
// functions.ink
// Reusable Ink functions and stitches used across episodes.
// INCLUDE after globals.ink in every episode.
// ────────────────────────────────────────────────────────────────────────────
// ── Relationship helpers ───────────────────────────────────────────────────
=== function change_rapport(ref rapport, delta) ===
~ rapport = rapport + delta
~ rapport = MAX(-3, MIN(3, rapport))
=== function rapport_label(rapport) ===
{ rapport >= 2:
    ~ return "close ally"
- else:
    { rapport >= 1:
        ~ return "friendly"
    - else:
        { rapport == 0:
            ~ return "neutral"
        - else:
            { rapport <= -2:
                ~ return "hostile"
            - else:
                ~ return "wary"
            }
        }
    }
}
// ── Choice counter ─────────────────────────────────────────────────────────
=== function track_choice() ===
~ total_choices_made = total_choices_made + 1
// ── Conditional greeting ───────────────────────────────────────────────────
=== function player_greeting() ===
{ met_the_stranger:
    - true:  ~ return "Back again."
    - false: ~ return "Hello, stranger."
}
// ── Clue discovery ─────────────────────────────────────────────────────────
=== function find_clue(clue_name) ===
~ clues_found = clues_found + 1
You found a clue: {clue_name}.
