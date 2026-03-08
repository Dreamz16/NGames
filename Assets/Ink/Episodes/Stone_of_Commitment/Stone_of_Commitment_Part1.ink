// ────────────────────────────────────────────────────────────────────────────
// Stone of Commitment — Ink Conversion (Part 1 of 3)
// Source: stone_of_commitment_demo.twee (SugarCube 2.37.3)
// Covers: LayerMap → Act 0 → Act 1 → Bridge_Inn
// ────────────────────────────────────────────────────────────────────────────

INCLUDE ../../Shared/globals.ink
INCLUDE ../../Shared/functions.ink

EXTERNAL get_player_name()
EXTERNAL has_completed_episode(episode_id)

// ── Bond scores ────────────────────────────────────────────────────────────
VAR lawrence = 0
VAR fang     = 0
VAR marcus   = 0
VAR tiberius = 0

// ── Stats ──────────────────────────────────────────────────────────────────
VAR dex  = 0
VAR flow = 0
VAR end  = 0
VAR stag = 0
VAR xp   = 0
VAR commitment = 0

// ── Mechanic flags ─────────────────────────────────────────────────────────
VAR no_recovery_unlocked  = false
VAR heartbeat_count       = 0
VAR chest_press_count     = 0
VAR jiwon_seen            = false
VAR demo_complete         = false
VAR commitment_unlocked   = false

// ── Narrative flags ────────────────────────────────────────────────────────
VAR observed_forest    = false
VAR marcus_consulted   = false
VAR warden_peaceful    = false
VAR firecamp_open      = false
VAR tribunal_dialogue  = false
// sky_resonance: 0=none 1=match 2=lawrence_leads 3=anchor
VAR sky_resonance      = 0
VAR drink_finished     = false
VAR name_revealed      = false
VAR familiar_signal_count = 0

// ── Acts 6–7 flags ─────────────────────────────────────────────────────────
VAR tariq_ledger     = false
VAR batu_met         = false
VAR almas_negotiated = false
VAR almas_vibration  = false
// kira_bound: 0=player 1=marcus 2=fang
VAR kira_bound       = 0
VAR gaochang_scene   = false

// ────────────────────────────────────────────────────────────────────────────
-> layer_map

// ════════════════════════════════════════════════════════════════════════════
// TITLE / PROLOGUE
// ════════════════════════════════════════════════════════════════════════════

=== layer_map ===
# scene: title_card
# music: white_night
<i>Stone of Commitment</i>
<i>A consent-first romantasy RPG set along the Silk Road.</i>

In the real world, you are Ishani — a 30-year-old executive who traded the marriage timeline and the family expectations for a corner office and two rescue pitbulls named Potato and Sammy. You have no regrets. Most days.
In <i>Vanquish Death</i>, the co-op RPG you launched two weeks ago, your handle is FortuneBringsProsperity. FBP. Fortune, to the people who've earned the shortcut.
You're playing tonight because a deadline ate your weekend and you need something that doesn't answer back.
The game has other plans. It always does.
Rhea Port, where three rivers meet the sea and argue about who arrived first. The western gate of the Silk Road. It smells of salt, cardamom, and the kind of history that accumulates when every civilization on earth has needed something from the same harbor.
You arrived following a quest thread: local merchants reporting ships returning empty. Not raided. Not lost. Empty. Cargo intact, crew silent, holds smelling of something below the waterline that nobody wants to describe twice.
Your party is already waiting. They have been waiting since yesterday.
There are two layers to this story. The Game Layer — what happens inside Ninkasa, where immortals fight and Guardians are freed. The IRL Layer — the people behind the characters, whose real lives bleed through. The game will not tell you which is which.

* [Begin.] -> avatar_name_select

=== avatar_name_select ===
# scene: character_select
What should they call you?
Your handle is FortuneBringsProsperity. The party will shorten this immediately.

* [Fortune.] -> mo_stor_descent
* [A different name.] -> mo_stor_descent

=== mo_stor_descent ===
# scene: mo_stor_exterior
# music: white_night_fade
The bar is called Mo Stór. The sign above the door is in a language nobody has spoken aloud in four centuries, but the meaning translates without effort: <i>My Treasure</i>. The kind of name a place gets when it has saved enough people from themselves.
You descend the steps. The door is heavy. The warmth hits you before the sound does.

-> mo_stor_first_impression

=== mo_stor_first_impression ===
# scene: mo_stor_interior
# speaker: Tiberius
"You're late. They've been here since last night."
He sets a drink in front of you without asking what you want. It is exactly what you would have ordered.

* ["Who are 'they'?"] -> mo_stor_which
* [(Look around first.)] -> mo_stor_nice_place

=== mo_stor_nice_place ===
# scene: mo_stor_interior
The bar is ship-timber and candlelight. Privacy alcoves line the back wall. A quest board near the entrance, curated — some notices have been pulled down. An empty stool at the far end of the bar that nobody sits in.

# speaker: Tiberius
"Most people don't notice the stool."
He doesn't explain further. He pours you a second drink. This one is better than the first.

-> mo_stor_which

=== mo_stor_which ===
You find them in the largest alcove. Three people who should not exist in the same room, and yet here they are, arranged around a table like a painting someone made a bet on.

