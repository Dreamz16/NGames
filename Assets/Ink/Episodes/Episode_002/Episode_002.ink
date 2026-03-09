// ────────────────────────────────────────────────────────────────────────────
// Episode 002 — "Halcyon"
// Author:  [Your Name]
// Release: Week 2
//
// Synopsis: You investigate the Voss Institute records and meet Morgan — who
//           may know more about Halcyon than they're letting on.
// Prerequisite: ep_001
// ────────────────────────────────────────────────────────────────────────────
INCLUDE ../../Shared/globals.ink
INCLUDE ../../Shared/functions.ink
EXTERNAL get_player_name()
EXTERNAL has_completed_episode(episode_id)
EXTERNAL get_flag(flag_name)
// ── Episode-local variables ────────────────────────────────────────────────
VAR found_halcyon_file     = false
VAR told_morgan_about_alex = false
VAR morgan_trusts_player   = false
// ────────────────────────────────────────────────────────────────────────────
-> ep02_intro
=== ep02_intro ===
# music: ep02_ambient_city
# scene: city_archive
{ get_flag("met_the_stranger"):
    The name Alex Voss hasn't left your head in three days.
- else:
    Something you heard on the radio three nights ago hasn't left your head.
}
The Voss Institute's public archive is housed in a repurposed municipal library on the edge of the old quarter. Reading rooms, microfiche machines, the particular silence of things that used to matter.
# speaker: Narrator
The clerk at the front desk doesn't look up when you enter.
# speaker: Clerk
"Research access closes at five."
It is currently 4:12.
*[Browse the public index for Halcyon.]*
    -> ep02_search_index
*[Ask the clerk directly.]*
    -> ep02_ask_clerk
*[Look for a reading room to work unobserved.]*
    -> ep02_find_quiet_room
=== ep02_search_index ===
# speaker: Narrator
The public index is a wall of card-catalogue drawers — and, more usefully, three terminals running a digitised search interface from approximately 2003.
You type: H-A-L-C-Y-O-N.
Zero results.
You try variations. Project Halcyon. Operation Halcyon. Halcyon Protocol.
On the fourth attempt — "Halcyon Trial" — the screen returns a single entry:
*Halcyon / sub-file 7 / Meridian Health Group / restricted access — archivist authorisation required.*
find_clue("halcyon_index_entry")
-> ep02_restricted_file
=== ep02_ask_clerk ===
# speaker: {get_player_name()}
"I'm looking for materials related to a project called Halcyon. Possibly connected to the Meridian Health Group."
The clerk looks up for the first time. Something behind her eyes recalibrates.
# speaker: Clerk
"That section is restricted. You'd need a research authorisation code from the Institute itself."
# speaker: Narrator
She has already looked back down. But her hand, you notice, is now resting on a desk phone.
*[Press for details — who authorises access?]*
    -> ep02_press_clerk
*[Thank her and back off.]*
    -> ep02_search_index
=== ep02_press_clerk ===
~ change_rapport(rapport_with_morgan, -1)
# speaker: {get_player_name()}
"Who do I contact at the Institute to get that code?"
# speaker: Clerk
"I wouldn't know. Good afternoon."
The hand is definitely on the phone now.
You retreat to a terminal.
-> ep02_restricted_file
=== ep02_find_quiet_room ===
# speaker: Narrator
Reading Room C is empty. A single high window throws a rectangle of pale winter light across a long table.
You're about to sit when you notice someone already in the far corner — bent over a folder, making notes in a tight, controlled hand.
They look up.
-> ep02_meet_morgan
=== ep02_restricted_file ===
# speaker: Narrator
Sub-file 7. Restricted. You write the reference number in your notebook.
Then — a sound from behind one of the reading room doors. Someone speaking quietly, urgently.
You push the door open a few centimetres.
-> ep02_meet_morgan
=== ep02_meet_morgan ===
# speaker: Morgan
# audio: ep02_morgan_voice
"—the sequencing data doesn't match the published baseline. Not even close."
The person stops. They've seen you.
{ found_halcyon_file:
    They're holding the same folder reference you just wrote down.
}
Dark eyes. Cautious posture. The look of someone who has learned that interruptions are rarely coincidental.
# speaker: Morgan
"This room is occupied."
*[Apologise and start to leave.]*
    -> ep02_morgan_leave