-> mo_stor_meet_fang

=== mo_stor_meet_fang ===
# scene: mo_stor_alcove
# speaker: Fang
The woman on the left has two long blades crossed on the table in front of her like a dare. She is examining her fingernails with the focus of someone who does this when she is actively not looking at something she finds interesting. She is looking at you.
"You walk like you've been carrying something heavy. Not a weapon. Something else."
She doesn't press. She just noticed. Out loud.

-> mo_stor_meet_marcus

=== mo_stor_meet_marcus ===
# speaker: Marcus
The large man in the center has his nose almost touching the surface of the table, reading the grain of the wood the way most people read a map. He lifts his head when you sit. His eyes are old. Not tired. Old, in the way that mountains are old.
"You arrived from the east gate. You paused at the harbor before you came in. Something you saw there concerned you."
It was not a question.

-> mo_stor_meet_lawrence

=== mo_stor_meet_lawrence ===
# speaker: Lawrence
The man at the far end of the booth is still. Not resting. Still, the way a very old predator is still: saving motion for when it matters. He does not look up when you sit. He looks up when he has decided to look up, which happens to be exactly when you have stopped expecting it.
"You're smaller than I expected. That's not an insult. Small is harder to read."
He looks back at whatever he was considering before you arrived. You have been assessed and filed.

-> mo_stor_lawrence_briefing

=== mo_stor_lawrence_briefing ===
# speaker: Lawrence
"The Water Guardian — we call her Water, for efficiency — has been imprisoned beneath Rhea Port for three hundred years. The harbour is dying. Three rivers converging wrong. Fish swimming the wrong direction. The light is bad. You may have noticed."

# speaker: Marcus
"There is a Sunken Tribunal beneath the furthest dock, accessible at low tide. The Guardian is held there by a binding that predates the current legal system by several centuries. The jailer is a magistrate who died in service and continued in death because nobody told him to stop."

# speaker: Fang
"We need a fourth. Specifically one who is still alive and therefore capable of things we are not."

* ["I'm in. What do I need to know?"] -> mo_stor_accept_ask
* ["I'm in." (No questions.)] -> mo_stor_accept_quick
* [(Look at the harbour again through the window.)] -> mo_stor_accept_look

=== mo_stor_accept_ask ===
# achievement: quest_accepted_careful
~ marcus = marcus + 1
# speaker: Marcus
"(finally lifting his head) Good. Ask again when you need to. The question is always worth asking."

-> mo_stor_waystone

=== mo_stor_accept_quick ===
~ dex = dex + 1
# speaker: Fang
"(a grin) There it is."

-> mo_stor_waystone

=== mo_stor_accept_look ===
~ flow = flow + 1
~ tiberius = tiberius + 1
You look out at the harbour through the bar's single window. The current runs inward. Even from here you can see it — the water refusing its own direction.

# speaker: Tiberius
"(watching you look) Most people see that and think: weather. You see it and think: wrong."

He pours you something you didn't ask for. It is exactly right.

-> mo_stor_waystone

=== mo_stor_waystone ===
# scene: mo_stor_waystone
# speaker: Fang
"The Waystone gets you out if things go sideways. One charge. Use it or lose it."

# speaker: Marcus
"It will not get you out of a bad decision. Only a bad location."

# speaker: Lawrence
"They are often the same thing."

* [Head for the port.] -> act0_rhea_port

// ════════════════════════════════════════════════════════════════════════════
// ACT 0 — RHEA PORT
// ════════════════════════════════════════════════════════════════════════════

=== act0_rhea_port ===
# scene: rhea_port
# music: ghost_town
Rhea Port opens up around you. Salt, cardamom, old decisions. Three rivers meeting the sea, except the rivers are wrong. Low tide, yet the current moves inward. Fish swim toward shore. Along their bellies, faint lines that are not scales and not veins — something is counting what it takes back.

The light is wrong too. The sun is present but it does not warm.

Between the market stalls, translucent figures drift. A merchant mid-transaction who is not there when you look directly. A woman carrying a bundle that catches no light. A child running between carts who leaves no footprint. They drift east, always east, and nobody in the market reacts. The dock workers walk through them without breaking stride. This has been happening long enough that the living have stopped seeing it.

You see it. You do not yet know what you are seeing.

* [Investigate the docks.] -> act0_docks
* [Find the harbormaster.] -> act0_harbormaster
* [Climb for a high vantage.] -> act0_high_ground

=== act0_docks ===
# scene: rhea_port_docks
~ dex = dex + 1
The fisherman won't meet your eye. "The fish. They're swimming toward shore. Not away. Three days now."

He holds up one of the dead ones. Along its belly, faint lines that are not scales and not veins. They look almost like tallies. Something is counting what it takes back.

Dock children whisper about drought nightmares — not local droughts, but ancient ones from places and times they could not know.

* [Meet the party at the furthest dock.] -> act0_meet_trio

=== act0_harbormaster ===
# scene: harbormaster_office
~ flow = flow + 1
# speaker: Sera
"The children have been having the drought dreams. And the strange thing is, they're not dreaming about our water. They're dreaming about droughts in places they've never been, famines from centuries ago. My niece woke up screaming about a river she couldn't name in a language she doesn't speak. People keep telling me it's the bad air off the harbour, but I've worked this port for twenty years and bad air doesn't teach children history."

She stamps your travel permit without looking at it. She has bigger concerns.

* [Meet the party at the furthest dock.] -> act0_meet_trio

=== act0_high_ground ===
# scene: clifftop_overlook
~ dex = dex + 1
~ flow = flow + 1
From above, you can see all of it: the three rivers converging wrong, the harbour current pulling inward. And below the waterline at the port's oldest dock, something that glows faintly and should not.

* [Meet the party at the furthest dock.] -> act0_meet_trio

=== act0_meet_trio ===
# scene: furthest_dock
All three had converged at the furthest dock. Lawrence notices you noticed the inward current and says so. The first real bond moment is him acknowledging competence, not charm.

Marcus is nose-to-water, reading the harbour by smell and vibration. Fang leans against a piling with the studied casualness of someone who could kill everything within fifteen feet and has chosen not to.

A vampire with a death wish. A werewolf with a punchline for every occasion. A bear who used to run an empire.

* ["I'm in. What do I need to know?"] -> act0_in_ask
* ["I'm in." (No questions. Figure it out.)] -> act0_in_quick
* ["Give me a minute." (Look at the water again.)] -> act0_in_look

=== act0_in_ask ===
~ marcus = marcus + 1
# speaker: Marcus
"(finally lifting his head) Good. Ask again when you need to. The question is always worth asking."

* [Head for the Tribunal entrance.] -> act0_tribunal_blocked

=== act0_in_quick ===
~ fang = fang + 1
~ dex = dex + 1
# speaker: Fang
"(a grin) There it is."

* [Head for the Tribunal entrance.] -> act0_tribunal_blocked

=== act0_in_look ===
~ flow = flow + 1
~ marcus = marcus + 1
You crouch at the water's edge. The others don't rush you.

The water isn't just still. It's <i>flinching.</i> Every ripple collapses inward like something below is catching them before they can spread.

You've seen this before. Not in water, but in people. The particular stillness of something that used to move freely and has been told, over and over, that movement is the problem.

# speaker: Marcus
"(quietly, beside you) You understand it."

He doesn't explain. He doesn't need to.

* [Stand. "Let's go."] -> act0_tribunal_blocked

=== act0_tribunal_blocked ===
# scene: sea_cave_mouth
The entrance is exactly where Marcus said it would be. Below the furthest dock, accessible now at low tide, a sea-cave mouth that smells of something older than salt. Stone steps descend into darkness.

Lawrence goes first. He makes it four steps before stopping.

# speaker: Lawrence
"There's something across the threshold. Not physical. Not magical either, exactly."

He raises one hand. The air shimmers, faintly translucent — the same translucence as the ghost figures in the market. He pushes. His hand slides sideways, the way water deflects around a stone.

# speaker: Lawrence
"A barrier. My magic can't find purchase on it. There's nothing to grip. It's like trying to suppress smoke."

Fang draws her long blade. A clean, testing cut across the shimmer. The steel passes through without resistance. But when she tries to follow, she cannot.

# speaker: Fang
"My sword goes through. I don't. That's a new one."

Marcus crouches at the top of the steps. Presses one paw flat against the stone. When he speaks, his voice carries the weight of someone connecting very old information.

# speaker: Marcus
"It's not a ward. It's residue. The same energy as the ghosts in the port. Halted momentum. People who were mid-journey when the Guardian disruption hit. Their unfinished movement pooled downhill and collected here, at the lowest point."

# speaker: Fang
"So the ghosts are blocking the door. Without knowing they're blocking the door."

# speaker: Marcus
"They are not blocking anything intentionally. They are simply stuck. And there are enough of them, concentrated through the underground channels, that their collective stalling has sealed the passage like silt blocking a drain."

Lawrence fires a focused mind lance. It enters the shimmer and disperses. Not reflected. Not absorbed. Simply rendered irrelevant.

# speaker: Lawrence
"We can't force this."

# speaker: Fang
"Since when do you accept that?"

# speaker: Lawrence
"Since just now."

# speaker: Marcus
"The ghosts are thickest in the Verdant Verge — the forest outside the port. If the source of the residue is cleared, the barrier should dissipate. The drain unblocks."

# speaker: Fang
"So we have to go through a haunted forest full of ghost choirs to unclog a supernatural drain so we can get into an underwater courtroom to free a water god."

# speaker: Marcus
"That is a concise summary, yes."

# speaker: Fang
"Just checking."

# achievement: tribunal_blocked_discovered
* [Head for the Verdant Verge.] -> act0_travel

=== act0_travel ===
# scene: road_to_verdant_verge
The road from Rhea Port to the forest edge takes the better part of an afternoon. Long enough to learn something.

Lawrence walks point — forward of center, tracking movement at the tree line the way a predator reads terrain. Marcus takes the rear. You learn, in the first mile, that he navigates by sound and vibration as much as by sight.

Fang walks beside you. Close enough to talk, though she chooses not to. She is listening to your footfall, your breathing, the way you hold your weapon.