*["I'm looking for information on Halcyon."]*
    -> ep02_morgan_halcyon_direct
*[Sit down. "You were talking about sequencing data."]*
    -> ep02_morgan_eavesdrop
=== ep02_morgan_leave ===
~ track_choice()
# speaker: {get_player_name()}
"Sorry — wrong room."
You start to back out. Their voice stops you.
# speaker: Morgan
"Wait."
A long pause.
# speaker: Morgan
"How did you get past the index? Sub-file 7 shouldn't surface in a public search."
-> ep02_morgan_conversation
=== ep02_morgan_halcyon_direct ===
~ track_choice()
~ change_rapport(rapport_with_morgan, 1)
# speaker: {get_player_name()}
"I'm looking for information on Halcyon. Whatever I can find."
The person is very still.
# speaker: Morgan
"Close the door."
-> ep02_morgan_conversation
=== ep02_morgan_eavesdrop ===
~ track_choice()
# speaker: {get_player_name()}
"You said the sequencing data doesn't match the published baseline."
You sit down. "I'm listening."
Their expression shifts — not quite trust, but the precursor to it.
# speaker: Morgan
"Who are you?"
-> ep02_morgan_conversation
=== ep02_morgan_conversation ===
# speaker: Morgan
"My name is Morgan. I'm a data analyst — or I was, until six months ago, when I was asked to stop asking questions about a particular clinical dataset."
{ met_the_stranger:
    # speaker: {get_player_name()}
    "Does the name Alex Voss mean anything to you?"
    The colour drains from Morgan's face.
    # speaker: Morgan
    "Where did you hear that name?"
    ~ told_morgan_about_alex = true
- else:
    # speaker: {get_player_name()}
    "What dataset?"
    # speaker: Morgan
    "Halcyon. Phase III trial data for the Meridian compound. Fourteen thousand patients."
}
-> ep02_morgan_reveal
=== ep02_morgan_reveal ===
# speaker: Morgan
"The published results show a 73% efficacy rate. The raw data — the data I saw before they locked me out — shows something very different."
*[How different?]*
    -> ep02_morgan_numbers
*["Why are you still digging if they locked you out?"]*
    -> ep02_morgan_motive
*["Who locked you out — specifically?"]*
    -> ep02_morgan_who
=== ep02_morgan_numbers ===
~ track_choice()
~ change_rapport(rapport_with_morgan, 1)
# speaker: Morgan
"Thirty-one percent. And a cluster of adverse events in the 40-to-55 demographic that simply... disappeared from the final report."
A silence opens between you.
{ told_morgan_about_alex:
    # speaker: Morgan
    "If Alex Voss really contacted you — they must have had access to the same files. Which means they're either inside Meridian or they were."
}
-> ep02_episode_end
=== ep02_morgan_motive ===
~ track_choice()
# speaker: Morgan
"Because fourteen thousand people took that compound. Some of them are still taking it."
They close the folder.
# speaker: Morgan
"Someone should know the truth. I decided it would be me."
~ morgan_trusts_player = true
-> ep02_episode_end
=== ep02_morgan_who ===
~ track_choice()
# speaker: Morgan
"Officially? My supervisor. Practically?"
A pause.
# speaker: Morgan
"A man named Carver. He's listed as lead auditor on the trial, but his credentials — I've checked — don't exist before 2019."
find_clue("carver_identity")
-> ep02_episode_end
=== ep02_episode_end ===
# music: ep02_outro_theme
# speaker: Narrator
The archive closes at five. You and Morgan leave together, neither of you quite ready to say the next thing out loud.
On the pavement, Morgan stops.
# speaker: Morgan
"Meet me tomorrow. There's a copy I kept — offsite. If you're serious about this, you should see it."
{ rapport_with_morgan >= 1:
    You say yes without hesitating.
    ~ morgan_trusts_player = true
- else:
    You take a moment. Then: yes.
    ~ morgan_trusts_player = true
}
# flag: alliance_formed = true
# speaker: Narrator
Tonight, for the first time in weeks, you don't feel entirely alone in this.
That might be the most dangerous thing of all.
# scene: black_title_card
-> END