# speaker: Fang
"(eventually) You walk like someone who's been carrying something heavy for a long time. Not a weapon. Something else."

She doesn't press. She just noticed. Out loud.

* [The forest arrives.] -> act1_entry

// ════════════════════════════════════════════════════════════════════════════
// ACT 1 — THE WHITE NIGHT (Verdant Verge)
// ════════════════════════════════════════════════════════════════════════════

=== act1_entry ===
# scene: verdant_verge_edge
Night never fully arrives in the Verdant Verge. Pale light clings to the leaves like it forgot to leave. The air hums.

Ghostly figures flicker between the trunks. A woman adjusting a pack that is no longer there. A man stepping over a root his foot passes through. Two children holding hands, walking east, reaching the edge of the tree cover and looping back to start again.

# speaker: Marcus
"These aren't invaders. They're echoes. People who never finished leaving."

# speaker: Fang
"So. Singing ghosts. Naturally."

# speaker: Lawrence
"When I was alive, ghosts rattled chains. Now they form choirs. Everything escalates."

# speaker: Fang
"You were alive for, what, forty years? Out of a thousand? You don't get to say 'when I was alive' with that much gravitas."

# speaker: Lawrence
"I absolutely do."

* [Observe before engaging. Let the forest breathe.] -> act1_observe
* [Ask Marcus what he senses.] -> act1_ask_marcus
* [Attack immediately.] -> act1_attack_early

=== act1_observe ===
~ flow = flow + 1
~ observed_forest = true
# scene: verdant_verge_edge
You stop. The party stops with you, without question. A small miracle.

The ghosts circle but don't attack. One drifts close. It bows.

Another does not — it faces a different direction entirely, oriented toward something deeper in the forest. Its posture is not defiance. It is attendance.

~ familiar_signal_count = familiar_signal_count + 1

# speaker: Fang
"...Did it just bow at us?"

# speaker: Marcus
"They want to be heard. Not fought."

# speaker: Lawrence
"Inconveniently, that's harder."

* [Move into the forest.] -> act1_combat_easy

=== act1_ask_marcus ===
~ marcus = marcus + 1
~ dex = dex + 1
~ marcus_consulted = true
# scene: verdant_verge_edge
Marcus crouches. Places one paw flat on the forest floor. His ears rotate independently, reading vibrations you cannot hear.

# speaker: Marcus
"Old grief. The forest held their last memories when they couldn't. They're not hostile. They're incomplete."

# speaker: Fang
"So they're stuck in a feeling they can't finish."

A beat. Nobody says anything about how familiar that sounds.

# speaker: Marcus
"One more thing. They're all oriented the same direction. East. Whatever caught them, they were going somewhere when it happened."

# speaker: Lawrence
"(filing that) Good. That's useful."

* [Move into the forest.] -> act1_combat_easy

=== act1_attack_early ===
~ stag = stag + 1
# scene: verdant_verge_edge
You charge. The ghosts scatter, then surge back, defensive and frightened, which turns out to be worse.

# speaker: Fang
"Okay. Noted. Ghosts have feelings. Harder way it is."

* [Fight through it.] -> act1_combat_hard

=== act1_combat_easy ===
~ xp = xp + 10
# scene: verdant_verge_deep
You move with purpose. Lawrence's mind lance fires first, a clean suppression bolt at the nearest cluster. It passes through. The ghosts simply are not there in the way the lance expects them to be.

# speaker: Lawrence
"(genuinely surprised) That should have worked."

# speaker: Fang
"Noted. Let me try the old-fashioned way."

Fang's long blade arcs through the closest cluster. Beautiful. Clean. The ghost splits, drifts apart like smoke, and reforms two seconds later.

# speaker: Fang
"Okay. That's new."

Marcus tries. Bear form. A full-body charge through a cluster with 1,800 years of mass behind it. The ghosts scatter like startled birds, swirl in a wide orbit, and resettle into the exact same formation.

# speaker: Marcus
"They're not resisting us. They're not even registering us. We're irrelevant to whatever is holding them here."

Three immortals. Combined age of roughly three thousand years. Standing in a haunted forest failing to hit anything.

# speaker: Fang
"This is the weirdest fight I've ever been in."

# speaker: Lawrence
"You've been in worse."

# speaker: Fang
"Name one."

# speaker: Lawrence
"Rome. 476."

# speaker: Fang
"...Fair. Fine. Second weirdest."

The clusters drift closer. Not aggressive. Patient. Waiting to be understood.

* [Watch the ghosts' movement patterns.] -> act1_ghost_watch
* ["They're travelers. Where were they going?"] -> act1_ghost_direction
* ["Lawrence, what does your magic actually see?"] -> act1_ghost_magic

=== act1_ghost_watch ===
~ flow = flow + 1
# scene: verdant_verge_deep
You watch. The party watches you watching, which is its own kind of trust.

The clusters are not random. Each ghost drifts in a loose ellipse, always returning to the same point. Not circling a location. Circling a direction. East. Every single one oriented east along the forest path, looping back before they reach the treeline, starting over.

# speaker: Fang
"They're walking the same road. Over and over."

# speaker: Marcus
"(very quietly) They were heading somewhere when the disruption hit. Their journeys never completed. The forest caught them mid-step and they've been taking that step ever since."

You look at the treeline. The path continues east. The ghosts reach for it and fall back, reach and fall back, like waves that cannot quite touch shore.

# speaker: Lawrence
"We can't destroy an unfinished journey. We have to finish it for them."

# speaker: Fang
"How do you finish someone else's road?"

# speaker: Lawrence
"You open the door they can't reach."

* [Clear the treeline. Give them somewhere to go.] -> act1_ghost_release

=== act1_ghost_direction ===
~ marcus = marcus + 1
# scene: verdant_verge_deep
# speaker: Marcus
"(ears rotating, reading the air) East. They were all heading east. Merchants, probably. Silk Road travelers caught by the Guardian disruption mid-journey."

He crouches. Places one massive paw flat on the forest floor. The diplomatic bear listening to the dead the way he once listened to the Roman Senate: with patience that borders on geological.

# speaker: Marcus
"They're not haunting this forest. They're stuck in the last moment before the road stopped working. Their grief isn't about dying. It's about never arriving."

# speaker: Fang
"(something crosses her face she doesn't explain) So how do we unstick them?"

# speaker: Marcus
"We give them an arrival. Any arrival. An ending they can accept."

# speaker: Lawrence
"The treeline. If we clear a path through and hold it open, the road continues. They can reach the other side."

# speaker: Fang
"We're building a door for dead people."

# speaker: Marcus
"We are finishing their walk for them. Yes."

# speaker: Fang
"(beat) Okay. That's actually beautiful. Don't tell anyone I said that."

* [Clear the treeline. Give them somewhere to go.] -> act1_ghost_release

=== act1_ghost_magic ===
~ lawrence = lawrence + 1
# scene: verdant_verge_deep
Lawrence goes still. Not his performative stillness. The real kind, where he stops managing how he is perceived and just looks.

# speaker: Lawrence
"They have no binding. No curse, no enchantment, no tether. My lance passed through because there is nothing magical holding them here."

# speaker: Fang
"Then what is?"

# speaker: Lawrence
"Momentum."

He points. You follow his finger. Each ghost drifts east. Looping back before the treeline and starting again.

# speaker: Lawrence
"They were moving when the disruption hit. The road broke underneath them. Their bodies stopped but their intention kept going. They have been walking east inside a forest that will not let them leave for three hundred years."

A long silence. Marcus's ears are flat.

# speaker: Marcus
"(very low) Three hundred years of trying to take one more step."

# speaker: Lawrence
"We cannot fight momentum. We can only remove the obstruction. Clear the treeline. Let the road continue. They will do the rest."

Fang is already drawing her blades. Not for ghosts this time. For undergrowth.

* [Clear the treeline. Give them somewhere to go.] -> act1_ghost_release

=== act1_ghost_release ===
# scene: verdant_verge_eastern_treeline
It takes all four of you. Fang cuts the undergrowth with the efficiency of someone who has cleared caravan routes for two centuries. Marcus shoulders aside a fallen trunk that three people could not move. Lawrence holds a suppression field at the edges, keeping displaced wildlife from flooding back in.

You do the work nobody assigned. The stones. The roots. The small obstructions that would not stop a living person but would stop something that has forgotten it can step over things. You clear a path that is not just passable but <i>legible</i>. A road that looks like it goes somewhere.

The party steps back. The path is open. Clean. Wide enough for a wagon. Beyond it, pale moonlight on an open meadow.

The ghosts reach the treeline. And stop.

Every single one. Right at the edge. Drifting forward to the exact boundary and falling back, reaching and retreating — the same loop as before. The open road is right there. They will not cross.

# speaker: Fang
"You have got to be kidding me."

# speaker: Lawrence
"(very still) The obstruction wasn't physical."

# speaker: Marcus
"No. It wasn't."

Marcus sits. The posture of a very old bear who has just understood something and does not enjoy the understanding.

# speaker: Marcus
"The Guardian disruption didn't just block the road. It broke the road's meaning. The path is open, but it doesn't connect to anywhere anymore. To these ghosts, the other side is not a destination. It is nothing. And you cannot walk into nothing, not even when you are dead."

# speaker: Fang
"So we need to make it mean something again. How?"

Silence. Three immortals. None of them have an answer.

# speaker: Lawrence
"(quietly) I don't know. I've been alive for a thousand years and I have never needed a road to mean something. I just walk."

# speaker: Fang
"Same. I walk because walking is what you do. I've never thought about why a road is a road."

# speaker: Marcus
"(slow, realizing) Because we are immortal. A road is just ground to us. We have walked every road there is. We have no unfinished journeys. We cannot show them what arrival feels like because we have forgotten."

Three people who cannot die, standing at the edge of a forest, unable to help the dead for the specific reason that they have lived too long.

The ghosts reach for the treeline and fall back. Reach and fall back.

* ["What if someone who is still on their own journey walks it first?"] -> act1_ghost_guide
* ["I'll go. I'm still going somewhere."] -> act1_ghost_guide_direct
* [(Look at Marcus. He knows.)] -> act1_ghost_guide_marcus

=== act1_ghost_guide ===
~ flow = flow + 1
~ marcus = marcus + 1
# scene: verdant_verge_eastern_treeline
The party turns to look at you. All three of them. At the same time.

# speaker: Marcus
"(very carefully) She's right. Someone still traveling. Someone whose road still has a destination. The ghosts need to remember what it feels like to be going somewhere. They need to see someone do it."

# speaker: Lawrence
"That's you. Not us."

# speaker: Fang
"(to you, very direct) You don't have to. We'll find another way. Eventually. Probably."

The "probably" hangs there like it knows what it's doing.

* [Walk the path.] -> act1_ghost_crossing

=== act1_ghost_guide_direct ===
~ dex = dex + 1
~ lawrence = lawrence + 1
# scene: verdant_verge_eastern_treeline
You are already moving before anyone responds.

# speaker: Fang
"Wait, hold on, we haven't even..."

# speaker: Lawrence
"(catching Fang's arm) Let her go."

# speaker: Fang
"She's been playing this game for two weeks, Lawrence."

# speaker: Lawrence
"And she understood something in thirty seconds that took us three thousand years to miss. Let. Her. Go."

Fang releases the breath she was holding. Nods once.

* [Walk the path.] -> act1_ghost_crossing

=== act1_ghost_guide_marcus ===
~ marcus = marcus + 1
# scene: verdant_verge_eastern_treeline
Marcus meets your eyes. His are old. Older than the forest.

# speaker: Marcus
"(quietly) I think you know what needs to happen. And I think it has to be you. But I will not ask you to do something dangerous without saying it plainly: it might be dangerous. And it has to be your choice."

# speaker: Fang
"What are you two communicating? I'm missing the telepathy."

# speaker: Lawrence
"(watching you) Someone who is still going somewhere has to walk the road first. Show them it leads to an arrival."

A beat.

# speaker: Lawrence
"None of us qualify."

# speaker: Fang
"(to you) Your call. We'll be right here."

* [Walk the path.] -> act1_ghost_crossing

=== act1_ghost_crossing ===
~ xp = xp + 20
~ dex = dex + 1
# scene: verdant_verge_path_east
# music: take_on_me_acoustic
You step past the treeline. Alone.

The air changes. Not temperature. Texture. The forest is behind you. Ahead, the meadow opens and the path continues east under a sky that has not decided whether it is night or dawn.

You are, for the first time since entering the Verdant Verge, outside the trees.

You are also aware that you are walking a road that three hundred dead travelers are watching you walk.

The ghosts press to the treeline behind you. Watching. Not following. Not yet.

You keep walking. Ten paces. Twenty. Each step deliberate. You are not performing courage. You are performing direction. You are a person going somewhere, and the road under your feet is real because you are using it.

Thirty paces. The road curves slightly. Moonlight pools on cobblestones that haven't been walked in three centuries. Your footsteps are the first living sound this stretch of road has heard since the Guardian disruption.

Behind you, something shifts.

The first ghost steps past the treeline. Then the second. The third. You do not turn around. You keep walking, and behind you the sound of the forest changes from humming to exhaling, as three hundred unfinished journeys finally find a direction that means something because someone ahead of them is proving it does.

You feel them flow past you. Cold and ancient and grateful in a way that does not have language. The translucence thins as each one passes. They straighten, the way a person does when they remember where they are going. And then they are gone. Not destroyed. Arrived.

The last one passes so close you feel the hem of a garment that no longer exists brush your wrist. Then silence. Just the road, and the meadow, and you.

# speaker: Fang
"(calling across the clearing, quiet awe she'll deny later) Did you just... walk three hundred ghosts into the afterlife?"

# music: take_on_me_cut
You turn around. The three of them are standing at the tree line. Lawrence's expression has changed, very slightly — something behind his eyes that was not there an hour ago. He does not look away when you notice. Marcus's ears are forward. Fang is grinning.

# speaker: Marcus
"(to Lawrence, as you walk back) And that is why the party needed four."

Lawrence says nothing. He watches you return. When you rejoin the group, he falls into step beside you. Half a step closer than before.

Marcus simply stands as you pass him. Eighteen hundred years of patience expressed as a form of witness.

# speaker: Fang
"We just escorted dead people to their bus stop. With you as the bus."

# speaker: Marcus
"Poetic, Fang."

# speaker: Fang
"I need this on my resume."

* [Face the Warden.] -> act1_warden

// ── Hard path (attacked early) ─────────────────────────────────────────────
=== act1_combat_hard ===
~ xp = xp + 15
~ end = end - 1
~ stag = stag + 1
# scene: verdant_verge_deep
The ghosts are already agitated. Your charge at the edge rattled something in them, and now they move with the particular violence of things disturbed mid-grief.

Fang attacks. Long blade, clean arc. It passes through the nearest cluster like cutting fog. The ghost splits, drifts, reforms.

# speaker: Fang
"That... did nothing."

Lawrence fires a mind lance. It passes through clean. No impact. No resistance.

# speaker: Lawrence
"There's no binding. No enchantment. My lance has nothing to break."

Marcus charges through a cluster. Bear form, full mass. The ghosts scatter like sparrows and swirl right back into formation. He shakes his head, rattled.

# speaker: Marcus
"They are not our enemies. They don't even know we're here. We are punching weather."

A spectral strike grazes your sword arm. Cold that goes past the skin into the architecture of the bone. Your grip weakens.

# speaker: Fang
"We need a new plan. The hitting-things plan has failed. I say this as someone whose entire identity is hitting things."

Then Fang goes silent. When Fang goes silent, something has changed.

# speaker: Fang
"(low, watching the ghosts) They're all moving east."

She is right. Every cluster. The same drift. East, east, east.

# speaker: Marcus
"They were travelers. Heading east when the disruption hit. They never arrived. The forest caught them mid-journey and they cannot stop walking a road that no longer exists."

# speaker: Lawrence
"The treeline. If we force a path open, they'll have somewhere to go."

# speaker: Fang
"(bleeding from the spectral graze) Would have been great to figure that out five minutes ago."

The treeline clearing is messier than it would have been. Fang cuts undergrowth one-handed. Marcus shoulders a fallen trunk with visible effort. Lawrence holds the perimeter, his suppression field thinner than usual.

The path opens. The ghosts reach the treeline. And stop.

# speaker: Fang
"(bleeding, exhausted) I am going to lose my mind."

# speaker: Marcus
"(sitting heavily) The disruption didn't just block the road. It broke what the road means. They cannot walk into nothing."

# speaker: Lawrence
"Someone living has to walk it first. Make it real again. Show them the road goes somewhere."

He looks at Fang. At Marcus. At himself. Three immortals who cannot remember what it feels like to be going somewhere for the first time.

# speaker: Lawrence
"It has to be her."

# speaker: Fang
"(to you, too tired for diplomacy) Your call. We physically cannot do this. And I hate saying that."

You are already moving.

The ghosts watch. You walk past the treeline into the meadow. Each step deliberate. Thirty paces. Moonlight on cobblestones that haven't been walked in three centuries.

Behind you, the first ghost crosses. Then the second. Three hundred unfinished journeys finding a direction that means something because a living person — bruised and tired and still arriving somewhere — is proving it does.

They flow past you. Cold and ancient and grateful. Then silence.

You walk back. Fang is leaning against the fallen trunk, watching you. Marcus's ears are forward. Lawrence watches you return, then falls into step beside you. Half a step closer than before.

# speaker: Marcus
"Don't fight it. Breathe."

You breathe.

* [Face the Warden.] -> act1_warden

// ════════════════════════════════════════════════════════════════════════════
// ACT 1 — THE WARDEN
// ════════════════════════════════════════════════════════════════════════════

=== act1_warden ===
# scene: verdant_verge_heart
The clearing is circular. The trees lean inward — not from wind but from attention. At the center, a woman stands with her arms slightly raised, palms out, as if holding the walls of a room that only she can see.

She is translucent like the other ghosts, but denser. More present. You can see the weave of her merchant's traveling coat, the calluses on her hands from years of packing and unpacking cargo, the particular lean of someone who has stood in one place for so long that her posture has become the place.

She was heading east the day the disruption hit. She never arrived. The forest caught her mid-step and she stayed, because the others were scattering and someone had to hold them together.

Three hundred years of holding. Her arms have not lowered once.

# speaker: Warden
"(voice like wind through old paper) You have come to take them from me."

# speaker: Marcus
"We've come to let them finish. There's a difference."

A long silence. The Warden turns to you — not to Lawrence, not to Marcus, not to Fang. To you. She looks at you the way ghosts do: through the present, through the thing you are performing, into the shape of what brought you here.

# speaker: Warden
"You know what it is to be held in place."

* ["I know what it is to wait when waiting is the only thing left."] -> act1_warden_peace
* ["I know what it is to keep others in a cage because you're afraid to let go."] -> act1_warden_hard
* [(Say nothing. Stay with her silence.)] -> act1_warden_silent

=== act1_warden_peace ===
~ xp = xp + 30
~ warden_peaceful = true
~ lawrence = lawrence + 1
# achievement: warden_released_peaceful
# scene: verdant_verge_heart
The Warden's arms lower. Slowly. The clusters she has been holding for three hundred years drift upward — not scattering but rising together, the way a flock lifts when the thing keeping it grounded finally steps aside. She watches them go. Then she goes with them.

The forest exhales for the first time in months.

Lawrence is standing slightly apart. Something in what you said reached him before he could stop it.
~ chest_press_count = chest_press_count + 1

You notice. He notices that you noticed. He doesn't say anything. He looks away.

That's somehow more.

# music: heartbeat_trigger_1
~ heartbeat_count = heartbeat_count + 1

* [Return to the Portside Inn.] -> bridge_inn

=== act1_warden_hard ===
~ xp = xp + 30
~ fang = fang + 1
# achievement: warden_confronted
# scene: verdant_verge_heart
# speaker: Fang
"(low, to you) That was the right thing. Even if it was the hard thing."

The Warden is still for a long moment. Then her arms lower. For the first time in three hundred years, her arms lower. The clusters she was holding drift upward like sparks from a fire that has finally been allowed to go out. She watches them rise. Her expression is not grief. It is the particular exhaustion of someone who has just set down something so heavy that her body has not yet registered the absence. She follows them up.

The forest exhales.

* [Return to the Portside Inn.] -> bridge_inn

=== act1_warden_silent ===
~ xp = xp + 30
~ marcus = marcus + 1
~ flow = flow + 1
# achievement: warden_chose_herself
# scene: verdant_verge_heart
You say nothing. You stay.

The silence does what words couldn't. The Warden looks at you for a long time. Her eyes move across your face the way someone reads a letter from home.

Then she chooses. Her arms lower on her own terms. Nobody told her. Nobody convinced her. She decided. The clusters drift upward at her pace, not yours. She watches them go the way you watch someone off at a platform when you know the train is the right one. Then she follows.

# speaker: Marcus
"(quietly, beside you) The hardest thing in the world is letting someone choose at their own pace."

* [Return to the Portside Inn.] -> bridge_inn

// ════════════════════════════════════════════════════════════════════════════
// BRIDGE — PORTSIDE INN
// ════════════════════════════════════════════════════════════════════════════

=== bridge_inn ===
# scene: portside_inn
{get_player_name()}'s hands are still cold. Not from temperature. From the place between the treeline and the meadow, where three hundred people who had been walking for three centuries finally stopped walking through her. She can still feel the hem of a garment that no longer exists brushing her wrist. She keeps rubbing the spot without deciding to.

The Warden's voice is still in her chest. Not the words. The thing under the words. <i>You know what it is to be held in place.</i>

{get_player_name()} sits by the fire. The fire is low. Nobody is particularly ready to sleep.

Marcus is asleep, or doing an excellent impression of it. Lawrence is at the window, his reflection looking less like a man keeping watch and more like a man allowing himself to rest.

Fang settles beside you. Closer than she needed to.

# speaker: Fang
"You've been running on fumes since we got here. I can tell."

You didn't say anything that would lead her to that conclusion.

# speaker: Fang
"(softer) It's not a criticism. I just... I know what it looks like. The running-on-empty thing."

* ["You do this a lot? Read people?"] -> bridge_inn_read
* ["I'm fine." (You've been saying that a lot lately.)] -> bridge_inn_fine
* [(Say nothing. Let the fire talk.)] -> bridge_inn_silence

=== bridge_inn_read ===
~ fang = fang + 1
~ firecamp_open = true
# speaker: Fang
"Two hundred years of practice. I'm still getting it wrong half the time. The other half I'm getting it right and wishing I wasn't."

Lawrence's head angle shifts. He is listening. He prefers you not notice.

-> bridge_inn_rest

=== bridge_inn_fine ===
~ end = end + 1
# speaker: Fang
"(a look that says she knows exactly what 'fine' means) Okay. But if you change your mind, I'm right here."

-> bridge_inn_rest

=== bridge_inn_silence ===
~ flow = flow + 1
The fire talks. It says enough. Fang stays beside you. The silence between you is the kind that happens when two people have decided not to perform.

-> bridge_inn_rest

=== bridge_inn_rest ===
The fire burns down. Sleep comes in pieces.

Somewhere between the game and the dream, a sound. Familiar. Not from Ninkasa.

<i>A notification chime. Your phone. The real one.</i>

Byung-Ho: good session. you're better at this than you think.

You stare at it for longer than a text message warrants. That was the person. Not the character. The distinction is supposed to be clean. It is not clean tonight.

* [Type a reply.] -> irl_chat_reply1
* [Set the phone face-down. Return to the fire.] -> irl_chat_decline

=== irl_chat_decline ===
The fire is still there. You return to it. The choice to stay in the game is its own kind of answer, and you both know it.

-> act2_entry

=== irl_chat_reply1 ===
~ name_revealed = false
You: thanks. the warden scene hit different.

Byung-Ho: right? i wasn't sure if you'd go peace or confrontation. the silent path is the rarest one.

You: i took the silent one.

Byung-Ho: i know. i was watching.

<i>He was watching. Not the DM watching the player. The person watching the person. The screen between you is very thin tonight.</i>

* [Keep talking.] -> irl_chat_r1_honest
* [Close the chat.] -> act2_entry

=== irl_chat_r1_honest ===
You: do you always watch that closely?

Byung-Ho: i watch everyone. occupational hazard. but yes. you specifically. you make choices i don't expect and i find that interesting.

<i>The word "interesting" is doing a lot of work in that sentence and you both know it.</i>

* [What else do you find interesting?] -> irl_chat_r2_notice
* [That sounds like a compliment.] -> irl_chat_r2_check
* [I should sleep.] -> act2_entry

=== irl_chat_r2_notice ===
Byung-Ho: the way you read the ghost situation before marcus finished explaining it. the warden choice. the fact that you took notes in the first session. nobody takes notes.

You: i take notes for everything. it's a problem.

Byung-Ho: it's not a problem.

<i>Three words. Lowercase. No punctuation. The most sincere thing he has said in two weeks of roleplay.</i>

-> act2_entry

=== irl_chat_r2_check ===
Byung-Ho: it's an observation. compliments are things i say on purpose. observations just... happen.

You: and this one just happened.

Byung-Ho: yes.

<i>A pause. Long enough to be deliberate.</i>

Byung-Ho: get some sleep. the tribunal is going to be rough.

-> act2_entry

-> END
