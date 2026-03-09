// ─────────────────────────────────────────────────────────────────────────
// stone_of_commitment_demo_v18 — Auto-generated from stone_of_commitment_demo_v18.twee by NGames pipeline
// DO NOT EDIT DIRECTLY — edit the .twee source in Writer/ instead
// ─────────────────────────────────────────────────────────────────────────

INCLUDE ../../Shared/globals.ink
INCLUDE ../../Shared/functions.ink

EXTERNAL get_player_name()
EXTERNAL has_completed_episode(episode_id)

VAR tkAct0 = true
VAR dockArmCost = true
VAR dockFightLethal = true
VAR artificerUsed = true
VAR tkLatent = true
VAR artificerSeen = true
VAR marcusConsulted = true
VAR observedForest = true
VAR wardenPeaceful = true
VAR tribunalDialogue = true
VAR noRecoveryUnlocked = true
VAR heartbeatPlanted = true
VAR skyResonance = "trust"
VAR pushedThrough = true
VAR batuMet = true
VAR gaochangScene = true
VAR tariqLedger = true
VAR gaochang = "passed"
VAR almasNegotiated = true
VAR kiraApproach = 1
VAR noRecoveryKira = true
VAR kiraFracture = true
VAR kiraBound = "fang"
VAR spiderWebReader = true
VAR spiderFear = true
VAR jiwonSeen = true
VAR commitmentUnlocked = true
VAR stoneFreeCount = 3
VAR marcusSeenYou = true
VAR artificerItems = 1
VAR fireCampOpen = true
VAR waystoneCharges = 1
VAR marcusTouched = true
VAR avatarConsentShown = true
VAR fangFamiliar = true
VAR saltFlatsChoice = "cost"
VAR fangSeen = true
VAR lawrenceFracture = true
VAR partyFriction = true
VAR nameRevealed = true
VAR kaiMet = true
VAR kaiBoundarySet = true
VAR kaiCombatTriggered = true
VAR kaiNoRecoveryWitnessed = true
VAR sunFreeCount = 4
VAR lastLocation = "Act8_BridgeToMoon"
VAR kaiRheaPortScene = true
VAR kaiEnspellAwareness = true
VAR kaiSusceptible = true
VAR moonFreeCount = 5
VAR moonFreed = true
VAR lawrenceArcComplete = true
VAR deathArcStarted = true
VAR moonApproach = true
VAR netAnswerLawrence = "complicated"
VAR netAnswerFang = "given"
VAR netAnswerMarcus = "form"
VAR netConversationComplete = true
VAR jiwonLetterOpened = true
VAR marcusViaAppiaStop = true
VAR lawrenceDeathChoiceMade = true
VAR deathOfferEngaged = false
VAR deathOfferTaken = true
VAR deathFought = true
VAR deathLiberated = true
VAR moStorFinal = true
VAR tiberiusStoolNamed = true

=== opening ===
// ═══ STONE OF COMMITMENTVanquish Death ═══
An RPG about trust. The slow burn kind.
Here is what is true before you log in.

You are Ishani. Thirty. Executive. Corner office you chose over the marriage timeline your parents laid out like place settings at a dinner you never agreed to attend. Two rescue pitbulls named Potato and Sammy. You have no regrets. Most days.

Tonight you have forty-five minutes. You opened the game because you needed to be somewhere else for a little while. The world inside is breaking — there will be a briefing, there is always a briefing — but the thing that made you come back is harder to explain. Something about the bar. The fire that has been burning long enough to be personal. The man at the far end who has not touched his drink since you first noticed him.

You have not logged in to save the world. You have logged in because somewhere in the last session, a woman who had been dead for three hundred years looked through your avatar and saw something you have not said out loud to anyone.

You are not ready. You are going anyway.

+ [Begin.] -> avatarname

=== act0_docks ===
~ dex = dex + 1
// 📍 Rhea Port · The Docks
The fisherman won't meet your eye. "The fish. They're swimming toward shore. Not away. Three days now."

He holds up one of the dead ones. Along its belly, faint lines that are not scales and not veins. They look almost like tallies. Something is counting what it takes back.

Dock children whisper about drought nightmares. Not local droughts, but ancient ones from places and times they could not know.

+ [Head toward the furthest dock.] -> act0_dockambush

=== act0_harbormaster ===
~ flow = flow + 1
// 📍 Rhea Port · Harbormaster's Office
# speaker: Sera
"The children have been having the drought dreams. And the strange thing is, they're not dreaming about our water. They're dreaming about droughts in places they've never been, famines from centuries ago. My niece woke up screaming about a river she couldn't name in a language she doesn't speak. People keep telling me it's the bad air off the harbor, but I've worked this port for twenty years and bad air doesn't teach children history."
She stamps your travel permit without looking at it. She has bigger concerns.

+ [Head toward the furthest dock.] -> act0_dockambush

=== act0_highground ===
~ dex = dex + 1
~ flow = flow + 1
// 📍 Rhea Port · Clifftop Overlook
From above, you can see all of it: the three rivers converging wrong, the harbor current pulling inward. And below the waterline at the port's oldest dock, something that glows faintly and should not.

+ [Head toward the furthest dock.] -> act0_dockambush

=== act0_in_ask ===
~ lawrence = lawrence + 1
Lawrence looks at her. One beat. Back to the water.

# speaker: Lawrence
"You already have it."
+ [Head for the Tribunal entrance.] -> act0_tribunalblocked

=== act0_in_look ===
~ flow = flow + 1
~ marcus = marcus + 1
You crouch at the water's edge. The others don't rush you.

The water isn't just still. It's flinching. Every ripple collapses inward like something below is catching them before they can spread.

You've seen this before. Not in water, but in people. The particular stillness of something that used to move freely and has been told, over and over, that movement is the problem.

# speaker: Marcus
"(quietly, beside you) You understand it."
He doesn't explain. He doesn't need to.

+ [Stand. 'Let's go.'] -> act0_tribunalblocked

=== act0_in_quick ===
~ fang = fang + 1
~ dex = dex + 1
# speaker: Fang
"(a grin) There it is."
+ [Head for the Tribunal entrance.] -> act0_tribunalblocked

=== act0_dockambush ===
// 📍 Rhea Port · Furthest Dock · Slip Three
The furthest dock runs out past the working slips into a narrow finger of stone that the fishing boats avoid. Too far from the market. Too easy to miss from the harbor road. Which is, you understand as you arrive, exactly why three men are here loading crates that are not on any manifest.

Your eyes move through the dock before your feet do. Rope coils at the far piling. A cargo hook wedged in the boards near slip three. Two crates stacked with their handles at reach-height. Load-bearing column at the dock's center, stressed but holding. Two seconds, no decision made. You have one thing you brought. A tension spool: silk thread wound around a carved bone toggle, the kind that fits in a closed fist and leaves no profile. Every character you have ever played carries silk rope. It started in that MMO you hated for six months and loved for three years — the one where you died in the tutorial because you had no way to reach the ledge above you, and after that you never logged in without rope again. Fortune does not know this. She just always has it. You are already deciding whether this is the moment to use it.

You decide it is not. Not yet. You want to see what they are first.

They are not smugglers. Or they were, once. Their eyes have the particular flat quality of people who have been awake for too many days and stopped asking why. One of them is muttering numbers under his breath. The same sequence. Over and over. The crates are marked with the same tally-symbols you noticed on the dead fish.

The nearest one sees you.

He doesn't run. He doesn't call out. He picks up the iron cargo hook at his feet with the slow deliberateness of someone acting on instructions rather than instinct.

# speaker: Lawrence
"(from somewhere behind you, at distance, not moving to help yet) Interesting. Let’s see how she handles it."
There is something colder than evaluation in his voice. He is watching the way a predator watches something it has not yet decided whether to claim.
+ [Close the distance fast. Don't let them reset.] -> act0_dockfight_t1_rush
+ [Read their formation before committing.] -> act0_dockfight_t1_read
+ [Don’t reach for your weapon. Something else first.] -> act0_dockfight_t1_tk

=== act0_dockfight_t1_rush ===
~ dex = dex + 1
~ xp = xp + 5
// 📍 Rhea Port · Furthest Dock · Turn 1
You move before they are ready. The nearest one swings the cargo hook high. Wrong. Wide arc, heavy iron. You step inside it and put him down with an elbow to the jaw. He folds without ceremony.

Two left. They look at each other in the specific way of people whose plan only covered one outcome.

The muttering one stops muttering. That is somehow worse.

+ [Pivot to the second while the third is still deciding.] -> act0_dockfight_t2_press
+ [Give the third one a second to choose differently.] -> act0_dockfight_t2_pause

=== act0_dockfight_t1_read ===
~ flow = flow + 1
~ xp = xp + 5
// 📍 Rhea Port · Furthest Dock · Turn 1
You wait. The formation tells you what you need: the nearest one is the muscle, the one on your left is the signal-caller, the muttering one in the back has not been given a function. He is running on something else entirely.

The muscle swings. You were already sideways. His hook takes the dock planks instead of you and sticks. He pulls. The planks hold. He has approximately one second before he understands what that means.

You use the second.

+ [Close on the signal-caller. Disrupt the coordination.] -> act0_dockfight_t2_press
+ [Hold position. Force them to come to you.] -> act0_dockfight_t2_pause

=== act0_dockfight_t1_tk ===
~ flow = flow + 1
~ xp = xp + 5
~ tkAct0 = true
// 📍 Rhea Port · Furthest Dock · Turn 1
You do not reach for your weapon.

You are not sure why. Something in the geometry of the dock is already moving for you before you have named what you want it to do. The cargo hook near slip three edges a quarter-inch in the wrong direction. The nearest worker tracks the motion. His eyes go to the hook instead of to you. That half-second is not nothing.

You use the half-second. He goes down before the hook has finished moving.

You do not look at the hook directly. You do not name what just happened. You file it the way you file things that do not have categories yet.

The hook is back where it was. You are almost certain it moved. You are not going to think about that right now.

+ [Press the advantage while two are still reset.] -> act0_dockfight_t2_press
+ [Hold. The third one hasn’t moved. Watch him.] -> act0_dockfight_t2_pause

=== act0_dockfight_t2_press ===
~ dex = dex + 1
~ xp = xp + 10
~ dockArmCost = true
// 📍 Rhea Port · Furthest Dock · Turn 2
You press. Two of them are down before the third one moves at all. Clean, fast. But not free.

The signal-caller got one hand on your sword arm in the scramble before he went down. Three seconds of grip, then gone. Three seconds was enough. The tendon along your forearm runs hot. Not injury. A warning. You will feel it if the next hold takes effort.

The third is the muttering one. When he finally turns to face you, his eyes are the wrong kind of wrong. Not fear. Not anger. His pupils have gone fully black at the edges, as if the darkness behind them is pressing forward, and the tally-symbols on the crates are moving on his skin now, faint and fast, tallying something.

He does not come at you with a weapon. He comes at you with his hands. He is heavier than he looks. You know this before he touches you.

+ [Knock him down without hurting him more than necessary.] -> act0_dockfight_t3_restrain
+ [Use the thing you brought.] -> act0_dockfight_t3_device
+ [Put him down hard and fast.] -> act0_dockfight_t3_hard

=== act0_dockfight_t2_pause ===
~ flow = flow + 1
~ xp = xp + 10
// 📍 Rhea Port · Furthest Dock · Turn 2
You hold. And in holding, you see it.

The muttering one. He is not watching you. He is watching the water. He has been watching the water since you arrived. His lips are forming the numbers but his eyes are tracking something below the surface, something moving wrong.

The other two attack together. You manage them. It costs you, a cut across your forearm that opens fast, but they are down.

The muttering one still hasn't moved. He is waist-deep in the water now without having walked. The dock is dry. He is in the water. You did not see him move.

+ [Go in after him. Pull him back.] -> act0_dockfight_t3_pull
+ [Use the thing you brought. Loop and hold.] -> act0_dockfight_t3_device
+ [Don't follow him in. The water is wrong.] -> act0_dockfight_t3_restrain

=== act0_dockfight_t3_restrain ===
~ flow = flow + 1
~ xp = xp + 15
// 📍 Rhea Port · Furthest Dock · Turn 3
{dockArmCost:
    You get hold of him. Your sword arm screams the moment you put your weight into the grip. He is heavier than his frame suggests, weighted by whatever has been moving him, and your forearm is already compromised. It takes longer than it should. You hold on anyway. Your arm is shaking when it is over. You take a breath before you turn around.

    The tally-marks fade when he stops moving toward the water's edge.
- else:
    You get hold of him before he goes further. It takes more than it should. He is heavier than his frame suggests, weighted by whatever has been moving him.
}

His eyes clear. He looks at you with the panicked confusion of someone who has just woken up several feet from where they went to sleep, and he runs.

The crates. You look at them. The marks on the wood are fading too. Whatever was counting has been interrupted.

+ [Leave the dock. Find the party.] -> act0_dockfight_aftermath

=== act0_dockfight_t3_hard ===
~ dex = dex + 1
~ xp = xp + 15
~ dockFightLethal = true
// 📍 Rhea Port · Furthest Dock · Turn 3
You put him down. It takes three seconds and leaves him conscious but done. The tally-marks on the crates shudder. Stop.

His pupils clear when he hits the dock boards. He lies there staring at you with the expression of someone who has just returned from somewhere he cannot describe and does not want to.

He says one thing: a number. Not at you. At the water.

The water does not respond. Which is somehow the worst part.

Fang, from her post by the piling, watches you put him down. Not the way she watched you handle the first two. The grin is gone. Her eyes are level and still.

+ [Leave the dock. Find the party.] -> act0_dockfight_aftermath

=== act0_dockfight_t3_device ===
~ flow = flow + 1
~ xp = xp + 15
~ artificerUsed = true
~ artificerItems = artificerItems - 1
// 📍 Rhea Port · Furthest Dock · Turn 3
You pull the spool from your fist. Three feet of silk thread, fine enough to disappear against the dock, with a bone toggle at each end that locks under tension. You were not sure what you brought it for when you packed it. You know now.

You get the loop around his wrist before he reaches the water's edge. The bone toggles seat and hold. The line goes taut. He stops moving toward the water, arrested mid-step, not understanding why his feet have stopped working. You hold the other end with both hands and do not enter the water.

The tally-marks on his skin dissolve. He sits down on the dock and coughs. Looks at his wrist. Looks at you. His eyes are clear.

He says a number under his breath, once, and then does not say it again.

You release the tension. The spool goes back into your palm. The dock is quiet.

Fang, from her post by the piling, is very still. Not her combat-still. Something else.

+ [Leave the dock. Find the party.] -> act0_dockfight_aftermath

=== act0_dockfight_t3_pull ===
~ flow = flow + 1
~ xp = xp + 15
// 📍 Rhea Port · Furthest Dock · Turn 3
You go in after him. The water is colder than it should be in summer and it resists you in a way water should not, a pressure from below like something with weight pressing up. You get your hands on him. He doesn't struggle. He is simply heavy.

You drag him to the dock. He empties water from his lungs that should not have had time to get there. The tally-marks on his skin dissolve. He sits up, coughing, with the look of someone who forgot where they were for three centuries and has just remembered.

Your arm is bleeding where the current caught it. You will notice that later.

There is a moment, just before you reached him, where you felt the current change direction. Not because the tide shifted. Something else. It released him toward you. You did not ask it to. You do not name that yet. You file it the way you file things that do not have categories yet.
~ tkLatent = true

+ [Get out of the water. Find the party.] -> act0_dockfight_aftermath

=== act0_dockfight_aftermath ===
~ xp = xp + 5
// 📍 Rhea Port · Furthest Dock · After
Fang is leaning against a piling twenty feet away, arms crossed. She has been there the whole time. She was close enough to intervene on any of the turns. She did not.

The harbor sounds come back slowly. Crates. Rope. Water.

You stand on the dock and breathe for a moment. The crates are still there. The marks are still on them. Nothing is resolved. You have slowed something down.

Lawrence is exactly where he was. He has not moved once. He looks at you the way a man looks at something that does not fit the shape of the shelf he had ready for it.

{artificerUsed:
    # speaker: Fang
    "(not a question) What was that thing?"
    She is watching you the way someone watches a hand of cards that just came out different than the deck suggested.

- tkAct0:
    # speaker: Fang
    "(carefully, not her usual register) That hook moved."
    Not a question. Not an accusation. The particular stillness of someone who catalogues things and has just encountered one she cannot place.

- else:
    # speaker: Fang
    "(not a question) You handled the marked one differently."
    She is watching you the way someone watches a hand of cards that just came out different than the deck suggested.

}

+ ["He wasn’t like the others. Something was wrong with him."] -> act0_aftermath_read
+ ["Did you want to jump in at any point?"] -> act0_aftermath_direct
+ [(Say nothing. Find the party.)] -> act0_meettrio

=== act0_aftermath_read ===
~ fang = fang + 1
# speaker: Fang
"The tally marks. I don’t know what they are. But he wasn’t defending. He was completing something. There’s a difference in how a body moves. You saw it too, or you wouldn’t have handled him differently."
{avatarName}: "You weren’t going to tell me?"
# speaker: Fang
"You were handling it. And I wanted to see if you’d catch it on your own."
# speaker: Fang
"(a beat) You did."
+ [Find the party.] -> act0_meettrio

=== act0_aftermath_direct ===
# speaker: Fang
"(the grin) Considered it. Decided you were fine. Also Lawrence said not to."
{avatarName}: "Lawrence told you to let me fight three dockworkers alone? One of whom was clearly not right?"
# speaker: Fang
"He said ‘let’s see how she handles it.’ Which is Lawrence for ‘don’t interfere.’"
# speaker: Fang
"I have opinions about that, which I will express to him later at volume."
~ dex = dex + 1

+ [Find the party.] -> act0_meettrio

=== act0_meettrio ===
// 📍 Rhea Port · Furthest Dock
All three had converged at the furthest dock. Marcus is nose-to-water, reading the harbor by smell and vibration. Fang leans against a piling, arms loose at her sides.

Before Fang notices you, you notice she’s watching a woman at the nearest market stall draw a short recurve. Testing string tension before purchasing. Draw arm level, stance square, weight on the back foot exactly right. The woman holds the draw two full seconds longer than she needs to.

Fang watches her do it. Just watches.

Then she sees you, and the grin comes back.
The party moves along the dock’s edge. Lawrence falls into step beside you without announcing it. He does not touch you.

{artificerUsed:
    # speaker: Lawrence
    "You adjusted for the third one. Most people wouldn’t have. They would have treated all three the same and missed what he was."
    A pause.

    # speaker: Lawrence
    "The thing with the thread. I have seen silk-line restraints in three centuries of combat. Never from a fist. Never with a bone toggle. You built that."
    He looks at you directly for the first time. Something behind his eyes has woken up that was not awake before.

    # speaker: Lawrence
    "It was built for something specific. Not this. You repurposed it in the moment. That is a different skill than fighting. I find I don’t have a category for it."
    ~ artificerSeen = true
- tkAct0:
    # speaker: Lawrence
    "You adjusted for the third one. Most people wouldn’t have. They would have treated all three the same and missed what he was."
    A pause. Longer than the other ones.

    # speaker: Lawrence
    "The hook near slip three moved before you reached it."
    He does not phrase it as a question. He does not phrase it as an accusation. He phrases it the way he phrases things he is going to think about for a very long time.

    He looks at you directly for the first time. Something behind his eyes has woken up that was not awake before. The quality of his attention has changed: he was watching a fighter. He is no longer watching a fighter.

    # speaker: Lawrence
    "I don’t have a category for that either."
- else:
    # speaker: Lawrence
    "You adjusted for the third one. Most people wouldn’t have. They would have treated all three the same and missed what he was."
    A pause.

    # speaker: Lawrence
    "The rope at the far piling. The hook in the boards. Three crates with handles at reach-height. You catalogued them when you walked in. I watched you do it."
    He looks at you directly for the first time. Something behind his eyes has woken up that was not awake before.

    # speaker: Lawrence
    "You chose not to use any of it. You fought with your hands when you had other options. You were preserving something. I don’t know what yet. That is the first thing about you I don’t know."
}

You check the exits now. Without deciding to. The dock edge, the road, the water. In that order.

# speaker: Lawrence
"I find that interesting. I don’t, as a rule, find things interesting anymore."
He turns back to the water. The sentence is complete.
Fang, across the dock, goes very still. Not her combat-still. Not her worry-still. The particular stillness of someone recognizing a pattern and recategorizing it.
+ [‘What was wrong with the third one?’] -> act0_in_ask
+ [‘I’m in.’ (She already was.)] -> act0_in_quick
+ [(Look at the water. The current is still wrong.)] -> act0_in_look

=== act0_in_fang ===
~ fang = fang + 1
{avatarName}: "(to Fang) Her back foot was off-center by about two inches. She noticed it on the third draw. Corrected before she paid."
Fang stares at you.

# speaker: Fang
"I thought I was the only one watching."
{avatarName}: "You were obvious about it."
# speaker: Fang
"I am never obvious."
A beat. She looks at the harbor. Then back at you. Something recategorizes.

# speaker: Fang
"(quieter, not a joke) Yeah. Okay. We’re going to be fine."
+ ['I'm in.'] -> act0_tribunalblocked

=== act0_rheaport ===
// 📍 Rhea Port · Gulf of Smyrna · The Port That Forgot How to Breathe
Rhea Port opens up around you. Salt, cardamom, old decisions. Three rivers meeting the sea, except the rivers are wrong. It's low tide, yet the current moves inward, toward shore, not out. Fish swim the wrong direction. You notice that the fish swimming toward shore have marks on them. Not wounds. Symbols. A fisherman stares at his nets with unspecific dread.

The light is wrong too. The sun is present but it does not warm. Dock workers have stopped commenting on the shadows falling at odd angles; they have been doing it for weeks and the novelty of wrongness has faded into something they carry without naming.

Between the market stalls, something flickers. Translucent figures, faint as heat shimmer. A merchant mid-transaction who is not there when you look directly. A woman carrying a bundle that catches no light. A child running between carts who leaves no footprint in the dust. They drift east, always east, and nobody in the market reacts. The dock workers walk through them without breaking stride. This has been happening long enough that the living have stopped seeing it.

You see it. You do not yet know what you are seeing.

+ [Investigate the docks.] -> act0_docks
+ [Find the harbormaster.] -> act0_harbormaster
+ [Climb for a high vantage.] -> act0_highground

=== act0_tribunalblocked ===
// 📍 Rhea Port · Furthest Dock · Low Tide · The Sea-Cave Mouth
The entrance is exactly where Lawrence said it would be. Below the furthest dock, accessible now at low tide, a sea-cave mouth that smells of something older than salt. Stone steps descend into darkness. The Tribunal is down there. Water is down there.

Lawrence goes first. Of course he does.

He makes it four steps before stopping.

# speaker: Lawrence
"There's something across the threshold. Not physical. Not magical either, exactly."
He raises one hand. The air in front of him shimmers, faintly translucent. The same translucence you saw in the ghost figures flickering between the market stalls on the walk down. He pushes. His hand slides sideways, the way water deflects around a stone. He cannot go forward.

# speaker: Lawrence
"A barrier. My magic can't find purchase on it. There's nothing to grip. It's like trying to suppress smoke."
Fang draws her long blade. A clean, testing cut across the shimmer. The steel passes through and out the other side without resistance. But when she tries to follow her own blade through, she cannot. Her body stops at the same threshold Lawrence hit.

# speaker: Fang
"My sword goes through. I don't. That's a new one."
Marcus crouches at the top of the steps. Presses one paw flat against the stone. His ears rotate and lock. He is listening to the stone. He stays like that for a long time. When he speaks, his voice has the weight of someone connecting very old information.

# speaker: Marcus
"It's not a ward. It's not a spell. It's residue. The same energy as the ghosts in the port. Halted momentum. People who were mid-journey when the Guardian disruption hit. Their unfinished movement pooled downhill through the root systems and the water table and collected here, at the lowest point."
# speaker: Fang
"So the ghosts are blocking the door. Without knowing they're blocking the door."
# speaker: Marcus
"They are not blocking anything intentionally. They are simply stuck. And there are enough of them, concentrated through the underground channels, that their collective... stalling... has sealed the passage like silt blocking a drain."
+ [(To Marcus) 'How do you know that?'] -> act0_askmarcusdrain
+ [Take the read. Keep moving.] -> act0_tribunalblocked_continue

=== act0_askmarcusdrain ===
~ marcus = marcus + 1
~ marcusConsulted = true
Marcus looks at her. Not surprised. Something closer to the quiet attention of someone who is rarely asked about the method.

# speaker: Marcus
"I have been listening to stone for four hundred years. Stone holds what happens to it. This stone is grieving. Grief has a particular resonance. It does not move forward."
A pause. His paw is still flat on the step.

# speaker: Marcus
"Most people ask what it means. You asked how I knew. That is a different question."
He does not explain further. He does not need to. The distinction between those two questions is its own answer.

+ [Continue.] -> act0_tribunalblocked_continue

=== act0_tribunalblocked_continue ===
Lawrence tries again. A focused mind lance, precise and surgical. It enters the shimmer and disperses. Not reflected. Not absorbed. Simply rendered irrelevant. A thousand years of magical refinement, and the barrier does not even acknowledge the attempt.

He steps back. Two fingers start toward his sternum. He catches the motion and kills it. His jaw sets.

# speaker: Lawrence
"A thousand years. And Net sends me to argue with a drain."
# speaker: Fang
"Since when do you accept a door saying no?"
# speaker: Lawrence
"I'm not accepting it. I'm deciding which approach doesn't waste the next three hours. There's a difference."
A beat. The sea-cave exhales brine. Below, you can almost hear the harbor's held breath.

# speaker: Marcus
"The residue is not static. It is moving. Slowly, but directionally. Something is drawing it downhill through the root systems."
He lifts his paw from the step. Turns his head toward the port's northern edge. His ears lock.

# speaker: Marcus
"It is coming from the forest."

+ ["So clear the source and the flow stops. The drain unblocks."] -> act0_tribunalblocked_deduce
+ [Wait for someone to say what that means.] -> act0_tribunalblocked_wait

=== act0_tribunalblocked_deduce ===
Marcus looks at her. One beat.

# speaker: Marcus
"Yes."
# speaker: Fang
"She got there faster than you did."
# speaker: Marcus
"I had more information."
# speaker: Fang
"She had less and still got there."
Marcus considers this with the seriousness it apparently deserves.

# speaker: Lawrence
"Five Guardians. Water, Sky, Stone, Sun, Moon. All imprisoned. Death moved when the gods turned on each other and nobody was watching. The harbor is dying because Water is gone. Every road you have traveled in the last year that felt wrong, every pass that closed without weather, every light that did not warm — that is why."
He looks at the barrier. At the shimmer that turned his thousand years into irrelevance.

# speaker: Lawrence
"We are standing at Water’s door."
# speaker: Fang
"So we have to go through a haunted forest full of ghost choirs to unclog a supernatural drain so we can get into an underwater courtroom to free a water god."
# speaker: Marcus
"That is a concise summary, yes."
# speaker: Fang
"Just checking."

+ [Return to Mo Stór. Rest before the road.] -> act0_mostorovernight

=== act0_tribunalblocked_wait ===
Lawrence does not wait long.

# speaker: Lawrence
"Clear the source. The flow stops. The barrier dissolves."
# speaker: Fang
"The forest."
# speaker: Lawrence
"The Verdant Verge. Yes."

# speaker: Lawrence
"Five Guardians. Water, Sky, Stone, Sun, Moon. All imprisoned. Death moved when the gods turned on each other and nobody was watching. The harbor is dying because Water is gone. Every road you have traveled in the last year that felt wrong, every pass that closed without weather, every light that did not warm — that is why."
He looks at the barrier. At the shimmer that turned his thousand years into irrelevance.

# speaker: Lawrence
"We are standing at Water’s door."
# speaker: Fang
"So we have to go through a haunted forest full of ghost choirs to unclog a supernatural drain so we can get into an underwater courtroom to free a water god."
# speaker: Marcus
"That is a concise summary, yes."
# speaker: Fang
"Just checking."

+ [Return to Mo Stór. Rest before the road.] -> act0_mostorovernight

=== act0_mostorovernight ===
// 📍 Mo Stór · Night · The Bar Below the Street

The party returns to Mo Stór. It is late. The harbor is quieter than it was, though not quiet. Rhea Port does not go fully dark.

Tiberius does not ask how it went. He pours. He has the specific quality of someone who has seen parties come back from bad news for long enough that he knows the pour is the correct first response.

# speaker: Tiberius
"Rooms are yours. The forest will still be there at first light. It has been there longer than most things."
# speaker: Fang
"Longer than you?"
# speaker: Tiberius
"(a pause) No."

Lawrence takes his drink to the far end of the bar. He does not sit. He stands with his back to the wall, the way he does everywhere, looking at nothing in particular and missing nothing at all.

The bar settles around you. The fire is still burning. Whatever tonight was, it is filed now. Tomorrow the road goes north.

+ [Sleep. The forest in the morning.] -> act0_travel

=== act0_travel ===
// 📍 Rhea Port → Verdant Verge · The Road Out · Day 2
The party leaves at first light. The road from Rhea Port to the forest edge takes the better part of a morning and into the afternoon. Long enough to learn something.

Lawrence walks point. Not ahead of the group, but forward of center. He tracks movement at the tree line the way a predator reads terrain, except his attention is quieter than that. He already knows what is out there. He is assessing what it knows about him.

At one point, without turning around:

# speaker: Lawrence
"A thousand years. And Net sends me to argue with a drain."
Nobody responds. It did not require a response. It was an accounting.

# speaker: Fang
"(to you, quietly) He’s like this for the first hour. After that he becomes about thirty percent more tolerable."
# speaker: Fang
"(a beat) The drain comment is actually an improvement on yesterday."
Marcus takes the rear. The ground compresses differently under his weight. You learn, in the first mile, that Marcus navigates by sound and vibration as much as by sight. His ears rotate independently of each other. You try not to stare.

Fang walks beside you. Close enough to talk, though she chooses not to. She is listening to your footfall, your breathing, the way you hold your weapon. When you adjust your grip, she notices, files it, and says nothing.

# speaker: Fang
"(eventually) You walk like someone who's been carrying something heavy for a long time. Not a weapon. Something else."
She doesn't press. She just noticed. Out loud.

+ [The forest arrives.] -> act1_entry

=== act0_travel_honest ===
~ fang = fang + 1
# speaker: Fang
"Footfall distribution. You’re compensating. Something in your right side you’ve been protecting for so long it became a habit. Also your jaw does a thing when you’re near people you don’t trust yet. Which is all of us, currently. Fair."
A pause. She adjusts the wolf puppy in her sling without looking at it. The puppy does not wake.

# speaker: Fang
"For what it’s worth, the jaw thing goes away. I mean, it did for me. Eventually. More or less."
+ [The forest arrives.] -> act1_entry

=== act0_travel_deflect ===
# speaker: Fang
"(mild, no judgment) Sure. About another hour."
She falls back into silence. Not wounded silence. The silence of someone who has been told ‘not yet’ enough times to recognize it as a complete sentence.

# speaker: Fang
"(after a moment, not looking at you) The offer stands. If it ever becomes useful."
+ [The forest arrives.] -> act1_entry

=== act1_askmarcus ===
~ marcus = marcus + 1
~ dex = dex + 1
~ marcusConsulted = true
// 📍 Verdant Verge · Forest Edge
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
+ [Move into the forest.] -> act1_combateasy

=== act1_attackearly ===
~ stag = stag + 1
// 📍 Verdant Verge · Forest Edge
You charge. The ghosts scatter, then surge back, defensive and frightened, which turns out to be worse.

# speaker: Fang
"Okay. Noted. Ghosts have feelings. Harder way it is."
# speaker: Lawrence
"(without inflection) I did mention they were grief-bound travelers."
# speaker: Fang
"You said ‘incomplete.’ That is not the same sentence."
# speaker: Lawrence
"It was implied."
# speaker: Fang
"Almost nothing you say is implied. You say a precise number of words and none of them are subtext. I’m not taking responsibility for your subtext."
+ [Fight through it.] -> act1_combathard

=== act1_combateasy ===
~ xp = xp + 10
// 📍 Verdant Verge · Deep · Ghost Clusters
You move with purpose. Lawrence’s mind lance fires first, a clean suppression bolt aimed at the nearest cluster.

It passes through. Not deflected. Not absorbed. The ghosts simply are not there in the way the lance expects them to be.

# speaker: Fang
"(staring at her blade, which is also through a ghost) Okay. So. That’s a thing."
# speaker: Lawrence
"They’re not physical."
# speaker: Fang
"Incredibly helpful. Thank you."
Marcus, at the rear, watches two ghosts drift through him. His expression does not change. He has the particular stillness of a very large, very old person reevaluating an expectation.

# speaker: Marcus
"(thoughtfully) I have not encountered that before."
# speaker: Fang
"(to you) Combined age of the three of us: somewhere north of two thousand years. Just so you have the full picture of how useful we’re being right now."
# speaker: Lawrence
"(genuinely surprised) That should have worked."
# speaker: Fang
"Noted. Let me try the old-fashioned way."
Fang's long blade arcs through the closest cluster. Beautiful. Clean. The ghost splits in half, drifts apart like smoke, and reforms two seconds later. Exactly as it was.

# speaker: Fang
"Okay. That's new."
Marcus tries. Bear form. A full-body charge through a cluster with 1,800 years of mass behind it. The ghosts scatter like startled birds, swirl in a wide orbit, and resettle into the exact same formation.

# speaker: Marcus
"They're not resisting us. They're not even registering us. We're irrelevant to whatever is holding them here."
Three immortals. Somewhere north of two thousand years, if you trust Fang's accounting. Standing in a haunted forest failing to hit anything.

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

Then the canopy opens and the moon comes through. Full. White. Wrong.

The wolf puppy lifts its head from the sling. Does not bark. Does not startle. It simply sits up, orients toward Fang, and waits.

+ [Move deeper into the forest.] -> act1_fangshift

=== act1_ghostwatch ===
~ flow = flow + 1
// 📍 Verdant Verge · Deep · Observing
You watch. The party watches you watching, which is its own kind of trust.

The clusters are not random. Each ghost drifts in a loose ellipse, always returning to the same point. Not circling a location. Circling a direction. East. Every single one of them oriented east along the forest path, looping back before they reach the treeline, starting over.

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
+ [Clear the treeline. Give them somewhere to go.] -> act1_ghostrelease

=== act1_ghostdirection ===
~ marcus = marcus + 1
// 📍 Verdant Verge · Deep · Listening
# speaker: Marcus
"(ears rotating, reading the air) East. They were all heading east. Merchants, probably. Silk Road travelers caught by the Guardian disruption mid-journey."
He crouches. Places one massive paw flat on the forest floor. Closes his eyes. The diplomatic bear listening to the dead the way he once listened to the Roman Senate: with patience that borders on geological.

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
+ [Clear the treeline. Give them somewhere to go.] -> act1_ghostrelease

=== act1_ghostmagic ===
~ lawrence = lawrence + 1
// 📍 Verdant Verge · Deep · Reading the Architecture
Lawrence goes still. Not his performative stillness. The real kind, where he stops managing how he is perceived and just looks.

# speaker: Lawrence
"They have no binding. No curse, no enchantment, no tether. My lance passed through because there is nothing magical holding them here."
# speaker: Fang
"Then what is?"
# speaker: Lawrence
"Momentum."
He points. You follow his finger. Each ghost drifts in the same direction. East. Always east. Looping back before the treeline and starting again.

# speaker: Lawrence
"They were moving when the disruption hit. The road broke underneath them. Their bodies stopped but their intention kept going. They have been walking east inside a forest that will not let them leave for three hundred years."
A long silence. Marcus's ears are flat.

# speaker: Marcus
"(very low) Three hundred years of trying to take one more step."
# speaker: Lawrence
"We cannot fight momentum. We can only remove the obstruction. Clear the treeline. Let the road continue. They will do the rest."
Fang is already drawing her blades. Not for ghosts this time. For undergrowth.

+ [Clear the treeline. Give them somewhere to go.] -> act1_ghostrelease

=== act1_ghostrelease ===
// 📍 Verdant Verge · Eastern Treeline
It takes all four of you. Fang cuts the undergrowth with the efficiency of someone who has cleared caravan routes for two centuries. Marcus shoulders aside a fallen trunk that three people could not move. Lawrence holds a suppression field at the edges, keeping the displaced wildlife from flooding back in.

You do the work nobody assigned. The stones. The roots. The small obstructions that would not stop a living person but would stop something that has forgotten it can step over things. You clear a path that is not just passable but legible. A road that looks like it goes somewhere.

The party steps back. The path is open. Clean. Wide enough for a wagon. Beyond it, pale moonlight on an open meadow. Somewhere a road continues east.

The ghosts reach the treeline.

And stop.

Every single one of them. Right at the edge. Drifting forward to the exact boundary and falling back, reaching and retreating, the same loop as before except now you can see it clearly. The open road is right there. They will not cross.

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
Silence. Three immortals. Combined age of roughly three thousand years. None of them have an answer.

# speaker: Lawrence
"(quietly) I don't know. I've been alive for a thousand years and I have never needed a road to mean something. I just walk."
# speaker: Fang
"Same. I walk because walking is what you do. I've never thought about why a road is a road."
# speaker: Marcus
"(slow, realizing) Because we are immortal. A road is just ground to us. We have walked every road there is. We have no unfinished journeys. We cannot show them what arrival feels like because we have forgotten."
Three people who cannot die, standing at the edge of a forest, unable to help the dead for the specific reason that they have lived too long.

The ghosts reach for the treeline and fall back. Reach and fall back.

+ ['What if someone who is still on their own journey walks it first?'] -> act1_ghostguide
+ ['I'll go. I'm still going somewhere.'] -> act1_ghostguide_direct
+ [Look at Marcus. He knows.] -> act1_ghostguide_marcus

=== act1_ghostguide ===
~ flow = flow + 1
~ marcus = marcus + 1
// 📍 Verdant Verge · Eastern Treeline
The party turns to look at you. All three of them. At the same time.

# speaker: Marcus
"(very carefully) She's right. Someone still traveling. Someone whose road still has a destination. The ghosts need to remember what it feels like to be going somewhere. They need to see someone do it."
# speaker: Lawrence
"That's you. Not us."
# speaker: Fang
"(to you, very direct) You don't have to. We'll find another way. Eventually. Probably."
The "probably" hangs there like it knows what it's doing.

+ [Walk the path.] -> act1_ghostcrossing

=== act1_ghostguide_direct ===
~ dex = dex + 1
~ lawrence = lawrence + 1
// 📍 Verdant Verge · Eastern Treeline
You are already moving before anyone responds.

# speaker: Fang
"Wait, hold on, we haven't even..."
# speaker: Lawrence
"(catching Fang's arm) Let her go."
# speaker: Fang
"She's been playing this game for two days, Lawrence."
# speaker: Lawrence
"And she understood something in thirty seconds that took us three thousand years to miss. Let. Her. Go."
Fang releases the breath she was holding. Nods once.

+ [Walk the path.] -> act1_ghostcrossing

=== act1_ghostguide_marcus ===
~ marcus = marcus + 1
// 📍 Verdant Verge · Eastern Treeline
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
+ [Walk the path.] -> act1_ghostcrossing

=== act1_ghostcrossing ===
~ xp = xp + 10
~ dex = dex + 1
// 📍 Verdant Verge · The Path East
You step past the treeline. Alone.

The air changes. Not temperature. Texture. The forest is behind you. Ahead, the meadow opens and the path continues east under a sky that has not decided whether it is night or dawn. You are, for the first time since entering the Verdant Verge, outside the trees.

You are also, for the first time, aware that you are walking a road that three hundred dead travelers are watching you walk.

The ghosts press to the treeline behind you. Watching. Not following. Not yet.

You keep walking. Ten paces. Twenty. Each step deliberate. You are not performing courage. You are performing direction. You are a person going somewhere, and the road under your feet is real because you are using it.

Thirty paces. The road curves slightly. Moonlight pools on cobblestones that haven't been walked in three centuries. Your footsteps are the first living sound this stretch of road has heard since the Guardian disruption.

Behind you, something shifts.

The first ghost steps past the treeline.

Then the second. The third. You do not turn around. You keep walking, and behind you the sound of the forest changes from humming to exhaling, as three hundred unfinished journeys finally find a direction that means something because someone ahead of them is proving it does.

You feel them flow past you. Cold and ancient and grateful in a way that does not have language. The translucence thins as each one passes. They straighten, the way a person does when they remember where they are going. And then they are gone. Not destroyed. Arrived.

The last one passes so close you feel the hem of a garment that no longer exists brush your wrist. Then silence. Just the road, and the meadow, and you, standing alone in the moonlight like someone who has just done something she does not have a name for yet.

This is the quietest three hundred people have ever been. The silence of intention, not absence. You felt them understand, one by one, that the road was still there. You did the most useful thing you have ever done and you were completely alone doing it and both of those things were true at the same time and you do not know how to hold both. You are still working on it.

Behind you, Fang's voice carries from the treeline.

# speaker: Fang
"(calling across the clearing, quiet awe she'll deny later) Did you just... walk three hundred ghosts into the afterlife?"
You turn around. The three of them are standing at the tree line. Lawrence's expression has changed, very slightly. Something behind his eyes that was not there an hour ago. He does not look away when you notice. Marcus's ears are forward. Fang is grinning the way people grin when they have been shown something they did not expect.

# speaker: Marcus
"(to Lawrence, as you walk back) And that is why the party needed four."
Lawrence says nothing. He watches you return. When you rejoin the group, he falls into step beside you. Half a step closer than before.

Marcus simply stands as you pass him. Eighteen hundred years of patience expressed not as a tactical maneuver but as a form of witness.

# speaker: Fang
"We just escorted dead people to their bus stop. With you as the bus."
# speaker: Marcus
"Poetic, Fang."
# speaker: Fang
"I need this on my resume."
+ [Face the Warden.] -> act1_warden

=== act1_combathard ===
~ xp = xp + 15
~ end = end - 1
~ stag = stag + 1
// 📍 Verdant Verge · Deep · Ghost Clusters
The ghosts are already agitated. Your charge at the edge rattled something in them, and now they move with the particular violence of things disturbed mid-grief.

Fang attacks first. Long blade, clean arc. It passes through the nearest cluster like cutting fog. The ghost splits, drifts, reforms.

# speaker: Fang
"That... did nothing."
She tries again. Both blades. Florentine cross-pattern. The ghost disperses into filaments and reconstitutes behind her, closer than before.

Lawrence fires a mind lance. It passes through clean. No impact. No resistance. Nothing magical holding them here for his magic to interact with.

# speaker: Lawrence
"There's no binding. No enchantment. My lance has nothing to break."
# speaker: Fang
"Then what are we supposed to hit?"
Marcus charges through a cluster. Bear form, full mass. The ghosts scatter like sparrows from a cannon and swirl right back into formation. He shakes his head, rattled. The cold of the spectral contact costs him something visible.

# speaker: Marcus
"They are not our enemies. They don't even know we're here. We are punching weather."
The clusters press closer. You feel a spectral strike graze your sword arm. Cold that goes past the skin into the architecture of the bone. Your grip weakens.

# speaker: Fang
"We need a new plan. The hitting-things plan has failed. I say this as someone whose entire identity is hitting things."
Fang takes a second hit she did not need to take because she refused to cede tempo. Then goes silent. When Fang goes silent, something has changed.

The canopy opens. The moon is full, white, and wrong for a forest this deep. Lawrence says one word, very quiet, to Marcus: "Now." Marcus is already moving.

Fang shifts.

Not all at once. The Florentine form — the exact geometry she has spent two hundred years perfecting — dissolves. What replaces it is faster and less precise and completely unreachable. Lawrence positions himself between her and the ghost clusters. Marcus covers the gap. The wolf does not attack the party. It attacks everything that moves, which in a forest full of grief-bound spirits is a significant category. The clusters scatter and regroup and scatter again, responding to the wolf's energy in a way they never responded to swords.

You do what you can with the treeline while Lawrence holds the line. It costs more than it should. The cold from the spectral grazes goes past the skin.

The moon slides behind a cloud. The pull recedes by degrees. Fang comes back to herself.

She knows immediately. She stands where she is for a moment without speaking. The wolf puppy, which had been sitting exactly where it was since the shift began, gets up, walks to her, and sits back down at her feet. She does not look at it. She does not look at any of you.

# speaker: Fang
"(quietly, not quite herself yet) They’re all moving east."
She is right. Every cluster, every fragment. The same drift. East, east, east. Looping back at the treeline. Starting over. Three hundred years of the same unfinished step.

# speaker: Marcus
"They were travelers. Heading east when the disruption hit. They never arrived anywhere. The forest caught them mid-journey and they cannot stop walking a road that no longer exists."
# speaker: Lawrence
"The treeline. If we force a path open, they'll have somewhere to go. They'll leave on their own."
# speaker: Fang
"(bleeding from the spectral graze) Would have been great to figure that out five minutes ago."
You learn, in the middle of this, that Lawrence's combat voice is different from his everything-else voice: lower, cleaner. You file this alongside several other things you're not thinking about yet.

The treeline clearing is messier than it would have been. Fang cuts undergrowth one-handed, her off-arm numb from spectral cold. Marcus shoulders a fallen trunk with visible effort. Lawrence holds the perimeter, his suppression field thinner than usual.

You do what you can. The path opens.

The ghosts reach the treeline. And stop. Every single one. Drifting to the edge and falling back. The open road is right there. They will not cross.

# speaker: Fang
"(bleeding, exhausted) I am going to lose my mind."
# speaker: Marcus
"(sitting heavily) The disruption didn't just block the road. It broke what the road means. The path is open but it connects to nothing. They cannot walk into nothing."
# speaker: Lawrence
"Someone living has to walk it first. Make it real again. Show them the road goes somewhere."
He looks at Fang. At Marcus. At himself. Three immortals who have walked every road there is and cannot remember what it feels like to be going somewhere for the first time.

# speaker: Lawrence
"It has to be her."
# speaker: Fang
"(to you, too tired for diplomacy) Your call. We physically cannot do this. And I hate saying that."
You are already moving.

The ghosts watch. You walk past the treeline into the meadow. Each step deliberate. You are not performing courage. You are performing direction. You are a person going somewhere, and the road under your feet is real because you are using it.

Thirty paces. Moonlight on cobblestones that haven't been walked in three centuries.

Behind you, the first ghost crosses. Then the second. Three hundred unfinished journeys finding a direction that means something because a living person, bruised and tired and still arriving somewhere, is proving it does.

They flow past you. Cold and ancient and grateful in a way that does not have language. Then silence.

You walk back. Fang is leaning against the fallen trunk, watching you with something she will never put into words. Marcus's ears are forward. Lawrence says nothing. He watches you return. When you rejoin the group, he falls into step beside you. Half a step closer than before.

# speaker: Marcus
"Don't fight it. Breathe."
You breathe.

+ [Face the Warden.] -> act1_warden

=== act1_entry ===
// ═══ ACT 1: THE WHITE NIGHTThe Verdant Verge · The Forest That Does Not Sleep ═══
// 📍 The Verdant Verge · Forest Edge · Night That Does Not Fully Arrive
Night never fully arrives in the Verdant Verge. Pale light clings to the leaves like it forgot to leave. The air hums.

Ghostly figures flicker between the trunks. A woman adjusting a pack that is no longer there. A man stepping over a root his foot passes through. Two children holding hands, walking east, reaching the edge of the tree cover and looping back to start again. They glow faintly, translucent, carrying the posture of people who were going somewhere important when the road stopped working.

# speaker: Marcus
"These aren't invaders. They're echoes. People who never finished leaving."
# speaker: Fang
"So. Singing ghosts. Naturally."
# speaker: Lawrence
"When I was alive, ghosts rattled chains. Now they form choirs. Everything escalates."
# speaker: Fang
"You were alive for, what, forty years? Out of a thousand? You don't get to say ‘when I was alive’ with that much gravitas."
# speaker: Lawrence
"I absolutely do."
+ [Observe before engaging. Let the forest breathe.] -> act1_observe
+ [Ask Marcus what he senses.] -> act1_askmarcus
+ [Attack immediately.] -> act1_attackearly

=== act1_observe ===
~ flow = flow + 1
~ observedForest = true
// 📍 Verdant Verge · Forest Edge
You stop. The party stops with you, without question. A small miracle.

The ghosts circle but don't attack. One drifts close. It bows.

Another does not. It faces a different direction entirely, oriented toward something deeper in the forest that the party cannot see. Its posture is not defiance. It is attendance. Fang tracks it with her eyes and says nothing.

The wolf puppy stirs in Fang's sling. Orients toward the bowing ghost. Not with fear. With focus. Settles back.
~ familiarSignalCount = familiarSignalCount + 1

# speaker: Fang
"...Did it just bow at us?"
# speaker: Marcus
"They want to be heard. Not fought."
# speaker: Lawrence
"Inconveniently, that's harder."
+ [Move into the forest.] -> act1_combateasy

=== act1_warden ===
// 📍 Verdant Verge · Heart · The Old Clearing
The Warden

The clearing is circular. The trees lean inward, not from wind but from attention. At the center, a woman stands with her arms slightly raised, palms out, as if holding the walls of a room that only she can see.

She is translucent in the way the other ghosts are, but denser. More present. You can see the weave of her merchant's traveling coat, the calluses on her hands from years of packing and unpacking cargo, the particular lean of someone who has stood in one place for so long that her posture has become the place. She was heading east the day the disruption hit. She never arrived. The forest caught her mid-step and she stayed, because the others were scattering and someone had to hold them together.

Three hundred years of holding. Her arms have not lowered once.

She doesn't fight unless you force it. She has been gathering the ghost clusters, pulling them into orbit around her, keeping them from dispersing into nothing. What started as mercy calcified into something she can no longer distinguish from purpose.

# speaker: Warden
"(voice like wind through old paper) You have come to take them from me."
# speaker: Marcus
"We've come to let them finish. There's a difference."
A long silence. The Warden turns to you. Not to Lawrence, not to Marcus, not to Fang. To you. She looks at you the way ghosts do: through the present, through the thing you are performing, into the shape of what brought you here. Her eyes track something behind your face that you did not know was visible.

# speaker: Warden
"You know what it is to be held in place."
+ ['I know what it is to wait when waiting is the only thing left.'] -> act1_warden_peace
+ ['I know what it is to keep others in a cage because you're afraid to let go.'] -> act1_warden_hard
+ [(Say nothing. Stay with her silence.)] -> act1_warden_silent

=== act1_warden_hard ===
~ fang = fang + 1
~ xp = xp + 30
// 📍 Verdant Verge · Heart
# speaker: Fang
"(low, to you) That was the right thing. Even if it was the hard thing."
The Warden is still for a long moment. Then her arms lower. For the first time in three hundred years, her arms lower. The clusters she was holding drift upward like sparks from a fire that has finally been allowed to go out. She watches them rise. Her expression is not grief. It is the particular exhaustion of someone who has just set down something so heavy that her body has not yet registered the absence. She follows them up. The last thing to fade is the outline of her traveling coat.

The forest exhales.

+ [Return to Mo Stór.] -> bridge_inn

=== act1_warden_peace ===
~ wardenPeaceful = true
~ xp = xp + 30
// 📍 Verdant Verge · Heart
The Warden's arms lower. Slowly. The clusters she has been holding for three hundred years drift upward, not scattering but rising together, the way a flock lifts when the thing keeping it grounded finally steps aside. She watches them go. Then she goes with them, toward wherever unfinished journeys end when someone finally says they can.

The forest exhales for the first time in months.

Lawrence is standing slightly apart.

/* TODO: <<chestpress "Something in what you said reached him before he could stop it.">> */
~ lawrence = lawrence + 1

You notice. He notices that you noticed. He doesn't say anything. He looks away.

That's somehow more.

/* TODO: <<heartbeat "Warden scene. Lawrence chest-press. Drum only · 45 sec · quiet">> */

+ [Return to Mo Stór.] -> bridge_inn

=== act1_warden_silent ===
~ marcus = marcus + 1
~ flow = flow + 1
~ xp = xp + 30
// 📍 Verdant Verge · Heart
You say nothing. You stay.

The silence does what words couldn't. The Warden looks at you for a long time. Her eyes move across your face the way someone reads a letter from home.

Then she chooses. Her arms lower on her own terms. Nobody told her. Nobody convinced her. She decided. The clusters drift upward at her pace, not yours. She watches them go the way you watch someone off at a platform when you know the train is the right one. Then she follows.

# speaker: Marcus
"(quietly, beside you) The hardest thing in the world is letting someone choose at their own pace."
+ [Return to Mo Stór.] -> bridge_inn

=== act2_argue ===
~ lawrence = lawrence + 1
~ tribunalDialogue = true
# speaker: Lawrence
"(quietly, to you) That was precisely the right thing to say."
The Tidewarden's certainty cracks. Not much. Enough.

+ [The battle begins.] -> act2_combat

=== act2_attack ===
~ stag = stag + 1
# speaker: Fang
"(already drawing) Yeah. I figured."
+ [The battle begins.] -> act2_combat

=== act2_combat ===
// 📍 The Sunken Tribunal · Battle
The Tribunal Battle

The Tidewarden hits you first. A column of compressed water slams into your guard before you can read the motion. You skid backward across wet stone, boots finding no grip.

He fights with verdict-magic: declarations that become force. His certainty-armor makes him nearly impervious from above. He adapts. Your opening strike was high, so his counter comes low. You adjusted left, so his next verdict fires right.

# speaker: Fang
"He’s reading you. Change your rhythm or he’ll eat you alive."
You change your rhythm. It costs you a beat. The Tidewarden punishes the hesitation with a backhand of pressurized current that catches your ribs. You feel something give.

Lawrence removes the ground certainty stands on. Every shadow in the chamber tilts slightly wrong. Fang fights in the flood rather than through it. The Tidewarden’s certainty-armor doesn’t cover below the knee.

# speaker: Marcus
"Fortune, two steps left. Fang, behind her. Lawrence, roll and go."
But the Tidewarden lands hits too. More of them than you want to count. A slash gets through your guard and opens your forearm.

The chamber partially floods. Phase 2. The water is rising to your shins. Every step costs twice the energy. Your footing is uncertain. The Tidewarden’s verdicts come faster.

# speaker: Fang
"(grinning, water to her knees) Oh, this I can work with."
He catches you across the jaw with a tidal fist. You go down to one knee. The water is cold against your skin and it is getting colder.

You are on one knee in three inches of water. Your vision is tunneling. Your sword arm is shaking and you can see the shake, which is different from feeling it. There is a specific silence inside the noise of the fight: the silence of a body that has finished arguing and is simply waiting for you to hear it.

You have been here before. Not in this room. In this calculation. The one where you know the answer and you are stalling before you say it out loud.

The Tidewarden raises both hands for what will be a finishing blow. You can see Fang adjusting, Marcus already in motion, Lawrence’s hands bright with something he has been holding in reserve.

They are ready. They have been ready. They were waiting for you to let them.

+ [Step back. Let the others finish it.] -> act2_norecovery

=== act2_harbornight ===
// 📍 Rhea Port · Harbor Road · Before Dawn
You cannot sleep. You dress in the dark and walk.

The harbor road at this hour belongs to the fishers and the people who have finished sleeping for reasons they do not discuss. The dock lights are oil-yellow. The water is black and moving wrong, the inward current still pulling even now, even with the ghost clusters resolved and the White Night lifted. Something below the surface is still counting.

You walk the full length of the road. Not toward anything. Just walking, the way your body has always known to process things it cannot think through.

At the furthest dock, you stop. Three Death-touched sailors are standing at the water’s edge. Not working. Not threatening. Standing the way people stand when they are waiting for an instruction that has stopped arriving. Their tally-marks are faint, fading, the harbor disruption bleeding out in the days since the ghost clusters were freed. They are not a fight. They are what a fight looks like the morning after.

One of them turns and sees you.

You look at the exits first. Dock edge, harbor road, water. Then you decide.

+ [Approach slowly. They may not be dangerous anymore.] -> act2_harbornight_approach
+ [Step back into the shadows. Let them be.] -> act2_harbornight_watch
+ [Lawrence is at the dock edge. He is not keeping watch.] -> act2_lawrencefire

=== act2_lawrencefire ===
// 📍 Rhea Port Harbor · The Dock Edge · Before Dawn
Lawrence is standing at the end of the dock. Not at the edge, which would be dramatic. Three feet back from the edge. The posture of someone who has been watching water for a long time and is not in a hurry.

You stop beside him without planning to.

He does not manage this. He does not manufacture distance or close it. He is simply standing in a way that looks like keeping watch so that nobody asks why he is standing here, and you are now also standing here, and nobody is asking.

The harbor is quiet. The Death-touched sailors you saw earlier have faded. The water is back to water.

After a long time, not looking at you:

# speaker: Lawrence
"I make good decisions about most things. Tactics. People. When to leave a situation and what to take with me. These I do well."
The harbor fills the silence for him. Water against the pilings, slow and patient. A gull somewhere overhead, deciding nothing. Below the dock, the quick skitter of a rat crossing a beam, entirely unbothered by a thousand-year-old man admitting something true.

# speaker: Lawrence
"I make poor decisions about the things that matter. I thought you should know that before the caves tomorrow. Not as a warning. As information."
He goes back inside before you can respond. Not abruptly. Not as performance. The exit of someone who has just said a true thing to their prey and needs to be somewhere else before they have to admit that is what happened.

You stand at the dock edge for another minute. The information sits with you. Not alarming. Something else. The specific feeling of being trusted with something small and true by someone who does not trust casually. You have been given this once before, years ago, by someone who then proceeded to make exactly the poor decision they warned you about. You wonder if the warning is ever the point, or if the point is always the telling.

+ [Return to the inn. Tomorrow is the Tribunal.] -> act2_entry

=== act2_harbornight_approach ===
~ flow = flow + 1
~ xp = xp + 10

You approach with your hands visible. Slow. The one who saw you does not move. His tally-marks, this close, are almost gone. There is a person underneath them, tired and confused and standing at the water’s edge with no memory of how he got here.

{avatarName}: "You should go home."
He looks at you. Then at his own hands, at the faint marks that are almost not there anymore.

He goes. All three of them. Not because you commanded it. Because you looked at them and saw people, and that was enough to remind them that they were.

+ [Return to the inn. Sleep. Tomorrow is the Tribunal.] -> act2_entry

=== act2_harbornight_watch ===
~ dex = dex + 1
~ xp = xp + 5

You stay in the shadow and watch. They stand at the water’s edge for another ten minutes. Then, one by one, they walk away from the dock. Not toward their homes, necessarily. But away from the water. The pull is weakening. Without the ghost clusters, without whatever was feeding the disruption, the Death-mark loosens its grip when it cannot find a new source.

You did not have to fight them. You did not have to approach. You read the room and you made the correct call and nobody required your intervention.

That is also a kind of competence.

+ [Return to the inn. Sleep. Tomorrow is the Tribunal.] -> act2_entry

=== act2_entry ===
// ═══ ACT 2: THE SUNKEN TRIBUNALThe Judgment That Holds Still ═══
// 📍 Rhea Port · Furthest Dock · Morning
Low tide. The light is gray and particular, the kind that arrives before the harbor wakes up and shows you the shape of things without the noise of daily commerce obscuring them. You walk the harbor road alone. The party will meet you at the sea-cave entrance. You told them you needed five minutes. You needed to walk the road first.

You do the thing you do: you check the exits. The dock edge, the harbor road, the cave mouth ahead, the water. In that order. Always that order. Then you stop and breathe, because you have done that and now you know where the edges are, and knowing where the edges are is the only peace you have found that holds under pressure.

The cave mouth is visible from the road. It smells of something older than salt. The shimmer that sealed it yesterday is gone. The air where the barrier was still carries the faint residue of completed journeys.

You are going in there to face something that believed it was doing the right thing for three hundred years.

You breathe once more. Then you go.

The Tribunal is reached via sea-cave at low tide. The shimmer that sealed the entrance yesterday is gone. The air where the barrier was still smells faintly of old journeys, but there is nothing to stop you now. The ghosts kept their end of the arrangement.

Lawrence enters first. The way he enters dangerous places tells whatever is inside everything it needs to know about him. Fang reads the stone wall as she descends. Marcus fills the corridor in a way that reads as reassuring rather than alarming.

# speaker: Lawrence
"Three hundred years of undisturbed judgment. Whatever is down here believed it was doing the right thing."
# speaker: Fang
"They always do. That's what makes them dangerous."
+ [Descend into the Tribunal.] -> act2_tiderising

=== act2_norecovery ===
~ noRecoveryUnlocked = true
~ xp = xp + 30
// 📍 The Sunken Tribunal · Post-Fracture
You step back. Your body thanks you before your pride does.

{artificerUsed && artificerItems <= 0:
    The spool is gone. The one thing you built for this situation has been used. The telekinesis you have been not-naming since the dock is running at a cost you don't have a number for yet. Both systems at their edge simultaneously. The No Recovery Fracture is not a failure: it is the correct read of the math.
- tkLatent:
    Something has been pulling at your attention since the water released him at the dock. You have been filing it without opening the file. Whatever it is, it costs something, and the cost is present now, at the back of your skull, a pressure that says: not this fight, not like this.
}

Fang moves without being asked. She just moves, checking where your eyes are pointing, not whether you're okay; reading the threat, not tending the wounded. Marcus takes your flank and launches his directed charge, aimed where the Tidewarden will be, not where he is. Lawrence drives shadow-work through the gap they made.

They finish it. Not instead of you. You gave them the opening, and they knew exactly what to do with it.

They have done this before. A long time before you.

+ [Watch Water be freed.] -> act2_waterfreed

=== act2_question ===
~ marcus = marcus + 1
~ tribunalDialogue = true

Marcus steps forward before anyone else can speak. Not to the front of the party. To the front of the room. There is a difference, and the Tidewarden registers it.

Something in Marcus settles. One slow breath out, shoulders dropping with it, and then he is already moving. He addresses the Tidewarden the way he once addressed the Senate: without volume, without aggression, with the patient precision of someone who has already found the flaw in the argument and is allowing the opposing party the courtesy of discovering it alongside him.

# speaker: Marcus
"You built this Tribunal to protect the harbor. The harbor is dying. I would like you to tell me, precisely, what you are protecting now."
The Tidewarden begins to answer. Marcus raises one hand, a fraction.

# speaker: Marcus
"Take your time. The question is not rhetorical. I have argued before bodies considerably older and more certain than this one, and they all made the same error: they confused the original purpose with the ongoing one and could not identify the moment they diverged. I am asking you to find that moment. I will wait."
The silence is load-bearing. The Tidewarden, who has handed down three hundred years of verdicts without being questioned on the premises, is being questioned on the premises. By a bear. Who used to be an emperor. Who has been politely, devastatingly patient about it.

Fang, behind Marcus, says nothing. This is the first time you have seen Fang go quiet out of respect rather than strategy.

+ [The battle begins.] -> act2_combat

=== act2_tiderising ===
// 📍 The Sunken Tribunal · Descent · Tide Turning
The corridor slopes down. Water pools at your ankles before you've taken twenty steps.

Marcus stops. Reads the walls by touch. The stone is carved with the same non-language you saw where the Tidewarden's stain was left above.

# speaker: Marcus
"This was designed to flood. Not as a failure. As a feature. The Tribunal was built to trap anyone who entered at low tide and could not justify their presence before the water arrived."
# speaker: Fang
"And the tide just turned."
The water is at your shins. It is rising faster than it should.

The wolf puppy in Fang's sling lifts its head. It does not orient toward the water. It orients downward, toward whatever is imprisoned below. Its ears flatten. Then, slowly, they rise again. It makes a sound Fang has not heard before. Not distress. Recognition.
~ familiarSignalCount = familiarSignalCount + 1

# speaker: Fang
"(glancing down) What are you hearing that I'm not?"
# speaker: Lawrence
"(calculating) We have roughly ten minutes before retreat stops being an option."
# speaker: Fang
"Great. Love a deadline. Really adds to the ambiance."
Behind you, the corridor narrows as water pressure shifts the stones. The way in is becoming the way not-out.

+ [Press forward to the main chamber.] -> act2_tidewarden

=== act2_tidewarden ===
// 📍 The Sunken Tribunal · Main Chamber
The Tidewarden

A magistrate from three centuries ago who believed in the law he served. Death offered him purpose when disruptions rendered his verdicts irrelevant. He reads charges against the Water Guardian with the certainty of a man who has never been wrong and considers this evidence.

# speaker: Tidewarden
"The charge is Uncontrolled Change. The verdict is containment. The sentence is already being served."
+ [Argue the premise. 'Control isn't protection. It's fear wearing a title.'] -> act2_argue
+ [Question what the tribunal was built to protect.] -> act2_question
+ [Attack immediately.] -> act2_attack

=== act2_waterfreed ===
~ xp = xp + 50
// 📍 Sunken Tribunal · The Binding Frame · Post-Battle
Water is Freed

The Binding Frame dissolves. Water doesn't burst free. She flows. Slowly, the way rivers reclaim their beds after a drought. The Tidewarden dissolves with the frame. Not destroyed. Released. Three hundred years is a long time to be certain about the wrong thing.

Where he stood, a stain on the stone floor. Not water damage. Not scorch. Something that looks like writing in a language that predates language. Marcus reads it, goes very still, and does not translate.

# speaker: Marcus
"We should move. Now."
He shepherds the party out faster than the moment warrants. Nobody asks why. The stain remains.

# speaker: Marcus
"(watching him go) He believed he was protecting something."
# speaker: Fang
"He was. He just forgot to ask what it wanted."
Lawrence says nothing. His jaw works once, like he started a sentence and decided against it.

+ [Water speaks.] -> act2_waterspeaks

=== act2_waterspeaks ===
// 📍 Sunken Tribunal · Water's Return
Water's voice does not come from a direction exactly. By the time you've registered what she said, she is water again.

She examines you the way a river takes the measure of new terrain. Not appraising. Mapping. She says only: "Hm." The weight of a full sentence in one syllable.

Water's final line, delivered with complete casualness: "I have a drought to address. In the Anatolian interior, it has been unmanaged for three hundred and fourteen years, two months, and eleven days. The grain situation is recoverable. Thank you for the inconvenience."

# speaker: Fang
"Did she thank us for inconveniencing her, or thank us AND acknowledge we were an inconvenience?"
# speaker: Marcus
"I believe, in her framing, these are the same thing."
# speaker: Lawrence
"(quietly, to no one) Yes. They would be."
~ chestPressCount = chestPressCount + 1
Lawrence's hand rises toward his chest and stops before arriving. The aborted gesture. Water sees it. You see it. The aborted gesture is louder than the completed ones.

/* TODO: <<heartbeat "Water freed. Lawrence almost speaks. Single measure · barely audible · for players already noticing">> */
~ heartbeatPlanted = true

There is a sound in the game music that you have heard twice now. You cannot name it. Not a full song. A measure, maybe less. It does not play when things are triumphant or when the combat peaks. It plays when Lawrence almost says something. You would recognize it immediately if it played again. You do not know why that matters yet.

+ [Return to Mo Stór.] -> bridge_mostor_return1

=== act3_approach_anchor ===
~ lawrence = lawrence + 1
~ skyResonance = "trust"

He is not hesitating. That is the thing you misread at first glance. He is moving with the particular certainty of something very old that has learned to let the world arrange itself around it. The wind adjusts for him. The rock face leans away. He has crossed a thousand passes and this one is no different and he has never once needed to announce that.

You feel it before you think about it. The pull. Not physical. Something else: the gravity of someone who does not perform authority because they have never had to.

You could step back. You could fall in beside him neutrally. You could treat this the way you have been treating all of it: as a mission, as a problem, as a thing to be handled from a professional distance.

You don't.

You step with him. Deliberately. Not swept -- choosing. The distinction matters and some part of you knows it matters and does it anyway.

He clocks it. The exact moment you chose toward him instead of beside him. Something crosses his face that is gone before it arrives, the way a door opens in a windstorm -- only the movement of air tells you it happened.

/* TODO: <<chestpress "Highwind Pass. She chose toward him. Not because he asked. Not because she named his hesitation. Because she felt his gravity and decided not to manage it. Something he did not expect to survive the armor. It didn't ask permission.">> */

/* TODO: <<heartbeat "Highwind Pass. Trust path. FULL MELODY, low. She chose him deliberately and he has no category for that. This is the moment the song becomes his song. Play the full melody here and nowhere close to here.">> */
+ [Face Yildiz.] -> act3_yildiz

=== act3_approach_lawrence ===
~ lawrence = lawrence + 1
~ skyResonance = "lawrence_leads"

He steps in front instinctively, before either of you decides it. The wind parts for him in a way that is not natural.

His hand does not go to his sternum. He is leading, and leading is something he knows how to do with everything sealed.
/* TODO: <<heartbeat "Highwind Pass. Lawrence Leads path. SILENCE. No Heartbeat. He is sealed and leading. The absence is its own information. Chest-press still fires post-fight.">> */
+ [Face Yildiz.] -> act3_yildiz

=== act3_approach_match ===
~ lawrence = lawrence + 2
~ skyResonance = "match"

You fall into step beside him without deciding to. He doesn't pull ahead. He doesn't slow down.

For a moment he glances sideways. Not long enough to be a look. Long enough to be a question he did not ask out loud.

His hand stays at his side.
/* TODO: <<heartbeat "Highwind Pass. Match path. 12-SECOND FRAGMENT only, then silence. Not the full melody. What the Trust path earns, the Match path approaches. Chest-press still fires post-fight.">> */
+ [Face Yildiz.] -> act3_yildiz

=== act3_highwindentry ===
// ═══ ACT 3: SKY TRAILIf My Heart Still Moves · Highwind Pass ═══
// 📍 Highwind Pass · Cliffside · The Wind That Holds Its Breath
The pass arrives. Wind that behaves wrong. Stopping mid-gust, reversing, holding perfectly still in places where stillness is geologically impossible.

Yildiz's charts are carved into the rock face. Not vandalism. Devotion.

+ [Lawrence and you match pace. Mutual recognition.] -> act3_approach_match
+ [Let Lawrence lead.] -> act3_approach_lawrence
+ [(You feel his pull. You don't fight it.)] -> act3_approach_anchor

=== act3_norecovery ===
~ xp = xp + 30
// 📍 The Observatory · Phase 3
You step back.

This time, nobody made you. The Tribunal forced this. The system interrupted. Your body decided. Here, on this mountain, in this wind, against a woman who is faster than Lawrence and fighting with forty years of grief behind every stroke: you decided. Your mind knew before your body had to tell it.

It is harder the second time. Not easier. Because the first time you could tell yourself you had no choice. This time the choice is yours and you are making it with your eyes open, watching the fight continue without you, trusting three people you have known for less than a month with the thing you started.

The wind hits you sideways as you step clear. You catch yourself on the observatory wall. Your hands are shaking. Not from cold.

Fang moves into the space you just left. She does not look at where you were. She does not check if you're okay. She looks at where Yildiz is going to be. The running commentary resumes, faster now, stripped of everything except survival mathematics: "Left. Low. She feints right then commits center."

But the Tribunal protocol doesn't work here. Yildiz is not the Tidewarden. She does not fight with verdict-magic and certainty-armor. She fights with a knife and forty years of mountain instinct, and the clean choreography the party built for structured enemies falls apart against someone who has never fought in a structure in her life.

Fang adapts first. She stops trying to predict and starts reacting, matching Yildiz's tempo instead of imposing her own. The knife comes in fast, low, angled for the gap between Fang's blades. Fang catches it on her off-hand blade and redirects. Barely.

Marcus adapts second. He stops trying to charge and starts reading. On all fours, low to the stone, paws flat, feeling Yildiz's footwork through the observatory floor the way he reads the earth in every other context: patience as tactical intelligence. When she commits to a lunge at Fang, he is already moving. Not a charge this time. A sweep. Eight hundred pounds of lateral force that takes her legs from under her. She hits the floor and rolls, but the knife skitters away across the star charts.

Lawrence does not adapt. Lawrence does something smarter. He stops fighting Yildiz entirely.

While Fang holds and Marcus sweeps, Lawrence crosses the observatory floor to the Binding Frame. Not running. Walking. The deliberate pace of someone who has realized the objective was never to defeat the woman with the knife. It was to free what she was guarding. He has been holding something in reserve since Phase 1. Not suppression magic. Something older. Something that sounds like a single sustained note when his hands connect with the Frame's edge.

The Binding Frame cracks.

Yildiz, on the ground, watches it happen. She could have reached for the knife. She doesn't.

You, against the wall, breathing hard, shaking, watching three people finish what you started: you understand something the game has been trying to teach you since the Tribunal. Stepping back is not leaving the fight. It is trusting the fight to the people who can finish it. And sometimes, from the outside, you can see the solution they couldn't see from the inside. Lawrence went for the Frame because you weren't in the way.

+ [The binding breaks.] -> act3_yildiz_break

=== act3_yildiz_break ===
// 📍 The Observatory · The Binding Frame
You reach the Binding Frame. It is smaller than you expected. A lattice of crystallized wind, dense enough to cast shadows, humming at a frequency that makes your teeth ache. Inside it, Sky is visible the way a held breath is visible in winter air: you can see the shape of what is being contained.

Yildiz is between you and the Frame. Knife in hand. Bleeding from where Marcus caught her. Breathing hard. Forty years of mountain living and the knife still doesn't shake. Her eyes move between you and the Frame, calculating the geometry of one more stand.

{avatarName}: "You already know how this ends."
Yildiz doesn't answer. She adjusts her grip on the knife.

# speaker: Fang
"(low, not unkind) Put it down."
Lawrence says nothing. He understands what is happening behind Yildiz's eyes because he has stood exactly where she is standing: between the thing you built to survive your grief and the moment someone asks you to stop.

Marcus sits. The bear equivalent of lowering a weapon. He will not advance. He is giving her the space to choose.

Yildiz looks at the Binding Frame. Inside it, Sky. The thing she charted for forty years. The patterns she traced every night from her observatory, measuring the movement of winds she could not touch but believed she understood. The storm that took someone she loved was Sky's domain. She blamed Sky. Death gave her a way to make the blame permanent.

She has been holding a knife for forty years. The cartography, the astrolabe, the precision: all of it was the knife. The weapon was never the instrument. The weapon was the certainty that she was right to be angry.

The knife lowers. Not because you won. Not because Marcus swept her legs. Not because Lawrence cracked the Frame. Because she just looked at Sky, through the lattice, and for the first time in forty years saw something other than the storm that took everything.

She saw what Sky looked like before the storm. She remembered why she started charting in the first place.

# speaker: Yildiz
"(very quiet, to no one in particular) I drew my first chart when I was eleven. I just wanted to know where the wind was going."
The knife clatters on the observatory floor. The sound is very small in the open air.

+ [Break the binding.] -> act3_skyfreed

=== act3_skyfreed ===
~ xp = xp + 60
// 📍 The Observatory · Sky's Release
Sky is Freed

The Binding Frame dissolves. Not like the Tidewarden's, which cracked and released. This one unravels. The crystallized wind filaments loosen, separate, and drift upward like threads pulled from a tapestry. The lattice thins until it is indistinguishable from the actual wind, and then it is the actual wind, and Sky is no longer inside something. Sky is the sky.

The wind above Highwind Pass begins to move correctly for the first time in months. You feel it before you understand it: a shift in pressure, a settling, the particular relief of air that has been compressed too long finally expanding.

Yildiz is still standing where she dropped the knife. She has not moved. Sky turns to her. Not as a person turns. As weather turns. The observatory fills with a presence that is vast and very, very gentle.

Sky: "These are accurate."

Yildiz looks up. Her face does something complicated.

Yildiz: "They were."

Sky: "They still are. The storm that took her... I could not have held it. But the chart was right. You read me correctly."

Yildiz's composure breaks. Not loudly. A single exhale that carries forty years of blame out of her body. She does not cry. She is not the kind of woman who cries. She is the kind of woman who stands very still and lets the feeling move through her like weather.

Yildiz picks up her astrolabe from the floor. Not the knife. The astrolabe. She walks out of the observatory without turning around. The song follows her and does not resolve.

Sky turns to you.

# speaker: Sky
"(to you, specifically) The desert will test you differently than the water did."
{avatarName}: "(quietly, head down, but meaning it) I’ll keep going anyway."
# speaker: Sky
"Whether you can keep going when you can't see the shape of what you're moving toward."
+ [Return to Mo Stór before the road east.] -> bridge_mostor_return2

=== act3_yildiz ===
// 📍 Highwind Pass · The Cartographer's Observatory
Yildiz, The Cartographer of Stars

The observatory is open to the sky. Star charts etched into the stone floor glow faintly, each one a fixed point in a cosmology Yildiz spent forty years mapping. The wind does not blow through this space. It orbits, following the charts' geometry, turning the room into a living orrery.

Yildiz stands at the center. She does not look afraid. She looks like someone who has been expecting company and is mildly annoyed it took this long.

# speaker: Yildiz
"You freed Water. I felt it from here. The tides shifted and my star charts went wrong for three hours. Do you know how long it takes to recalibrate a sextant after a tidal correction?"
# speaker: Fang
"We're here to free Sky."
# speaker: Yildiz
"I know what you're here to do. I also know what Sky is. Do you?"
Nobody answers. She didn't expect them to.

+ [She attacks first.] -> act3_yildiz_phase1

=== act3_yildiz_phase1 ===
// 📍 The Observatory · Phase 1: The Cartographer
Yildiz fights with cartographic precision. Fixed wind currents flow in geometrically exact paths along the star chart grooves in the floor. Step on a chart line and the wind throws you. Her astrolabe executes trajectories as force strikes. Her sextant measures party angles and applies them as splitting shockwaves.

The room is the weapon. Every chart line is a tripwire. The wind follows the map, which means the map dictates where you can stand, and Yildiz drew the map.

Lawrence must fight inefficiently: deliberate mistiming, abandoned follow-throughs. His jaw is tight throughout. He knows her instruments. He knows what they can do. He is fighting someone who fights the way he would if he had forty fewer years and forty more reasons to believe in what he was doing.

# speaker: Fang
"The floor is a grid. She knows every square. Stay off the glowing lines."
Fang's running commentary exploits the predictive system: if you can see the chart, you can see where the wind will go next. Marcus, in bear form, is the thing Yildiz's system cannot account for. A bear does not move on geometric lines. What he reads through vibration and scent, paws flat on the observatory floor, does not appear on any chart she has drawn. Her astrolabe tracks bipedal movement. Marcus has not been bipedal in a very long time.

+ [Disrupt the floor charts.] -> act3_yildiz_phase2
+ [Let Marcus draw her attention.] -> act3_yildiz_phase2

=== act3_yildiz_phase2 ===
// 📍 The Observatory · Phase 2: The Observatory Fights Back
Marcus charges through the center of the observatory on all fours. Eighteen hundred years of mass moving at a speed that a bear this size should not be capable of. His paws crack three chart lines simultaneously. The geometric wind patterns stutter, loop, and for two seconds the room doesn't know what shape it is.

Yildiz's eyes go wide. Not fear. Fury. She slams her palm against the observatory floor and the star charts flare.

The room reconfigures. Chart lines crawl across the stone like living things, reforming around the party's current positions. The wind shifts to match. The map she is fighting on is no longer the map you entered. She is rewriting the battlefield in real time.

# speaker: Marcus
"She's redrawing the charts around us. The wind will follow in seconds."
# speaker: Lawrence
"(suppression field flickering) My magic is mapped. She's charted my frequency. I am fighting someone who has made a study of me and I did not consent to the examination."
# speaker: Fang
"Welcome to what that feels like."
Lawrence does not respond to that. He does hear it.

The observatory's open ceiling becomes a liability. The stars above are not decorative. They are the original charts. Yildiz looks up, looks down, and the floor charts realign to match the current sky. The room is now synchronized with the actual heavens. Her precision has become astronomical.

# speaker: Fang
"She just linked the floor to the sky. I don't know what that means tactically but it scares me and I don't say that often."
+ [The phase shifts again.] -> act3_yildiz_phase3

=== act3_yildiz_phase3 ===
// 📍 The Observatory · Phase 3: The Woman Under the Maps
Then something changes. Yildiz throws the astrolabe aside. It clatters across the observatory floor and the geometric wind patterns collapse into chaos. The chart lines on the floor flicker and die. She draws a long knife you didn't know she was carrying and moves the way someone moves who learned to fight before they learned to chart.

# speaker: Fang
"(urgent) She dropped the math. She's fighting on instinct now."
# speaker: Lawrence
"(between blocks) I noticed."
# speaker: Fang
"Lawrence, she's faster than you."
# speaker: Lawrence
"I noticed that too."
The precision was containable. This is not. Forty years of living on mountain passes, reading weather by feel, sleeping with a blade because the heights belong to things with claws. The cartographer was the performance. The woman underneath has survived longer than the maps.

Without the charts, the wind goes feral. No longer geometric. No longer predictable. It blows from every direction and none, gusting hard enough to slide Marcus sideways across the stone despite four legs and eight hundred pounds of bear. Fang drops to a crouch and fights from below the wind line. Lawrence's suppression field is useless against wind that has no magical signature. It is just air, and air does not negotiate.

# speaker: Marcus
"(braced against the wind, calling over it) She's not trying to win anymore. She's trying to make sure we don't reach the binding. There's a difference."
# speaker: Fang
"What difference?"
# speaker: Marcus
"Someone fighting to win still believes they can. Someone fighting to delay believes they've already lost. She's more dangerous now."
Yildiz's knife finds openings that the astrolabe never could. She catches Fang across the shoulder. Marcus takes a slash along his flank that would have dropped a smaller bear. Lawrence blocks three consecutive strikes and the fourth gets through, opening a line across his forearm that mirrors the one the Tidewarden gave you in the Tribunal.

# speaker: Fang
"(bleeding, to you, very direct) This is the part where you decide."
{noRecoveryUnlocked:
    + [No Recovery Fracture: step back, let the party finish.] -> act3_norecovery
}
+ [Push through to the binding.] -> act3_yildiz_break

=== act4_ambush ===
// 📍 Deep Karakum · Dry Riverbed · Midday
The Ambush

The wolf puppy tried to warn you. An hour ago, at the dune ridge, it oriented east and Fang noticed. Nobody else did. You filed it. You should have acted on it.

The sand moves first.

Not underfoot. Under the surface. A compression wave you feel in your ankles before your brain processes it. Marcus drops flat, paws spread, reading. His ears rotate independently. His jaw locks.

# speaker: Marcus
"(fast) Three left, two right, one below. The one below is big. It's coming up in four seconds."
Three seconds. The ground erupts. Sand-wraiths: not ghosts, not spirits, not anything with a face you can negotiate with. Compressed desert given shape by Stone's disruption. They move like sand moves in a windstorm, except the windstorm has teeth and the teeth remember where you're standing.

Lawrence fires a mind lance. It connects. The wraith splits, scatters, and reforms behind him. His magic is pulling against itself. Stone's disruption makes every spell feel like trying to write on a surface that keeps shifting.

# speaker: Lawrence
"My magic is fighting the terrain. Every cast costs twice what it should."
Fang draws both blades and plants for her single-tempo. The sand shifts under her back foot. The plant fails. She stumbles, catches herself, and the wraith she was targeting is already somewhere else.

# speaker: Fang
"I can't plant. The ground won't hold still long enough for the tempo."
Marcus is the most effective because he has been reading terrain for eighteen centuries. He tracks the wraiths through the sand by compression patterns, calling positions before they surface. But the information is coming faster than the party can act on it.

+ [Hold position. Let Marcus call it.] -> act4_ambush_phase2
+ [Move to the riverbed. Harder ground.] -> act4_ambush_phase2

=== act4_ambush_phase2 ===
// 📍 Deep Karakum · The Riverbed · The Sands Get Louder
The Singing Sands get louder.

Not ambient. Not background. The hum that has been following you since Samarkand resolves into something with rhythm. Marcus said "reciting." He was right. The wraiths are coming in patterns that match the hum. Every fourth beat, from the left. Every seventh, from below. The desert is coordinating them the way a conductor coordinates an orchestra, except the instruments are made of compressed sand and the music is trying to kill you.

# speaker: Marcus
"The hum is the pattern. Count the beats. Fourth from left, seventh from below. If you can hear the rhythm, you can predict the next strike."
Fang adapts. She stops trying to plant and starts moving with the sand instead of against it. Her commentary shifts from positions to timing: "Two beats. Now. Three beats. Left." She catches a wraith mid-surface with a stroke that uses the sand's own momentum, long blade riding the compression wave instead of fighting it.

# speaker: Fang
"I'm surfing a sandstorm with a sword. This is either the stupidest or the best thing I've ever done."
Then the sand walls of the riverbed start to close.

Not collapsing. Moving. The wraiths are herding the party into the narrowest section. The walls lean inward, sand cascading from the edges, compressing the space you can fight in. Fang has less room for the Florentine. Marcus can't circle. The wraiths are burying you alive in slow motion.

Lawrence burns magic to hold the walls. Both hands up, suppression field extended sideways instead of forward, pushing sand back by force of will. His face is white. This is costing him everything and it's barely enough.

# speaker: Lawrence
"(through gritted teeth) I can hold the walls or I can fight. Not both. Decide fast."
Fang goes quiet. The running commentary stops. The jokes stop. Players who have been paying attention know what this means: when Fang goes silent, something is genuinely wrong.

She takes a hit. The wraith's compression edge catches her off-hand arm. The Samarkand blade bites sand instead of wraith. Spectral cold races up her forearm. She doesn't cry out. She switches to single blade and keeps fighting, but the geometry of her combat has changed. She's favoring the arm. Marcus sees it. Files it. Adjusts his position to cover her weak side without being asked.

The canteen on your belt cracks. You feel it before you see it: the strap snapping, the vessel hitting the riverbed floor, the sound of water meeting sand. The sand drinks it. All of it. In two seconds. The last water the party had, absorbed into a desert that does not negotiate.

# speaker: Fang
"(seeing the empty canteen, very quiet) ...No."
{noRecoveryUnlocked:
    + [Push through. Finish this yourself.] -> act4_push
    + [No Recovery Fracture: step back.] -> act4_norecovery
- else:
    + [Push through.] -> act4_push
}

=== act4_canteenempty ===
// 📍 Deep Karakum · No Water · No Magic
You walk. There is nothing else to do, so you walk.

Dawn arrives. The sun is visible, a pale disc clearing the horizon. The warmth does not come with it. The desert is cold. Not night-cold. Something else. The kind of cold that happens when a fire is burning and producing no heat. The light falls on the sand and the sand does not warm. Your shadow stretches behind you, too long for this hour, pointing back the way you came like a suggestion.

# speaker: Lawrence
"That should not be possible."
Nobody asks what. They can feel it. The sun is present and useless. Two Guardians freed and the world is still wrong in ways that go deeper than any single imprisonment.

Marcus tries to shift. The transformation stutters, catches halfway, and reverts. He stands very still for a moment. His ears do not rotate. When Marcus's ears stop moving, he is processing something he does not want to name.

# speaker: Marcus
"I can't feel my magic."
Lawrence raises one hand. The air around his fingers should shimmer. It does not.

# speaker: Lawrence
"Neither can I."
Fang tests her off-hand. The spectral cold from the wraith is still in the muscle. She makes a fist. Opens it. The fingers respond, but slowly, like they're translating from a language they used to speak fluently.

# speaker: Fang
"Out of spells. Out of water. Out of people who believed in us."
You keep walking. The sand hums beneath your feet. Quieter than before the ambush, as if the desert spent something too. The dunes are lower here, flatter, and the horizon is a straight line in every direction. There is nowhere to go that looks different from where you are.

Fang's silence tell is not active. She is talking. But the jokes have stopped. The commentary has stopped. What she says now is inventory: distance remaining, sun position, pace count. The voice of someone rationing energy the way you ration water, except there is no water.

Marcus walks with his head low. Not defeated. Conserving. Every few hundred paces he lifts his nose and reads the air, searching for moisture, for the chemical signature of a well or an underground spring. Each time his expression resets to the same careful neutral that means he found nothing.

Lawrence walks point. He has not stopped walking point since the ambush. His posture is precise even now, shoulders level, jaw set, the silhouette of a man who has decided that form is what you maintain when everything else is gone. But his gait has changed. Shorter steps. He is measuring his energy in increments small enough that he can pretend each one is a choice and not a concession.

An hour passes. Two. The sun climbs and delivers nothing. Your lips crack. Your tongue is thick. The sand in your lungs from the riverbed fight has settled into a grit that makes every breath taste like the desert is already inside you.

Fang stumbles. Catches herself. Does not acknowledge it. You see Marcus's ear tilt toward her without his head moving. He tracked the stumble by sound. He does not offer help. He knows she would refuse. He adjusts his pace so that if she stumbles again, he will be in range.

You think about Mo Stór. The stool pulled out. The drink waiting. The third step that creaks. It feels like a memory from someone else's life. The distance between that bar and this desert is not measured in miles. It is measured in the number of times you have had to decide to keep going when the landscape offers no evidence that going is the right choice.

Then Lawrence stops. He does not announce the stop. He simply ceases forward motion, and the party, attuned to him in ways none of them would describe as trust but all of them rely on, stops with him.

He reaches into his pack. Past the blade oil, past the empty provision wraps, into the bottom where he keeps things he does not discuss. He pulls out a water skin. Small. Battered. The kind of thing you carry not because it holds enough but because it holds something.

You didn't know he was carrying it. Nobody did.

A thousand years of crossing deserts taught him to keep a reserve. Not for himself. For the moment when keeping it mattered more than having it.

He passes it to you. His hand is steady. His eyes are not.

You take it. The water is warm and tastes like leather and survival. Two sips. Maybe three. Enough to swallow. Enough to remind your body that water exists. Not enough to solve anything.

You hold it out to Fang. She shakes her head once. You hold it out to Marcus. The same. Lawrence has already turned away. He did not take any. He will not take any. This is not a choice he is making in the moment. This is a choice he made before he filled the skin, possibly before he crossed his first desert, certainly before he met you.

You notice. He notices you noticed. Neither of you speaks. The gesture said everything that words would only make smaller.

The empty skin goes back in the pack. The party resumes walking. The horizon is the same in every direction. The sand hums. You keep going.

+ [Lawrence has a question.] -> act4_thequestion

=== act4_desertentry ===
// ═══ ACT 4: THE SINGING SANDSDuut Mankhan · What You're Made Of When Nothing Is Left ═══
// 📍 East of Samarkand · The Karakum Passage
The desert is a fact, not a postcard. Three days of heat and the particular psychology of a landscape that offers no landmarks. The Sands hum. Deeper now, edged.

The wolf puppy lifts its head and orients east before any threat registers. Fang is already talking. No one else was looking.
~ familiarSignalCount = familiarSignalCount + 1

# speaker: Fang
"You know what the Singing Sands are actually singing?"
# speaker: Marcus
"Acoustic resonance from particulate friction during compression events, amplified by..."
# speaker: Fang
"Nope. I was going for something poetic."
# speaker: Marcus
"...They sing of what was and is no longer."
# speaker: Fang
"There you go."
A long pause. The hum resolves, just for a moment, into something that almost sounds like a word.

# speaker: Marcus
"(quietly, ears flat) That is not singing."
# speaker: Fang
"What is it?"
# speaker: Marcus
"Reciting."
# speaker: Fang
"Reciting what?"
# speaker: Marcus
"Terms."
Nobody asks whose terms. Nobody needs to.

# speaker: Lawrence
"(without turning) They've been louder since we left Samarkand. Something knows we're coming."
Fang hums along for two bars. Then stops. Confused at herself.

# speaker: Fang
"...Why do I know this?"
Nobody answers. She doesn't know the song. But Clare might.

+ [Continue into the Karakum.] -> act4_ambush

=== act4_norecovery ===
~ xp = xp + 20
// 📍 Deep Karakum · Dry Riverbed
You step back. Your back hits the sand wall Lawrence is holding. You can feel his magic vibrating through the stone underneath, the effort of it translating as heat against your spine.

This is the third time. The Tribunal forced it. Yildiz, you chose it. Here, in a riverbed that's trying to become a grave, you know it the way you know breathing: without deciding. Your body is done. Your magic was gone two minutes ago. The sand in your lungs makes every breath a negotiation.

Fang fills the space. One blade now, the off-hand arm tucked against her ribs, fighting single-tempo for the first time the player has seen. It should be worse. It is not worse. It is different. Stripped of the Florentine's elegance, her combat becomes something rawer: instinct without choreography, survival without style.

Marcus reads the hum. Fourth beat. Seventh beat. He calls the positions and Fang trusts them without looking. The two of them fall into a rhythm that has nothing to do with the protocol they built for structured enemies. This is what two centuries of fighting beside someone actually looks like: not coordination. Anticipation.

Lawrence releases the walls. The sand surges inward. He has exactly enough magic left for one thing. He drives it not at the wraiths but into the sand beneath them, disrupting the compression patterns from underneath. The hum stutters. The wraiths lose cohesion for three seconds. Fang kills two in that window. Marcus catches the third mid-scatter.

The last wraith sinks. The sand settles. The hum fades to its old ambient drone.

+ [Aftermath.] -> act4_postcombat

=== act4_postcombat ===
// 📍 Deep Karakum · Post-Combat
Everyone emptied out.

Lawrence sits facing outward, posture precise even in exhaustion. His hands are flat on his knees. They have not stopped trembling since he dropped the walls. Fang crouches beside a rock, claws retracted, off-hand arm held against her ribs. The spectral cold is still in the muscle. She flexes her fingers and winces. Marcus is on his side, breathing through pain that bears process differently than people do: slowly, deliberately, each exhale a choice.

The canteen is in the sand where it fell. Empty. The stain where the water soaked in has already dried. The desert erased the evidence in minutes.

# speaker: Marcus
"So. That went impressively bad."
# speaker: Lawrence
"If we're cataloguing failures, I'd prefer to wait until I can feel my legs again."
# speaker: Fang
"(flexing her off-hand, testing) The canteen is gone. We have no water. We have no magic. We're in the middle of the Karakum. I want to make sure everyone is clear on the situation before someone suggests something optimistic."
# speaker: Marcus
"The nearest well is at least a day east."
# speaker: Fang
"Of course it is."
Nobody moves for a long time. The Singing Sands hum. Quieter now. Like they got what they wanted.

+ [The canteen is empty.] -> act4_canteenempty

=== act4_push ===
~ end = end - 2
~ xp = xp + 20
~ pushedThrough = true
// 📍 Deep Karakum · Dry Riverbed
You push through. Your sword arm shakes. Your magic is gone. You are fighting with muscle and the particular stubbornness of someone who has decided that this riverbed is not where the story ends.

A wraith surfaces directly under you. You drive your blade down through the compression wave, pinning it to the harder ground beneath. The impact travels up your arm and into your shoulder and something in your back gives a warning you will pay for later. The wraith dissolves around the blade. Sand fills the wound it leaves.

Lawrence drops the walls. He doesn’t have a choice. His magic gutters out like a candle in wind. The sand surges inward and he physically braces against it, shoulder against the wall, boots digging into the riverbed floor. A thousand-year-old vampire mage reduced to holding a sand wall with his body. There is no dignity in it. He does it anyway.

Fang, one-armed, finishes the last two wraiths with a single-tempo stroke that uses the collapsing wall as a redirect. The wraith hits the compressed sand and she’s waiting on the other side. Clean. Brutal. The kind of kill that costs nothing because there’s nothing left to spend.

Marcus catches the final wraith mid-scatter with his jaw. Bear. Direct. Not elegant. The wraith tastes like old sand and the death of rivers. He spits it out and lies down.

The hum fades. The sand settles. The walls stop moving.

You are on your knees. You don’t remember getting there.

{fang >= lawrence && fang >= marcus:
    Fang crouches beside you. She does not ask if you are okay. She looks at the empty space where your canteen used to be, then at the shape of what you just did, and she says something quiet that is not comfort and not praise.

    # speaker: Fang
    "You knew what it would cost. You did it anyway. That’s not the same as not knowing."
    She stands up before you have to respond.
- lawrence >= marcus:
    Lawrence is three feet away. Still standing, barely. He looks at you on your knees and he says nothing for a long moment. When he speaks, his voice is the combat voice, low and clean, and it is doing something it does not usually do: it is being honest about something it witnessed.

    # speaker: Lawrence
    "You checked the exits. Then you chose not to take them. I noted the difference."
    He offers you his hand. Not a gesture. A practical offer.
- else:
    Marcus shifts to human form and sits beside you in the sand. He does not speak immediately. When he does, it is the voice he uses when he has been waiting to say something and has decided the moment is now.

    # speaker: Marcus
    "There is a difference between someone who does not know their limits and someone who knows them and decides anyway. You decided. I have watched people fight for eighteen hundred years. I know the difference."
    He says nothing else. He doesn’t need to.
}

+ [Aftermath.] -> act4_postcombat

=== act4_thequestion ===
// 📍 Deep Karakum · The Question
The party walks. The sun is useless overhead. Nobody has spoken since the water skin.

Lawrence falls into step beside you. Not beside Fang, not near Marcus. Beside you. The half-step distance he has been maintaining since Highwind Pass narrows to a quarter-step. His arm is close enough to yours that you can feel the temperature difference between his skin and the air. Vampires run cold. The desert runs colder. The space between is something you are very aware of.

He does not look at you. He looks at the horizon. But the angle of his attention has changed in a way that a thousand years of practice cannot entirely disguise. He is performing indifference. Badly. On purpose.

# speaker: Lawrence
"You're limping."
You are not limping. Your left boot has a sand crease from the riverbed that you've been favoring. The fact that he noticed the difference between a limp and a boot crease from three paces away tells you everything about the precision of his attention. The fact that he named it as a limp tells you he wanted you to know he was watching.

{avatarName}: "Sand crease. Not a limp."
# speaker: Lawrence
"I know."
A beat. He lets that land. Two people too smart and too guarded to say the obvious thing, so they say the brilliant adjacent thing and let the subtext accumulate. He has been doing this since Highwind Pass. The attention. The manufactured proximity. The way he makes you feel like the most important thing in the desert and then withdraws just enough that you reach for the space he left. He is very, very good at this. He has had a thousand years of practice.

The thing Lawrence does not let himself think about: you are becoming a person to him. Not a target. A person. Moon's absence makes the line between conquest and connection impossible to maintain cleanly. He pursues because it creates distance. The distance keeps narrowing.

# speaker: Lawrence
"I have a question. You don't have to answer it."
He stops walking. You stop with him. Fang and Marcus continue for a few paces before they realize the geometry has changed. Fang looks back. Her jaw tightens by a fraction. She knows what this is. She has watched Lawrence do this across two centuries.

Marcus reads the pause. Reads Fang reading the pause. He positions himself between Fang and the scene, not to block her but to give her something else to orient toward. The diplomat, managing the room even in the open desert.

Lawrence turns to face you. Full attention. Not the sideways attention he has been rationing for days. All of it. His eyes are dark, and the precision he applies to combat he is now applying to this moment, and it is disarming in a way you did not prepare for.

# speaker: Lawrence
"If this is where it ends. If the desert takes us and Stone is never freed and none of it mattered... was it worth it? Coming this far. With us."
The question is strategic. He knows it will create intimacy because it frames the two of you as people who might die together, and proximity to death is the fastest solvent for distance. He has deployed this exact move before. He is not proud of it. He is doing it anyway because the emptiness is loud and you are the only thing that makes it quieter.

But his hand rises toward his sternum. Stops. Drops.
The question is also real.

{lawrence >= 5:
    + ['Yes. Every step.'] -> act4_question_yes
    + ['I don't know. But I'd do it again.'] -> act4_question_again
    + [(Step closer. Hold his gaze. Say nothing.)] -> act4_question_silent
- else:
    + ['Yes. Every step.'] -> act4_question_yes
    + ['I don't know. But I'd do it again.'] -> act4_question_again
    + [(Hold his gaze. Say nothing.)] -> act4_question_silent
}

=== act4_question_yes ===
~ lawrence = lawrence + 1
~ xp = xp + 20

{avatarName}: "Yes. Every step. Even the ones that hurt. Especially those."
Lawrence exhales. Not the controlled exhalation of someone who received the answer he engineered. The uncontrolled exhalation of someone who received an answer he did not expect to feel.

# speaker: Lawrence
"...That was supposed to be harder for you to say."
{avatarName}: "I know. That's why I said it fast. Before the smart part of my brain caught up."
He almost smiles. Not the performed smile he uses as social architecture. The other one. The one that involves exactly zero planning and disappears before he can manage it.

# speaker: Lawrence
"The smart part of your brain is considerably inconvenient."
{avatarName}: "You have no idea."
/* TODO: <<heartbeat "The Question. Full melody. 90 seconds. Everything the prior triggers built toward.">> */

He looks away first. That has never happened before.

+ [The desert releases you.] -> act5_threshold

=== act4_question_again ===
~ lawrence = lawrence + 1
~ xp = xp + 20

{avatarName}: "I don't know if it was worth it. I don't know if 'worth it' is even the right frame. But I would do it again. All of it. The Tribunal. The ghosts. The mountain. This."
Lawrence is very still.

# speaker: Lawrence
"'This' meaning the desert?"
{avatarName}: "'This' meaning whatever this is. Between us. The part where I keep noticing when you're watching and you keep pretending you weren't."
A long silence. The kind of silence that happens when someone says the thing both people knew and neither was willing to name. Lawrence's jaw works once. He starts a sentence. Stops. Starts a different one. Stops that too. A thousand years of rhetoric and he cannot find the correct response, which is itself the most honest thing he has done in your presence.

# speaker: Lawrence
"You are... considerably more observant than I accounted for."
{avatarName}: "Maybe you wanted me to notice."
He does not deny it. He does not confirm it. He starts walking again. After three steps, he adjusts his pace. Not the half-step back. Not the quarter-step. Even.

/* TODO: <<heartbeat "The Question. Full melody. 90 seconds. Everything the prior triggers built toward.">> */

+ [The desert releases you.] -> act5_threshold

=== act4_question_silent ===
~ lawrence = lawrence + 2
~ xp = xp + 20

You say nothing. You do the harder thing.

{lawrence >= 5:
    You step closer. Not a full step. Six inches. The distance between standing near someone and standing with someone. You can feel the cold of him now. Not unpleasant. Specific. The particular temperature of a man who has not been warm in a thousand years and has stopped expecting warmth from anyone.

    You hold his gaze. His eyes are dark and very, very still. He is reading you the way he reads combat: every micro-expression, every shift in weight, every breath. He is calculating. He is always calculating. But the calculation is stuttering against something it cannot process, which is that you are not performing bravery. You are simply here, six inches closer than you were, and you are not leaving.

    His hand rises toward her neck. Not fast. Not aggressive. The slow, certain reach of something that has done this before and stopped thinking of it as a choice. It stops an inch short. He looks at where his hand is. Something crosses his face that is not quite recognition and not quite shame. His hand drops to his side.

    # speaker: Lawrence
    "(barely audible) You should not stand this close to me."
    You do not move.

    # speaker: Lawrence
    "(even quieter) I am not asking you to move."
    The desert wind moves your hair across your face. Lawrence’s arms are rigid at his sides, hands clenched. You both know he is not going to reach for it. He knows you know. The space between you is the same width it was a moment ago. It feels smaller.

- else:
    You hold his gaze. The silence stretches. Lawrence looks at you with the full weight of a thousand years of managing how other people see him, and for once the management fails. His expression changes. Not much. The particular shift of someone who asked a strategic question and received a genuine answer and does not know what to do with the difference.

    # speaker: Lawrence
    "That is either the bravest or the cruelest answer you could have given."
    {avatarName}: "Which one did you want?"
    # speaker: Lawrence
    "...I am not certain anymore."
    The fact that he admitted uncertainty is seismic. This is a man who has spent a millennium making sure he always knows the answer before the question is asked. You just broke that. You did it by saying nothing.

}

/* TODO: <<heartbeat "The Question. Full melody. 90 seconds. Everything the prior triggers built toward.">> */

The desert wind continues. The Sands hum. The silence between you and Lawrence is a living thing, and it is not empty. It is full of everything neither of you said.

Fang, fifty paces ahead, does not turn around. Her combat commentary in the next scene will be three words shorter than usual. She will not explain why.

+ [The desert releases you.] -> act5_threshold

=== act5_aftermath ===
// 📍 Eastern Edge of Duut Mankhan · Campfire · The Night After the Threshold
Nobody speaks for a long time. The fire does the work.

Marcus is a bear again. He has been human twice today, and the desert took everything the first time had left. He settles at the edge of the fire where the warmth reaches him and the light does not. His eyes are open. He is not asleep.

He is cleaning his claws with a patience that is its own form of prayer. Lawrence is sitting closer to the fire than he usually does. Not seeking warmth. Seeking proximity.

Fang breaks first. Not with a joke. Not with a deflection.

# speaker: Fang
"I'm glad you're here."
Not followed by a joke. Not qualified. Not redirected. Just that.

The silence that follows is the kind that happens when someone has said the truest thing they know how to say and is waiting to see if the world punishes them for it.

It does not.

# speaker: Marcus
"(after a long time, very quietly) As am I."
Lawrence says nothing. He does not need to. He is here. He stayed.

You close your laptop. Not because the session ended. Because something in you recognized the moment and needed to sit with it.

Your apartment is quiet. Potato lifts his head from the couch, assesses that you are not in crisis, and returns to sleep. Sammy does not wake up. The kitchen light is on. You left it on this morning when the deadline was still breathing down your neck and the world felt like a series of tasks that would never resolve.

You think about texting someone. You do not text anyone. You sit at your kitchen table in the light you forgot to turn off and you feel, for reasons you could not explain to any reasonable person, that something important just happened to you.

You open the laptop again. The campfire is still there.

+ [The road east begins.] -> act6_bridgeeast

=== act5_alone ===
~ xp = xp + 30

You walk ahead of them. Not far. Just enough that the wind between you and the party is yours alone. The hardpan clicks under your boots. Small sounds in a large silence. Each step is a decision to keep being a person who moves forward.

Behind you, the party settles into a formation that respects the distance without abandoning it. Marcus in the center, human form, the coat from Samarkand not warm enough but worn anyway. Fang on the left where her good arm faces outward. Lawrence on the right where he can watch you walk away from him without you seeing his face while he does it.

They let you. This is the hardest kind of trust, the kind that looks like distance.

Fang's voice carries forward, not directed at you. At Marcus. At the space. At nobody.

# speaker: Fang
"She'll come back."
# speaker: Marcus
"I know."
# speaker: Fang
"I'm just saying."
# speaker: Marcus
"I know, Fang."
+ [The road continues east.] -> act5_aftermath

=== act5_threshold ===
// ═══ ACT 5: DUUT MANKHANThe Threshold · Where You Decide What Commitment Means ═══
// 📍 Duut Mankhan · Western Approach · The Edge of Stone's Domain
The Singing Sands go silent. Between one step and the next, the hum that has been your constant companion since Samarkand simply stops, the way a held note stops when the singer runs out of breath. The absence is louder than the sound was. Your ears ring with it.

The landscape changes. The dunes flatten into hardpan, cracked and pale. The sand gives way to a surface that feels like walking on the back of something that is not asleep. Dried salt deposits catch the light and throw it back in patterns that look almost deliberate. The ground is warm under your boots. Not sun-warm. Warm from below.

# speaker: Marcus
"(panting, ears flat) I need to stop for a moment."
Marcus, who has not once complained since the ambush, stops. Eight hundred pounds of grizzly in a desert that has offered no shade for two days. His coat is built for mountain rivers and salmon runs, not the Karakum. He has been shedding steadily for miles, tufts of brown fur caught in the salt crust behind him like a trail of breadcrumbs. He lies flat on the hardpan and presses his belly to the ground, seeking coolness in rock that does not have any to give.

# speaker: Fang
"(crouching beside him, hand on his shoulder) Hey. Big guy. Stay with us."
# speaker: Marcus
"I am a bear. In a desert. The thermodynamic implications of this combination have been accumulating for three days and I am addressing them now."
# speaker: Fang
"He's fine. When he uses big words he's fine. It's when the words get small that I worry."
Marcus shifts to human form. His daily allowance, spent on survival instead of diplomacy. When he stands, he is soaked with sweat. Human Marcus in the desert is less thermally catastrophic but more visually distressed. Fang offers him her water ration. He declines. She puts it in his hand. He drinks.

# speaker: Fang
"You've been shedding since the salt flats. I've been finding your fur in my bedroll. I've been finding your fur in my sword wrap. I found your fur in my breakfast this morning, Marcus."
# speaker: Marcus
"Bears shed. It is a biological process and not a personal affront."
# speaker: Fang
"It was IN my breakfast."
# speaker: Marcus
"Consider it seasoning."
He takes two steps and stops. His legs are deciding something that his dignity has not signed off on yet.

Fang looks at Lawrence. Lawrence looks at Fang. The silent communication of two people who have been reading each other in combat for two hundred and forty years. A protocol activates that the party built at some point before you arrived.

# speaker: Fang
"(to Marcus, carefully) We can carry the pack weight. Between us."
A long pause. Long enough that Lawrence takes a half-step forward. Long enough that you understand what is happening: this is a man who has held civilizations together being offered the chance to be held, and the offer costs him something enormous to accept, and costs the people making it nothing at all, and he is trying to locate the difference.

# speaker: Marcus
"(very quietly) I am not accustomed to requiring assistance."
# speaker: Fang
"Nobody said you required it."
Another pause. He hands her his pack. One strap at a time.

Lawrence takes the second one without being asked. He does not comment. He does not make it into anything. He slings the pack over his shoulder and resumes scanning the horizon, which is the most tactful thing he has done in the game.

Marcus looks at you. Something in his expression has shifted. Not embarrassment. Not relief. The specific quality of a man who has been a wall for sixteen hundred years and has just been told that the people behind him know it and have decided, together and without a committee, to be the wall for a mile. He has not had this before. He has not let himself have it.

# speaker: Marcus
"(to you, not to them) I built seventeen caravanserais. I never stayed in one."
He does not explain what he means. He walks forward. His steps are steadier.

Lawrence walks a few paces ahead during this exchange, scanning the threshold. But his attention is not on the horizon. It is angled backward, toward you, in the specific way that means he is watching without watching. You feel it the way you feel sunlight on the back of your neck. Directional. Warm. Not accidental.

You catch him. His eyes meet yours for exactly one second too long before returning to the horizon. He does not acknowledge the exchange. He does not need to. The glance said: I see you. I am choosing to let you see me seeing you. A thousand years of conquest deployed as a single look, and the worst part is you're not sure whether it's strategy or sincerity, and the worst worst part is you're not sure you care.

# speaker: Fang
"(to you, quiet, having seen the glance) He does that. The looking thing. I've watched him do it for two hundred years. It doesn't get less effective."
She does not say whether it's a warning or an observation. She might not know.

The hardpan stretches ahead. The air shimmers with heat that the ground radiates upward, making the horizon ripple. Somewhere ahead, the terrain begins to climb. Duut Mankhan. Stone's domain. You can feel it in the soles of your boots: the ground is getting harder, denser, as if the earth is remembering what it means to be permanent.

Three paths based on what you've built:

+ [Walk forward together. All bonds intact.] -> act5_together
+ [Walk forward. Something is unresolved.] -> act5_unresolved
+ [Walk forward alone. You need distance.] -> act5_alone

=== act5_together ===
~ xp = xp + 40

Fang walks on your left. Her off-hand arm is still stiff from the spectral cold, but she rolls the shoulder every few minutes, working the mobility back. She hums something under her breath. Not a song. A rhythm. The combat timing she uses when she's centering herself.

Marcus walks behind, human form, the ground steady under a different kind of weight. He has put on the coat from the Samarkand market. It is not warm enough. He wears it anyway. His footsteps are deliberate in a way that bear paws are not: he is relearning how to walk on two legs for the second time in a week.

Lawrence is on your right. Half a step back. Close enough that the absence of the half-step would mean something. Close enough that you can hear him breathing. You did not used to notice his breathing. You notice it now.

The silence where Heartbeat should be is more devastating than the music.

{jiwonSeen:
    Fang touches the chart inside her coat. Lawrence watches. Some things can only be carried together.
}

The landscape rises. The first rocks appear: not boulders, but teeth. The desert's jawline. The air tastes of mineral and age.

+ [The road continues east.] -> act5_aftermath

=== act5_unresolved ===
~ xp = xp + 35

Something between two of you is not finished. The silence where Heartbeat should be sits in that gap like a guest at a dinner party who has arrived too early and is trying not to take up space.

Fang walks slightly ahead, favoring her arm. Her commentary is minimal. She is rationing something, and it is not energy.

Lawrence is near you. Too near, given the friction. Or exactly near enough, given everything else. His proximity is a statement he has not verbalized. You are beginning to understand that Lawrence's physical positioning is his primary language and that everything he says out loud is the translation, which means the translation is always slightly less than the original.

Marcus walks between the gaps. He has been doing this since Samarkand. The diplomat, holding the geometry. In human form now, sweat-soaked, undignified. The least Roman he has looked in eighteen hundred years. Possibly the most honest.

You walk forward anyway. The unresolved thing comes with you. It will have to be addressed, but not here, not now. The ground hardens under your feet. Stone's domain does not care about your feelings. It cares about what you're made of.

+ [The road continues east.] -> act5_aftermath

=== act6_batu ===
~ batuMet = true
// 📍 Lower Cliff Dwelling · Mutou Valley
Batu

The cliff dwelling is carved into the valley wall, accessible by a path that switches back twice before arriving at a leather curtain weighted with stones. Batu draws it aside before you knock. The mountain told him.

He is old in the way that master craftspeople are old: the age is in his hands, not his bearing. His forge is cold. It has been cold for eight months. The tools are clean and arranged with the precision of someone who maintains them out of respect, not use. There is a chair near the forge that has not been sat in for a long time. It is positioned for someone shorter than Batu. He has not moved it.

# speaker: Batu
"Eight months ago, everything I made started failing. Not from wear. From giving up. The metal forgot what it was supposed to hold. A blade I forged for a caravan guard shattered against wood. I tested the steel myself. It was sound. And then it wasn't, because the stone underneath it stopped believing in permanence."
# speaker: Batu
"I knew the engineer who built the bridge. Kira. She came through the valley twenty years ago. Measured every cliff face, every mineral vein, every load-bearing stratum. Most people look at a mountain and see a mountain. Kira looked at a mountain and saw a promise it had made to gravity. She trusted the promise. When it broke, she broke with it."
Fang steps forward. She draws the Samarkand off-hand blade. Unwraps the hilt cloth. The letter is inside, where it has been since Samarkand. Eight hundred miles. She holds it out.

# speaker: Fang
"From Nadia."
Batu looks at the letter. Then at Fang. Then at the blade wrap it came in. He takes the letter with both hands. Holds it the way you hold something that might not be real.

# speaker: Batu
"She sent this in a blade wrap."
# speaker: Fang
"She said you'd understand."
# speaker: Batu
"I taught her to wrap blades when she was fourteen. She wrapped them the way she did everything else. Precisely. As if the object deserved the same attention as the person it was for."
He opens the letter. Reads it. His expression does not change, but his hands do. They stop being the hands of a man holding paper and become the hands of a man holding something that weighs more than paper has a right to weigh. When he finishes, he folds it. Places it inside the cold forge, against the wall where the coals used to be. The most protected place he knows.

# speaker: Batu
"She writes that the blade is holding. That the crack in the grain I was worried about has been stable for three years. She writes about a new tempering technique she developed from something I taught her, and she writes that she wanted me to know before..."
He stops. Clears his throat. Continues.

# speaker: Batu
"Before the road failed entirely. She was not certain the letter would arrive. She sent it anyway."
Fang is very still. The kind of still that, if you have been paying attention, means something is genuinely wrong.

# speaker: Fang
"(quiet, not performing casualness) How long since you've seen her?"
# speaker: Batu
"Eleven years. She came to the valley to study the tempering mineral in the cliff rock. Stayed three months. Left with technique and a letter she made me promise to read after she was gone. I still have that letter too."
# speaker: Fang
"(barely above a whisper) You kept them."
# speaker: Batu
"What else would I do with them?"
Fang turns away. She walks to the edge of Batu's dwelling where the cliff drops to the valley floor. She puts both hands on the stone railing and looks at nothing. The wolf puppy, in her sling, presses its nose against her jaw. She does not acknowledge it. She is somewhere else.

You follow. Not because she asked. Because the way she walked to the edge was the walk of someone who does not want to be alone but cannot bring herself to ask for company.

# speaker: Fang
"(not turning around) I told you I never sent Jiwon a letter."
{avatarName}: "You told me. At the night camp."
# speaker: Fang
"What I didn't tell you is that she sent me one. Three days before the storm. I got it after. I've never opened it."
A long silence. The valley below is beautiful and neither of you is looking at it.

# speaker: Fang
"It's in my pack. It has been in my pack for forty years. Every time I change packs, I move it first. Before the blades. Before the provisions. Before anything."
{avatarName}: "Why haven't you opened it?"
# speaker: Fang
"Because right now it could say anything. It could say she forgave me. It could say she loved me. It could say 'pick up milk on the way home.' As long as I don't open it, every version is possible. The moment I open it, forty years of possible becomes one true thing, and the one true thing might be worse than all the possible things I've been carrying instead."
She turns around. Her eyes are dry. Fang does not cry. But the effort of not crying is visible in a way that is more devastating than tears would be.

# speaker: Fang
"Batu kept every letter Nadia sent him. He put them in his forge. The most protected place he knows. I've been keeping mine in my pack, between the blades. (beat) The most dangerous place I know. Make of that what you will."
She bumps your shoulder with hers. Once. Brief. Then walks back inside.

Inside, Batu is showing Marcus the forge. The cold metal. The tools arranged with care. Marcus is at the forge in bear form, studying the anvil the way he studies ruins: with the weight of someone who has watched a thousand crafts die when the infrastructure that supported them failed.

# speaker: Batu
"(to Marcus) Your bear knows more than he's saying."
# speaker: Marcus
"(a low sound that is agreement without words)"
Lawrence is at the dwelling's edge, looking toward the cave entrance visible across the valley. The Flaming Mountains frame it like a wound. He has not participated in the letter exchange. He has not spoken since the night camp. The kiss is twelve hours old and he is processing it the way he processes everything: by not processing it, by looking at the next objective, by maintaining the forward motion that has kept him alive for a millennium.

But he is standing at the edge, and his hand rises to his sternum. Completes. He is not performing. He is not aware he is doing it.

/* TODO: <<chestpress "Cave threshold. Lawrence looking east, at what remains. Not performed. Out of habit.">> */

You stand beside him. Not the strategic proximity of the last few days. Something simpler. Shoulder near shoulder. Two people looking at the same dark entrance.

{avatarName}: "Are you ready?"
# speaker: Lawrence
"(still looking at the caves) I have entered a great many dark places in a thousand years. I was always ready because I did not care what happened to me inside them."
A pause.

# speaker: Lawrence
"This is the first time I am not ready. I find I prefer it."
He is saying: there is now something he does not want to lose. He is saying it by saying the opposite of what he has been for a thousand years. The man who didn't care what happened is standing at the threshold of the last dungeon and caring, and the caring is what makes him unready, and the unreadiness is what makes him present.

His hand finds yours. Not briefly this time. He holds it. You hold back.

Fang, returning from the edge, sees your joined hands. She does not react. She does not sharpen anything. She looks at the cave entrance. Then at Lawrence. Then at you.

# speaker: Fang
"(very quietly, to herself, not meant to be heard but you hear it anyway) ...Okay."
One word. It is not approval. It is not blessing. It is Fang deciding, for the first time in two hundred years, to let something play out without trying to protect everyone from the ending.

/* TODO: <<heartbeat "4 bars, buried in the Stone ground tone. Submerged immediately. The player who has been counting will know what number they're at.">> */

+ [Cross the valley to the caves.] -> act7_tigerambush

=== act6_bridgeeast ===
// ═══ ACT 6: THE SEARCH ACTRoad to the Thousand Caves · Commitment Without Entrapment ═══
// 📍 East of Duut Mankhan · The Gobi Transition
The desert changes personality between Duut Mankhan and the Gobi. The Singing Sands were hostile. The Gobi is indifferent, which is worse. Flat gravel extending in every direction, the color of old bone. No dunes. No features. Just distance, uninterrupted, stretching to a horizon that looks the same at noon as it does at dawn.

The road stutters. Literally. Sections of ancient highway that should be continuous are offset by centimetres, as if the ground forgot where it was supposed to connect. You step over a gap where six inches of road simply stopped existing. The stone on either side is clean. Not broken. Discontinued.

# speaker: Marcus
"This road was one continuous surface when I walked it in the fourth century. Seventy-three days, Samarkand to Chang'an. Every step connected to the next. Stone remembers connection. When Stone is imprisoned, the memory fails."
# speaker: Fang
"So the road is having an identity crisis."
# speaker: Marcus
"The road is forgetting what it is for. Which, if you have studied the decline of any civilization, is exactly how things end. Not with a collapse. With a discontinuation."
# speaker: Fang
"Cool. Love that for us. Super encouraging."
The gravel crunches under your boots. The sound is the only evidence you're moving. Without it, you could be standing still and the horizon wouldn't argue.

Lawrence walks beside you. He has not returned to the half-step distance since The Question. He walks even with you now, and the evenness is a statement he has not retracted.

On the third day, you stumble over a road discontinuation. A gap that wasn't visible under the gravel. Your ankle turns. You catch yourself, but Lawrence's hand is already at your elbow. Fast. Precise. The reflexes of someone who was tracking your footfall by sound and had already calculated the most likely failure point.

His hand stays a beat longer than support requires. One second. Two. You feel the cold of his fingers through your sleeve. When he withdraws, the withdrawal is deliberate, not sudden. He is making sure you register that the touch happened and that the removal was a choice, not a reflex.

# speaker: Lawrence
"The road gets worse ahead. Be careful where you plant."
Practical. Reasonable. The kind of thing anyone would say. Except his voice did something on "be careful" that his everything-else voice does not do, and you heard it, and he knows you heard it.

You are flattered. You are aware that you are flattered. You are aware that being aware of it does not make it less effective. A thousand years of knowing how people work, deployed as a hand at your elbow and a voice that drops half a register on the word "careful." The worst part is that it's working and you don't entirely want it to stop.

Fang, walking three paces ahead, heard the stumble. Heard the catch. Heard the one-second-too-long silence. She does not turn around. But something in her shoulders changes. The looseness she carried out of Duut Mankhan tightens by a degree.

That evening, you make camp in the lee of a road marker that predates Marcus. Fang sharpens her blade. The sound is rhythmic, steady, and slightly more aggressive than it needs to be.

Lawrence sits near you. Not beside you. Near you. The geometry is different and specific: close enough to talk, angled so that the firelight catches his profile in a way that might be accidental if you didn't know that Lawrence has not done anything by accident since the fall of Constantinople.

# speaker: Lawrence
"You favored your left ankle after the stumble. Is it weight-bearing?"
{avatarName}: "It's fine. A ghost walked through me last month and this barely registers."
# speaker: Lawrence
"Merchant's stools are considerably more dangerous than they're given credit for."
A smile. Not the managed one. The one that happens before he catches it. You smile back. The exchange is small, warm, and exactly the kind of manufactured intimacy that makes you feel like the most interesting person at the campfire. You know it's manufactured. It doesn't matter. You're in a desert and someone is paying attention to your ankle and your smile and the way you tuck your hair behind your ear, and the attention feels like water after three days of dust.

# speaker: Lawrence
"May I see it? The ankle. I have some experience with field medicine."
+ ["Sure."] -> gobi_ankle_yes
+ ["I’m good. Really."] -> gobi_ankle_no

=== gobi_ankle_yes ===
~ lawrence = lawrence + 1

He kneels. His hands are careful, clinical, respectful. He checks the joint with the precision of someone who has done this a thousand times. His thumb traces the tendon line and pauses at the point where the swelling begins. His touch is cool and professional and you are aware of every millimetre of it.

# speaker: Lawrence
"Minor strain. It will hold. Wrap it tonight if you can."
He releases your ankle. Stands. Returns to his position by the fire. The interaction was medical. The interaction was also not entirely medical. You both know this. Neither of you names it.

The sharpening sound from Fang's side of the camp has gotten louder.

-> END

=== gobi_ankle_no ===

# speaker: Lawrence
"(a nod, accepting cleanly) Wrap it if it swells."
He doesn't push. The acceptance is instant and total. It reveals something: there is more to him than the approach. A man whose entire strategy is pursuit should not accept rejection this gracefully. Unless the rejection tells him something he needed to know, and the needing is the real thing, not the pursuit.

The sharpening sound from Fang's side of the camp has gotten louder. Not dramatically. Just enough that if you've been tracking the rhythm, you'd notice the tempo increased.

# speaker: Fang
"(without looking up from the blade) Lawrence."
# speaker: Lawrence
"Fang."
# speaker: Fang
"Nothing. Just making sure you remember other people exist."
She goes back to sharpening. The sound is exactly as aggressive as before. Lawrence's jaw works once. He does not respond.

You don't understand why Fang is annoyed. She's not jealous. She has shown no romantic interest in Lawrence in your presence. She named what you did on Yildiz's mountain and called it the hardest thing she'd seen in a fight. She's been walking on your left since the Threshold. So why does Lawrence paying attention to your ankle make her sharpen her blade harder?

It's not about the ankle. You're fairly sure of that. And it's not jealousy, at least not any version of jealousy you recognize. Fang has shown no romantic interest in Lawrence in your presence. She has shown no romantic interest in anyone in your presence. She has shown interest in swords, beer, and the structural integrity of Nadia's blade repair, in that order.

So what is it? She has known Lawrence for two hundred years. You have known him for weeks. She is reacting to something she has seen before, something in the pattern of his attention that you are seeing for the first time and she is recognizing for the hundredth. You do not know what the pattern is. You do not know what comes after the part you're in.

You only know that Fang, who has not been afraid of anything since you met her, is sharpening a blade that does not need sharpening, and the sound she is making is not maintenance. It is warning.

You don't know what she's warning you about. You will.

Marcus, across the fire, has been watching the entire exchange. He says nothing. He is making notes.

Your phone vibrates. Not a game notification. A DM.

{jeff >= 6>><span style="color:#60a5fa;">Byung-Ho:</span> <span style="color:#d1d5db;">Hey. Good session tonight. Your character is really coming into her own. I mean that. She's ! just good at things. She's interesting.</span><<elseif jeff >= 3>><span style="color:#60a5fa;">Byung-Ho:</span> <span style="color:#d1d5db;">hey. good session tonight. your character is really coming into her own. I've been thinking about the pomegranate scene.</span><<else>><span style="color:#60a5fa;">Byung-Ho:</span> <span style="color:#d1d5db;">hey. good session tonight. your character is really coming into her own.</span><</if:
    ~ jeff = jeff + 1
    Ishani:FBP: Thanks! The desert sequence was intense. I didn't expect the question scene.
    Byung-Ho: yeah Lawrence kind of went off script there. i had something more strategic planned but the scene just went somewhere and i followed it.
    >Ishani:>FBP:> It felt very in character. Lawrence has been different since Highwind.
    Byung-Ho: lol yeah he has. i think the character is just doing his thing. vampires gonna vampire you know.
    Byung-Ho: it's all rp though. i hope that's cool. like i'm not trying to make it weird.
    >Ishani:>FBP:> It's not weird. I like where the story is going.
    Byung-Ho: cool. cool cool cool. yeah me too.
    Byung-Ho: the ankle thing was maybe a bit much though lol. i couldn't tell if that was too forward or if it worked
    >Ishani:>FBP:> It worked.
    Byung-Ho: oh. good. that's. good to know.
    Byung-Ho: anyway. see you next session. get some sleep, the caves are going to be rough.
    He signed off with "see you next session." Not "goodnight." Not "sweet dreams." "See you next session." The careful, lowercase language of a man who is testing whether he still knows how to make someone feel something, using a fictional character as a safety net so that if it doesn't work, it was just RP. Lawrence is not Byung-Ho. But the hand at the elbow was not entirely Lawrence's either, and the question about whether the ankle thing was "too forward" is a question a software developer asks, not a thousand-year-old vampire. He is using the game the way someone uses a practice room: to rehearse the version of himself he's afraid doesn't exist anymore, after the breakup ate the part of him that believed he was worth wanting.

    + [Reach the Jade Gate outpost.] -> act6_jadegate

=== act6_flamingmountains ===
// 📍 Flaming Mountains · Mutou Valley Approach
The mountains earn their name. The cliff faces are the color of heated iron: red-orange at the base, darkening to rust at the ridgeline. Heat shimmers make them ripple like living things. The air tastes of mineral and old fire. Somewhere inside this range, Kira's bridge stood for three hundred years. It came down on a clear day. No wind, no flood, no cause in any record that followed. She had calculated eight hundred. What she decided afterward was not that her math was wrong. It was that permanence itself could not be trusted to keep its word.

The party walks differently this morning.

Fang is three paces ahead, where she has been since dawn. Her commentary is present but clipped. She is not angry. She is processing. Her combat word-count, if anyone were tracking it, dropped by four words overnight.

Marcus walks beside you. In bear form again, daily human allowance saved for whatever the caves require. His ear tilts toward you, then toward Lawrence, then back. He is reading the changed geometry of the group by sound and does not require an explanation.

Lawrence walks on your other side. The distance between you is different. Not the half-step. Not the quarter-step. Something new. The distance of two people who kissed twelve hours ago and have not discussed it and are both profoundly aware of every centimetre between them.

He has not touched you since last night. The absence of his hand is louder than the presence was.

# speaker: Fang
"(without turning) The cave entrance should be a half-day's walk. If anyone has anything they want to say before we go underground, now would be the time."
Nobody says anything. Fang nods once. The party continues.

The invitation was not casual. She was giving you and Lawrence an opening. You did not take it. She will not offer again.

+ [Find Batu.] -> act6_batu

=== act6_gaochang ===
~ gaochangScene = true
// 📍 Gaochang Ruins · Turpan Basin
Gaochang is a skeleton. Walls that used to hold markets, temples, a garrison. The wind moves through them without obstruction because every door is gone. Sand has colonized the interiors. What remains is geometry without purpose: the shape of a city that forgot it was a city.

Marcus walks through it the way you walk through a house where someone died. Slowly. Touching walls.

# speaker: Marcus
"(quietly) We told ourselves the roads would outlast everything. We were, in a specific and devastating way, correct. The roads outlasted us."
# speaker: Fang
"You were."
The most direct thing she says to him in this arc. Two words that carry two centuries of knowing someone.

The party splits to explore. Marcus needs time alone with the ruins. Fang lets him have it. She takes a perimeter walk, checking sightlines, doing the work that keeps her from having to feel things.

You wander into a courtyard with a dry fountain. The basin is carved with a pattern of interlocking circles. Silk Road geometry. The kind of design that only works if every piece connects.

Lawrence is already there. He is standing with his back to you, looking at a wall mosaic that has survived twelve centuries of weather. It depicts two figures: one reaching, one turning away. The plaster is cracked but the gesture is clear.

# speaker: Lawrence
"(without turning) Do you know what this city was famous for?"
{avatarName}: "Trade?"
# speaker: Lawrence
"Letters. The merchants here wrote more personal correspondence than any other city on the Silk Road. They were constantly writing to people they missed. The entire city ran on longing."
He turns. The mosaic is behind him: one figure reaching, one turning away.

# speaker: Lawrence
"I walked through here in the sixth century. The letters were still being delivered. By the ninth century, they were being found in the walls. By the twelfth, nobody remembered who wrote them. The longing outlasted the names."
This is not a strategic deployment. This is Lawrence in the ruins of a city that reminds him of something he will not say. The conquest surface has thinned. Underneath it, for just a moment, you can see the outline of a man who has outlived every person he ever wrote a letter to.

{avatarName}: "Do you still write letters?"
# speaker: Lawrence
"(a pause that carries more weight than the answer) ...No. I stopped when I ran out of people to send them to."
The wind moves through the empty doorway. The mosaic watches. You stand in the courtyard of a city that died of disconnection, with a man who has been disconnected for a thousand years, and the distance between you is smaller than it has ever been.

+ [Night camp. Fang has a letter.] -> act6_nightcamp

=== act6_jadegate ===
// 📍 Jade Gate Outpost · Eastern Silk Road
Tariq al-Fashir

The outpost is smaller than you expected. A handful of mud-brick buildings clustered around a well that still works, which makes it the most valuable real estate for two hundred miles. Camels kneel in the shade of a wall that predates every structure around it. The Jade Gate itself is a stone archway with no gate, framing a view of the Gobi that nobody asked for.

Tariq al-Fashir sits behind a table covered in ledgers. He is thin, precise, and has the particular exhaustion of a man who has been writing down things nobody believes. His father built a livelihood on this road. Tariq is documenting its autopsy.

# speaker: Tariq
"My father built his livelihood on this road. When the road stops being reliable, everything built on it is gone. That is not metaphor. That is accountancy."
He opens the ledger. Route anomalies, dated and precise. Caravans that left on schedule and arrived three days late to destinations two days away. Roads that measure differently depending on which direction you walk them. Kira's bridge in the Flaming Mountains, the one Lawrence mentioned in the briefing, the one that stood for three hundred years and collapsed on a clear day with no wind.

Marcus leans forward. Tariq glances at the bear who is now a man and decides, with the pragmatism of a Silk Road merchant, that the explanation can wait.

# speaker: Marcus
"Your route measurement methodology. You measured both directions independently?"
# speaker: Tariq
"My father taught me to walk a route twice. Once to measure distance. Once to measure whether the distance agreed with itself."
# speaker: Marcus
"And the discrepancies began eight months ago."
# speaker: Tariq
"Eight months, three weeks. I have the date. I have every date. When a man watches his inheritance dissolve, he writes down the time of dissolution."
Marcus traces a finger along a column in the ledger. His expression changes. The senator seeing data that confirms what the bear already knew.

# speaker: Marcus
"These discrepancies follow the old caravanserai network. Every anomaly you've recorded corresponds to a waystation I helped build in the fourth century."
# speaker: Tariq
"(long pause) You helped build the waystations."
# speaker: Marcus
"The infrastructure was designed around the presence of Stone. With Stone imprisoned, the foundation logic is failing. Your father's road isn't broken. It's forgotten what holds it together."
# speaker: Tariq
"(setting down his pen for the first time since you arrived) My father would have liked you. He also explained catastrophe as engineering."
They continue. Marcus pulls out details Tariq didn't know were details: which anomalies cluster near underground water sources, how the road's memory degrades faster at altitude, why the bridge in the Flaming Mountains was the first thing to fail (it was the most perfectly engineered structure on the route, and perfection is the first thing Stone's absence erodes). Tariq writes faster. He has been documenting the impossible for eight months and someone is finally reading it as evidence instead of hysteria.

While they work, you and Lawrence drift to the edge of the outpost. Fang is outside checking the road conditions, which is Fang for needing five minutes without walls. You lean against the stone archway. Lawrence leans against the other side. Between you, the Gobi stretches in every direction.

{avatarName}: "What did you eat? Before all this. Before the quest. When you were just living in whatever century, doing whatever you were doing. What was your regular meal?"
Lawrence looks at you with an expression that suggests nobody has asked him a normal question in a very long time.

# speaker: Lawrence
"...Pomegranates."
{avatarName}: "Really?"
# speaker: Lawrence
"For a while. A century or so. I found a grove in Anatolia where they grew without intervention. I would go back every autumn. The same trees. The same fruit. It was the most consistent thing in my life for a hundred years."
{avatarName}: "What happened to the grove?"
# speaker: Lawrence
"An aqueduct. The water table shifted. The trees died in three seasons. I was in Samarkand when it happened. By the time I came back, there was nothing to come back to."
A beat.

# speaker: Lawrence
"What about you?"
{avatarName}: "What do I eat?"
# speaker: Lawrence
"What is your pomegranate grove. The thing you go back to."
You think about it. The question is small and the answer is not.
/* TODO: <<textbox "$fortuneGroveAnswer" "There's a place near my apartment that does dosas. The woman who runs it doesn't know my name but she knows my order. I've been going every Saturday for three years. She puts extra chutney without me asking.">> */

{avatarName}: "{fortuneGroveAnswer}"
# speaker: Lawrence
"(the almost-smile) That is a pomegranate grove."
{avatarName}: "It's a dosa cart."
# speaker: Lawrence
"Same thing. A place that knows what you want before you say it. Those are rare. Protect it."
The conversation is nothing. Pomegranates and dosas. The kind of talk that happens at the edge of somewhere, between people who have been doing important things all day and need five minutes of not-important. And yet Lawrence just told you about a grove he loved for a hundred years and lost while he wasn't looking, and the way he said "protect it" had the weight of someone who did not protect his.

+ [Let it be what it was.] -> supply_letbe
>>+Lawrence Trust · he opens something he rarely opens
>>Provocation · accurate · will cost something

-> END

=== supply_letbe ===
~ lawrence = lawrence + 1

Inside the outpost, Marcus and Tariq are still bent over the ledger. The diplomat and the accountant, saving the world with data.

Lawrence stands behind you while you rejoin them to read the ledger. Not beside you. Behind you. Close enough that when you lean forward to trace a route on the map, his chest is near your shoulder and you can feel the cold of him through two layers of travel clothes. He reaches past you to point at an entry. His arm brushes yours. The contact lasts exactly long enough to register and not long enough to name.

# speaker: Lawrence
"(low, near your ear, reading the entry) Mutou Valley. Flaming Mountains. That is where Stone is."
His voice does the thing again. The half-register drop, close enough that his breath catches the edge of your ear. The butterflies arrive before you have time to argue with them.

Your breath catches. Just for a second. You are not sure if he notices. You are fairly sure he notices everything.

You are aware that reading a ledger should not feel like this.

Fang, back from the road, watches the exchange from the doorway. She says nothing. Her off-hand flexes once.

~ tariqLedger = true

+ [Continue to Gaochang.] -> act6_gaochang

=== act6_nightcamp ===
// 📍 Night Camp · East of Gaochang · Under Stars That Remember
The fire is built in the lee of a Gaochang wall that still stands. Overhead, the stars are thick and low. The Turpan Basin has no light pollution. The sky looks the way it looked when this city was alive.

Fang produces the letter. The one Nadia tucked into the blade wrap in Samarkand. Eight hundred miles, carried next to steel, carried next to Fang's heartbeat every time she drew the sword.

# speaker: Fang
"Nadia said to deliver this to Batu. Eight hundred miles in a blade wrap. That's either devotion or insanity."
# speaker: Marcus
"(ears tilt, human form, but the tilt is the same) Sometimes the same thing."
Fang holds the letter. She does not open it. She turns it over in her hands.

# speaker: Fang
"I never sent Jiwon a letter. I had forty years and I never once put it in writing. I told myself it was because we were always in the same place. But that wasn't it. I was afraid that if I wrote it down, it would become real in a way I couldn't take back."
The fire cracks. Marcus does not speak. Lawrence does not speak. This is Fang's moment and the party knows it.

# speaker: Fang
"Nadia put eight hundred miles of road between herself and the person she was writing to, and she still wrote it. That's braver than anything I did with a sword today."
She tucks the letter back into the blade wrap. She will deliver it. The fire burns lower.

Marcus excuses himself. "I will check the perimeter. It will take exactly as long as it takes." He leaves. He is giving the fire to the people who need it.

Fang follows ten minutes later. "I'm going to sharpen the off-hand. It doesn't need sharpening. Nobody point that out." She walks to the far side of the wall.

You and Lawrence are alone at the fire.

The silence is not uncomfortable. It is the particular silence of two people who have been circling each other for a thousand miles and have run out of road to use as distance. The firelight catches his profile. He is not positioning himself for it. He has simply stopped managing how you see him.

# speaker: Lawrence
"Fang is braver than she knows. The letter, the carrying, the admission just now. She has spent two centuries building walls and she just named one out loud."
{avatarName}: "You sound like you admire her."
# speaker: Lawrence
"I do. I always have. I admire anyone who is capable of saying the thing I cannot."
{avatarName}: "Which thing?"
He looks at you. The full weight of it. Not the strategic attention he has been deploying since the Gobi. Not the manufactured proximity. The other thing. The thing underneath. The thing his hand keeps reaching for against his sternum when his guard drops.

# speaker: Lawrence
"That it matters. That any of it matters. That the people who are here, right now, at this fire, in this impossible place, doing this impossible thing... that they matter to me. Specifically. Not as a party. As people."
A long silence. The fire settles. A log shifts.

# speaker: Lawrence
"(very quiet) As a person."
Singular. Not plural. He corrected himself. He is looking at you when he says it.

The silence has a direction now. Both of you can feel which way it is pointing.

+ [(Lean away. The moment would pass. He would let it.)] -> gaochang_pass
+ [(You are already leaning. You may as well know it.)] -> gaochang_kiss_lean
+ [(Hold still. See what he chooses.)] -> gaochang_kiss_hold

=== gaochang_pass ===
~ gaochang = "passed"
~ lawrence = lawrence + 1

You lean back. Barely. An inch. A choice made in the angle of a shoulder.

He sees it. Of course he does. A man who tracked a boot crease from three paces can read a centimetre.

He exhales. Not disappointment. Something closer to relief, then closer still to recognition: you were paying enough attention to choose deliberately. Not rejection. Precision.

# speaker: Lawrence
"(very quiet) Alright."
One word. Complete acceptance. No qualification. No manufactured casualness. He does not touch you. He does not move away. He stays exactly where he is and the space between you is exactly the space you chose, and he is treating that choice as information rather than a verdict.

He looks at the fire. After a long moment:

# speaker: Lawrence
"For the record. I was not performing that."
It is the most honest thing he has said without architecture around it. You believe him. That is why the lean was the right choice: not because the moment was wrong, but because it was real enough to deserve more than one night in Gaochang to hold.

He looks away first. That has also never happened before.

Somewhere beyond the wall, Fang is sharpening a blade that does not need sharpening. She registered the quality of the silence when it changed. She files this. She does not know yet how she feels about it.

+ [Approach the Flaming Mountains.] -> act6_flamingmountains

=== gaochang_kiss_lean ===
~ gaochang = "lean"
~ lawrence = lawrence + 1

You do not know who moves first. Later, you will replay this moment from every angle available to memory and you will never be certain. One of you leaned. One of you met. His hand comes up to the side of your face. His fingers are cold and careful. He pauses there, a centimetre from contact, giving you time to pull back. Consent built into the architecture of the gesture.

You do not pull back.

The kiss is not what you expected. It is not a thousand years of technique. It is not the conquest mechanic. It is brief, and soft, and slightly uncertain in a way that a man who has done this a thousand times should not be. As if the part of Lawrence that knows how to perform has stepped aside and what remains is the part that has forgotten how to mean it and is remembering in real time.

He pulls back first. His hand stays at the side of your face for one more second. Then drops.

# speaker: Lawrence
"...I did not plan that."
{avatarName}: "I know."
# speaker: Lawrence
"That is precisely the problem."
He looks at the fire. You look at the fire. The stars continue. Somewhere beyond the wall, Fang is sharpening a blade that does not need sharpening, and she knows exactly what just happened, and she is deciding what she thinks about it.

+ [Approach the Flaming Mountains.] -> act6_flamingmountains

=== gaochang_kiss_hold ===
~ gaochang = "hold"
~ lawrence = lawrence + 2

You hold still.

It is the harder answer. It requires nothing and costs everything. You do not lean toward him. You do not lean away. You are simply here, at the exact distance you chose, and you let him decide what to do with it.

He is very still. A thousand years of calculation and it is stuttering. He is the one who has to choose. You have handed him something he is not accustomed to receiving: agency without a cue. No manufactured proximity, no subtext accumulating on a schedule, no reciprocal lean to respond to. Just you, holding still, waiting.

His hand rises. Not fast. Not aggressive. The slow, certain reach of someone who has made a decision he has been thinking about since Highwind Pass. His fingers find the side of your face. Cold and careful. A centimetre from contact, he stops.

The pause is the consent. He gave it to you. He is waiting.

You close the distance.

The kiss is brief, and soft, and slightly uncertain in a way that a man who has done this a thousand times should not be. As if the part of Lawrence that knows how to perform has stepped aside and what remains is the part that has forgotten how to mean it and is remembering in real time.

He pulls back first. His hand stays at the side of your face for one more second. Then drops.

# speaker: Lawrence
"...I did not plan that."
{avatarName}: "You chose it."
# speaker: Lawrence
"(very quietly) Yes. That is precisely the problem."
He looks at the fire. You look at the fire. The stars continue. Somewhere beyond the wall, Fang is sharpening a blade that does not need sharpening. She clocked the shift in the silence the moment it changed. She has decided not to name what she thinks about it. Not yet.

+ [Approach the Flaming Mountains.] -> act6_flamingmountains

=== act7_almas_fight ===
~ stag = stag + 1
~ end = end - 1
~ xp = xp + 15

They fight like something that doesn't want to hurt you but has no other language for "please leave." It costs you more than it should.

+ [Continue deeper.] -> act7_level4

=== act7_almas_negotiate ===
~ marcus = marcus + 1
~ almasNegotiated = true
~ xp = xp + 25

Marcus does something you have never seen him do. He makes himself smaller.

Not physically. He is still the broadest person in the chamber. But the senatorial bearing, the posture that addressed the Roman Senate and the Senate listened, the carriage of a man who has advised emperors, all of it folds inward. His shoulders round. His chin lowers. He brings his center of gravity down until he is standing the way the Almas stand: weight forward, head below the shoulder line, hands visible and open. He is not mimicking them. He is showing them, in the only language that predates all language, that he is not above them.

The largest Almas watches this. Its head tilts. A low vocalization, different from the alarm call. Questioning.

Marcus answers. Not in words. He presses both palms flat on the cave floor. Holds them there. The same gesture he uses in bear form to read terrain, except here it means something else. He is offering the Almas proof that he is in contact with the same ground they stand on. Same stone. Same foundation. Whatever boundary they are defending, he is acknowledging it exists before asking them to adjust it.

The Almas leader steps forward. Slowly. It places one massive hand on the stone beside Marcus's. Not touching him. Beside him. A parallel gesture. Two beings establishing that they share a surface.

A silence. Not the awkward silence of a stalled negotiation. The working silence of two parties who have agreed on the first term and are preparing to discuss the second.

Marcus raises his head. Makes eye contact. Among primates, direct eye contact is either a challenge or an invitation. The difference is in the jaw. Marcus keeps his jaw soft. Open. Not baring teeth. Not clenching. The Almas leader reads this. Its own jaw relaxes by a fraction.

# speaker: Fang
"(barely breathing, to you) I've seen him negotiate trade agreements, territorial disputes, and one very memorable argument about cheese. I have never seen him do this."
Marcus begins to vocalize. Low, from the chest, not the throat. The sound is not a word in any human language. It is closer to the resonance the Almas themselves produce: a vibration that travels through the stone floor as much as through the air. He is not speaking their language. He is speaking in the register their language occupies, and he is saying, through pitch and duration and the specific pattern of pauses between sounds: we are passing through. We mean no harm to your boundary. The disruption that unsettled your home is what we have come to repair.

The Almas leader responds. Longer. More complex. Marcus listens with his whole body. His palms are still on the stone. He is reading the vibration of the Almas's vocalization through the cave floor simultaneously with hearing it. Two channels of the same message. When the leader finishes, Marcus shifts his weight. A small adjustment, angling his body to create an opening, a gap in his silhouette that points deeper into the cave. We need to go that way. May we?

The leader looks at the gap Marcus created. Looks at the passage behind it. Looks at the wolf puppy in Fang's sling.

The puppy sits very still. It has been still since the Almas appeared. Not frozen. Attentive. It looks at the Almas leader with a focus that has nothing to do with being a puppy and everything to do with the old magic it carries. The Almas recognize this. Whatever the puppy is, it is something they have encountered before, in a time none of them can remember clearly but all of them feel.

The leader makes a sound. Short. Definitive. It steps aside. The others follow. Not retreating. Repositioning. They form a corridor, bodies angled to create a passage through their territory. The boundary is not gone. It has been temporarily revised to include you.

Marcus stands. The senatorial bearing returns, but differently. Not as performance. As gratitude. He inclines his head to the leader. Not a bow. An acknowledgment between equals. The leader mirrors it, approximately. Close enough.

# speaker: Marcus
"(to you, very quietly, as you pass through) Eighteen hundred years. I have negotiated with emperors, warlords, merchant princes, and a Pope who was considerably less reasonable than he appeared. That was the most honest negotiation I have ever conducted."
# speaker: Fang
"What did you say to them?"
# speaker: Marcus
"I said we share a floor. Everything else followed from that."
They part. Not with trust. With assessment. They have decided you are not the thing that broke their boundary. Marcus carries the weight of their decision the way he carries everything: with the quiet awareness that permission, properly earned, is the heaviest thing a diplomat can hold.

+ [Continue deeper.] -> act7_level4

=== act7_kiraapproach ===
// 📍 The Foundation Chamber · Stone's Prison · Bottom Level
The Foundation Chamber

The Foundation Chamber is not a cave. It is a room someone built. The walls are carved sandstone, worked by hands, smoothed by centuries of attention. Every surface carries chisel marks in regular intervals -- not decorative. Structural calculations written in stone the way a master builder leaves notes in their own work. Load estimates. Tensile ratios. The math of permanence.

The Binding Frame sits at the center. Unlike the Tribunal's submerged iron cage or the Observatory's astrolabe cradle, this one is architectural. Stone arches forming a geometric container. Stone's domain is not held by force. It is held by design.

The weight in the room is not emotional. It is literal. Each step costs more than the one before it. Your boots press deeper into the stone floor than physics explains. The air is not thin. It is dense.

# speaker: Fang
"(quietly) You feel that?"
# speaker: Marcus
"The stone is leaning on everything equally. It does not distinguish."
# speaker: Lawrence
"(through his teeth) Yes. She is here."
His hand presses flat against his sternum -- the broken ribs, or something the weight found before his mind did. He does not perform it. He does not register he's doing it.
Kira is standing at the far end of the chamber. She is not aggressive. She is not threatening. She is standing between the party and the Binding Frame the way a load-bearing wall stands between a room and collapse: not because it wants to, but because that is what it is now.

She watches you cross toward her. She does not reach for a weapon. She waits.

+ [Approach together.] -> act7_kirastrike1

=== act7_kirastrike1 ===
~ kiraApproach = 1
// 📍 The Foundation Chamber · First Approach
Strike One: Pressure

The party advances as a unit. It is the right instinct. It is the wrong approach.

# speaker: Fang
"Kira. We know what happened. We know about the bridge. We know what it cost you. We are not here to minimize it. But Stone needs to be free."
Kira watches her come. When she answers, her voice is level. Not cold. Level.

# speaker: Kira
"You know what happened. You know facts. You read a ledger, talked to Tariq, and found Batu. I am glad he is still alive. You do not know what happened."
Marcus takes a step forward. His senatorial register is fully deployed -- the gravity he uses when he needs something to land.

# speaker: Marcus
"Death's offer is not liberation. What it calls mercy is a permanent condition in exchange for a temporary pain. You are a builder. You understand load-bearing structures. What Death built here is a load-bearing lie."
It is an excellent argument. Architecturally precise. Intellectually airtight. The kind of thing an eighteen-hundred-year-old Roman senator delivers when he is, with complete genuine sincerity, trying his absolute best.

The weight in the room increases.

Your footing shifts. Fang catches herself on Lawrence's arm, which costs them both more than they show. Marcus absorbs it on all fours -- this is not a space built for bears, or empires.

# speaker: Kira
"Your argument is correct. Correct and helpful are not the same thing. You of all people should know that by now."
# speaker: Fang
"(under her breath) She's got us there."
# speaker: Lawrence
"(also under his breath) Extraordinarily unhelpful observation, Fang."
# speaker: Fang
"I thought we were being honest."
# speaker: Lawrence
"We are taking turns being honest and I was not finished."
+ [Try again.] -> act7_kirastrike2

=== act7_kirastrike2 ===
~ kiraApproach = 2
// 📍 The Foundation Chamber · Second Approach
Strike Two: Evidence

# speaker: Fang
"Let me try something."
# speaker: Lawrence
"(gesturing) By all means."
# speaker: Fang
"Was that sarcastic?"
# speaker: Lawrence
"I have cracked ribs and we have been underground for three days. Interpret it however helps you most."
Fang approaches along the left wall, where the chisel marks are oldest. She reads them as she walks. Her face changes slightly.

# speaker: Fang
"These calculations on the east wall. She ran them twice. Same sequence, different variables. She was checking her own work."
Kira watches her. Something in her posture changes. Not softening. Recognizing.

# speaker: Fang
"(stopping, not looking at Kira) I have never built a bridge. I know how to take them apart. I know the difference between a structure that failed and a structure that held as long as it could. The marks on this wall are from someone who held as long as they could. The bridge was the same."
The weight does not increase. This is meaningful. The approach has found the edge of something real. But it does not lift.

# speaker: Kira
"(very quietly) It was supposed to last eight hundred years. I was two months east. I heard second-hand."
# speaker: Fang
"I know."
# speaker: Kira
"Do you? Then tell me what that means. Not the facts. What it means."
Fang opens her mouth. Closes it. The thing she would have said is true and accurate and not the answer to the question that was asked.
# speaker: Marcus
"(from across the room, almost to himself) It means you built it for the people who would cross it and never know your name."
Everyone goes quiet. Including Marcus, who appears slightly surprised by himself.

# speaker: Kira
"(long pause) Yes."
Not concession. Confirmation. The wound, named correctly for the first time. The floor under your feet stops pressing. The weight holds but no longer advances.

+ [One more approach.] -> act7_kirastrike3

=== act7_kirastrike3 ===
~ kiraApproach = 3
// 📍 The Foundation Chamber · Third Approach
Strike Three: The Wrong Kind of Right

Lawrence moves forward now. Not because it is his turn or anyone asked. Because both best diplomatic minds in the party have found the shape of the wound and neither one could reach inside it.

# speaker: Lawrence
"You know what Death offered you is not peace. You said so. You have been standing in this room for eight months with a Guardian and a grief and a certainty that neither can be released without the other. I understand that. I have held things that could not be released for reasons I could not articulate for longer than you have been alive."
Kira watches him. She is listening.

# speaker: Lawrence
"I am going to tell you something I have not said out loud in several centuries. I am saying it only because we are all going to run out of time in approximately the next four minutes if you do not choose."
A beat. Two beats. The stone ground tone holds.

# speaker: Lawrence
"Things end. The people who loved them do not have to."
His hand goes flat against his sternum, once.
# speaker: Kira
"(looking at him) You are not talking about a bridge."
# speaker: Lawrence
"(after a long pause) No. Not entirely."
The weight becomes symmetrical. The stone floor, the stone walls, the stone arches of the Binding Frame -- all of it exhales slightly and holds. Like a structure that has located its load-bearing point and settled around it.

Kira does not move.

She is not going to move. Not for Lawrence, not for any of them. Not for an argument, not for evidence, not for honesty that rhymes with her wound but is not her wound.

# speaker: Fang
"(very quietly, to nobody) We can't reach it."
# speaker: Marcus
"Not from here. Not with all four of us."
# speaker: Fang
"What does that mean?"
Marcus looks at you.
+ [The party steps back. You go forward.] -> act7_kiracollectivenorecovery
+ [Push through together.] -> act7_kiraforcedfracture

=== act7_kiracollectivenorecovery ===
~ noRecoveryKira = true
~ xp = xp + 60
// 📍 The Foundation Chamber · Collective No Recovery
No Recovery -- Collective

The three immortals exchange something without words. Two hundred years of Fang. Eighteen hundred years of Marcus. A thousand years of Lawrence. Combined, longer than any bridge was built to last. None of it is enough to reach what is in this room from the outside.

Fang steps back first. She looks at you and says nothing. She does not need to. Her face says: this part is yours.

Marcus steps back second. The senatorial bearing drops -- not to the bear register. To something older than either. The look he has when he has stopped performing diplomat and started being, simply, a very old person who has loved things that ended. He stays at the far wall and does not look away.

Lawrence is last.

# speaker: Lawrence
"(to you, low, Kira cannot hear) She will not break for us. We are the wrong shape. We tried what we could reach."
He does not say: be careful. He does not say: I trust you. He steps back. His hand does not go to his sternum this time. He holds it still at his side. Which is its own thing.

You are alone in the center of the Foundation Chamber. HP at 25%. Your party is at the walls. Kira is watching you cross toward her.

You cross anyway.

+ [Reach her.] -> act7_kira

=== act7_kiraforcedfracture ===
~ kiraFracture = true
~ xp = xp + 15
// 📍 The Foundation Chamber · Weight Fracture
The Stone Pushes Back

The weight doubles.

Not as punishment. As information. The Stone magic does not care about intention or effort or how many times you have been right about other things. It responds to a party pushing past its limit the way a load-bearing wall responds to weight it was not designed to hold: not with malice, but with physics.

# speaker: Fang
"(through clenched teeth) This is not working."
# speaker: Lawrence
"(equally strained) Noted."
# speaker: Marcus
"(flat on the floor, all fours, unable to advance) I would like to formally register that I have negotiated with emperors. This is worse than a Pope."
Kira watches the party fail to cross the room. She does not look satisfied. She does not look victorious. She looks like someone watching rain: witnessing an outcome she knew was coming without any pleasure in being right.

# speaker: Kira
"You are not wrong. You are just not the answer to this question."
# speaker: Fang
"(making the call) Everyone. Back."
The three immortals retreat to the walls. They leave the center of the room open. They leave it for you.

+ [Walk forward. Alone.] -> act7_kira

=== act7_kira ===
// 📍 The Foundation Chamber · The Conversation
Kira

You stop three feet from her. She does not step back. She watches you arrive and waits until you have caught your breath. She gives you time to catch your breath. That is the first thing she has given anyone in eight months.

# speaker: Kira
"I built a bridge that lasted three hundred years. I calculated it to last eight hundred. The flood that took it was not in any design parameter. I was two months east when it happened. I heard second-hand."
The three immortals are at the walls. They are not helping. This is the correct shape.

# speaker: Kira
"(not accusing) You crossed the room alone. You are half-broken. You came anyway."
She is not asking why. She already knows why. She is naming it so you both know she sees it.

# speaker: Kira
"That is what I did. Every day for eight months. I came to this room knowing it would not fix anything. I came anyway."
The weight in the room shifts. Not lifting. Redistributing. Like a structure that has found a counterbalance it did not know was available.

{marcus >= 3 && batuMet:
    + [Marcus: Recognition.] -> act7_kira_marcus
}
{fang >= 3 && tariqLedger:
    + [Fang: The Letter.] -> act7_kira_fang
}
+ [You: Name the fear.] -> act7_kira_player

=== act7_kira_fang ===
~ kiraBound = "fang"
~ fang = fang + 1
~ xp = xp + 50

Fang crosses from the wall to your side. She does not ask permission to stand there. She draws the Samarkand off-hand blade -- the one Nadia repaired -- and unwraps the hilt cloth. The letter is inside. Eight hundred miles from Samarkand. She holds it out.

Not to Kira. To you. She lets you deliver it.

# speaker: Fang
"(quietly, to you only) From Nadia. Batu was right about what she wrote. Give it to her."
You extend the letter. Kira takes it with both hands. She reads it. The room is very still while she reads.

When she finishes, she holds it against her chest -- the same unconscious gesture Lawrence made in the Weight Room, the same gesture a hand makes when it is holding something it does not want to put down.

# speaker: Kira
"She says the bridge held for three hundred years. That everything I build is honest."
# speaker: Fang
"It is never enough, when you lose something you thought was permanent. I know. But keeping Stone locked up doesn't fix the bridge. It just makes sure nothing new gets built."
# speaker: Kira
"How long have you been carrying this letter?"
# speaker: Fang
"Since Samarkand."
# speaker: Kira
"Through everything."
# speaker: Fang
"In the blade. It felt right to keep it in the blade."
Something in Kira's posture that has been load-bearing for eight months redistributes.

The most emotionally generous path in the game.

+ [Stone is freed.] -> act7_stonefreed

=== act7_kira_marcus ===
~ kiraBound = "marcus"
~ marcus = marcus + 1
~ xp = xp + 50

Marcus has not moved from the wall. He calls across the room. Not loudly. The stone carries it.

# speaker: Marcus
"I calculated the eastern caravanserai pillar wrong the first time. You corrected it. Silently."
Kira turns to look at him. The first time she has taken her eyes off you since you entered the room.

# speaker: Kira
"Because I trusted your intent. Not your precision. The precision I could fix. The intent... that was real."
# speaker: Marcus
"The bridge's intent was real. Everything you built it as was real. The flood was a flood. It was not a verdict."
A long silence. The stone floor under your feet stops pressing.

# speaker: Kira
"(very quiet) It felt like one."
# speaker: Marcus
"Yes. It would."
He does not say: but it wasn't. He has learned, in eighteen hundred years, that some things are true and do not need to be said after the right word is already in the room.

The stone shifts. Not breaks. Shifts. The Binding Frame's arches recalibrate.

+ [Stone is freed.] -> act7_stonefreed

=== act7_kira_player ===
~ kiraBound = "player"
~ xp = xp + 50
~ commitment = commitment + 1

You have nothing she hasn't heard. No evidence, no letter, no centuries of credential. You have the fact that you are standing three feet from her at low HP after crossing a room that has been pressing you through the floor for the last twenty minutes.

You have that. It turns out to be enough.

{avatarName}: "If permanence doesn't exist, does that mean nothing given in love meant anything?"
Kira is quiet. She is looking at you the way she looked at the chisel marks on the wall: taking inventory.

{avatarName}: "It meant something. It always meant something. Not because it lasted. Because you built it as if it would."
The weight in the room releases. Not all at once. One increment at a time, and then all at once at the end. The Stone magic redistributes. The floor stops pressing. The walls go still. The Binding Frame's arches readjust around a load that is no longer present.

Kira sits against the wall behind her. Not collapsing. Choosing to sit down, which is its own kind of structural decision.

# speaker: Kira
"(after a long time) Yes. That is what it means."
The act of commitment that frees Stone is itself commitment.

+ [Stone is freed.] -> act7_stonefreed

=== act7_tigerambush ===
// 📍 Mutou Valley · The Crossing · Midday Sun
The Valley Is Not Empty

The path from Batu's dwelling to the cave entrance crosses a half-mile of open valley. Scrub grass. Dry riverbed. The Flaming Mountains on both sides, radiating heat that makes the air ripple. It looks empty. It sounds empty.

Marcus stops walking. His ears flatten. His nose lifts. He does not say anything. He presses one paw to the ground and holds it there for four seconds.

# speaker: Marcus
"(very low, very still) Nobody move."
# speaker: Fang
"What is it?"
# speaker: Marcus
"Four heartbeats in the scrub. Twenty paces, nine o'clock. They have been tracking us since Batu's. They let us walk into the open before announcing themselves, which means they are not animals. They are tacticians."
The scrub grass does not move. The valley does not change. Nothing happens for ten seconds that feel like a minute.

Then the silence arrives.

Not quiet. Silence. Active, pressing, magical silence that swallows the ambient hum of the valley, the crunch of gravel, the sound of your own breathing. It descends like a blanket thrown over the world. Your ears pop. You open your mouth and no sound comes out. Fang draws both blades and the steel makes no ring. Lawrence starts a suppression spell and the words dissolve before they form.

The mother tiger walks out of the scrub.

She is enormous. Not Flaming Mountain large, but wrong-large. Stone's disruption has done something to the predators in this valley: sharpened instead of dulled. Where the road forgot its connections and the bridge forgot its permanence, the tigers remembered what they were for. They are more precise than any natural predator has a right to be. The mother moves with zero wasted motion. Each paw placement is calculated. Her eyes do not scan. They are already fixed on the exact center of your group, the geometric weak point between four bodies.

She is teaching. The three cubs behind her, nearly grown, each the size of a large dog, are watching their mother's approach the way students watch a master demonstrate. This is a lesson. You are the lesson.

# speaker: Fang
"(mouthing the words, no sound in the silence field) She's got cubs."
The first cub attacks from the left.

You don't hear it. That is the point. The silence field is the mother's magic, and the cubs have learned to use it. The cub covers ten paces without a single vibration reaching Marcus's paws. It hits Fang's blind side, the off-hand she's been favoring since the desert. Fang spins, catches the cub on her long blade, and redirects. The cub tumbles, rolls, and is back on its feet before Fang finishes the stroke. Fast. Learning. It tested her weak side on the first attack. It was told to.

The second cub comes from behind. It targets Lawrence. Not with claws. With a roar that shouldn't be possible in a silence field but is: a directed burst of sonic force that operates inside the silence the way a current operates inside still water. The roar hits Lawrence in the chest and staggers him backward. His suppression magic, already fighting the silence field, flickers and dies. For the first time since you've known him, Lawrence is fighting without magic.

# speaker: Lawrence
"(drawing his sword, an event so rare that Fang's head turns) Well. This is humbling."
The third cub does not attack. It circles. It is the watcher. The one the mother positioned to observe how the party responds to the first two, to learn the formation, to identify the pattern, and then to exploit the gap the other two created. This is not instinct. This is curriculum.

Marcus charges the mother. Bear against tiger, mass against precision. The mother sidesteps him with a dexterity that eight hundred pounds of Roman bear cannot match. She does not counterattack. She intimidates. A low growl that is not sound but pressure, a vibration that travels through the ground and up through Marcus's paws and tells his body, at a level below conscious thought, that the thing in front of him is more dangerous than he calculated.

Marcus hesitates. For the first time in the game, Marcus hesitates. The mother used his own sensory system against him: a bear who reads through vibration just received a message, through vibration, that said you are not the apex predator here.

# speaker: Fang
"(fighting the first cub, which has come back faster and from a different angle) She's running a school. We're the practice dummy. I would be impressed if I weren't bleeding."
Lawrence fights without magic. His swordwork is clean, economical, and visibly different from his usual style. Without suppression fields and mind lances, he is a man with a blade, and the blade is good, and it is not enough. The second cub's roar comes again, shorter, more precise. Lawrence braces for it this time. It still staggers him. But he stays upright.

# speaker: Lawrence
"(between parries) The silence field is hers. The cubs are using it as cover. If we break the field, we break their coordination."
# speaker: Fang
"Great. How?"
# speaker: Lawrence
"I have no idea. My magic is gone. Suggestions welcome."
The wolf puppy barks.

In the silence field, the bark should make no sound. It does. A single, clear note that cuts through the magical silence the way the puppy cut through every other magical boundary it has encountered: by not acknowledging that the boundary exists. The silence field fractures around the sound. Cracks spread from the point of the bark outward, and for two seconds, the valley has sound again.

Marcus uses those two seconds. He roars. Not the intimidation roar the mother used. A territorial roar, low and sustained, that travels through the ground and through the air simultaneously, filling the cracks the puppy made. The silence field shatters. Sound returns like a held breath released.

The cubs scatter. Without the silence field, they are visible, audible, trackable. They are still dangerous. They are no longer invisible.

The mother does not scatter. She stands her ground and looks at Marcus. Two apex predators, reassessing. The intimidation magic rolls off her in waves. Marcus absorbs it. His paws are flat on the ground. He is reading her heartbeat through the stone. She is reading his mass through the vibration of his roar. They are having a conversation that has nothing to do with fighting and everything to do with territory.

# speaker: Marcus
"(to the mother, in a register below human hearing, felt more than heard) We are passing through. We are not staying. Your valley remains yours."
The mother holds his gaze for five seconds. Then she turns. Not retreating. Withdrawing. She calls the cubs with a chuff that carries authority no roar could match. They come. All three. Immediately. Whatever the lesson was, it is over. The practice dummies survived, and that data is apparently sufficient.

The cubs follow their mother into the scrub. The third one, the watcher, looks back once. It looks at you. Not at Marcus, not at Lawrence, not at Fang. At you. It has identified you as the one who did not fight. It files this information with the same precision its mother files everything.

# speaker: Fang
"(sheathing, checking the off-hand wound) That tiger had a lesson plan. An actual lesson plan. She positioned the cubs for a three-stage attack pattern, used a silence field as tactical cover, and deployed intimidation magic on the biggest threat first. I've fought with mercenary captains who couldn't coordinate that well."
# speaker: Lawrence
"(examining his sword as if seeing it for the first time in centuries) Stone's disruption sharpened them. The road forgot what it was for. The tigers remembered."
# speaker: Marcus
"(quietly) She was not trying to kill us. She was trying to teach her children what a threat looks like so they would survive the next one. We were the curriculum."
A pause. Fang looks at the scrub where the tigers disappeared.

# speaker: Fang
"...Respect."
~ dex = dex + 1
~ xp = xp + 20

+ [Enter the Thousand Caves.] -> act7_level1

=== act7_level1 ===
// ═══ ACT 7: THE THOUSAND CAVESBezeklik · Mutou Valley · What You Built When You Thought Nothing Could Break It ═══
// 📍 Level 1 · The Painted Grottos
The cave mouth swallows sound. One step inside and the desert disappears: the heat, the wind, the horizon. Replaced by cool air that smells of wet stone and centuries. Your eyes adjust. The walls resolve.

Fourteen centuries of Silk Road art. Buddhist figures beside Nestorian crosses beside Zoroastrian fire symbols beside Manichaean light-and-dark panels. Syncretism made literal: every faith that traveled this road left something on these walls, and none of them asked the others to leave. The paintings shift. Not moving, exactly, but the eye is drawn deeper. Toward the heart of the mountain. The art is showing you where to go.

Fang runs her fingers along a painted caravan. The pigment is still bright after twelve hundred years. "Whoever made this expected it to last," she says. Nobody responds. The statement sits in the cave air and gains weight.

Lawrence walks beside you. Underground, the distance between you has contracted again. In the narrow passages, shoulders brush. He does not apologize. You do not move away. The geography of caves makes proximity inevitable, and you are both aware that neither of you is fighting the geography.

Marcus, in bear form, fills the passages in a way that is structurally concerning. His fur brushes both walls. He does not complain. His nose is working: reading the cave the way he reads every terrain, cataloguing moisture, age, threat.

No combat here. Only observation. The dungeon that rewards patience.

+ [Descend to the Almas chambers.] -> act7_level2

=== act7_level2 ===
// 📍 Level 2 · The Almas Chambers
The Almas

You hear them before you see them. A low vocalization that resonates in the chest, not the ears. Then shapes in the dark: broad, low, covered in coarse hair that catches the bioluminescence of cave lichen. Ancient hominins. Not monsters, not aggressive. Very old and very alarmed. Stone's disruption has destabilized their sense of boundary, and four strangers just walked into their home.

The largest one steps forward. It is taller than Marcus in human form and broader than Marcus in bear form, which is saying something that Marcus would probably find diplomatically concerning.

Marcus shifts. The transformation echoes in the cave. When he stands as a man, the Almas react: a low sound, not hostile, but assessing. The wolf puppy, in Fang's sling, goes very still. It does not hide. It looks at the Almas with a focus that is older than its body.

The Almas look at the puppy. Something passes between them. Recognition of a kind of magic that predates language.

+ [Negotiate. Let Marcus speak.] -> act7_almas_negotiate
+ [Fight through. They won't move.] -> act7_almas_fight

=== act7_level4 ===
~ flow = flow + 1
// 📍 Level 4 · The Spider Galleries
The gallery opens and something in your body says no.

Spiders. The size of shields. Everywhere. The walls are covered in webs so dense they look structural, and they are structural: the spiders have adapted to Stone's absence and are doing Stone's work, webbing support where the rock has forgotten its own shape. They are the architecture now. The cave would collapse without them.

You know this. You understand this. Your body does not care. Your skin crawls. Your breathing shortens. Every shadow in your peripheral vision is legs. You stop walking.

# speaker: Fang
"(noticing immediately) Hey. You okay?"
{lawrence >= 4:
    Lawrence is beside you before you answer. Not performing concern. Reading the specific frequency of someone whose fear is irrational and who knows it is irrational and who cannot make that knowledge matter. His hand finds the small of your back. Light. Grounding. Asking nothing.

    # speaker: Lawrence
    "(low, only for you) They are not interested in us. Focus on my voice. We walk through. Sixty paces."
    You walk through. His hand stays at your back the entire time. Sixty paces. You count every one. The spiders move around you without curiosity. They are busy. They have a cave to hold together.
- else:
    {avatarName}: "I'm fine. Just... give me a second."
    You are not fine. But you walk. The spiders move around you without curiosity. They are busy. They have a cave to hold together.
}

{flow >= 3:
    ~ spiderWebReader = true
    Once through the worst of it, you notice: the webs form readable patterns. You can see the dungeon's structure in them. Shortcuts, weaknesses, Kira's location. The spiders have been mapping for you.

}

~ spiderFear = true

+ [Descend to the Weight Room.] -> act7_level5

=== act7_level5 ===
// 📍 Level 5 · The Weight Room · Mandatory Rest
Rest

No fire. Carbon risk in deep cave. Cold rations eaten in darkness cut only by bioluminescent lichen that gives everything a blue-green pallor. The puppy settles against Fang's side without being asked. It has not made a sound since the Spider Galleries.

Fang has placed herself closer to the passage entry than the rest of the party. Not dramatically. Three feet, maybe four, between her and the group. She has not acknowledged this. Her commentary, already sparse since the Spider Galleries, runs slightly faster than the road version: shorter gaps, less silence between words. On the road, Fang owns silence. Down here, she fills it.

The Weight Room earned its name. Kira identified it when she surveyed the Flaming Mountains. She calculated the precise tonnage pressing down on this room and carved the number into the wall. You find it by the entrance: 4.7 million metric tonnes. Below the number, in smaller script: This is what commitment looks like from underneath.

The ceiling is low enough to feel. The stone presses down with the accumulated mass of everything above it: mountain, desert, sky. You are further underground than you have ever been. The silence has texture. You can feel your own heartbeat in your teeth.

You have managed every room you have ever entered. You read the space, found the exit, identified the leverage points, positioned accordingly. This room does not have leverage points. The weight is the leverage point. It has been here for three million years and it does not require your input.

Lawrence sits against the far wall. Moonlight falls across his shoulders. There is no moon down here. There is no opening in the rock above him. The light has no source and no reason to be here and it is resting on him as if it has been looking for him for a very long time.

Fang sees it. She says nothing. She adds it to the list of things she carries without explaining.

You sit near Lawrence. Not against him. Near. The distance that has existed since the kiss: close enough to feel, far enough to choose. In the dark, your hand rests on the stone between you. His hand rests on the stone between you. The gap is the width of a breath.

# speaker: Fang
"Lawrence. Has it ever bothered you, being the thing that shows up after everyone else has been waiting that long?"
Lawrence turns. This surprises her.

# speaker: Lawrence
"Yes."
The most honest answer he has given Fang in forty years. One syllable that costs more than anything he said at Gaochang, more than the kiss, more than the question in the desert. Because this was for Fang, not for you, and the honesty was not strategic.

Fang looks at him for a long time. Then she nods. Once. The kind of nod that closes a forty-year conversation.

Lawrence looks away. Fang watches him look away. Then she stands, crosses the Weight Room, and sits down beside you. Not beside Lawrence. Beside you. The positioning is deliberate. She has something to say and she has decided it is for you.

# speaker: Fang
"(low, so Lawrence can hear if he wants to, which means she wants him to hear) I need to tell you something. And I need you to understand I'm not saying it to be cruel."
You wait.

# speaker: Fang
"I have known Lawrence for two hundred and forty years. I have watched him do what he's doing with you. Not once. Not twice. I stopped counting around the sixth century because the number was making me angry and the anger was making me unfair."
The cave is very quiet. Lawrence does not move.

# speaker: Fang
"He is very good at the part he's in right now. The attention. The proximity. The way he makes you feel like you're the only real thing in the room. That part is not a lie. He means it while he's doing it. That's what makes it worse."
She pauses. This is costing her something.

# speaker: Fang
"What comes after is the part I need you to know about. After the closeness, he withdraws. Cleanly. Precisely. Not cruelly. Worse than cruelly. He withdraws the way someone turns off a light. One moment the warmth is there. The next it's not, and you're standing in the dark trying to remember if you imagined it."
# speaker: Fang
"I was on the receiving end of that. Once. A long time ago. I survived it. But I knew what I was getting into. You don't. And I would rather you hear it from me now than learn it from him later."
A silence. The Weight Room presses down.

{avatarName}: "Why are you telling me this?"
# speaker: Fang
"Because you're the first person in two hundred years I've liked enough to warn."
She stands. Returns to her side of the room. The puppy adjusts against her leg.

# speaker: Fang
"(over her shoulder) For what it's worth, the 'yes' just now was real. I know what his real sounds like. That was it. Maybe something's different this time. I don't know."
She does not say: I hope so. But the shape of the sentence leaves a space where those words would fit.

Lawrence heard everything. He did not interrupt. He did not defend. He did not perform hurt or contrition. He sat against the wall with impossible moonlight on his shoulders and let Fang say the truest thing anyone has said about him in a thousand years.

In the dark, his hand moves half an inch closer to yours on the stone. You feel it. He does not close the gap. He just made it smaller.

You understand the gesture differently now. It is not a man closing distance. It is a man who just heard himself described accurately and is choosing, despite the description, to stay.

+ [Ask about forty years ago.] -> act7_rest_jiwon
+ [Ask Lawrence if he's all right.] -> act7_rest_lawrence
+ [Rest without pushing.] -> act7_rest_quiet

=== act7_level6 ===
~ xp = xp + 30
// 📍 Level 6 · The Fossil Chamber
Spinosaurus Mirabilis

The chamber opens into a cathedral of stone. The ceiling disappears into darkness. The floor is different here: not cave rock but compressed sediment, layered, ancient, the geological record of a world that existed three million years before anyone thought to name it.

The fossil is embedded in the far wall. Partially. The rest of it is standing.

Three million years old. Stone's domain preserved it in perfect mineral stasis. Stone's disruption woke it. Not alive, not dead, not undead. Something else entirely: a memory of a body, given structure by the same force that holds mountains together, animated by the absence of the thing that was supposed to keep it still. It is seventeen meters of calcified predator, and it is looking at you without eyes, tracking by sound and heat and the vibration of four heartbeats on the chamber floor.

# speaker: Marcus
"(paw flat, reading, voice barely above a whisper) It does not see. It listens. Through the floor. Every footstep is a signal. Every heartbeat is a location. Do not run."
Nobody runs.

The Spinosaurus moves. Not the way animals move. The way geology moves: slowly, inevitably, with the grinding patience of tectonic plates. Its jaw opens. No sound. The jaw is lined with mineralized teeth the length of your forearm. It exhales. The exhale carries dust that has been inside it for three million years. The dust settles on your skin and your skin knows it is very, very old.

# speaker: Fang
"(two blades drawn, stance wide, whispering) How do we kill something that's already dead?"
# speaker: Lawrence
"We don't. We break its structural coherence. It's held together by Stone's residual energy. Disrupt the energy, the fossil returns to the wall."
# speaker: Fang
"And how do we disrupt Stone's energy?"
# speaker: Lawrence
"I have no idea. I have never fought a fossil."
# speaker: Fang
"Wonderful first time for everything."
The Spinosaurus charges. Seventeen meters of mineral bone covering the distance between the far wall and your party in four strides. The floor cracks under each footfall. Marcus reads the compression wave and calls the direction: "LEFT." Everyone dives left. The fossil's jaw closes on the space you occupied half a second ago. The snap echoes for four seconds.

The first problem: you cannot be quiet. The chamber amplifies everything. Every breath, every footstep, every heartbeat bounces off the stone walls and returns as a targeting signal. The Spinosaurus does not need to find you. The cave is telling it where you are.

Fang attacks first. Both blades, running in from the flank, striking at the joint where the fossil's forelimb connects to the shoulder. The Samarkand blade rings off mineralized bone and bounces. No damage. The fossilized calcium is harder than steel. Fang's hands go numb from the impact.

# speaker: Fang
"(shaking her hands) My blades bounced off it. Off a skeleton. I have cut through castle gates."
Lawrence fires a mind lance at the skull. The suppression magic connects, wraps around the mineral surface, and slides off. Stone's energy is not magical in the way Lawrence's magic is magical. It is older. It does not recognize his authority. His thousand years of combat experience just met something that has been standing still for three million.

# speaker: Lawrence
"Magic is ineffective. The mineral structure doesn't register it as a threat."
Marcus charges the fossil's flank. Eight hundred pounds of bear hitting mineralized bone at full speed. The impact shakes the chamber. Stalactites crack overhead. The fossil staggers. One step. Then corrects. Marcus bounces off and hits the chamber wall hard enough to leave a bear-shaped impression in the sediment.

# speaker: Marcus
"(pulling himself out of the wall, winded) Mass works. Slightly. The mineral structure responds to physical force. But I would need to hit it roughly forty more times to achieve meaningful structural compromise, and I do not believe my skeleton will outlast its skeleton."
The second problem: the fossil learns. After Fang's flank attack, it adjusts its stance to protect the joints. After Lawrence's mind lance, it angles its skull away from his casting position. After Marcus's charge, it plants its rear legs wider for stability. Three attacks, three adaptations. Three million years of compressed predatory intelligence, running on Stone's residual logic. It is not smart. It is something worse: it is patient and structural and it remembers everything.

The Spinosaurus sweeps its tail. The tail is six meters of mineralized vertebrae moving at a speed that should not be possible for something made of rock. It catches Lawrence across the torso. He goes airborne. Hits the far wall. Slides down. Does not get up immediately.

# speaker: Fang
"Lawrence!"
He gets up. Slowly. Something in his ribs is wrong. He does not acknowledge it. He readjusts his grip on the sword and walks back toward the fight. His posture is precise even now, which tells you exactly how much pain he is in: the precision is the mask.

# speaker: Lawrence
"(blood on his lip, very calm) The joints. Fang was right. The mineral is hardest where the bone is solid. The joints are where the calcium never fully replaced the cartilage. That's the vulnerability. Three million years of preservation and the weak point is the same as any living skeleton: where things connect."
# speaker: Fang
"So we go for the knees."
# speaker: Lawrence
"We go for everything that bends."
The party reorganizes. This is the coordination mechanic the entire dungeon has been building toward. Marcus reads the fossil's movement through the floor: compression patterns, weight shifts, the microsecond delay between when it decides to move and when the floor registers the decision. He calls positions. Not words. Sounds. The same low register he used with the Almas, adapted for combat. One sound for left. One for right. One for down.

Fang adapts her combat for the first time since the desert. She stops trying to cut through the mineral and starts targeting the joints exclusively. Her Florentine geometry becomes something new: both blades used as wedges, driven into the gaps between fossilized bones and twisted. The Samarkand blade bites into the hip joint. Fang throws her weight behind it. Something inside the fossil cracks. Not breaks. Cracks. The sound is three million years old and it is very loud.

Lawrence fights without magic, with broken ribs, with a sword he has not drawn in centuries, and he is magnificent. His footwork is precise because it has to be: every misplaced step is a targeting signal. He moves in the fossil's blind spots, which are thermal blind spots, which means he is fighting cold. His vampire physiology, which runs cold, is for once an advantage. The fossil cannot track what it cannot heat-map. He drives his blade into the knee joint and levers. The knee buckles. The Spinosaurus drops to one side.

Marcus does not charge again. He has learned from the first attempt. Instead he reads the fossil's shifted weight through the floor and calls the new center of gravity. When Fang and Lawrence drive it off balance, Marcus is waiting at the precise point where the fossil will fall. He catches the skull as it comes down. Not with his jaw. With his front paws, braced against the chamber floor, absorbing the impact the way he has absorbed everything this journey: with the quiet awareness that holding is sometimes more effective than striking.

He holds the skull pinned. The fossil thrashes. Marcus holds. His claws score grooves in three-million-year-old mineral. His muscles shake. The floor beneath his paws cracks.

# speaker: Marcus
"(through the effort of holding, barely audible) NOW."
Fang and Lawrence hit the spine simultaneously. Both sides. The point where the fossil's structural coherence converges, the geological equivalent of the Weight Room: where everything connects. Fang's blade finds the gap between the seventh and eighth vertebrae. Lawrence's finds the gap between the eighth and ninth. They lever in opposite directions.

The Spinosaurus comes apart.

Not violently. Slowly. The way a bridge collapses when the keystone is removed: one piece at a time, each piece realizing it has nothing to hold onto. The mineral structure loses its coherence. Stone's residual energy dissipates in visible waves, rippling outward from the broken spine like heat from a road. The bones settle. The skull, still in Marcus's paws, goes still. The eye sockets, which never held eyes, point upward. The jaw, which was open, closes gently. Not a death. A return.

The fossil slides back into the wall. Piece by piece, the mineral structure reabsorbs into the sediment it came from. The last thing to disappear is the spine, the place where it broke, which glows faintly for several seconds after the rest has gone.

Silence.

{noRecoveryUnlocked:
    + [No Recovery Fracture.] -> act7_norecovery6
}
+ [The Foundation Chamber is below.] -> act7_postfossil

=== act7_norecovery6 ===
~ xp = xp + 30

You are done. Your body decided this during the fight and your mind is only now catching up. The depleted magic, the spiders, the weight of the mountain, the seventeen meters of prehistoric mineral that just tried to eat your party: you are finished.

Marcus lowers himself beside you. Not a command. An offer. The broadest, most stable surface available. You climb onto his back. His fur is coarse and warm and smells of cave dust and exertion and something underneath that is older than both: the particular scent of a bear who has been carrying things for eighteen hundred years.

He walks. You ride. Your head rests against his shoulder. From here, the cave looks different. Lower. Warmer. The bioluminescent lichen casts moving shadows that look, from Marcus's back, almost like the painted caravans in Level 1. Almost like things in motion.

You are on a bear's back in a cave full of things that tried to kill you and one of your companions has broken ribs and the other carries a letter she has never opened and you are, for reasons you cannot explain to a reasonable person, the most held you have felt in months. The bear is warm and enormous and he adjusted his stride three times since you climbed on him and each adjustment was for your balance, not his. You notice this. You do not say anything about it. You file it in the same place you filed "and that is why the party needed four."

Fang walks beside Marcus. She does not comment on the arrangement. She adjusts her pace to match his. Lawrence walks ahead, scouting, because even with broken ribs he will not stop being the person who enters dangerous places first.

+ [The Foundation Chamber.] -> act7_postfossil

=== act7_postfossil ===
// 📍 Below Level 6 · The Descent to the Foundation
The passage narrows. The stone changes color: from grey sediment to something darker, denser. Bedrock. You are below everything now. Below the painted grottos. Below the Almas. Below the spiders and the Weight Room and the three-million-year-old skeleton that just went back to sleep.

Nobody speaks. The party moves through the dark in single file. The only sound is breathing. Fang's is controlled but shallow; the off-hand injury is compressing her lung capacity. Lawrence's is precise and measured, which means his ribs are worse than he's admitting. Marcus breathes like a bellows, slow and deep, conserving what's left.

You are all broken.

Lawrence stops. Leans against the passage wall. For three seconds, the mask drops. His face in the lichen-light shows the cost of the last hour: the ribs, the tail-strike, the fight without magic. He is a thousand years old and he looks, briefly, like someone who has been alive for a thousand years.

# speaker: Fang
"(touching his arm, the gentlest she has been with him in your presence) Hey. Can you make it?"
# speaker: Lawrence
"(straightening, the mask returning) I have made it through considerably worse than a dinosaur."
# speaker: Fang
"That's not what I asked."
# speaker: Lawrence
"(quieter) Yes. I can make it."
Fang nods. She does not let go of his arm immediately. Half a second longer than necessary. Then releases. Lawrence watches her hand leave. Something passes between them that is not romantic and is not platonic and has no name because it has been accumulating for two hundred years in a space where names cannot reach.

Marcus pushes forward. His nose reads the passage ahead. He stops. Lifts his head.

# speaker: Marcus
"(very quiet) She's here."
He can smell her. The particular mineral signature of a woman who has been standing in the same place for so long that the stone has begun to accept her as part of its structure.

You enter the Foundation Chamber broken. You enter without full magic. You enter with cracked ribs and a chipped blade and a worsening off-hand and four heartbeats that a three-million-year-old skeleton tracked because they were too loud to hide.

You enter anyway. This is the game's thesis, and it has been the thesis since the Tribunal: the fight is never the point. The willingness to keep going after the fight is the point.

Kira is waiting. She has been waiting for a very long time.

+ [Face Kira.] -> act7_kiraapproach

=== act7_rest_jiwon ===
~ jiwonSeen = true

Fang eats her cold rations the way she does everything else: efficiently, without ceremony, like fuel. She tears the dried meat with her teeth and talks between bites. The combination should be graceless. It is instead the most honest version of Fang you have seen: a woman who has decided that if she is going to tell this story, she is not going to perform it. She is going to eat dinner and tell it at the same time, because making it precious would make it impossible.

# speaker: Fang
"Her name was Jiwon. She was a healer. Not the kind who fixes bones. The kind who fixes the thing that made the bone break in the first place."
She takes another bite. Chews. The cave waits.

# speaker: Fang
"We were together for forty years. Which, for an immortal, is either a very long time or a very short one depending on how much you let yourself feel it. I let myself feel it. That was the mistake. Or the best thing I ever did. I go back and forth."
{avatarName}: "What was she like?"
# speaker: Fang
"Quiet. Patient. Could sit with someone for three hours and not say a word and the person would leave feeling better than when they arrived. I have no idea how she did that. I talk for a living. Silence is my worst skill. She made it look like a superpower."
She sets the ration down. Picks it back up. Sets it down again. The food has become a prop for her hands.

# speaker: Fang
"She wasn't immortal. That was the thing. Forty years for me is survivable. Forty years for her was most of what she had. She spent most of what she had on me, and I spent most of those forty years being afraid of the math instead of being present for the time."
{avatarName}: "What happened?"
# speaker: Fang
"A storm. The kind that doesn't have a name because naming it would imply it was something you could predict. She was traveling to a village east of here. Healer work. People needed her and she went because that's what she did, she went where people needed her, and the storm came, and it came fast."
A long silence. The lichen casts blue-green shadows on Fang's face.

# speaker: Fang
"I was two days behind her. Two days. I could have gone with her. She asked. I said I had something to finish first. I don't remember what I was finishing. I have tried to remember for forty years and I cannot recall what was so important that I let her walk into that storm alone."
She picks up the ration. Takes a bite. The act of eating is keeping her in her body. Without it, she would be somewhere else entirely.

# speaker: Fang
"That's the shape of it. That's all you get tonight. I have a letter from her in my pack that I've never opened and a sword in my hand that I've used every day since, and if you ask me which one weighs more I will give you an answer you don't want."
She finishes the ration. Brushes her hands on her knees.

# speaker: Fang
"She would have liked you, by the way. She liked people who were braver than they knew. She said it was her favorite kind of person to heal."
Lawrence watches Fang tell it. He has not moved. He has not looked away. For the first time since you have known him, Lawrence is giving someone his full attention without calculating what the attention costs or buys. He is simply witnessing. Fang sees him seeing her. She does not flinch. She does not deflect. Two people who have known each other for two hundred years, sitting in the dark, and for once the knowing is not a weapon either of them is holding.

The fire burns lower. Fang brushes her hands on her knees a second time, a gesture that means she is done but has not moved yet.

# speaker: Fang
"(without looking at him) You knew the shape of it. Before tonight."
A silence that is not comfortable and is not hostile. It is honest.

# speaker: Lawrence
"Yes."
# speaker: Fang
"That’s the part I haven’t figured out how to forgive."
She does not say it like an accusation. She says it like a fact she has been carrying and has finally set down where someone else can see it. Lawrence says nothing. He does not defend. He does not apologize. His hand rises toward his sternum, the gesture the player has been tracking since Act 0, and this time it is not a reflex suppressed. It arrives. His fist rests against his chest for a full breath, and then he lowers it.

Fang sees it. She looks back at the fire.
+ [Face what's below.] -> act7_level6

=== act7_rest_lawrence ===
# speaker: Lawrence
"Functional. That is not the same as all right."
No chest-press. The player who has been tracking it notices its absence.

+ [Face what's below.] -> act7_level6

=== act7_rest_quiet ===

You rest without pushing. Some moments are not yours to fill.

Marcus reads the room. He reads every room, but this one he reads differently. Three people at different edges of the same silence: Fang with whatever she is not saying about Jiwon pressed between her ribs. Lawrence with the moonlight that should not exist resting on his shoulders. You, with the gap between your hand and his on the stone, the gap that is the width of a breath and the weight of a decision.

Marcus does not speak. He does not need to. He stands, slowly, and repositions himself between the three of you and the passage you came through. Not facing you. Facing outward. His back to the group, his body filling the corridor entrance the way only eight hundred pounds of bear can fill a corridor entrance.

He is a wall.

Not metaphorically. Physically. His shoulders span the passage from rough stone to rough stone. His head is low, ears forward, reading the cave beyond for anything that might approach. His breathing is slow and deliberate: the specific rhythm of a bear who has decided that nothing comes through this passage tonight. Nothing interrupts what these three people need, even if what they need is to sit in the dark and not talk about the things that matter most.

The puppy watches Marcus from Fang's side. It does not join him. It understands, in whatever way the puppy understands things, that Marcus is not standing guard against a threat. He is standing guard against interruption. The distinction is everything.

Fang sees it. She does not comment. But her breathing changes. The tightness in her shoulders eases by a degree. Someone is watching the door. Someone has decided that her silence is worth protecting. She has not been protected in two hundred years. She does not know what to do with it except exhale.

Lawrence sees it. He also does not comment. But his hand, on the stone between you, moves the last half inch. His fingers touch yours. Not holding. Touching. The contact point is smaller than a coin and heavier than everything Marcus is holding at the corridor entrance.

Marcus stays at the passage for the entire rest. He does not turn around. He does not check on them. He does not need to. He is a bear who was once an emperor who understands that the most powerful thing a leader can do is stand between the people he loves and the things that would disturb them, and say nothing, and move for nothing, and let the room do what the room needs to do.

+ [Face what's below.] -> act7_level6

=== act7_stonefreed ===
~ commitmentUnlocked = true
~ stoneFreeCount = 3
// 📍 The Foundation Chamber · Post-Liberation
Stone is Freed

The Binding Frame dissolves. Not violently. Like scaffolding removed from a finished structure: the pieces separate and what it was containing is simply free.

The paintings in Level 1 stop shifting and settle into the walls as if they were always meant to be still. The Almas make a sound that is not language and carries everything. The spiders in the Spider Galleries revise their web geometry. They have decided that helping is the right shape. The Flaming Mountains begin, slowly, to cool.

Kira is against the wall. She is not certain she can leave yet.

# speaker: Fang
"(sitting down beside her, no permission asked) You don't have to go anywhere right now."
# speaker: Kira
"I might stay until I'm sure the arch calculations hold without the Frame."
# speaker: Fang
"Yeah. That sounds like a you thing to do."
Marcus is upright. His senatorial bearing has returned, differently. Not as performance. As something that survived long enough to be real. He inclines his head toward Kira. She returns it. Two people who have built things that lasted, recognizing each other across a room.

Lawrence is standing in the middle of the chamber. Not positioned near the exit. Standing in the middle of the room, which he has not done since Act 2.

# speaker: Lawrence
"Stone. Sun. Moon..."
He stops after Moon. He always stops after Moon.

Marcus, after a long pause, to nobody:

# speaker: Marcus
"I want to be clear that I have negotiated with a Pope, two empresses, a Mongol general who was also an amateur poet, and a harbour master in Carthago Nova who was simply unreasonable on principle. This was harder. I would like that acknowledged."
# speaker: Fang
"Acknowledged."
# speaker: Kira
"(dry, from the wall) You're welcome."
# speaker: Fang
"(to you) See, that's funny. She's funny. I like her."
No Recovery Fracture
{noRecoveryUnlocked:
    Mechanic active. You know your limits and they are not weaknesses. Carry this forward.
- else:
    The Tribunal taught you this. Find it again.
}

+ [Rest before the surface.] -> act7_finalrest

=== marcus_sees_you ===
~ marcus = marcus + 2
~ marcusSeenYou = true
// 📍 Below Level 7 · The Road Back Up
Marcus is in human form. Not by choice -- the cave has required it for the last six levels. He is re-learning the specific inefficiency of walking on two legs with fresh ribs after a week underground, and he is managing this with his customary dignity, which is to say: without mentioning it.

He falls into step beside you on the ascent. Not beside Lawrence, who is ahead. Not beside Fang, who is behind. Beside you.

He says nothing for two full switchbacks.

Then:

# speaker: Marcus
"The ghost crossing. You walked it in thirty seconds. We had three thousand years between us and missed it entirely."
He does not slow down. He is not being rhetorical.

# speaker: Marcus
"I want you to understand: I have witnessed seventeen empires rise. I have seen what people do when they have all the knowledge and none of the clarity. What you did in that forest was not knowledge. It was clarity. Those are not the same thing and most people never learn the difference."
He walks ahead to navigate a narrow section of the passage, holding a low rock aside so you can pass. When you come through, he does not continue. He is waiting.

# speaker: Marcus
"I have been waiting for a long time for someone who moves like you move. Like the world is worth paying attention to. The Silk Road is failing. The Guardians have been alone. The party needed four."
He does not wait for a response. He walks ahead to check the road. That is the whole scene. It was everything.

+ [The surface. Light.] -> act7_finalrest

=== act7_finalrest ===
// 📍 The Foundation Chamber · Post-Liberation · Rest
The party does not leave immediately. Stone's release has changed the cave's acoustics: the oppressive silence of the lower levels has softened into something that almost breathes. The stone remembers what it is for. The walls feel less like a coffin and more like a room.

Marcus finds a dry alcove and collapses into it with the boneless relief of a bear who has been underground for too long. He is asleep in seconds. The puppy curls against his chest.

Fang sits at the chamber entrance, blade across her knees, watching the passage they came through. She is on guard. She is also giving you and Lawrence the room.

# speaker: Fang
"(over her shoulder, quiet) Get some sleep. Both of you. I have first watch for as long as you need it."
The emphasis on "both of you" is specific and kind and costs her something she will never name.

You lie down against the cave wall. The stone is warmer now. Stone remembering warmth. Your eyes close.

The nightmares come fast.

The Spider Galleries. The legs. The webs closing around you, not as architecture but as binding. The Binding Frame, except it is made of silk and it is tightening around your chest. You cannot breathe. The spiders are not busy anymore. They are watching. Each one has a face you almost recognize. The faces are yours, from different ages, and they are all held in place.

You know what it is to be held in place.

The Warden's voice. Except it is coming from inside the web. You try to move and the silk tightens and the cave walls are closing the way the riverbed walls closed during the ambush and the sand is in your lungs again and the water is gone and the canteen cracked and the desert drank it and there is nothing left and the spiders are weaving and weaving and weaving...

You wake with a sound you did not consent to making. Not a scream. A choked exhale. The kind of sound that comes from someone who has been trying not to make a sound for so long that the body overrides the decision.

Lawrence is already there.

Not standing over you. Not hovering. Sitting beside you, back against the same wall, close enough that you can feel the length of him along your side. He was already there when the nightmare started. He heard your breathing change and moved, and he did not wake you because he knows that sometimes the nightmare has to finish before the waking can begin.

# speaker: Lawrence
"(very quiet, not touching you, waiting) I'm here."
Your breathing is ragged. Your hands are shaking. The cave is not closing. The spiders are not here. The web is not real. You know this. Your body does not know this.

{avatarName}: "(still shaking) Spiders."
# speaker: Lawrence
"I know. I could tell from your breathing. Spider nightmares have a specific rhythm. Faster than combat nightmares. More irregular."
The clinical observation should be cold. It is not cold. It is the language of a man who has been paying attention to how you breathe for weeks and has categorized the variations because that is how Lawrence cares: by knowing.

{avatarName}: "Can you... is it okay if you..."
You cannot finish the sentence. You do not need to. He understood the request before you made it.

He opens his arm. You lean in. His arm comes around your shoulders and settles there with a weight that is exactly right: present enough to anchor, light enough to leave. His chest is cool against your cheek. You can hear something that might be a heartbeat, faint and slow and old. It should not be there. Vampires do not have heartbeats. But something in his chest is beating, very slowly, as if it has been waiting for a reason.

He does not perform comfort. He does not say "it's okay" or "you're safe." He holds still and lets his body be the argument against the nightmare. Here. Solid. Real. Cold in the way that stone is cold: not hostile, just permanent.

Your breathing slows. The shaking subsides. The cave wall is warm against your back. Lawrence's arm stays where it is.

# speaker: Lawrence
"The spiders in Level 4 were helping. They were holding the cave together. The nightmare will not tell you that. Nightmares never include the part where the thing you fear is the thing that saved you."
A long silence. You feel sleep pulling at you again. This time, the caves do not feel like a coffin. They feel like the Weight Room: pressing, but holding. The way Lawrence is holding you.

{avatarName}: "(half-asleep) Stay."
# speaker: Lawrence
"(barely a whisper) Yes."
The same word he gave Fang in the Weight Room. One syllable. Except this one is the answer to a different question, and it costs something different, and the honesty is the same.

You sleep. He stays.

Fang, at the entrance, heard everything. She does not turn around. Her grip on the blade loosens by a fraction. Something in her that has been braced for two centuries, waiting for Lawrence to do the thing he always does after closeness, waits for the withdrawal.

The withdrawal does not come.

Fang adds this to the list. The list is getting shorter. The things she carries without explaining are becoming things she might not need to carry much longer.

Marcus, asleep in the alcove, shifts once. A small sound. The puppy adjusts. The cave breathes. Three Guardians freed. Two remain. The road continues.

But not yet. Not tonight. Tonight, Lawrence holds Fortune in a cave at the bottom of the world, and the nightmare does not return, and the spiders outside continue their work of holding everything together, and the difference between being held in place and being held is something you finally understand.

+ [The road east. Act 8 begins.] -> act8_hexicorridor
+ [Read your journal.] -> journal

=== avatarname ===
// &#x1F4CD; Character Select
What should the party call you?

In Vanquish Death, your handle is FortuneBringsProsperity. The party will shorten this immediately.

/* TODO: <<textbox "$avatarName" "Fortune">> */
~ tkLatent = false
~ tkAct0 = false
~ artificerItems = 1
~ artificerUsed = false
~ artificerSeen = false

+ [Confirm. Go to the bar.] -> mostor_descent

=== bridge_inn ===
// 📍 Rhea Port · Portside Inn · Late Night
You return to the inn.

{avatarName}'s hands are still cold. Not from temperature. From the place between the treeline and the meadow, where three hundred people who had been walking for three centuries finally stopped walking through her. She can still feel the hem of a garment that no longer exists brushing her wrist. She keeps rubbing the spot without deciding to.

The Warden's voice is still in her chest. Not the words. The thing under the words. You know what it is to be held in place. The Warden was not asking. She was recognizing.

And somewhere outside the game, Ishani feels it too. Not the cold. Not the ghosts. The recognition. Because Ishani chose the career. Chose the dogs. Chose the corner office over the marriage timeline her parents laid out like place settings at a dinner she never agreed to attend. She chose all of it. She would choose it again. But a dead woman in a video game just looked through her avatar and saw something Ishani has not said out loud to anyone: choosing the opposite of what someone else wanted is not the same thing as choosing what you want.

{avatarName} sits by the fire. The fire is low. Nobody is particularly ready to sleep.

Marcus is asleep, or doing an excellent impression of it. Lawrence is at the window, his reflection in the glass looking less like a man keeping watch and more like a man allowing himself to rest.

Fang settles beside you. Closer than she needed to.

# speaker: Fang
"You've been running on fumes since we got here. I can tell."
You didn't say anything that would lead her to that conclusion.

# speaker: Fang
"(softer) It's not a criticism. I just... I know what it looks like. The running-on-empty thing."
+ ['You do this a lot? Read people?'] -> bridge_inn_read
+ ['I'm fine.' (You've been saying that a lot lately.)] -> bridge_inn_fine
+ [(Say nothing. Let the fire talk.)] -> bridge_inn_silence

=== bridge_inn_fine ===
~ end = end + 1
# speaker: Fang
"(a look that says she knows exactly what 'fine' means) Okay. But if you change your mind, I'm right here."
+ [Rest. Tomorrow is the Tribunal.] -> bridge_inn_rest

=== bridge_inn_fangcatch ===
~ fang = fang + 1
# speaker: Fang
"(without missing a beat) Because everyone who says ‘fine’ like that is doing the exact same math. I’ve done it for two hundred years. It sounds the same every time."
A pause. She pours herself another drink.

# speaker: Fang
"The math being: I am not fine but the other options are worse and I don’t know this person well enough yet to be honest and also I’m tired. That math."
{avatarName}: "(quietly) Yeah. That math."
Fang nods once. No commentary. No resolution. Just the specific acknowledgment of someone who was not expecting confirmation and is doing something with the fact that she got it.

# speaker: Fang
"Get some sleep. I’ll be right here if the math changes."
You have said "that math" to exactly one other person and she married someone else six months later. You are saying it to Fang, a woman you have known for three weeks, in a game, at a fire that is not your fire. It was easier here than it was there. You think about why that is. You do not reach a conclusion that comforts you. You file it next to the exit-checking and move on.

+ [Rest. Tomorrow is the Tribunal.] -> bridge_inn_rest

=== bridge_inn_read ===
~ fang = fang + 1
~ fireCampOpen = true
# speaker: Fang
"Two hundred years of practice. I'm still getting it wrong half the time. The other half I'm getting it right and wishing I wasn't."
Lawrence's head angle shifts. He is listening. He prefers you not notice.

+ [Rest. Tomorrow is the Tribunal.] -> bridge_inn_rest

=== bridge_inn_rest ===
The fire burns down. Sleep comes in pieces.

Somewhere between the game and the dream, a sound. Familiar. Not from Ninkasa.

A notification chime. Your phone. The real one.

Byung-Ho: good session. you're better at this than you think.
~ jeff = jeff + 1
You stare at it for longer than a text message warrants. That was the person. Not the character. The distinction is supposed to be clean. It is not clean tonight.

+ [Type a reply.] -> irl_chat_reply1
+ [Set the phone face-down. Return to the fire.] -> irl_chat_decline

=== bridge_inn_silence ===
~ flow = flow + 1
The fire talks. It says enough.

Fang stays beside you. The silence between you is the kind that happens when two people have decided not to perform.

+ [Rest. Tomorrow is the Tribunal.] -> bridge_inn_rest

=== bridge_mostor_return1 ===
~ moStorVisits = moStorVisits + 1
~ tiberius = tiberius + 1
// 📍 Mo Stór Tavern · Rhea Port · Return #1
Coming Home

The harbor restores. Sera pays the reward. The party walks back down those stone stairs.

Tiberius is already pouring. He doesn't ask what happened. He saw the tides return from his window. Mo Stór is busier than when you left. One more instrument in the ambient. More conversation. You don't clock it consciously. You feel it.

# speaker: Tiberius
"The ships are moving. I assume that's your fault."
Fang relaxes in a way you haven't seen before. Looser, less armored, like something she carries outside this place gets left at the door. She claims her usual seat without looking for it. She is home.

Lawrence sits in his usual spot. Does not finish his drink. Tiberius doesn't pour a full glass. You notice the protocol.

# speaker: Marcus
"(tasting a new vintage Tiberius placed without being asked) ...Closer."
# speaker: Tiberius
"(expression of a man who will find that wine if it kills him) Noted."
The quest board near the entrance has been updated. New jobs since Water's rescue. The world responds to what you did. Most are local: dock repair, cargo recovery, harbor patrol. One is not.

A posting from the Samarkand Caravan Guild, pinned at the top. Expensive paper. Official seal. Highwind Pass has been impassable for five months. Winds blow in directions that should not exist. No caravan has crossed since the disruption began. The eastern Silk Road is severed. The guild is offering a standing reward for anyone who can open the pass, and the amount is large enough that Fang reads it twice.

# speaker: Fang
"That's a lot of money for a weather problem."
# speaker: Marcus
"It is not a weather problem."
# speaker: Lawrence
"(already at the door) The pass is closed because Sky is gone. I mentioned this in the briefing."
# speaker: Fang
"You mentioned five Guardians, twelve prophecies, and a thousand years of personal regret. Some of us need a second pass at the material."
Tiberius pulls the posting down and hands it to you. Not to Lawrence. Not to Fang. To you.

# speaker: Tiberius
"The pass is three days east. If you leave in the morning, you'll hit the foothills before the weather turns again."
+ [Take the Highwind Pass job. Begin the road east.] -> bridge_roadeast

=== bridge_mostor_return2 ===
~ moStorVisits = moStorVisits + 1
~ tiberius = tiberius + 1
~ waystoneCharges = 1
// 📍 Mo Stór Tavern · Rhea Port · Return #2
The Last Easy Return

You descend the stone steps. The third step creaks. You knew it would creak before your weight hit it. The carved Old Elvish line on the door is becoming something you read without reading, the way you stop seeing the art on your own walls. Your hand finds the push-point without looking. The door swings on hinges that Tiberius oils every three days, and the smell of Mo Stór meets you before the light does: woodsmoke, old leather, the particular sweetness of whatever Tiberius keeps in the copper pot behind the bar that he has never once explained.

You do not know when this stopped being a tavern and started being the place you come back to. But your shoulders dropped two inches on the third step, and that is its own kind of answer.

{tiberius >= 3:
    Tiberius looks up before the door finishes opening. Your drink is already on the counter. Not where drinks go. Where your drink goes, in front of the stool at the far end of the bar. The empty stool. The one Tiberius told you about the first night, when he said "Most people don't notice the stool." It is pulled out. Waiting. Nobody has sat in it since you were last here. You know this the way you know the third step creaks.

    # speaker: Tiberius
    ">."
    Just your name. Not "welcome back." Not "you're alive." Your name, the way a bartender says the name of someone whose stool is already pulled out. You sit. The drink is exactly right. He has been paying attention the entire time. He just never made it obvious until now.

    {avatarName}: "Hey, Tibby."
    Tiberius pauses. Looks at you for exactly two seconds too long.

    # speaker: Tiberius
    "She's contagious."
    He does not correct you. He polishes a glass that is already clean. Once. Brief. Then sets it down and leans on the bar the way bartenders lean when they are about to say something they have been thinking about for a while.
}

{tiberius < 3:
    # speaker: Tiberius
    "Twice in one week. Something's either very right or very wrong."
    He pours your drink without asking what you want. He remembered.
}

# speaker: Tiberius
"You came back faster this time. ... Why?"
He has never asked about you before. The quest, the Guardians, the logistics of saving the world, yes. You, no. Something about the way he holds the glass tells you this is not casual.

You open your mouth. The answer that almost comes out is not from Fortune. It is from the woman at her desk with two rescue dogs asleep on the couch and a deadline she filed three days ago that still hasn't left her body.

"Because I had a bad week and this is the only place where..."

You catch yourself. Tiberius watches you catch yourself. He does not ask you to finish the sentence.

You find your seat at the bar and set your drink down, adjusting your belt out of habit. The buckle has been catching wrong since the pass. You haven’t had a quiet moment to fix it.

When you look up, Lawrence is watching you. Not the room. Not the door. You, with the patient, unhurried certainty of a man who has already decided and is simply waiting for you to catch up. The attention is not aggressive. That is what makes it land the way it does. It is warm and still and completely focused, the way a candle is warm and still and completely focused, and you are the only thing in the room it is pointed at.

You become aware of how you are sitting. Where your hands are. You reach for your belt again without meaning to, catch yourself halfway, and leave your hand where it is.

Lawrence says nothing. He does not look away.

Tiberius, behind the bar, picks up a glass that is already clean and polishes it. Once. Brief. He has seen Lawrence walk through this door for a hundred years. He knows what just changed.

You check the quest board. It has changed again. The Highwind Pass posting is gone, replaced with a "COMPLETED" stamp and your party's designation. Fang stares at it for a moment. She has never had her name on a completed quest board before. She doesn't say this. She doesn't need to.

The new posting at the top is different from the Samarkand Guild notice that sent you to the pass. This one is handwritten. Smudged. The ink is thin, as if the writer was rationing it. From a Silk Road factor stationed at Samarkand's eastern gate: three caravans have entered the Karakum desert in the last two months. None have emerged. The Singing Sands, which traders have crossed for centuries by following the acoustic resonance of the dunes, have changed their song. The sound is wrong. Experienced guides are refusing the route. The eastern Silk Road, already severed at Highwind Pass before you opened it, is now severed again at the desert.

# speaker: Marcus
"The road east is failing because Stone is gone. Lawrence said that in the first briefing. We've opened the pass. The desert is next."
# speaker: Fang
"Three caravans. That's people, Marcus. Not infrastructure."
# speaker: Marcus
"(quietly) I know what caravans are, Fang."
Lawrence has been reading the posting over your shoulder. Close enough that you feel the cold coming off him before you register he is there. Not wind. Not the bar. Him. He reaches past you and pulls it from the board. Folds it. Puts it in his own pack this time.

# speaker: Lawrence
"Samarkand first. We resupply there. Then the desert."
He did not ask. He planned. The difference is subtle, and Fang notices it, and says nothing.

The logistics settle. The posting is folded. The route is decided. The bar absorbs the planning the way it absorbs everything: without comment, without rush.

Fang waits until the conversation is done. Then she slides a drink across the bar to you. Not Tiberius's drink, which was waiting when you arrived. A second drink. One she ordered and paid for while you were reading the quest board.

{noRecoveryUnlocked:
    # speaker: Fang
    "You stepped back on that mountain and let us finish it. Do you know how rare that is? I have fought beside people for two hundred years who would rather bleed out than admit the team needed to carry them. You were done, you knew you were done, and you made the call with your eyes open. Against a woman who was faster than Lawrence."
    She taps the glass once.

    # speaker: Fang
    "That's not quitting. That's the hardest thing I've seen anyone do in a fight. Drink."
- else:
    # speaker: Fang
    "You pushed through a woman with a knife who was faster than Lawrence. On a mountaintop. In wind that could knock a bear sideways. After surviving an underwater courtroom that tried to judge you for the crime of moving."
    She taps the glass once.

    # speaker: Fang
    "I'm buying you a drink and we're not going to discuss it. Drink."
}

Fang is not generous with money. She counts every coin. She tracks expenses the way she tracks combat: precisely, instinctively, without waste. She just bought you a drink. The gesture is not casual. It is Fang saying, with currency instead of words, that what you did on that mountain changed how she sees you.

Marcus takes out his lute. For the first time, he plays in Mo Stór. Quiet. Background. An older melody that none of you recognize but all of you feel. The bar, which has been settling around you since the logistics finished, goes still in a different way. Not silence. Attention.

Tiberius stops what he's doing and listens for four bars. Then resumes. He used to be a musician. He knows what he's hearing. The way he sets down the glass afterward is gentler than it needs to be.

+ [Marcus has asked to speak with you. Privately. Before the road.] -> marcus_counteroath
+ [Take the Samarkand road. Resupply, then the desert.] -> bridge_samarkand

=== marcus_counteroath ===
~ marcus = marcus + 2
// 📍 Mo Stór · The Back Corner · Before the Road East
Marcus asks to speak with you privately. The request comes through Fang, who delivers it the way Fang delivers messages that make her feel something she prefers not to examine: with full accuracy and no commentary.

He is in bear form when you find him. He reverts to human to speak with you.

It costs him something. You can see the specific weight of it: the human form is harder to hold than the bear, and he holds it for you without mentioning that.

He looks at his hands. Human hands, not quite the right weight for a man who was a bear an hour ago.

# speaker: Marcus
"I want to tell you something I should have said at Mo Stór. Before the water. Before any of this."
He pauses. The pause is not hesitation. It is the specific pause of someone choosing accuracy over brevity.

# speaker: Marcus
"I have survived seventeen empires, nine plagues, and one municipal zoning dispute in Rome that nearly destroyed the Senate and would have been funny if it had not taken forty-three years to resolve. I have not been afraid of what came next. Not once. Not the fall of Carthage. Not the Antonine Plague. Not the thing in Ostia in 389 that we agreed not to write down."
He looks at his hands again.

# speaker: Marcus
"I notice I am slightly afraid of what comes next. The desert. Kira. The Guardians still imprisoned. I notice this and I find I want you to know it. The last time I was afraid and did not tell anyone, I handled it alone for four centuries and the approach was not optimal. I have updated my methods."
He is doing the hardest thing Marcus does: asking to be known without it serving a function.

>>+Marcus Bond · the honest answer
>>+Marcus Bond · he exhales something
+ [(Put your hand on his arm.)] -> marcusoath_touch

=== marcusoath_afraid ===
~ marcus = marcus + 1
{avatarName}: "I'm a little afraid too. I don't know if it shows."
# speaker: Marcus
"It shows in the right places. Not as hesitation. As attention. You are afraid of the right things. That is not common."
# speaker: Marcus
"(steadier) Good. We are afraid together. That is, historically, when things go best."
+ [The road east.] -> bridge_samarkand

=== marcusoath_paying ===
~ marcus = marcus + 1
{avatarName}: "Then we're both paying attention."
# speaker: Marcus
"(after a moment) Yes. That is exactly it. That is the correct frame. Paying attention."
# speaker: Marcus
"I have missed that. Someone who names things correctly. Thank you."
+ [The road east.] -> bridge_samarkand

=== marcusoath_touch ===
~ marcus = marcus + 2
~ marcusTouched = true
~ avatarConsentShown = true

You put your hand on his arm. The pause before sitting down was the question. This is the answer you are offering.

Not his paw. Not the bear. His arm, in the human form he is holding for you right now, the form that costs him something, the form he chose so you would have somewhere to look when he said the thing he needed to say.

He looks at your hand on his arm. He does not move.

After a long moment, he places his other hand over yours. Very briefly. The specific weight of someone who does not know what to do with gentleness and is handling it with great care.

# speaker: Marcus
"(very quiet) Ah."
One syllable. Eighteen hundred years of having learned not to ask for things, meeting one person who offered before being asked.

He releases your hand. Straightens. The bear form reasserts.

# speaker: Marcus
"The road east waits. I will be beside you for it. All of it. That is not a tactical statement."
+ [The road east.] -> bridge_samarkand

=== bridge_roadeast ===
// 📍 Rhea Port → Highwind Pass · Three Days Travel
The Road East

Water's freedom restores the harbor overnight. The dock children stop having the drought dreams, all of them, the same night. The Samarkand Caravan Guild posting sits folded in your pack. Three days to Highwind Pass. A standing reward. A Guardian to free.

# speaker: Fang
"(to you, quietly, as you pocket Sera's coin) She thinks you did something miraculous."
# speaker: Fang
"Which, to be fair."
The road east follows the Silk Road's western arc. It doesn't move reliably anymore. You walk through evidence of the crisis: caravans stopped mid-journey, weather arriving wrong.

One caravan is different. The crew is not silent. They are smiling. Broad, clean smiles that do not reach the eyes and do not respond to greeting. Their cargo is untouched. Their animals are fed. They are simply standing beside their wagons, smiling at nothing, as if waiting for something they have already agreed to.

Lawrence looks at them for too long. He does not say anything. He walks faster afterward.

# speaker: Marcus
"Sky's imprisonment is felt here too. The winds carry wrong. They should be trading news between cities. Instead they circle."
# speaker: Fang
"Two more days of Marcus' scintillating travel commentary."
# speaker: Marcus
"I don't commentary."
# speaker: Fang
"‘The road is long.’ ‘The weather changes.’ ‘Wolves are nearby.’ That's you. That's your travel personality."
# speaker: Lawrence
"...The wolves are nearby."
# speaker: Fang
"(to you) See?"
Fang checks whether you laughed at her joke. Files it.

+ [Continue to Highwind Pass.] -> act3_highwindentry

=== bridge_saltflats_fangdawn ===
~ fangFamiliar = true
~ avatarConsentShown = true
// 📍 Karakum Desert · Salt Flat Edge · Dawn
The flat looks like a lake at dawn. The salt reflects the first light so precisely you have to check the horizon twice to confirm which one is sky. The air is cold. The cold will not last. In an hour, the desert will be a furnace. Right now it is this.

Fang is at the edge of it, alone. Knees up. Watching the horizon do nothing that would be interesting to anyone who was not watching for the specific quality of silence that happens before the world decides which direction to go.

She does not hear you approach. Or she hears you and decides not to react. With Fang, these are not always different.

You pause before sitting. Not long. A second. The pause is the question. The specific courtesy of someone who has learned to ask before arriving, not after.

She does not stop you. That is the answer.

You sit beside her. The flat holds both of you in the particular way flat things hold people: equally, without preference.

A long silence.

# speaker: Fang
"When I met Jiwon, she was sitting at the edge of a lake watching the same nothing I was watching. I thought: there is a person who knows what this is for."
She does not look at you. The horizon does something light does at dawn in deserts.

# speaker: Fang
"I'm not making a comparison. I'm saying it feels familiar. The -- the quality of someone who knows what standing at an edge is for, not as a dramatic gesture but just as a thing some people need."
A pause.

# speaker: Fang
"I don't know what to do with familiar right now. I wanted you to know I'm aware of it."
>>+Fang Bond
+ [(Stay. Say nothing.)] -> fangdawn_silence
>>+Fang Bond · direct · she wasn't expecting this

-> END

=== fangdawn_firsttime ===
~ fang = fang + 1
# speaker: Fang
"(a long pause) I stopped looking for it to mean something other than what it was. I let it be familiar without making it a question."
# speaker: Fang
"I was not very good at that. I am still not very good at that. The letter is evidence."
She stands. Brushes salt off her knees. Looks at the flat one more time.

# speaker: Fang
"But I'm better than I was. Marginally. Don't tell Lawrence."
+ [The desert continues.] -> bridge_saltflats_cost

=== fangdawn_silence ===
~ fang = fang + 2

You stay. The flat stays. The light shifts by degrees.

After a while, Fang takes out the blade. Not to sharpen it. Just to hold it. The weight of a thing she carries every day, held differently this morning. The way you hold something when you are deciding whether it still means what it used to mean.

She puts it back. Stands.

# speaker: Fang
"(standing, not looking at you) Thank you for not saying anything useful."
She walks back toward camp. The wolf puppy, which had been asleep in the sling and somehow ended up between you, gets to its feet and follows her. It glances back at you once. Then does not.

+ [The desert continues.] -> bridge_saltflats_cost

=== fangdawn_want ===
~ fang = fang + 1

Fang turns and looks at you directly. The question surprised her. She was not expecting to be asked what she wants. She has not been asked that in a long time.

# speaker: Fang
"(after a long pause) I want to know what it is before I decide what to do with it. I have spent forty years carrying a letter I have not opened. I am aware of my pattern."
A beat.

# speaker: Fang
"I don't want to do that again. The carrying without knowing. Even if the knowing is worse."
She looks back at the flat. Not away from you. Toward the thing that has no answer yet.

# speaker: Fang
"That's a more honest answer than I planned to give."
+ [The desert continues.] -> bridge_saltflats_cost

=== bridge_saltflats_cost ===
~ fang = fang + 1
~ saltFlatsChoice = "cost"
Fang appears from behind you. She heard.

# speaker: Fang
"The cost question. Yeah. I've been running that math for two hundred years. I still don't have an answer. But I'm still here, which might be the answer."
+ [Continue toward Samarkand.] -> bridge_samarkand_arrival

=== bridge_saltflats_sky ===
~ lawrence = lawrence + 1
~ saltFlatsChoice = "sky_warning"
# speaker: Lawrence
"Sky's warning is accurate. The desert strips things. What remains afterward is either stronger or honest. Ideally both."
+ [Continue toward Samarkand.] -> bridge_samarkand_arrival

=== bridge_saltflats_you ===
~ lawrence = lawrence + 2
~ saltFlatsChoice = "about_you"
# speaker: Lawrence
"...Oh."
Not deflection. Not sarcasm. Just: oh.

He keeps walking. So do you.

# speaker: Lawrence
"...That's either very brave or a significant tactical error."
{avatarName}: "Maybe both."
# speaker: Lawrence
"(quietly) Yes. Maybe both."
+ [Continue toward Samarkand.] -> bridge_samarkand_arrival

=== bridge_samarkand ===
// 📍 Highwind Pass → Samarkand · Seven Days East
The Road to Samarkand

Waypoint 1: The Caravanserai

# speaker: Marcus
"(expansively) I advised the construction of seventeen of these. The ratio of private rooms to shared water supply has improved considerably."
# speaker: Fang
"Did you just compliment infrastructure?"
# speaker: Marcus
"Infrastructure is the nearest thing mortals have to devotion. I respect it."
# speaker: Lawrence
"(to you, quiet) He gets like this near old roads. Ignore it for approximately two hours and he returns to normal."
Waypoint 2: The Salt Flats

Lawrence walks beside you without speaking. The silence between people who've stopped needing to fill it.

# speaker: Lawrence
"You've been quiet."
{avatarName}: "I've been thinking."
# speaker: Lawrence
"About?"
+ ['About Sky's warning. The desert and not seeing where you're going.'] -> bridge_saltflats_sky
+ ['About whether this is worth it. Not the mission. The cost.'] -> bridge_saltflats_cost
+ ['About you, actually.'] -> bridge_saltflats_you
+ [(Fang is at the edge of the flat at dawn. She has something to say.)] -> bridge_saltflats_fangdawn

=== bridge_samarkand_arrival ===
// 📍 Samarkand Gates · Day 7 · Dusk
Samarkand arrives as sound and smells before it arrives as sight. Six languages in the first thirty paces, none of them yielding to each other. Saffron. Horse sweat. Heated copper from somewhere to the left, where hammers ring on metal in a rhythm that has not changed since the city was founded. Then the sight: blue-tiled domes of Registan Square catching the last of the sunset, throwing color across the dust in a way that makes the entire city look like it was painted an hour ago.

A city that has been the center of the known world at various points, and wears that history the way some people wear expensive coats. Not to impress. Because it's theirs.

Marcus stops at the gate. He has been walking on four legs for three days. He looks at the market, the crowd density, the narrowness of the streets.

# speaker: Marcus
"I need to shift. A bear in Registan Square would cause the kind of incident that makes it into trade guild reports for decades."
He steps behind a grain cart. There is a sound like a very old joint popping, multiplied. When he steps out, Marcus is a man. Tall. Broad-shouldered. Dark skin weathered by eighteen centuries of everything. The senatorial bearing is immediately obvious. He holds himself the way someone holds themselves when they have addressed the Roman Senate and the Senate listened.

He is also, you notice, handsome. In a heavy, classical way that the third century would have appreciated and the twenty-first century is about to find confusing.

# speaker: Fang
"Every time. I forget what you look like and then you do that and I have to start over."
# speaker: Marcus
"I look like myself, Fang."
# speaker: Fang
"You look like you should be on a bronze horse in the Roman Forum. It's very distracting. The bear is less complicated."
Lawrence says nothing, but the half-smile is there and gone.

The party splits to resupply. You have a few hours before the caravanserai closes its gates for the night.

+ [Go with Fang to the swordsmiths' quarter.] -> bridge_samarkand_swordsmiths
+ [Explore the Registan market with Marcus.] -> bridge_samarkand_market
+ [Help Lawrence resupply at the caravanserai.] -> bridge_samarkand_supply

=== bridge_samarkand_swordsmiths ===
~ fang = fang + 1
// 📍 Samarkand · Swordsmiths' Quarter · Evening
The swordsmiths' quarter is down a side street that smells of coal and quench oil. Fang walks faster. She knows where she's going.

Nadia Tursunova's shop is small, hot, and clean. The woman behind the anvil is sixty, built like a question nobody has satisfactorily answered, and does not look up when you enter. She finishes a stroke. Then another. Then she sets the hammer down and looks at Fang's blades the way a doctor looks at a patient.

# speaker: Nadia
"A crack running the grain. Off-hand. You’ve been compensating for three weeks. I can tell from the wear on the long blade’s crossguard."
# speaker: Fang
"(to you, quietly) She understood the steel before I finished drawing."
You sit. Four hours pass. You watch a woman repair something with a patience that borders on devotion, and another woman watch the repair with an expression she doesn't wear anywhere else: trust. Complete, unperformed trust.

You notice, around the second hour, that Fang has not looked away from Nadia's hands once. Not at the blades. Not at the shop. Nadia's hands: the way they move across the steel, the weight she applies to different strokes, the pause before each decision. Fang tracks it the way she tracks a fight. But quieter. The way she looks at something she is not ready to call by its name.

Fang does not make jokes in this room. You file that too.

When it's done, Nadia tucks a folded letter into the blade wrap. Fang does not open it. She touches it once, through the fabric, and nods.

# speaker: Fang
"(on the walk back, very casual) If you tell anyone I sat still for four hours, I'll deny it."
A beat. Then, quieter, not quite to you:

# speaker: Fang
"Jiwon would have liked her. She had a thing for people who were very good at exactly one thing and did not need you to notice. (stops herself) Anyway."
She picks up the pace. You do not push.

+ [Head to the caravanserai for the evening.] -> bridge_samarkand_evening

=== bridge_samarkand_fangquestion ===
~ fang = fang + 2
~ fangSeen = true
// 📍 Samarkand · Swordsmiths' Quarter · Outside the Last Forge
Nadia went back inside. The blade is repaired. The letter is tucked into the hilt wrap again, eight hundred miles from where it started. Fang sets the sword down on the low wall outside the forge and looks at it the way you look at something you cannot stop looking at.

A minute passes. Maybe two.

# speaker: Fang
"You have not asked me anything about myself. Not once. Not the letter, not Jiwon, not the wolf puppy."
She picks up the blade. Checks the edge. Sets it down again.

# speaker: Fang
"Everyone asks about the wolf puppy."
She looks at you sideways. The way she looks at combat geometry when she is solving a problem she has not named yet.

>>+Fang Bond · she thought about this
>>+Fang Bond · honest
>>+Fang Bond +2 · she stops · this is the answer

-> END

=== fangq_ready ===
~ fang = fang + 1
# speaker: Fang
"(considering) That's diplomatic."
{avatarName}: "It's true."
# speaker: Fang
"(a beat) I know. That's what makes it diplomatic."
A pause. She rotates the blade handle once in her palm. The motion is unconscious. She does it when she is working something out.

# speaker: Fang
"I'm not easy to know. I know that. I've spent two hundred years making sure of it. Most people ask about the letter because they want the story. You waited for me to want to tell it. That's" She stops. Recalibrates. "That's not nothing."
+ [Head to the evening camp.] -> bridge_samarkand_evening

=== fangq_wrong ===
~ fang = fang + 1
# speaker: Fang
"Get it wrong how?"
{avatarName}: "Ask too soon. Ask the wrong question. Ask about the letter when you wanted to talk about the sword, or ask about the sword when you wanted to talk about neither."
Fang is quiet for a moment. The cooling-blade sound from inside the forge. A horse somewhere distant.

# speaker: Fang
"(not a compliment, just accurate) You pay attention."
{avatarName}: "So do you."
# speaker: Fang
"Yes. (a beat) But I'm usually watching for threats. You're not."
She stands. Picks up the blade. The conversation is over, which means it was complete.

+ [Head to the evening camp.] -> bridge_samarkand_evening

=== fangq_worth ===
~ fang = fang + 2
# speaker: Fang
"(stopping) What?"
{avatarName}: "I was waiting for you to decide I was worth telling."
She looks at you directly. Not the sideways assessment. Full attention. The wolf puppy, from inside the sling, opens one eye.

# speaker: Fang
"(quieter) That's the right answer."
A pause.

# speaker: Fang
"That's an annoying answer to receive. Because it means I've been making you wait for something I've already decided."
She picks up the blade. Tests the grip. Sets it back down.

# speaker: Fang
"Her name was Jiwon. She was a cartographer. Not professionally -- she just mapped things. Rooms she liked. Roads she thought were interesting. She mapped me once, by accident. Told me where all my exits were. I didn't know I had exits until she drew them."
She stands. The blade goes on her back. The conversation closes the way a room closes: from the inside, not the outside.

# speaker: Fang
"You were worth telling. You were worth telling before the Tribunal. I just needed to be sure."
+ [Head to the evening camp.] -> bridge_samarkand_evening

=== bridge_samarkand_market ===
~ marcus = marcus + 1
// 📍 Samarkand · Registan Market · Evening
Marcus walks through the market the way a man walks through a building he designed. He touches a column base and murmurs something about load-bearing improvements. He stops at a fountain and nods approvingly at the plumbing. He has opinions about the tile work. They are correct opinions. Nobody asked for them.

# speaker: Marcus
"I advised the construction of this market's original irrigation system. In the third century. The current system is... adequate."
{avatarName}: "That's the most devastating review I've ever heard."
# speaker: Marcus
"I have had eighteen hundred years to refine my capacity for understatement."
At a spice merchant's stall, Marcus reaches into the pocket of a coat he has owned for longer than most civilizations and produces a coin. He places it on the counter. The merchant picks it up. Turns it over. Holds it to the lamp.

It is a Roman denarius. Silver. The profile of Marcus Aurelius. The emperor, not the bear. Though technically both.

The merchant stares at the coin. Stares at Marcus. Stares at the coin again. He calls over the woman running the antiquities stall three doors down. She takes one look at the coin and makes a sound that is not a word in any language currently spoken in Samarkand.

# speaker: Marcus
"(genuinely confused) Is there a problem with the currency?"
{avatarName}: "Marcus. That coin is eighteen hundred years old."
# speaker: Marcus
"Yes. But it is still legal tender."
{avatarName}: "It is absolutely not still legal tender."
# speaker: Marcus
"(a pause of genuine reconsideration) ...The economy has changed."
You pay for the spices with actual money. The antiquities dealer is still making the sound.

You are still composing yourself when a woman at the silk stall catches Marcus's eye. Not his attention. His eye. She smiles. Adjusts the scarf she is selling so that it falls across her forearm in a way that is not about the scarf. She says something in Sogdian that Marcus's translation instinct processes before his social instinct can intervene.

# speaker: Marcus
"(to you, extremely formal) She is offering a competitive rate on textiles."
The woman touches his arm. Once. Then again while showing him a silk that does not require two hands to display.

{avatarName}: "Marcus. She's not selling you silk."
# speaker: Marcus
"She is quite clearly selling silk. It is very fine silk. The thread count is extraordinary."
{avatarName}: "She touched your arm. Twice."
Marcus goes very still. Eighteen centuries of accumulated wisdom reorganize themselves behind his eyes. Diplomatic training from three imperial courts processes the new data. The Roman Senate could not have prepared him for this.

# speaker: Marcus
"...Ah."
He turns back to the woman with the precise courtesy of a man who has no idea what to do next but is absolutely going to be polite about it. He buys the silk. He does not need silk. He folds it with the care of someone handling a treaty document. You do not laugh until you are two stalls away, and then you cannot stop.

# speaker: Marcus
"I have been a bear for a very long time. Bears are not... approached. In that manner."
{avatarName}: "Marcus, you look like a classical sculpture that learned to walk. People are going to approach you."
# speaker: Marcus
"(with deep feeling) I would like to go back to being a bear now."
+ [Head to the caravanserai for the evening.] -> bridge_samarkand_evening

=== bridge_samarkand_supply ===
~ lawrence = lawrence + 1
// 📍 Samarkand · Eastern Caravanserai · Evening
Fang falls into step beside you before you’ve made it ten feet.

# speaker: Fang
"The swordsmiths’ quarter is better. Nadia does blade repair and she’s genuinely interesting. The market has a wine merchant Marcus has been circling for twenty minutes. Both of those are good options."
{avatarName}: "Lawrence asked me to help with resupply."
# speaker: Fang
"Lawrence is perfectly capable of resupplying alone. He has been resupplying alone since before your grandmother’s grandmother was born."
A beat.

# speaker: Fang
"I’m just saying. The caravanserai at night is very dark and very quiet and Lawrence is very."
She stops. Recalibrates.

# speaker: Fang
"He’s very Lawrence right now. That’s all I’m saying."
Before you can answer, Lawrence’s voice arrives from somewhere ahead, low and unhurried, already knowing you’re coming:

# speaker: Lawrence
"Fortune."
Just your name. The way he says it makes the caravanserai sound like somewhere you were always going to end up tonight.

You go.

Fang watches you leave. She does not follow. After a moment she says, to nobody in particular: "Yep. That’s what I thought."

Lawrence resupplies the way he does everything: with the efficiency of someone who has done this a thousand times and the precision of someone who expects this to be the last time. He knows what the desert requires. He has crossed it before. He does not say how many times.

You help. It is the kind of work that does not require conversation: sorting water skins by capacity, checking dried provisions for spoilage, wrapping blade oil in cloth so it doesn't leak into the food stores. Quiet logistics. The silence is comfortable.

# speaker: Lawrence
"You're good at this."
{avatarName}: "At packing?"
# speaker: Lawrence
"At being useful without needing to be told how."
He hands you a water skin. His fingers close over yours for a half-second longer than the transfer requires. Not long enough to name. Long enough to notice.

You focus on the provisions. Check a dried pack twice. It does not need checking twice.

Twenty minutes later, reaching past you for a rope coil on the shelf above your head, his arm crosses your shoulder. The warmth of him is closer than it should be for the available space. He takes the rope. Steps back. Says nothing.

You become aware that your heart is doing something it has no business doing over rope management.

He crouches beside you to check the blade oil wrapping. His knee is an inch from yours. He points to a seam you missed. His hand covers yours to show you the fold. Patient. Instructional. Completely reasonable in context.

You think about Fang saying ‘he’s very Lawrence right now’ and understand, belatedly, exactly what she meant.

You are not sure when sorting provisions became the most charged twenty minutes of the last three weeks. You are also not sure what to do with that information.

# speaker: Lawrence
"The desert will be different from anything we've faced. The Verdant Verge and Highwind Pass were contained. The Karakum is not. It strips things. If there is anything you're carrying that you haven't dealt with, the sand will find it."
He is talking about you. He is also talking about himself. He knows this. You know this. Neither of you names it.

+ [Head to the caravanserai courtyard for the evening.] -> bridge_samarkand_evening

=== supply_goback ===
~ lawrence = lawrence + 1

Lawrence is quiet for a moment. Long enough that you think the question is going to be let go.

# speaker: Lawrence
"I wanted to verify the loss. There is a difference between knowing something is gone and standing in the place where it was. One is information. The other is evidence."
He looks at the Gobi. His jaw works once.

# speaker: Lawrence
"I have had a thousand years of information about things I lost while I was elsewhere. I go back when I can. I have a comprehensive archive of absences. It is not a cheerful record, but it is honest."
A beat. The lightest thing he has said about a thousand years of carrying things.

# speaker: Lawrence
"(quietly, not looking at you) I do not regret going back. Even when the grove is always gone."
+ [Into the caravanserai courtyard.] -> bridge_samarkand_evening

=== supply_fracture ===
~ lawrenceFracture = true
~ lawrence = lawrence - 2
~ xp = xp + 5

Lawrence goes very still.

Not the managed stillness he uses as performance. The actual stillness of a person who has been standing in a room he thought was safe and has just noticed it is not.

# speaker: Lawrence
"(very quiet) That is either the cruelest thing you could say or the most accurate."
He waits. He wants to know which one you meant.

You know which one. You meant both.

He stands. Not quickly. Deliberately. The motion of someone closing something.

# speaker: Lawrence
"I need to think about which one."
He does not come back to the fire that night. He resupplies alone. When you rejoin the party in the courtyard, he is already there, and his position has changed: not beside you. Across the fire. The distance he maintained in the first three acts, resurrected.

+ [Into the caravanserai courtyard.] -> bridge_samarkand_evening

=== bridge_samarkand_evening ===
// 📍 Samarkand · Eastern Caravanserai · Courtyard · Night
The party reconvenes in the caravanserai courtyard. A fire someone else built. Other travelers at other fires. The normal sounds of a Silk Road way station at night: horses and camels settling, merchants checking boxes and bags, servants cooking, quiet conversation in four languages, the distant call to prayer from a minaret you can't see but can feel.

Marcus is still in human form. He sits cross-legged and holds his wine glass with the same improbable delicacy he showed as a bear. Except now it makes sense, because he has human hands, and the delicacy is just who he is.

Fang arrives last. She is carrying something she bought in the Registan market: a star chart. Obsessively precise. She doesn't show it to anyone. She tucks it inside her coat.

Lawrence notices. He says nothing. Yet.

A notification. Your phone. The real one, again.

Clare: Hey! Sorry if this is random. I just wanted to say you were amazing in the pass fight.
Clare: Like actually amazing. I was watching the replay and my daughter walked in and asked what I was watching and I said "my friend being a badass" and she said "mom please stop"
+ ['Your daughter sounds like she has good judgment.'] -> irl_clare_chat1_kid
+ ['A badass? I literally stepped back and let everyone else finish.'] -> irl_clare_chat1_nr
+ ['Thanks Clare. That means a lot coming from you.'] -> irl_clare_chat1_direct

=== irl_clare_chat1_kid ===
>Ishani:>FBP:> Your daughter sounds like she has good judgment.
Clare: She's 12 going on 45. Hold on my oldest just informed me he needs a costume for tomorrow
Clare: Ok I'm back. He needs to be a "historical figure" and I said Marcus and he said "mom that's a bear" and now I have to explain shapeshifting at 10pm on a school night
Clare: Anyway lol. How are you doing? Like actually doing. The game gets intense and sometimes I forget to check in with real people
+ ['I'm good. Tired. The Samarkand market was a lot.'] -> irl_clare_chat2

=== irl_clare_chat1_nr ===
>Ishani:>FBP:> A badass? I literally stepped back and let everyone else finish.
Clare: Yeah. That's the badass part.
Clare: I've played games for years where stepping back = failure. You stepped back and the party WORKED BETTER. That's not quitting. That's trust.
Clare: Sorry that was intense lol. My kids are in bed and I have Opinions after 9pm
Clare: How are you doing though? Like actually?
+ ['I'm good. Tired. The Samarkand market was a lot.'] -> irl_clare_chat2

=== irl_clare_chat1_direct ===
>Ishani:>FBP:> Thanks Clare. That means a lot coming from you.
Clare: Oh stop. I just hit things with swords and make jokes about it.
Clare: Actually no don't stop. I never get compliments that aren't from my kids' teachers telling me my son "has a lot of energy" which is code for "he broke something again"
Clare: How are you doing? We're about to hit the desert and I want to make sure my people are good before things get sandy
+ ['I'm good. Tired. The Samarkand market was a lot.'] -> irl_clare_chat2

=== irl_clare_chat2 ===
>Ishani:>FBP:> I'm good. Tired. The Samarkand market was a lot.
Clare: RIGHT?? I spent an hour in the swordsmiths' quarter and forgot I had children
Clare: This game does that to me. I log on for an hour and suddenly it's midnight and the dog needs to go out and I'm emotionally invested in a werewolf's sword maintenance
Clare: Is that weird? That might be weird.
>Ishani:>FBP:> It's not weird. Or if it is, we're both weird.
Clare: Deal. Weird together.
Clare: Ok I gotta go. My youngest just yelled "MOM THE DOG DID A THING" which is never good
Clare: Stay safe in the desert. I mean it. 💛
She signed off the way she probably signs off with her kids: fast, warm, already dealing with the next thing. You notice she used a heart emoji. You notice you noticed.

You set the phone down. The fire is still going. The party is still here. Fang is pulling something from inside her coat.

It is the star chart she bought in the Registan market. Obsessively precise. A single star named in Old Sogdian. She unfolds it carefully, the way you handle something that belonged to someone you lost.

Marcus reads the name quietly: a woman's name. Nobody asks whose.

Lawrence sees the chart. His expression changes. Not surprise. Recognition.

# speaker: Lawrence
"You kept her charts."
The temperature between them drops twenty degrees.

# speaker: Fang
"Don't."
# speaker: Lawrence
"I only meant..."
# speaker: Fang
"I know what you meant. You meant you knew her name before I said it. You meant you've been carrying that information for forty years and you never once asked me about it. And now you're going to say it like it's observation and not presumption. Don't."
Lawrence closes his mouth. The jaw works once. He looks away.

Fang does not look at you. She does not explain. She walks to the far side of the courtyard and stays there.

Marcus positions himself between you and the gap, not blocking either of them. Holding the geometry of a group that just cracked.

~ partyFriction = true

+ [Bridge the gap. Talk to Fang.] -> bridge_samarkand_repair_fang
+ [Bridge the gap. Talk to Lawrence.] -> bridge_samarkand_repair_lawrence
+ [Let it ride. The desert will sort it.] -> bridge_samarkand_friction

=== bridge_samarkand_friction ===
~ stag = stag + 1
// 📍 East of Samarkand
Neither of them says another word about it. But the space between Fang and Lawrence, which had been closing for hundreds of miles, reopens. The desert road is long enough for it to harden if you let it.

You walk between Fang and Marcus. Lawrence is ahead, far enough that he is choosing not to hear this. Fang is behind, far enough that she is choosing not to be heard. You are in the middle with an eighteen-hundred-year-old Roman who has been holding other people's broken geometry since before geometry was invented.

The silence lasts an hour. Then Marcus breaks it. Not for you. For Fang.

# speaker: Marcus
"(without turning, loud enough to carry back) You don't have to explain it to me, Fang. I was there."
Fang's footsteps don't change pace. But after a moment:

# speaker: Fang
"You weren't there for all of it."
# speaker: Marcus
"No. I was there for the part where you stopped sleeping. And the part where you started taking jobs that should have killed you. And the part where you told me you were fine and I let you lie because I didn't know what else to do."
Nothing for a long time. The road is flat and featureless. There is nowhere to look except at the person talking.

# speaker: Fang
"(very quiet) That's more than you've said about it in forty years."
# speaker: Marcus
"I have been a bear for most of those forty years, Fang. Bears process things slowly."
# speaker: Fang
"Don't make me laugh right now. I'm committed to being angry."
# speaker: Marcus
"You can be both. I have extensive experience."
Another silence. Shorter this time. Fang catches up by two paces. Not all the way. Two.

# speaker: Fang
"He kept her name for forty years and never asked. That's the part that hurts, Marcus. Not that he knew. That he chose to carry it alone instead of carrying it with me. Like it was his to keep."
# speaker: Marcus
"(slowly, carefully) He thought he was protecting you."
# speaker: Fang
"I know. That's what makes it worse. I can't even be angry at him for the right reason. I'm angry because he loved me enough to carry it and not enough to share it. And I don't know which one I'm more upset about."
Marcus does not respond immediately. When he does, his voice is different. Lower. The diplomatic register gone. Just the man.

# speaker: Marcus
"I lost someone too. Before the spell. Before the bear. Her name was Faustina. She was the only person who ever told me I was wrong and made me grateful for the correction."
# speaker: Fang
"(beat) You've never told me that."
# speaker: Marcus
"I have been processing it. As I said. Slowly."
# speaker: Fang
"Eighteen hundred years slowly?"
# speaker: Marcus
"Some things take the time they take."
Fang closes the remaining distance. Walks beside Marcus. Not beside you. Beside him. Shoulder height reaches his elbow. She doesn't lean in. But the space between them is a different shape than it was an hour ago.

# speaker: Fang
"Faustina. That's a good name."
# speaker: Marcus
"It was."
The desert opens ahead of them. Lawrence is still walking point. He did not turn around. But his pace slowed, just slightly, while they were talking. Close enough to hear, if the wind carried it. Whether it did is between him and the wind.

+ [Head to the caravanserai gate.] -> kai_marketplace

=== bridge_samarkand_repair_fang ===
~ fang = fang + 1
~ partyFriction = false
// 📍 Samarkand · Market Edge
Fang doesn't look at you when you fall into step beside her. Then she does.

# speaker: Fang
"He's not wrong. That's the problem. He's never wrong in a way I can argue with. He's wrong in a way that only hurts because he's right."
A long pause. The market noise fills it.

# speaker: Fang
"I'll deal with it. Not now. But I'll deal with it."
She bumps your shoulder with hers. Once. Brief. A language she trusts more than words.

+ [Head to the caravanserai gate.] -> kai_marketplace

=== bridge_samarkand_repair_lawrence ===
{lawrenceFracture:
    // 📍 Samarkand · The Repair
    He is at the wall again. Not the dock. There is no dock here. The gesture is the same: three feet from the edge, watching something that does not require watching.

    You go to him. He does not turn around.

    A long pause.

    {avatarName}: "I think I meant the accurate one. I should have asked before I said it."
    He is very still for a moment.

    # speaker: Lawrence
    "(without turning) ‘Should have asked.’"
    He tastes the phrase. Runs it against something internal.

    # speaker: Lawrence
    "(quieter) Yes. You should have. But you saw it. Not many people see it."
    He turns. Not the full attention. Sideways. But the wall is behind him now, not between you.

    # speaker: Lawrence
    "I do not want it to be the way you see me."
    {avatarName}: "It isn't. It was one thing you did once. A long time ago."
    # speaker: Lawrence
    "(long pause) More than once."
    {avatarName}: "More than once. And then you stopped, and came back, and stand three feet from the edge and do not call it grief."
    Something in his face shifts. The management does not fully return. What is left is smaller and more honest.

    # speaker: Lawrence
    "(after a moment) I do not know what to do with you."
    {avatarName}: "I know. That's new for you. I'm choosing to find it reassuring."
    ~ lawrenceFracture = false
    ~ lawrence = lawrence + 3

    + [The desert tomorrow.] -> bridge_samarkand_friction
- else:
    ~ lawrence = lawrence + 1
    ~ partyFriction = false
    // 📍 Samarkand · Registan Square · Dusk
    Lawrence is standing in front of a mosaic that he is not actually looking at.

    # speaker: Lawrence
    "I should not have said it. I knew whose name was on the chart because I was there when it was given. Forty years ago. Before everything... changed."
    He pauses. Recalibrates.

    # speaker: Lawrence
    "Fang lost someone she loved. I was... adjacent to that loss. In ways I have not earned the right to reference casually."
    He looks at you. The look says: do not ask me more right now. The look also says: I am telling you this because I trust you with it.

    + [Head to the caravanserai gate.] -> kai_marketplace
}

=== irl_chat_close ===
~ jeff = jeff + 1
{jeff >= 9:
    Byung-Ho: see you next session.
    Byung-Ho: I mean that literally. Not as a figure of speech.
    Byung-Ho: {irlPlayer}. FBP. I hope that's okay to say.
    He used your name at the start. Not the character's name. Your name, capitalized, at the front of a sentence that had nowhere to hide. You read it twice. You put the phone face-down and it lands on the table with a sound that is louder than it should be in a quiet room.

    You are aware that you are smiling. You are aware that you are aware of it. You are aware that none of this is about Lawrence.

- jeff >= 6:
    Byung-Ho: see you next session. Rain here tonight. Weird that I noticed.
    He texted something that was not about the game. A small true thing from a real place. You read it the way you read things that land differently than expected: once, then again, then you set the phone down and do not pick it up for a while.

- else:
    Byung-Ho: see you next session.
}
The conversation ends the way good first conversations end: before anyone runs out of things to say.

You set the phone down. Not face-down this time. Screen up, notification light breathing softly.

Somewhere on the other side of whatever city Byung-Ho lives in, a software developer is also setting down his phone. You know nothing about his apartment, his face, his life. But you know he paused before the Warden fight, and that he noticed you paused too, and that he chose to say something about it.

That is more than most people give you in a year.

+ [Tomorrow is the Tribunal.] -> act2_harbornight

=== irl_chat_close_name ===
~ jeff = jeff + 1
~ nameRevealed = true
FBP: Goodnight. And it's Ishani, by the way.
A pause. Then:

Byung-Ho: goodnight, Ishani.
He capitalized your name. He didn't capitalize anything else in the entire conversation.

You set the phone down. Not face-down this time.

+ [Tomorrow is the Tribunal.] -> act2_harbornight

=== irl_chat_decline ===
You set the phone face-down. The screen light fades against the table.

The fire does not care about notifications. The fire is doing its job. You return to it.

The game does not judge you for this. But it noticed.

+ [Tomorrow is the Tribunal.] -> act2_harbornight

=== irl_chat_r1_casual ===
FBP: Thanks. The ghost forest was intense.
Three dots. He is typing.

Byung-Ho: right?? the ghosts that bow instead of attack. did not see that coming
Byung-Ho: most games just throw combat at you and call it content. this one made me feel bad for the enemies
+ ['The Warden wasn't really a villain though, was she?'] -> irl_chat_r2_warden
+ ['Do you play a lot of RPGs?'] -> irl_chat_r2_rpgs

=== irl_chat_r1_deflect ===
FBP: How could you tell? I was mostly just clicking things.
Three dots. He is typing.

Byung-Ho: lol no. you paused before the warden fight. most people charge in
Byung-Ho: patience is a skill. I should know, I have none
+ ['Ha. I'm patient at work. Everywhere else, disaster.'] -> irl_chat_r2_work
+ ['Do you always notice how other people play?'] -> irl_chat_r2_notice

=== irl_chat_r1_honest ===
FBP: That means a lot, actually. Long day.
A pause. Longer than the others. Then:

Byung-Ho: yeah I get that. sometimes the game is the only thing that goes right
Byung-Ho: not to get heavy. just. yeah.
+ ['No, I know exactly what you mean.'] -> irl_chat_r2_know
+ ['Are you okay?'] -> irl_chat_r2_check

=== irl_chat_r2_check ===
FBP: Are you okay?
A long pause. The typing indicator appears, disappears, appears again.

Byung-Ho: lol nobody's asked me that in a while
Byung-Ho: yeah I'm good. just going through some stuff. breakup, the usual apocalypse
Byung-Ho: the game helps. playing someone who has it together, you know?
Playing someone who has it together. You glance at the Ninkasa screen still glowing on your laptop. You think about your avatar. About the version of you that fights ghosts instead of filing quarterly reports.

+ ['I get that more than you'd think. Different apocalypse, same escape plan.'] -> irl_chat_r3_escape
+ ['For what it's worth, Lawrence is really well played. I didn't know it was a performance.'] -> irl_chat_r3_lawrence

=== irl_chat_r2_know ===
FBP: No, I know exactly what you mean.
Byung-Ho: cool. that's actually really nice to hear
Byung-Ho: I do software stuff during the day. the kind where you stare at a screen and pretend the screen is meaningful. so this is like. the better screen
Byung-Ho: what's your thing? when you're not adventuring
+ ['Finance. I manage other people's risk all day. Ironic, considering I just fought ghosts.'] -> irl_chat_r3_job
+ ['Two rescue dogs and a career I picked instead of the marriage my parents wanted.'] -> irl_chat_r3_dogs

=== irl_chat_r2_notice ===
FBP: Do you always notice how other people play?
A pause. Then:

Byung-Ho: honestly? no
Byung-Ho: I'm a software dev. I usually notice the code, not the people. force of habit
Byung-Ho: but this game does something weird where the people become the point? idk. haven't figured it out yet
+ ['I think that's the design. It's sneaky.'] -> irl_chat_r3_design
+ ['I haven't figured it out either. That might be why I'm still playing.'] -> irl_chat_r3_still

=== irl_chat_r2_rpgs ===
FBP: Do you play a lot of RPGs?
Byung-Ho: too many probably. occupational hazard
Byung-Ho: I'm a dev so I play everything and enjoy nothing because I'm looking at the seams the whole time
Byung-Ho: this one's different though. I stopped looking at the seams around the time the water started moving wrong. that never happens
Byung-Ho: what about you? first RPG?
+ ['Kind of. I played one terrible MMO before this and rage-quit.'] -> irl_chat_r3_mmo
+ ['A dev? That explains how Lawrence fights. Very optimized.'] -> irl_chat_r3_lawrence

=== irl_chat_r2_warden ===
FBP: The Warden wasn't really a villain though, was she?
Byung-Ho: no she was just holding on too long. which. relatable content honestly
Byung-Ho: sorry that got philosophical for a tuesday night lol
Byung-Ho: what do you do when you're not fighting ghost choirs btw? if that's not weird to ask
+ ['Not weird. I work in finance. Very un-ghost-choir.'] -> irl_chat_r3_job
+ ['Two rescue dogs and a deadline that just ended. That's my whole personality right now.'] -> irl_chat_r3_dogs

=== irl_chat_r2_work ===
FBP: Ha. I'm patient at work. Everywhere else, disaster.
Byung-Ho: oh no what do you do
Byung-Ho: wait let me guess. something corporate that requires you to smile at people who don't deserve it
+ ['Finance. And yes. So many undeserved smiles.'] -> irl_chat_r3_job
+ ['Close enough to hurt. What about you?'] -> irl_chat_r3_him

=== irl_chat_r3_design ===
FBP: I think that's the design. It's sneaky.
Byung-Ho: right?? someone built this thing to make you care and then pretend you chose to
Byung-Ho: as a dev I'm furious. as a player I'm hooked
Byung-Ho: ok sleep time. tomorrow we go underwater and yell at a judge. the usual
+ ['The usual. Goodnight.'] -> irl_chat_close

=== irl_chat_r3_dognames ===
FBP: Potato and Sammy. Don't judge me, they came with the names.
Byung-Ho: POTATO
Byung-Ho: incredible. I would die for Potato
Byung-Ho: ok I should let you sleep. got Tribunal stuff tomorrow and I hear the boss is a real stickler for due process
+ ['Goodnight, Byung-Ho.'] -> irl_chat_close
+ ['Goodnight. And it's Ishani, by the way. Potato says hi.'] -> irl_chat_close_name

=== irl_chat_r3_dogs ===
FBP: Two rescue dogs and a career I picked instead of the marriage my parents wanted. That's my whole personality right now.
Byung-Ho: wait you chose dogs and a career over a marriage and you think YOU need the self-esteem boost?
Byung-Ho: that's the most confident thing I've heard all month. and I work with people who talk about their stock options at lunch
Byung-Ho: what are the dogs' names. this is important intel
+ ['Potato and Sammy. Don't judge me, they came with the names.'] -> irl_chat_r3_dognames

=== irl_chat_r3_escape ===
FBP: I get that more than you'd think. Different apocalypse, same escape plan.
Byung-Ho: ok that's the most relatable thing anyone's said to me in weeks
Byung-Ho: we should start a support group. "people whose coping mechanism is medieval fantasy but it's actually working"
Byung-Ho: get some rest. tomorrow there's a judge who needs talking to, and you're going to be great at it
+ ['Goodnight, Byung-Ho. Thanks for reaching out.'] -> irl_chat_close
+ ['Goodnight. And it's Ishani, by the way. For the support group roster.'] -> irl_chat_close_name

=== irl_chat_r3_him ===
FBP: Close enough to hurt. What about you?
Byung-Ho: dev. the kind that builds things other people take credit for. very rewarding, would not recommend
Byung-Ho: but the game is the thing where I actually choose what happens. so that's nice
Byung-Ho: anyway. sleep. tomorrow there's a courthouse underwater and I have to keep a straight face. goodnight FBP
+ ['Goodnight. And it's Ishani, by the way.'] -> irl_chat_close_name
+ ['Goodnight, Byung-Ho.'] -> irl_chat_close

=== irl_chat_r3_job ===
FBP: Finance. Very un-ghost-choir. Lots of spreadsheets, not enough swords.
Byung-Ho: finance and dev. we're both people who stare at things that aren't real and pretend they matter
Byung-Ho: at least here the fake stuff admits it's fake
Byung-Ho: ok I should sleep. but this was nice. most people in games don't actually talk
+ ['They don't. Goodnight, Byung-Ho.'] -> irl_chat_close
+ ['They don't. Goodnight. And it's Ishani, by the way.'] -> irl_chat_close_name

=== irl_chat_r3_lawrence ===
FBP: For what it's worth, Lawrence is really well played. I didn't know it was a performance.
A very long pause.

Byung-Ho: haha. yeah
Byung-Ho: performance. totally
Byung-Ho: anyway. get some sleep. the Tribunal awaits and I hear the judge is a real piece of work
You read "haha. yeah" three times. It is the least funny thing anyone has ever followed with "haha."

+ ['Goodnight, Byung-Ho.'] -> irl_chat_close

=== irl_chat_r3_mmo ===
FBP: Kind of. I played one terrible MMO before this and rage-quit.
Byung-Ho: oh no. which one. actually don't tell me, the list of terrible ones is infinite
Byung-Ho: respect the rage quit though. knowing when to leave is underrated as a life skill
Byung-Ho: ok I'm going to stop being accidentally deep before you think I'm weird. sleep well, see you in the Tribunal
+ ['Goodnight. And you're not weird. Much.'] -> irl_chat_close
+ ['You're not weird. And it's Ishani, by the way. Not FBP.'] -> irl_chat_close_name

=== irl_chat_r3_still ===
FBP: I haven't figured it out either. That might be why I'm still playing.
Byung-Ho: honestly same. I keep opening the game to blow things up and then someone says something real and I forget to blow things up
Byung-Ho: terrible strategy. would not recommend. 10/10
Byung-Ho: get some sleep. Tribunal tomorrow, and Clare already sent three messages about formation strategy
+ ['Tell Clare I said hi. Goodnight.'] -> irl_chat_close

=== irl_chat_reply1 ===
~ jeff = jeff + 1
Your thumbs hover. The cursor blinks. You are aware, suddenly, that you do not know this person at all. You know Lawrence. You do not know Byung-Ho. They are not the same thing.

+ ['Thanks. The ghost forest was intense.'] -> irl_chat_r1_casual
+ ['How could you tell? I was mostly just clicking things.'] -> irl_chat_r1_deflect
+ ['That means a lot, actually. Long day.'] -> irl_chat_r1_honest

=== journal ===
// ═══ JOURNALWhat You Carry With You ═══
Every choice, every silence, every moment the world shifted. This is your record. It cannot be undone, only understood.

{journal.length === 0:
    No entries yet. Your story is waiting to begin.
- else:
    /* TODO: <<for _i, _entry range $journal>> */
    _entry.title
    _entry.body
    _entry.tag
    >
}

>>>Back to where you were

-> END

=== layermap ===
// &#x1F4CD; The World &middot; Background Lore
Rhea Port sits at the convergence of three rivers and the Aegean. In better times, the current runs outward, carrying trade to the Mediterranean, returning loaded. In these times, it runs wrong.

Fish swim toward shore, not away. Along their bellies, faint marks that are not scales and not wounds: tally-symbols, the same ones you have started to notice everywhere. Ships return empty. Not raided. Not lost. Empty. Cargo intact, crew silent, holds smelling of something below the waterline nobody wants to describe twice.

The world is breaking, not from mortal war, but from divine infighting. The gods are locked in conflict and Death seized the moment to imprison the five World Guardians: Water, Sky, Stone, Sun, and Moon. Without them, seasons collapse. Crops fail. Civilizations fray.

The goddess Net gathered four unlikely allies and offered each the one thing they believe they want most. Each accepted for deeply personal, and deeply flawed, reasons.

+ [Back to the bar.] -> mostor_firstimpression

=== mostor_accept_ask ===
~ lawrence = lawrence + 1
Lawrence looks up from the chart for the first time. One look at her. Then back to the chart.

# speaker: Lawrence
"You already have it."
+ [Finish your drink and prepare to leave.] -> mostor_waystone

=== mostor_accept_look ===
~ tiberius = tiberius + 1
~ flow = flow + 1
You look around the bar. Ship-timber ceiling. Privacy alcoves along the back wall. Tiberius calls them "confession booths." A quest board near the entrance, curated; some notices have been pulled down. An empty stool at the far end of the bar. Nobody sits in it.

# speaker: Tiberius
"(watching you look) Most people don't notice the stool."
He doesn't explain further. He pours you a second drink. This one is better than the first.

+ [Prepare to leave.] -> mostor_waystone

=== mostor_accept_quick ===
~ fang = fang + 1
~ dex = dex + 1
# speaker: Fang
"(a grin) There it is."
Lawrence is caught watching the exchange. He looks back at the chart one beat after he should have.

+ [Finish your drink and prepare to leave.] -> mostor_waystone

=== mostor_briefing ===
// 📍 Mo Stór · The Briefing Table
Tiberius pours without being asked. Lawrence places one hand flat on the table. A fragment of harbor chart, annotated in his own writing, densely, in three languages.

He does not look up.

# speaker: Lawrence
"The Goddess Water is imprisoned below this port. The harbor dies because she is held. Her mother, the Goddess Net, has the power to tear this port open and pull her free. She does not, because doing so would finish what Death started. Net tasked us instead: four mortals and near-mortals who can move through the wreckage without becoming it. Entrance at the furthest dock, low tide, sea-cave mouth. You read the marked one before you engaged him. Most people don’t. We need a fourth. Those two facts are related."
A beat.

# speaker: Fang
"He’s been saying that last part for six hours."
# speaker: Lawrence
"Four times."
# speaker: Fang
"(to you) See, that’s the part that concerns me."
# speaker: Tiberius
"(from behind the bar) Take the job. They’re going to get themselves killed otherwise, and I just restocked."
+ ['I'm in. What do I need to know?'] -> mostor_accept_ask
+ ['I'm in.' (No questions.)] -> mostor_accept_quick
+ ['Give me a minute.' (Look around the bar.)] -> mostor_accept_look

=== mostor_descent ===
// ═══ ACT 0: MO ST&Oacute;RThe Bar Below the Street &middot; Rhea Port &middot; Gulf of Smyrna ═══
// &#x1F4CD; Rhea Port &middot; Stone Steps &middot; Descending
Stone steps. Old ones, worn smooth by centuries of feet that knew where they were going. You descend.

From the street level behind you, still audible: the particular anxiety of a port city that has forgotten how to breathe. Gulls. Vendors. The sound of water running wrong — inward, toward shore, not out. Between the market stalls above, something flickers. Translucent figures, faint as heat shimmer. They drift east, always east. The dock workers move through them without breaking stride. This has been happening long enough that the living have stopped seeing it.

You see it. You have always seen it. You are still not sure what that means about you.

Below: warmth. The crackle of a fire. The murmur of voices. The clink of glass on wood.

The transition is physical. A heavy door. Carved with a single line in Old Elvish that nobody can fully translate. You push it open.

+ [Enter the bar.] -> mostor_firstimpression

=== mostor_firstimpression ===
~ moStorVisits = moStorVisits + 1
// &#x1F4CD; Mo St&oacute;r Tavern & Inn &middot; Below Street Level

Low ceilings. Ship-timber supports salvaged from trade vessels that made this port famous. A fire that has been burning long enough to be personal. Behind the bar, a Dark Elf with amber-gold eyes polishes a glass that is probably already clean. He glances at you. Files you. Returns to the glass.

The bar is half-full. Locals. Merchants. A woman in the corner sharpening a blade while telling a joke to nobody in particular — the joke is for her own benefit and she knows it. A very large bear at a table designed for people who are not bears, holding a wine glass with improbable delicacy, staring at the ceiling beams with an expression that has nothing to do with architecture.

At the far end of the bar, a man. Not facing the room. Back to the wall, positioned so that every entrance, every table, and every exit falls within his sightline without him appearing to look at any of them. His drink is in front of him. Untouched. This is not because he forgot it was there. He has not forgotten anything in a very long time.

You came for the briefing. You are looking at him instead.

# speaker: Tiberius
"You’re the fourth. … They said you’d be here an hour ago. But then, they’ve been here since yesterday, so the concept of ‘on time’ has lost some meaning."
+ [‘Sorry I’m late.’] -> mostor_late
+ [‘Which ones are mine?’] -> mostor_which
+ [‘Nice place.’] -> mostor_niceplace
>>Optional lore &middot; does not advance the scene

-> END

=== mostor_late ===
~ flow = flow + 1
# speaker: Tiberius
"Don't be. Late means you had something worth finishing first."
He places a drink in front of you without being asked. Warm, spiced, non-committal. "On the house. First night."

+ [Meet the party.] -> mostor_meetfang

=== mostor_lawrence_briefing ===
~ flow = flow + 1
# speaker: Lawrence
"(recalibration; he respects efficiency) I do."
+ [The briefing.] -> mostor_briefing

=== mostor_lawrence_door ===
~ dex = dex + 1
# speaker: Lawrence
"It usually is."
+ [The briefing.] -> mostor_briefing

=== mostor_lawrence_exits ===
~ lawrence = lawrence + 1
# speaker: Lawrence
"(recognition, something shifts behind his eyes) Yes. So do I."
+ [The briefing.] -> mostor_briefing

=== mostor_meetfang ===
# speaker: Fang
"Finally. I was running out of people to talk to."
# speaker: Tiberius
"(not looking up) You were talking to me."
# speaker: Fang
"I was talking at you, Tibby. Different thing."
# speaker: Tiberius
"Please don't call me that."
# speaker: Fang
"Noted, Tibby."
The wolf puppy in Fang's shoulder sling opens one eye, orients toward you with an attentiveness no ordinary wolf pup would have, then closes it again. Fang doesn't notice.
~ familiarSignalCount = familiarSignalCount + 1

She is exactly what you imagined and nothing like what you expected. Broad grin. Two blades visible: long blade cross-drawn on her back, a shorter curved blade at her hip. A throwing knife on the other hip. Insurance. She fills the room the way a campfire fills a clearing.

+ [Match her energy. Grin back.] -> mostor_meetfang_grin
+ [Look at the wolf puppy.] -> mostor_meetfang_puppy
+ [Meet Marcus.] -> mostor_meetmarcus

=== mostor_meetfang_grin ===
~ fang = fang + 1
# speaker: Fang
"(genuinely delighted) Okay. I like you already."
+ [Meet Marcus.] -> mostor_meetmarcus

=== mostor_meetfang_puppy ===
~ fang = fang + 1
~ familiarSignalCount = familiarSignalCount + 1
# speaker: Fang
"(glancing down, surprised) Most people don’t notice him first."
The wolf puppy opens one eye again. It looks between you and Fang with the attention of something that is not deciding whether to trust you. It already decided. It is waiting for Fang to catch up.

# speaker: Fang
"He’s got better instincts than I do. And I have excellent instincts."
+ [Meet Marcus.] -> mostor_meetmarcus

=== mostor_meetlawrence ===
# speaker: Fang
"(quieter) That's Lawrence. He's... processing. Give him a second."
Lawrence turns. Not all at once. He finishes whatever thought he was holding, sets it down, and looks at you. Up close, he is more unsettling than he looked from a distance. Not because he's threatening. Because he looks like someone who has already made all the relevant calculations about you and is deciding what to do with the results.

# speaker: Lawrence
"You noticed the stairs. Most people use the main entrance on the street level. You came down the old customs steps. That's the longer route."
+ ['I like knowing where the exits are.'] -> mostor_lawrence_exits
+ ['The door was more interesting.'] -> mostor_lawrence_door
+ ['Fang said you had a briefing?'] -> mostor_lawrence_briefing

=== mostor_meetmarcus ===
# speaker: Marcus
"(with senatorial gravity) Welcome. You'll want to sit. The quest briefing is... extensive."
# speaker: Fang
"What he means is Lawrence has been sitting with that chart for six hours waiting for someone he thinks is worth the four sentences."
Marcus's ears tilt once. He says nothing further. The wine glass looks absurd in bear paws and yet he holds it with the precision of someone who once held the Roman Senate's attention for three hours without notes.

He looks up at the ceiling beams with an expression that has nothing to do with architecture and everything to do with memory.

# speaker: Marcus
"(to you, privately) This timber. Pontic oak. They stopped growing at this latitude six hundred years ago. Tiberius has been here longer than the trees remember."
He returns to his wine. The observation sits in the air like something you were not supposed to hear but were meant to.

+ [Meet Lawrence.] -> mostor_meetlawrence

=== mostor_niceplace ===
~ tiberius = tiberius + 1
# speaker: Tiberius
"... Thank you."
He picks up a glass that is already clean and polishes it. Once. Brief. Then places a drink in front of you without being asked. Warm, spiced, non-committal. "On the house. First night."

+ [Meet the party.] -> mostor_meetfang

=== mostor_waystone ===
// 📍 Mo Stór · The Door
The party gathers. Fang checks her blades. Marcus rises, which is an event, spatially.

Then Lawrence moves.

He does not announce it. He simply stands, turns from the bar, and crosses the room. That is the entirety of what happens, and it is enough to pull every eye in Mo Stór without him asking for a single one. The spine is soldier-straight, shoulders back, the posture of someone who learned to carry himself like that a very long time ago and never stopped. The walk is unhurried. Each step exactly where he intends it, weight forward and controlled, the economy of a man who has been fighting and moving and surviving long enough that waste is simply not part of how his body works. There is something of the fencer in it. Something of the dancer. The elegance is not ornamental. It is a thousand years of knowing where the threat is and refusing to be surprised by it.

The people have stopped their conversations without deciding to. He does not look at them. He does not look at you. He reaches the door, opens it, and waits without appearing to wait, his gaze already on the street outside, already in the next thing.

Fang appears at your shoulder.

# speaker: Fang
"He does that every time. Don’t read into it."
A beat.

# speaker: Fang
"(quieter, to herself) Or do. I don’t actually know anymore."
Before you leave, Tiberius produces a small stone token from behind the counter and places it in your hand. It is warm. It should not be warm.

# speaker: Tiberius
"If you need to come back, hold this and mean it. ... It only works if you mean it. I've had adventurers try to use it because they wanted a cheaper inn. It knew."
{drinkFinished:
    Tiberius notices you finished your drink. He files this.
}
You pull the pouch that's hanging around your neck out from under your tunic and slip the token inside. Then you tuck the pouch back out of sight.

+ [Climb the stairs and head to the dock.] -> act0_rheaport

=== mostor_which ===
~ dex = dex + 1
# speaker: Tiberius
"The wolf, the shadow, and the bear. You'll know which is which in about three seconds."
He places a drink in front of you without being asked. Warm, spiced, non-committal. "On the house. First night."

+ [Meet the party.] -> mostor_meetfang

=== kai_marketplace ===
~ kaiMet = true
// &#128205; Samarkand Caravanserai Courtyard &middot; Late Afternoon &middot; Departure Hour
Old Acquaintance

The courtyard is dense: four languages of signage, cardamom and iron and livestock overlapping. Everyone watching everyone for advantage. The crowd at the gate is thickest. You move toward it.

Someone is moving through the crowd the way people move when they have been watching it for a while. Not against the flow. With it, but slightly ahead, reading it. He sees Lawrence first.

A pause. A specific smile. The smile of someone who finds something genuinely entertaining.

# speaker: Kai
"Well. A man I thought the world had gotten tired of."
Lawrence does not turn around immediately. When he does, it is deliberate. The turn is too controlled to be casual.

# speaker: Lawrence
"Kai."
# speaker: Kai
"You said that like it costs you something."
Then he sees you. His attention moves: Lawrence first, then you. The sequence matters. He is not interested in you independently of that sequence.

He looks back at Lawrence with an expression that is a question dressed as a statement.

Something changes in the way he is standing. Not dramatically. The weight shifts to one hip. His shoulders settle back half an inch. It is the physical equivalent of someone deciding to be interesting on purpose, and the decision takes under a second. He has just recalibrated the entire encounter. You are no longer incidental to a conversation with Lawrence. You are the conversation.
# speaker: Kai
"Still carrying that old heartbeat around? (looks him up and down) I thought by now it would’ve stopped."
Lawrence’s hand moves fractionally toward his sternum. Controlled in under two seconds. Not a full gesture: a reflex suppressed.
Fang has gone very still. Not her combat-still. Not her worry-still. The observational stillness of someone who is recategorizing something she has seen before, from a different angle.

Kai turns to you. He introduces himself the way people introduce themselves when they already know the answers to every question they are about to ask.

# speaker: Kai
"You’re traveling with him. (nods at Lawrence) And you’re still here. That’s either impressive or alarming. I’ve never decided which. (focus arriving too warm, too fast) Which are you?"
+ [‘I’m still deciding.’ (Playful.)] -> kai_playful
+ [‘I don’t think that’s any of your business.’] -> kai_boundary
+ [(Step back toward Lawrence. Not a request: a choice.)] -> kai_stepback
+ [(Say nothing. Let Lawrence handle it.)] -> kai_lawrencehandles

=== kai_playful ===
// &#128205; Samarkand Caravanserai Courtyard
Kai laughs. A genuine laugh, not performed. Whatever he expected, this was not it.

# speaker: Kai
"Fair answer. Most people pick one and defend it."
He glances at Lawrence. Lawrence says nothing. Fang’s jaw is doing something very controlled.

# speaker: Kai
"I like that. (to Lawrence, not unkindly) You’ve improved your taste."
Lawrence’s voice drops half a register.

# speaker: Lawrence
"Was there something you needed, Kai?"
The question is the minimum number of words that terminates an exchange without being openly hostile. Six words. The economy is the signal: he wants this over in a way that is specific to this person and this moment.

+ [The exchange reaches its natural end.] -> kai_postscene

=== kai_boundary ===
~ kaiBoundarySet = true
~ lawrence = lawrence + 1
// &#128205; Samarkand Caravanserai Courtyard
A beat. Kai holds your gaze. Reading something.

# speaker: Kai
"Fair."
He means it. He looks at Lawrence.

# speaker: Kai
"I like her."
Lawrence’s expression does not change. This is, itself, information.

# speaker: Kai
"Relax. I’m not going to be a problem."
# speaker: Lawrence
"You’ve never decided that based on whether it was a problem."
# speaker: Kai
"(considers) True. But circumstances change."
+ [The exchange reaches its natural end.] -> kai_postscene

=== kai_stepback ===
~ lawrence = lawrence + 1
// &#128205; Samarkand Caravanserai Courtyard
You step back. Not a request for rescue. A choice. A direction.

Lawrence steps forward. Marginally. Half a pace.

That marginal step is the tell.

Kai sees it. His expression shifts, just slightly, just for a second. Something recalibrated.

# speaker: Kai
"(to Lawrence, quietly) Interesting."
# speaker: Lawrence
"We’re passing through. Not available."
# speaker: Kai
"You’re always passing through. That’s never stopped you before."
# speaker: Lawrence
"No. It hasn’t."
He does not add to this. The "no, it hasn’t" plus the half-step is the whole speech.

+ [The exchange reaches its natural end.] -> kai_postscene

=== kai_lawrencehandles ===
~ lawrence = lawrence + 1
// &#128205; Samarkand Caravanserai Courtyard
You say nothing. You let Lawrence read the room.

He does.

# speaker: Lawrence
"We’re eastbound. Not stopping."
Six words. The economy of his response is the whole tell. He would normally deploy more architecture than this. The minimum-viable termination is the signal that he wants this conversation over in a way that is specific to this person and this moment.

# speaker: Kai
"(to you, around Lawrence) He always gets concise when he’s annoyed. Or when something matters. I was never completely sure which was which."
# speaker: Kai
"(to Lawrence) Safe road, then. The desert’s been strange."
# speaker: Lawrence
"I know."
+ [The exchange reaches its natural end.] -> kai_postscene

=== kai_postscene ===
// &#128205; Samarkand Caravanserai Courtyard &middot; After
Kai moves off into the market without saying goodbye. This is consistent with who he is.

Fang waits until he is definitely out of earshot.

# speaker: Fang
"(to Lawrence, very quietly, not looking at him) You have an interesting face right now."
# speaker: Lawrence
"I have no face right now."
# speaker: Fang
"That’s the interesting part."
She walks toward a spice stall. Just before she is out of earshot, almost to herself, not for him:

# speaker: Fang
"(quietly) I’ve seen it before."
Lawrence does not respond. He does not turn. His jaw sets once, then releases. He knows what she means. So does anyone who has been paying attention.

She used the same quiet she uses when something real is happening to her, to describe him. The player who has been tracking Fang’s tells will file this without being told to.
Marcus falls into step beside Lawrence. He does this with senatorial precision: the exact distance that says "I am available but not demanding."

# speaker: Marcus
"Old friend?"
# speaker: Lawrence
"Old acquaintance."
# speaker: Marcus
"Those are never the same thing."
Beat.

# speaker: Lawrence
"No."
/* TODO: <<heartbeat "Old acquaintance. Marcus exchange. Lawrence involuntary reveal. Full 12 bars, earned.">> */

~ xp = xp + 15
+ [Take the desert road east.] -> act4_desertentry

=== kai_combat ===
~ kaiCombatTriggered = true
// &#128205; Samarkand Caravanserai Courtyard &middot; Escalation
A Problem After All

Something in the exchange tips over. The marketplace crowd widens without being asked: they recognize the shift before it becomes a fight.

Kai is non-immortal but not weak. Two hundred years of raw predatory instinct without Lawrence’s discipline. Faster and less predictable. He is not trying to kill anyone. He is genuinely having fun, which is somehow more dangerous.

Lawrence’s combat voice drops lower than usual. Clipped even beyond his standard register. Marcus’s ears tilt once and do not tilt back.

{noRecoveryUnlocked:
    + [Fight. Push through.] -> kai_combat_pushthrough
    + [No Recovery Fracture: step back.] -> kai_combat_norecovery
- else:
    + [Fight. The party handles it.] -> kai_combat_pushthrough
}

=== kai_combat_pushthrough ===
~ xp = xp + 20
// &#128205; Samarkand Caravanserai &middot; Post-Combat
The fight is short and leaves bruises on everyone’s dignity. Kai has a split lip and an expression of someone who found this more satisfying than expected.

# speaker: Kai
"(genuinely pleased) Good. Better than I expected."
# speaker: Fang
"Wonderful. Our vampire critic has issued a review."
# speaker: Kai
"(to Lawrence) She’s better than you too, by the way. In case you needed to hear it."
Lawrence says nothing. This is also a tell.

Kai takes a different exit from the courtyard without saying goodbye.

+ [Regroup. Marcus exchange.] -> kai_postscene

=== kai_combat_norecovery ===
~ kaiNoRecoveryWitnessed = true
~ xp = xp + 20
// &#128205; Samarkand Caravanserai &middot; No Recovery Fracture
You step back. The party closes in.

Kai stops.

His performance-charisma drops for one second. The easy confidence goes quiet. He looks at you: not at Lawrence, not at Fang. At you.

# speaker: Kai
"…Hm."
Then it’s back. The smile. The register. The whole architecture of him, reassembled in under two seconds.

He takes a different exit without saying goodbye.
+ [Regroup. Marcus exchange.] -> kai_postscene

=== act8_hexicorridor ===
// 📍 Hexi Corridor, Gansu Province -- Road East of the Thousand Caves
The Last Pass Under Heaven

The Hexi Corridor: a narrow band of habitable land between the Qilian Mountains to the south and the Gobi to the north. The party exits the Thousand Caves into the fullest daylight they have seen since the journey began. It should feel like relief.

It does not feel like relief.

The light is too bright. Too flat. Too consistent. No shadows move. Nothing shifts with the time of day. The sun is technically present and producing no warmth. The world is visible and cold. A painting of daylight, not daylight itself.

# speaker: Fang
"(stopping, squinting) Is it always this bright here?"
# speaker: Marcus
"No."
# speaker: Fang
"That's Sun."
# speaker: Marcus
"Sun's imprisonment. The light is present. What it does with the light is the part that's missing."
Lawrence is already walking east. He named the Guardians at the cave threshold and stopped after Moon. He does not name them again now. He simply walks in the direction of what he did not say.

Fang falls into step beside you. She knows this road. She is not saying so. She stops at a junction and takes the eastern fork without checking the signpost -- not because the signpost is wrong, but because she already knows which road has the better footing past the junction. Marcus notices. Lawrence is twenty meters ahead and does not appear to notice, which means he noticed.

+ [The Zhangye outpost.] -> act8_zhangye

=== act8_zhangye ===
// 📍 Zhangye Outpost -- Hexi Corridor midpoint
Soldiers of the Same Order

The outpost sits where the road narrows between two ridgelines. Four soldiers on gate duty. A commander at the post-house. The fort's insignia is still current -- they have been maintaining everything. Their armor is clean. Their weapons are maintained. Their eyes have the specific quality of people who have been alert for so long that alertness has become a substitute for purpose.

# speaker: Fang
"(low, to you) They're not hostile. They're thorough. There's a difference."
# speaker: Marcus
"(reading the post) They were ordered to hold this position until the seasonal cycles normalized. The seasonal cycles have not normalized. They are holding."
# speaker: Fang
"For how long?"
# speaker: Marcus
"The date on the last supply record is two years ago."
A pause. Lawrence, from the back of the group: "Then they have been waiting for permission to stop for two years. Whether we give them that permission or fight our way through is a question of efficiency and decency, in that order."

The soldiers at the gate have seen you. They are moving into position. Not attacking. Checking. Their protocol is beginning.

{marcus >= 3:
    + [Marcus: Name the flaw in their orders.] -> act8_zhangye_negotiate
}
{fang >= 4:
    + [Fang: The bypass.] -> act8_zhangye_reroute
}
+ [Fight through.] -> act8_zhangye_combat

=== act8_zhangye_negotiate ===
~ marcus = marcus + 1
~ xp = xp + 30
// 📍 Zhangye Outpost -- Gate
Marcus steps forward. He is not deploying the senatorial register. He is using something quieter: the voice of a person who has held a post past its purpose and knows exactly what that costs.

# speaker: Marcus
"Your orders were to hold until the seasonal cycles normalized. The seasonal cycles have not normalized because the Sun Guardian is imprisoned. We are here to free the Guardian. When we succeed, the seasons will normalize, and your orders will be fulfilled. You are holding a position that preserves the problem you were posted to solve."
The soldiers look at each other. The commander comes out of the post-house.

# speaker: Marcus
"(to the commander, quieter) I have held posts past their purpose. I know what it costs. Your soldiers are ready to be finished. Let them be finished."
A long silence. The commander looks at the post roster. At his soldiers. At the road east.

# speaker: Commander
"We were waiting for someone to tell us we could stop."
# speaker: Marcus
"You can stop."
The commander closes his eyes. He has been waiting to hear that for two years. He opens them again and steps aside.

+ [The Rainbow Mountains.] -> act8_rainbowmountains

=== act8_zhangye_reroute ===
~ xp = xp + 15
// 📍 Zhangye -- Caravanserai Bypass
Fang takes the east fork before the main outpost road, following a path that cuts through a dry streambed behind the garrison buildings. The path is narrow, barely wide enough for Marcus in human form. It is also completely hidden from the outpost gates.

# speaker: Marcus
"How do you know this path?"
# speaker: Fang
"I know this road."
She does not elaborate. Marcus does not press. Lawrence, behind both of them, says nothing. He has been cataloguing the things Fang knows on this road and not asking about them, and he will continue to catalogue them and not ask about them until she decides to explain, which she may or may not do.

The bypass adds half a day. Nobody comments on this either.

+ [The Rainbow Mountains.] -> act8_rainbowmountains

=== act8_zhangye_combat ===
~ xp = xp + 20
// 📍 Zhangye Outpost -- Fight
The soldiers fight with the muscle memory of long training and the particular distraction of people who are not certain what they are fighting for. They are well-drilled and not fully present. Both things are true.

Lawrence cannot use shadow magic -- the flat sourceless light in the Corridor has been thinning his toolkit since the Thousand Caves exit. He fights at half-efficiency. Fang compensates. Marcus reads the ground.

Non-lethal path available: subdue rather than kill. The soldiers are not Death's agents. They were posted here and the world changed around them.

# speaker: Fang
"(after) They were just waiting for orders."
# speaker: Lawrence
"Most people are. That does not make the orders correct."
# speaker: Fang
"It makes them sad."
+ [The Rainbow Mountains.] -> act8_rainbowmountains

=== act8_rainbowmountains ===
// 📍 Zhangye Danxia -- The Rainbow Mountains
Colors Without Warmth

The iron oxide bands of rock: red, amber, ochre, gold. In functioning sunlight they are extraordinary. In Sun's captured light they are present but inert. The colors are correct and lifeless. A painting of a sunrise instead of a sunrise.

# speaker: Marcus
"I have seen this range in every season for forty years."
# speaker: Lawrence
"(at the cliff edge, looking at the wrong light) I have seen it across four centuries. It has never looked like this."
A pause.

# speaker: Lawrence
"That is the correct response to something missing."
He is talking about the mountains. He is talking about other things. His hand starts toward his sternum -- and stops. He holds it still at his side. The gesture does not arrive.
This is the mandatory rest before the fort. No combat. The party camps at the base of the red cliffs.

Fang at the cliff face, cleaning the Samarkand blade. The hilt cloth is loose. The letter is visible. The hilt cloth with Jiwon's letter wrapped inside it, where it has been since Samarkand.

{fang >= 7:
    + [(Fang Bond 7+) Say something.] -> act8_rainbowmountains_fangbeat
}
+ [Let the rest continue in silence.] -> act8_lastcaravanserai

=== act8_rainbowmountains_fangbeat ===
~ fang = fang + 1
~ xp = xp + 25
// 📍 Rainbow Mountains -- Rest Scene
You sit beside Fang. Not close enough to intrude. Close enough that she knows the sitting is intentional.

She is tightening the hilt cloth over the letter. She pauses. She knows you can see what she is doing.

# speaker: Fang
"She came through here in autumn. The red was different in autumn."
She does not say who. She does not need to. Jiwon's caravan route ran through the Hexi Corridor. Autumn was one of the three seasons she traveled it. Fang walked beside the cart while Jiwon catalogued the rock colors for the hanji-buyers she knew in Luoyang who wanted paper dyed the specific red of Zhangye at golden hour.

Fang finishes tightening the hilt cloth. She sheathes the blade.

# speaker: Fang
"The letter is still in there. In case you were wondering. I have not opened it."
{avatarName}: "I know."
# speaker: Fang
"(quiet) I'm going to. I think. Soon."
She does not say when. She does not say what is in it. She says soon, and she means it, and that is more than she has said about the letter in the entire journey.

+ [The last caravanserai.] -> act8_lastcaravanserai

=== act8_lastcaravanserai ===
// 📍 Last Caravanserai -- Two li from Jiayuguan Fort
Someone Has to Be Here

The final caravanserai before the fort. Still open. Still staffed by a single innkeeper who has not left in three years because someone has to be here when travelers need to rest before the gate. She has the resigned pragmatism of a person who decided that presence was enough of a purpose.

She sets out bread and tea without being asked. She has seen enough travelers to know what people need before they walk through a gate they may not come back through.

Fang knows which room has the best ventilation before being assigned it. She catches herself knowing and covers the recognition with a routine question about water supplies. The innkeeper answers without looking up from her ledger. Lawrence appears not to notice this. He is getting very good at appearing not to notice things.

# speaker: Innkeeper
"(to Fang, not looking up, unprompted) The Korean merchant. You were with her for three seasons."
Not a question. A memory, stated plainly.

# speaker: Fang
"Yes."
# speaker: Innkeeper
"She was a good guest. Always paid in full. Left the rooms clean. The ginseng she left for my daughter's cough -- I still have some."
A pause. She closes the ledger. Sets her brush down.

# speaker: Innkeeper
"I was sorry to hear."
# speaker: Fang
"Yes."
That is the entire exchange. The innkeeper picks up her brush again and returns to the ledger. Fang turns to the window. The door to the room is still open.

Lawrence moves to stand beside Fang. He does not speak. He is simply there -- the specific presence of a person who has decided that standing in the same place as someone is the most honest thing available. He does not touch her. He does not perform comfort. He is there, and she knows he is there, and neither of them says anything.

# speaker: Fang
"(very quiet) Don't."
# speaker: Lawrence
"I'm not doing anything."
# speaker: Fang
"I know. Keep not doing it."
He stays. The room holds them both. Two hundred years of friction that has become something without a name: not friendship, not forgiveness, not rivalry. Two people who have lost the same person, at different removes, in different ways, and the only honest response is to be in the same place.

Marcus, in the courtyard, does not come inside. He does not need to. He has been doing this since the Weight Room.

+ [Jiayuguan.] -> act8_fortapproach

=== act8_fortapproach ===
// 📍 Hexi Corridor -- Final Approach to Jiayuguan
The Last Gate

The fort sits at the narrowest point of the Hexi Corridor. Three concentric walls of rammed earth and brick. Two watchtowers. The light here is the flattest yet -- the walls reflect it back in every direction, creating a space with no shadows at all.

The west gate is open. Nothing guards it.

# speaker: Fang
"The gate is open."
# speaker: Marcus
"Yes."
# speaker: Fang
"That's wrong."
# speaker: Marcus
"Yes."
Lawrence is reading the gate's architecture. His hands are behind his back. His voice, when it comes, is the voice he uses when something is precise enough to be almost interesting: "The gate is open because she is not holding the fort. She is past the fort. Whatever she set here is between us and her, but she is not in it. She is in the desert beyond the east gate."

An inscription above the gate: through this gate, you do not return.

# speaker: Fang
"(reading it) Cheerful."
# speaker: Lawrence
"It was accurate for most people who walked through it."
# speaker: Fang
"And for us?"
# speaker: Lawrence
"We have walked through worse gates. The inscription does not know us."
+ [Enter the fort.] -> act8_level1_westgate

=== act8_level1_westgate ===
// 📍 Jiayuguan Fort -- West Gate / Outer Walls
Level 1: The Gate That Should Not Be Open

The outer ward is intact. The walls are maintained. The flags are still on the signal tower. The parade ground has been swept, recently, by someone who has been maintaining the fort out of something that is not duty and is not hope but functions like both.

The party spreads out instinctively. Four people reading a space that should contain hundreds. Marcus reads the ground through his boots. Fang reads the walls. Lawrence reads the flags on the tower.

# speaker: Lawrence
"The flags are running a message. The same pattern for -- (pause) -- for a very long time. Those are astronomical notations."
# speaker: Marcus
"Can you read them?"
# speaker: Lawrence
"Not fully. The notation system is specific to Joseon court astronomy. I recognize the structure but not all the symbols. Someone with access to the archive would be able to read them completely."
He notes this without pressing it. The archive is ahead. He is the only one who already knows there is an archive.

+ [The outer garrison.] -> act8_level2_garrison

=== act8_level2_garrison ===
// 📍 Jiayuguan Fort -- Outer Garrison
Level 2: Soldiers of Habit

The garrison soldiers are here. Fewer than the fort was designed to hold -- perhaps a dozen. They are running the same rotations they have always run. Their post has been maintained with the specific care of people who have replaced purpose with procedure.

They are not Death's agents. They were posted here, the disruption happened, and they could not leave because their orders had not been rescinded.

They see the party. They move into position. The protocol begins.
{marcus >= 3:
    + [Follow their protocol exactly.] -> act8_level2_nonlethal
}
+ [Fight through. Non-lethal.] -> act8_level2_nonlethal
+ [Fight through.] -> act8_level2_lethal

=== act8_level2_nonlethal ===
~ xp = xp + 35
// 📍 Jiayuguan Fort -- Garrison, Resolved
The soldiers are subdued without permanent harm. The commander is last -- he is better trained than his soldiers and fighting with the specific ferocity of someone who has nothing left except the post he was given and the dignity of holding it.

When he goes down, he stays down. Not dead. Waiting.

# speaker: Marcus
"(kneeling beside him) We are here to free the Sun Guardian. When we succeed, your orders will be fulfilled. You can stop."
The commander opens his eyes. He looks at the ceiling of the garrison hall. At the flags outside. At Marcus.

# speaker: Commander
"We were waiting for someone to tell us we could stop."
# speaker: Marcus
"You can stop."
He closes his eyes again. Something in his face that has been held tight for two years releases.

+ [The signal tower.] -> act8_level3_tower

=== act8_level2_lethal ===
~ xp = xp + 20
// 📍 Jiayuguan Fort -- Garrison, Cleared
The soldiers fight to the end. They are well-trained and they believe in the post they were given even when the post no longer serves anything. The combat is efficient. It is also sad in the specific way that things are sad when they did not have to happen.

# speaker: Fang
"(after, quiet) They were just waiting for orders."
# speaker: Lawrence
"Most people are."
Lawrence does not add anything to this. Fang does not ask him to. The garrison has no more soldiers.

+ [The signal tower.] -> act8_level3_tower

=== act8_level3_tower ===
// 📍 Jiayuguan Fort -- Signal Tower
Level 3: The Message She Sent Herself

The signal tower gives the full fort view. From the ground, the flags looked mechanical -- stuck in a loop. From up here, the pattern is legible as text. Astronomical notation: a specific system developed for Joseon court records.

Lawrence, at the tower railing: "The notation is Joseon royal observatory standard. Late 14th century. The message is partially legible to me." He pauses. "Fully legible to anyone who has read her archive. Which we have not done yet."

The partial reading Lawrence can extract: *The calculations were correct. The system changed. The fault was not --* The last phrase is in a notation variant he cannot parse without the archive key.

# speaker: Marcus
"She set the flags before she went into the desert."
# speaker: Lawrence
"Yes. This was the last thing she did inside the fort. She ran the flags, and then she walked through the east gate, and Death was waiting."
# speaker: Fang
"She was leaving herself a note."
# speaker: Lawrence
"(quiet) It would appear so."
The flag pattern is also a navigation key: the sequence points to the postern gate's location. The party does not know they need the postern yet. They will.

+ [The inner ward.] -> act8_level4_innerward

=== act8_level4_innerward ===
// 📍 Jiayuguan Fort -- The Inner Ward
Level 4: Full Visibility

The inner ward of Jiayuguan has no shadows. The light comes from everywhere simultaneously. The walls, the ground, the sky above the courtyard -- all equally lit, equally flat, with no direction. No angles. No edges. Nowhere to stand that is not equally and perfectly visible.

For Lawrence: his shadow manipulation requires angles, depth, darkness at margins. The inner ward has none of these things. He is fighting in the one environment purpose-built to remove everything he uses.

The Binding Frame's overflow fills the ward: light constructs, not sentient, not conversational. They cannot be reasoned with. They can only be outlasted. They move in straight lines through the flat light, which means they are entirely predictable and still dangerous because there is nowhere to step that is not their path.

# speaker: Lawrence
"(grimly, mid-combat, adapting in real time) I have approximately three approaches remaining that do not require shadows. I am going to need a moment to remember which ones they are."
# speaker: Fang
"This would be funny under different circumstances."
# speaker: Lawrence
"I am choosing to find it funny under these circumstances. It is either that or admit the light is winning."
# speaker: Fang
"Is it winning?"
# speaker: Lawrence
"Not yet."
He is using cold-body physics as an advantage -- the constructs track heat signatures and he runs cold. He is using reach without angle, which is inefficient and effective. He is using a thousand years of having been in worse situations and choosing to find them slightly amusing.
No Recovery Fracture available if HP falls below 30%.

+ [The archive.] -> act8_level5_archive

=== act8_level5_archive ===
// 📍 Jiayuguan Fort -- The Archive Room
Level 5: The Evidence of Precision

Seo Yun-ji's workspace. Twenty years of astronomical records organized with the care of someone who believed precision was a form of love. The calculations that failed are here. And next to them, the records from before the disruption, which show that her methodology was flawless across eighteen years of accurate seasonal prediction.

The disruption was not her fault. The system changed. She did not have the information to know the disruption was external. She has been in the desert for two years blaming herself for something that was not hers to carry.

Marcus reads the records. This takes time. He is eighteen hundred years old and has been watching astronomical record-keeping since before some of these civilizations existed, and he reads with the specific attention of someone who is looking at work they recognize as excellent.

# speaker: Marcus
"She was correct. Every calculation she made was correct for the system she was working within. The system was disrupted and she did not have the information to know the disruption was external. Her methodology is flawless. Her data is accurate. The fault was not in the math."
# speaker: Fang
"So she's been in the desert for two years because she blamed herself for something that wasn't her fault."
# speaker: Marcus
"Yes."
# speaker: Fang
"That seems like a very specific kind of hell."
A pause. Lawrence, looking at the records, has not spoken.

# speaker: Lawrence
"It is a very common one."
He is not looking at Seo Yun-ji's records anymore.

The party rests here. Mandatory. The archive is the only room in the fort with warmth -- residual, from years of people working in it with lamps and bodies and the heat of concentration. The warmth is Seo Yun-ji's, left behind.

The full signal flag message is now decodable: *The calculations were correct. The system changed. The fault was not in the math. I did not know this when I left.*

She wrote it before Death found her. Before the story that fit. The flags are the exoneration she sent herself and did not believe.

+ [The east gate.] -> act8_level6_eastgate

=== act8_level6_eastgate ===
// 📍 Jiayuguan Fort -- The East Gate
Level 6: Sealed With Light

The east gate passage is blocked by a wall of light. Not metaphorical. Solid, sourceless, the color of noon at high altitude. It fills the gate passage completely from floor to arch to side walls.

Lawrence tries three approaches. Each one fails cleanly, which is more useful than failing messily -- he learns the shape of what he is dealing with.

# speaker: Lawrence
"It is keyed to her. Not to the fort. It opens when she chooses to open it, or when we reach her by another route."
# speaker: Fang
"There is no other route. The corridor walls are solid. The gate is the only east exit."
# speaker: Lawrence
"(beat) Every fort of this period and construction has a postern. A secondary exit that is never listed in official records because listing it defeats the purpose. The flag pattern was a navigation key. I did not know why until now."
He finds it. A door in the inner ward's north wall, flush with the brickwork, secured with a latch that has not been used in years. It opens into the desert on the fort's north side: a narrow passage that bypasses the gate entirely and deposits the party in the open terrain beyond the walls.

The light hits them full-force when the postern opens.

Seo Yun-ji is visible from the postern. Three hundred meters across the open desert. Standing in the middle of the plain, a figure against the flat bright horizon. Not hiding. Not moving.

Waiting.

+ [Cross to her.] -> act8_desertcrossing

=== act8_desertcrossing ===
// 📍 The Desert Beyond Jiayuguan -- The Crossing
The walk across the desert takes longer than it should. The light does not blind. It reveals. Every bruise, every healing cut, every piece of gear that needs attention is visible. The party is not diminished. They are simply seen. Completely. This is more uncomfortable than darkness.

Your HP is whatever it has been reduced to by the dungeon. You enter this crossing in the most visible state you have been in since Mo Stor: nothing concealed, nothing managed, just what you are and what you have been through.

Seo Yun-ji watches you cross toward her. She does not move. When you are close enough:

# speaker: Seoyunji
"You came through the postern. I knew someone would eventually think of the postern."
She is not hostile. Not warm. Precise. The bearing of someone who has rehearsed being alone for two years and gotten very good at it.

# speaker: Seoyunji
"I know why you're here. I would ask you to reconsider. If the dawn makes promises again, there will be people who believe them. People who build their lives on the assumption that the light will come when expected. And when it does not -- "
She stops. She does not need to finish. She finished it once already, publicly, in front of the king, and the people who trusted her seasonal prediction starved through a ruined planting season.

+ [Begin.] -> act8_seoyunji

=== act8_seoyunji ===
// 📍 The Desert Beyond Jiayuguan -- The Conversation
Seo Yun-ji
# speaker: Seoyunji
"I spent twenty years predicting the seasons for the royal court. Every calculation I made was correct. Then Sun's domain fractured and my calculations failed and the people who trusted them -- the people who planted based on my predictions -- lost the harvest. I watched it happen. From here."
She gestures at the desert around her. This is where she has been. Watching from the place furthest from the damage she caused.

+ [The signal flags: what she wrote herself.] -> act8_strike1
{marcus >= 3:
    + [Marcus: the archive records.] -> act8_strike2
}
+ [The argument she cannot answer.] -> act8_strike3

=== act8_strike1 ===
// 📍 The Desert -- Strike One: Evidence
What She Wrote Herself

You present the flag message. She set those flags before she left the fort. She wrote the exoneration herself: *The calculations were correct. The system changed. The fault was not in the math.*

# speaker: Seoyunji
"I know what the flags say. I wrote the flags. I wrote them because I could see the data clearly in that moment -- the disruption signature was external, the methodology was sound, the failure was not mine. I wrote it because I needed to write it somewhere before I stopped being able to believe it."
A pause.

# speaker: Seoyunji
"Knowing something and believing it are not the same thing. You of all people should understand that by now."
# speaker: Fang
"(under her breath) She's not wrong."
# speaker: Marcus
"(equally quiet) No. She is not."
The HP drain continues. The light does not change. She has known about the flags. Evidence was not the argument she needed.

+ [Try again.] -> act8_seoyunji

=== act8_strike2 ===
~ marcus = marcus + 1
~ xp = xp + 30
// 📍 The Desert -- Strike Two: The Archive
Eighteen Hundred Years of Observation

Marcus steps forward. He carries the archive records in his memory -- he read them completely in Level 5. He presents the comparison: her methodology from before the disruption, eighteen years of flawless prediction. The disruption signature, clearly external. The logical conclusion.

# speaker: Marcus
"You are not the only person in this desert who has been a court advisor. I advised the Roman Senate, three dynasties, and a handful of philosophers who were more difficult than any of them. I have been reading astronomical records since before your calendar system existed. Your methodology is excellent. Your data is accurate. The system you were working within changed without warning and without your knowledge. I am telling you this not as comfort but as data."
Seo Yun-ji listens. She is too precise a thinker to dismiss it.

# speaker: Seoyunji
"You are saying the data supports exoneration."
# speaker: Marcus
"Unambiguously."
# speaker: Seoyunji
"(long pause) The people who starved do not care about the data."
The light does not change. But she takes one step back from where she has been standing. Barely perceptible. The party notices.

+ [One more. The authority problem.] -> act8_strike3

=== act8_strike3 ===
~ xp = xp + 50
~ commitment = commitment + 1
// 📍 The Desert -- The Argument She Cannot Answer
Strike Three: Authority

{lawrence >= 5:
    Lawrence steps forward. This is the version of Lawrence that was visible in the Inner Ward: not performing, not managing, just present.

    # speaker: Lawrence
    "You are standing in the light you could not control as punishment. I understand the logic. The punishment is permanent. It ensures you cannot fail again by ensuring there is nothing left to fail at. I have made that calculation before. It is the wrong calculation."
    # speaker: Seoyunji
    "Because?"
    # speaker: Lawrence
    "Because the light is not yours to withhold. You did not create it. You could not control it. You cannot be responsible for its existence by choosing to be responsible for its absence. Those are not the same authority."
- else:
    {avatarName}: "You are standing in the light you could not control as punishment for not controlling it."
    # speaker: Seoyunji
    "Yes."
    {avatarName}: "The light is not yours to withhold. You did not create it. You cannot be responsible for its existence by choosing to be responsible for its absence."
}

{avatarName}: "The people who trusted you needed the dawn to return. You are making sure it cannot. That is not protecting them from false hope. That is taking their real one."
Seo Yun-ji is quiet for a very long time.

The light is still flat. The desert is still bright. Nothing moves.

Then she takes out a small astronomical instrument -- a sextant, pocket-sized, worn from years of use. She holds it for one moment. She looks at the horizon where the sun should be casting a proper angle and is not. She looks back at the party.

# speaker: Seoyunji
"(very quiet) The calculation was wrong."
She steps aside. Not out of defeat. Out of precision. A mathematician corrects the calculation.

+ [Sun is freed.] -> act8_sunfreed

=== act8_seoyunji_norecovery ===
~ xp = xp + 20
// 📍 The Desert -- Optional No Recovery
The HP drain has been slow and consistent and the party has been standing in it long enough that someone is going to hit a limit soon. If the player triggers No Recovery here before Strike 3, the party steps back. The light does not pursue. Seo Yun-ji watches.

# speaker: Seoyunji
"(watching the party regroup) You are choosing to stop."
# speaker: Fang
"We are choosing to not collapse in your desert."
# speaker: Seoyunji
"(a pause that might be the first humor she has expressed in two years) That is a reasonable choice."
She waits while the party recovers. She does not press the advantage. She does not have an advantage to press. She is standing in her desert and the party is choosing to stay in it and neither of them is done.

+ [Return to the conversation.] -> act8_seoyunji

=== act8_sunfreed ===
~ sunFreeCount = 4
~ commitmentUnlocked = true
// 📍 The Desert Beyond Jiayuguan -- Liberation
Sun is Freed

The Binding Frame, somewhere inside the fort, dissolves.

The change in the light is immediate and not dramatic. It does not flood back. It recalibrates. The angle of the sun shifts for the first time since the disruption. Shadows appear -- first at the edges of the fort walls, then across the desert floor, then from the party's own bodies.

Lawrence stands in the first shadow that falls from him and goes very still for three full seconds. His face is not readable. He does not press his chest. He simply stands in his own shadow and looks at it.

Systemic effects: shadows return across the Hexi Corridor. The Rainbow Mountains' colors shift and deepen as the light angle changes for the first time in two years. At Zhangye, the garrison soldiers watch the sun move. The iron oxide bands go from inert to luminous in the space of a minute.

Seo Yun-ji walks back through the postern into the fort. She has work to do. She will verify the archive records. She does not say whether she can leave afterward. The player does not know if she will.

# speaker: Marcus
"The signal flags are still running."
# speaker: Seoyunji
"(disappearing through the postern) I'll change them."
She does not say to what.

# speaker: Fang
"(watching her go) She's going to be fine."
# speaker: Marcus
"(honestly) I am not certain of that."
# speaker: Fang
"Neither am I. But she corrected the calculation. That's something."
+ [The gate.] -> act8_jiayuguangate

=== act8_jiayuguangate ===
// 📍 Jiayuguan Fort -- The East Gate (Now Open)
Through the Gate

The light wall has dissolved with Sun's liberation. The east gate is open: a rectangle of afternoon light and road and desert and, further east, the route that eventually becomes the road to China proper, and then to the coast, and then to Korea.

Fang goes through first. Marcus follows. You follow Marcus.

Lawrence stops at the threshold.

He stands in the gate passage and looks east. The inscription above him: *through this gate, you do not return.* He has read this inscription before. He read it on the way in and said the inscription did not know them.

He looks east for five seconds. The party does not call back to him. They understand the five seconds are not for them.

He does not press his chest. He does not speak.

He walks through.

+ [The road east.] -> act8_bridgetomoon

=== act8_bridgetomoon ===
// 📍 East of Jiayuguan -- Road to the Coast
The Road Knows Where You Are Going

The road east from Jiayuguan descends from the Corridor toward the interior routes. The landscape is changing: less desert, more grassland, the soil darkening as the elevation drops. The shadows move with the sun. This should be unremarkable. It is, currently, extraordinary.

Fang: she is on the eastern side of the Hexi Corridor now. The route from here leads eventually toward the coast roads that Jiwon used when traveling home between trading seasons. Fang walked this road as Jiwon's guard. She has not been on it since the storm. She is walking it now in the opposite direction: going east, the way Jiwon went home, which is the way the party is going too.

She says nothing about this. Her pace is slightly different. Not slower. More deliberate. The pace of someone choosing each step.

Lawrence, who has been walking east all day, is walking east. He does not say anything. Nothing in his posture or behavior announces what walking east means. Only the Heartbeat, submerged in the gate passage, knows how much it cost, and it has already faded into road sounds.

# speaker: Marcus
"There is a waystone option from here. Mo Stor is accessible before the Moon arc begins. It will not be accessible at this quality after."
# speaker: Fang
"He's saying drink something and talk to Tiberius before everything gets harder."
# speaker: Marcus
"That is precisely what I am saying, yes."
~ lastLocation = "Act8_BridgeToMoon"
+ [Use the Waystone. Return to Mo Stor.] -> mostor_return_postsun
+ [Restock in Rhea Port. Then the crossing.] -> act8_rheaport_restock
+ [Keep moving east.] -> act8_journeyeast_plains

=== mostor_return_postsun ===
// 📍 Mo Stor · The Bridge Inn · Return After Sun
The Last Easy Return

The third step creaks. The smell arrives before the light: woodsmoke, old leather, the copper pot. The quest board near the door. The privacy alcoves. The empty stool at the far end of the bar.

Still empty. It has been empty since Act 0.

Tiberius looks up before the door finishes opening. He says your avatar name. Just the name. He has two drinks on the counter before you reach the bar. He has had them poured since he heard the desert past Jiayuguan had shadows again.

# speaker: Tiberius
"Four."
{avatarName}: "Four."
# speaker: Tiberius
"(setting the second drink down) One more."
He does not say Moon. He does not say Korea. He knows what the one more is and he knows what it costs the person walking toward it and he has the specific tact of a man who has been tending a bar at the edge of the known world for long enough to understand when silence is the better service.

The inn carries Sun's liberation: full, warm, the energy of a world that remembered it has a sun that moves. New patrons with plans. Laughter from the back alcoves. The ambient that comes with the fourth Guardian freed.

If Tiberius bond is 3+: he leans against the counter after the party settles and says, quietly, something he has not said before. "The stool. The person who used to sit in it -- she's been gone a long time. I kept it empty because I didn't know what else to do with not knowing. You understand that, I think."

He doesn't elaborate. He refills the drink. He goes back to his work. The stool is still empty.

Quest board: new posting, handwritten, from a factor at the Bohai coastal route. Something in the light has been wrong for a year north of the Yellow Sea. The nights are not cycling correctly. Moon.

Lawrence reads the posting. He does not pull it down this time. He just reads it and turns back to his drink and finishes it.

+ [Restock in Rhea Port before the crossing.] -> act8_rheaport_restock
+ [Use the Waystone. Return to the road east.] -> act8_bridgetomoon

=== act9_placeholder ===
/* TODO: <<goto "Act9_MoonDungeon_Entry">> */

-> END

=== act8_rheaport_restock ===
~ lastLocation = "Act8_BridgeToMoon"
// 📍 Rhea Port · Market District
Before the Long Water

Rhea Port is louder than when you left it. Sun's liberation has reached the Mediterranean coasts; the harbor feels like a harbor again, not a waiting room. Merchants who had been holding inventory in warehouses are moving goods. The smell of salt and pitch and warm bread and the copper smell of coin.

The party divides to resupply efficiently. Marcus takes the provisions. Fang takes the weapons. Lawrence takes the intelligence -- who has ships, which captains sail east, what the road to Tianjin looks like at this season. He works the harbor offices with the specific efficiency of a man who has been doing exactly this for a thousand years and has contacts in every port city between here and the Bohai Sea.

# speaker: Marcus
"(before splitting) Two hours. Meeting point at the harbor stairs. Do not let anyone sell you salted fish from the third warehouse on the left -- I can smell it from here."
# speaker: Fang
"How do you know it's the third warehouse?"
# speaker: Marcus
"Bears."
You have two hours in Rhea Port. The city is familiar and different in the same way all places are familiar and different when you come back to them carrying more than you left with.

+ [Wander the market.] -> act8_kai_encounter
+ [Stay near the harbor stairs.] -> act8_rheaport_nowander

=== act8_rheaport_nowander ===
~ xp = xp + 5
// 📍 Rhea Port · Harbor Stairs
You wait at the harbor stairs. The party reassembles on schedule. Lawrence returns last, with a folded paper of port contacts and the name of a captain in Tianjin who moves cargo quietly and quickly.

# speaker: Lawrence
"Captain Shen Wei. Tianjin. She sails a junk that is, by all accounts, faster than it has any right to be. She charges accordingly."
+ [The road. Tianjin bound.] -> act8_journeyeast_plains

=== act8_kai_encounter ===
~ kaiRheaPortScene = true
// 📍 Rhea Port · Spice Market Alleys
The alleys behind the spice stalls are where the city breathes. The main market is performance; back here is actual transaction. Barrels, rope, jars of sealed things. You are turning a corner when you hear your name.

Not your avatar name. The name you carry when you are not in the story.

# speaker: Kai
"(leaning against the alley wall, the particular ease of someone who was expecting you) There you are. I heard you came back."
He looks exactly the same. That is the problem with Kai: he always looks exactly the same, which means he always looks like the version of himself you remember most.

# speaker: Kai
"Four Guardians. You should be proud. You're going to Korea next, aren't you."
{avatarName}: "How do you know about Korea?"
# speaker: Kai
"(small smile) I keep up. I always keep up when I'm paying attention to someone."
He steps closer. Not dramatically. Casually. The ease of it is the mechanism: he does not announce the step, which means you do not announce a response to it, which means you are already closer to him than you decided to be.

Something in the air of the alley changes. A warmth that is not the Mediterranean sun. It moves inward from the skin and settles in the chest. The city sounds behind you soften to a register that feels like a score underneath something. Like being inside a story that already knows what happens next and has decided it is beautiful.
# speaker: Kai
"(very close now, voice low) You've been working so hard. For so long."
His hands are at your shoulders. You did not decide to permit this. You also did not decide against it. The warmth has made the deciding feel less urgent.

He leans in. His lips brush the side of your neck.

The warmth peaks. The city disappears. There is only this alley, this warmth, this specific feeling of being inside a moment that was made for you by something that knows exactly what you need.

{dex >= 3 || lawrence >= 4:
    ~ kaiEnspellAwareness = true
    Something else is also present, at a frequency underneath the warmth. Small. Insistent. It is the part of you that has spent eight acts learning how mechanisms work. It knows what this is. The warmth is not yours. The warmth was built to fit you, and built things that fit perfectly are worth examining. You are aware. You cannot break it alone. But you are aware.
- else:
    ~ kaiEnspellAwareness = false
}

# speaker: Lawrence
"(from the alley entrance, three words, no inflection) Take your hands off her."
+ [The warmth recedes.] -> act8_kai_lawrence_intervenes

=== act8_kai_lawrence_intervenes ===
~ kaiSusceptible = true
~ xp = xp + 10
// 📍 Rhea Port · Spice Market Alley
Kai's hands drop. Not quickly. He steps back from you with the specific unhurriedness of someone who is choosing the timing of the retreat as carefully as he chose the approach. He meets Lawrence's eyes. Something passes between them that has nothing to do with you and everything to do with a history that predates your arrival on the Silk Road by two centuries.

The warmth in your chest does not dissipate fully. It recedes. It does not leave. This is the part that matters: it recedes but it does not leave.

{kaiEnspellAwareness:
    The frequency underneath the warmth is still present too. The part that was watching the mechanism even while the mechanism ran. That part is fully intact. You were in there the whole time.
}

Lawrence crosses the alley to you. He does not look at Kai again. He checks your face -- not your expression, your eyes. The specific check of someone who wants to know if you are all right before he decides what to do with the fact that you are not entirely all right.

# speaker: Lawrence
"(quiet, just to you) Are you with me?"
{avatarName}: "(still orienting) Yes. I -- yes."
# speaker: Kai
"(from behind you, unbothered) Lawrence. You're late."
# speaker: Lawrence
"(still not looking at him) I was not late. I was following a reasonable route through a market. You were early."
# speaker: Kai
"(pause; something underneath the performance for the first time) Fair enough."
The sound of Kai's footsteps. Not departing quickly. Just departing. The alley is quieter.

Lawrence's hand moves toward your shoulder -- and stops. He does not touch you. He waits.
+ ["I didn't choose that."] -> act8_kai_aftermath_named
+ [Say nothing. Just walk back.] -> act8_kai_aftermath_quiet

=== act8_kai_aftermath_named ===
~ lawrence = lawrence + 1
~ xp = xp + 20
// 📍 Rhea Port · Walking Back
{avatarName}: "I didn't choose that. I want you to know that."
# speaker: Lawrence
"I know."
{avatarName}: "It felt -- I don't know how to describe what it felt like."
# speaker: Lawrence
"Like being inside a story where everything already knows its place. Like the warmth that comes when a narrative closes around you. Like being chosen by something that knows exactly what you need."
He says this with the precision of someone who has seen the mechanism before. He says it like someone describing a lock he knows the shape of from the inside.

{avatarName}: "You sound like you know what that feels like."
# speaker: Lawrence
"(a long pause) I have done what Kai did to you to people I cared about. Not identically. Not with intent to harm. But I have chosen the approach and the timing and the angle, and I have called it something other than what it was. Yes. I know what it feels like from the other side."
This is the most honest thing Lawrence has said about himself in eight acts. It sits between you on the walk back to the harbor stairs.

{avatarName}: "Why are you telling me this?"
# speaker: Lawrence
"Because you deserve to have the complete information. About what just happened. About who I have been. So that whatever you decide about any of it is yours to decide with full knowledge."
+ [Back to the harbor stairs. The party is waiting.] -> act8_rheaport_depart

=== act8_kai_aftermath_quiet ===
~ xp = xp + 10
// 📍 Rhea Port · Walking Back
You say nothing. You walk back toward the harbor stairs. Lawrence falls into step beside you. He does not speak either. His silence is not uncomfortable. It is the specific silence of a person who is giving you the room to be wherever you are without requiring you to perform being somewhere else.

At the harbor stairs he stops.

# speaker: Lawrence
"(not looking at you, watching the harbor) You do not have to explain anything. You also do not have to carry it alone. Either option is available whenever you want it."
He goes back to distributing the resupply gear to the party. The option stays open. He meant it. He always means exactly what he says.
+ [The party is assembled. The road east.] -> act8_rheaport_depart

=== act8_rheaport_depart ===
// 📍 Rhea Port · Harbor Stairs · Departure
The party reassembles at the harbor stairs. Lawrence has the captain's name. Marcus has the provisions. Fang has the edge she always has, plus whatever she added during two hours alone with a sharpening stone and the particular mood the city puts her in.

Fang looks at you once when you arrive. She filed something. She does not ask. She adjusts the blade wrap and falls into the lead position.

# speaker: Fang
"(walking, not looking back) Road to Tianjin is three to four weeks. I've done it faster. I've done it slower. The middle third is boring and the end is a city. Let's move."
+ [The road east. Tianjin bound.] -> act8_journeyeast_plains

=== act8_journeyeast_plains ===
// 📍 Yellow River Valley -- Henan to Hebei Provinces
The Road the Empire Was Built On

The route east from the Hexi Corridor drops into the interior: the Loess Plateau, the Wei River valley, the imperial roads through Shanxi and into Hebei. This is not the Silk Road anymore. This is the road the empire used to govern itself. It is wider, better maintained, and populated in ways the western routes were not.

The world is visibly wrong in here. Sun's imprisonment fractured the seasons; the effects are less dramatic than the Hexi Corridor's flat light but more distributed. Crops at the wrong stage for the time of year. Villages that have switched to night work because the daytime light, while technically present, does not warm the soil. A riverboat captain on the Yellow River who has been tracking the wrong tide cycles for eighteen months and has the haunted precision of someone whose instruments have started lying.

Marcus, reading the road through the soles of his boots: "The road is remembering what it is for. Slowly. Sun's liberation is traveling east but it has a long way to go."

Lawrence is counting days. He knows exactly how many days to Tianjin, exactly how many days of sailing from Tianjin to Asan Bay, exactly how many days from Asan Bay to Gyeryongsan. He has known since before Jiayuguan. He has not shared the count with anyone because nobody asked, which is not the same as nobody knowing.

+ [The checkpoint.] -> act8_journeyeast_checkpoint

=== act8_journeyeast_checkpoint ===
// 📍 Imperial Road Checkpoint -- Hebei Province
Eight Hundred Pounds of Bear at a Checkpoint

The checkpoint is a permanent structure. Stone gatehouse, two guards, a clerk with a ledger. The imperial road system requires documentation: origin, destination, cargo, party composition.

The clerk is working through a long queue ahead of them. His brush moves without apparent engagement with what it is writing. He has been doing this for twelve years and has developed the specific efficiency of a man who has decided the information he records is less important than the rate at which he records it.

He looks up when the party reaches the front of the queue.

His brush stops.

Marcus is in human form. He is still eight hundred pounds and seven feet of Roman emperor who has been walking fast for three weeks and is slightly dusty and carries the specific posture of someone who has been in charge of very large things for a very long time.

# speaker: Clerk
"...Party composition?"
# speaker: Marcus
"Four. One scholar, one diplomat, one specialist, one consultant."
# speaker: Clerk
"...Cargo?"
# speaker: Marcus
"Provisions and documents. Nothing dutiable."
# speaker: Clerk
"...Purpose of travel?"
# speaker: Marcus
"Diplomatic correspondence. We are expected in Tianjin."
A pause. The clerk looks at the ledger. At Marcus. At the ledger.

# speaker: Clerk
"...You are expected."
# speaker: Marcus
"We are expected."
The clerk stamps the ledger. The guards step aside. The party passes through. Behind them, the clerk stares at his ledger for a long moment and then writes something in the margin that is not part of the official record.

# speaker: Fang
"(once they are through) Were we actually expected anywhere?"
# speaker: Marcus
"Everyone is expected somewhere. The precision of where is largely a matter of confidence."
# speaker: Lawrence
"I have been doing that at checkpoints for four hundred years. It never stops being effective."
+ [The road to Tianjin.] -> act8_journeyeast_ambush

=== act8_journeyeast_ambush ===
// 📍 Hebei Province -- Night Camp
The Party That Heard About Four Guardians

Night camp, two days from Tianjin. The fire is small. The landscape is flat and the horizon is wide enough that anyone approaching from any direction is visible at distance, which is both reassuring and why the party has the camp positioned so the fire is not their silhouette.

The ambush comes from underneath.

Not bandits. Death's irregulars -- not soldiers, not formal agents, but the residual fringe: people who believed the Guardian imprisonments were correct and have been watching the disruptions unravel for eight months with the specific rage of someone whose certainty is being dismantled. Four of them. They have been tracking the party since the checkpoint.
The fight is short and decisive. Death's irregulars do not have the coordination of trained soldiers. They have anger and conviction, which carries them into the fight and does not carry them through it.

The party stands in the flattened night camp after. The fire is still burning. Nothing has been said about what the ambush means for the road ahead.

# speaker: Fang
"They knew where we were. They knew what we're doing."
# speaker: Marcus
"Word travels. Four Guardians freed is not a small event. Death's people are responding. We should expect more of this the closer we get to Moon."
# speaker: Lawrence
"(very dry) Reassuring."
# speaker: Marcus
"It is information. Information is more useful than comfort."
# speaker: Fang
"Marcus. Comfort and information are not mutually exclusive."
# speaker: Marcus
"(honestly considering this) ...Noted."
+ [Tianjin.] -> act8_tianjin

=== act8_tianjin ===
// 📍 Tianjin Port -- Bohai Sea Coast
The Coast at Last

Tianjin smells like Rhea Port in the way that all port cities smell like each other: salt and pitch and fish and coin and the specific urgency of people who are waiting for or departing on something. The Bohai Sea is visible at the end of every north-facing street.

The harbor master's office has Lawrence's contact paper. Captain Shen Wei is in berth seven.

Berth seven contains a junk.

The party stops. Marcus takes inventory of the junk with the expression of a man who has been in every harbor in the known world and has seen boats that looked worse than this. He cannot immediately recall where.

The junk is approximately forty feet long. The hull has been repaired so many times that the repairs have been repaired. The battened sails are four different shades of red. One of the masts has been replaced with a different kind of wood entirely. There is a fresh patch of caulking on the starboard bow that is still wet.

# speaker: Fang
"...No."
# speaker: Marcus
"I have survived worse."
# speaker: Fang
"I have not survived worse. I have not tried to survive worse. I have been very deliberate about this."
Captain Shen Wei appears at the rail above them. She is in her fifties. She has the deeply unconcerned expression of someone whose opinion of her boat does not require external validation.

# speaker: Shenwwei
"You're the ones looking for fast passage to Asan Bay."
# speaker: Lawrence
"We are."
# speaker: Shenwwei
"(noting their expressions) She may not look like much. But she's got it where it counts."
+ [Negotiate passage.] -> act8_tianjin_negotiate

=== act8_tianjin_negotiate ===
// 📍 Tianjin Port -- Berth Seven
# speaker: Marcus
"What's her best time to Asan Bay?"
# speaker: Shenwwei
"Eighteen hours. Point to point. With a southeast wind, sixteen."
A pause. Marcus and Lawrence exchange a look. Eighteen hours on the Bohai Sea is roughly four times faster than any legitimate cargo vessel would make the same run.

# speaker: Marcus
"How."
# speaker: Shenwwei
"(pointing at the hull) Modified keel. Water channeling. And I know where the Bohai's tidal compression lines run because I've been running them for thirty years while everyone else uses the standard routes."
# speaker: Fang
"(quietly, to Marcus) She knows where the seams are."
# speaker: Marcus
"(quietly back) She is the seams."
The price is high. Lawrence pays it without negotiating, which tells Shen Wei exactly what the timeline is. She accepts without pressing the advantage. She has a rate and the rate is the rate.

# speaker: Shenwwei
"We depart at third watch. Tide runs our direction before dawn."
# speaker: Fang
"(to you, resigned, looking at the junk) I want it on record that I said no initially."
# speaker: Marcus
"Noted. It will not be in the official record."
+ [Third watch. The crossing.] -> act8_yellowseacrossing

=== act8_yellowseacrossing ===
// 📍 Bohai Sea -- Night Crossing to Asan Bay
Water Between What Was and What Comes Next

Shen Wei was not wrong about the speed. The junk moves through the Bohai darkness at a rate that requires adjustment: the other ships the party can see at departure disappear behind them within two hours. The modified keel finds the compression lines and follows them with the ease of someone walking a path they know by feel.

Fang sleeps below deck on principle. She has crossed enough bodies of water to know there is no useful work to be done mid-crossing and rest is always the better tactical choice. She is asleep within twenty minutes of departure.

Marcus is somewhere in the middle of the boat doing something that functions as meditation. He does not sleep at sea. He has not slept at sea since a crossing in 206 BC that he does not discuss. He processes the water time quietly.

You find Lawrence at the forward rail, facing east. He has been there since the port lights of Tianjin faded. He is not watching the water. He is watching the horizon.

{avatarName}: "How long since you've been to Korea?"
# speaker: Lawrence
"(a beat) I was last here in 1389. I have not been back."
1389. Three years before the Joseon dynasty was established. Three years before the capital moved to Hanyang.

{avatarName}: "What happened in 1389?"
He does not answer immediately. The junk runs fast over the compression line. The Bohai stars are clear above them.

# speaker: Lawrence
"A great many things happened in 1389. I was there for some of them."
That is all he says. The horizon does not change. He is facing the direction Moon is in, and he has not said Moon's name since the cave, and his hand is at the rail and not at his sternum, and the not-saying is the saying.

{lawrence >= 6:
    + ["You stopped after Moon."] -> act8_crossing_lawrencebeat
}
+ [Stay at the rail with him.] -> act8_crossing_quiet

=== act8_crossing_lawrencebeat ===
~ lawrence = lawrence + 1
~ xp = xp + 30
// 📍 Bohai Sea -- Forward Rail
{avatarName}: "Every time you name the Guardians. You always stop after Moon."
He goes very still.

{avatarName}: "You've done it since Mo Stor. Stone, Sun, Moon -- and you stop. Every time. You stop after Moon."
# speaker: Lawrence
"(quiet, still facing east) Yes."
{avatarName}: "Is Moon -- is someone --"
# speaker: Lawrence
"Moon's captor is someone I knew. Before the imprisonments. Before any of this."
A pause. The junk hisses over water.

# speaker: Lawrence
"I cannot free Moon without freeing them from what they chose. And what they chose made sense to them. And I understood why it made sense to them. And I have understood why it made sense to them for a very long time, which is not the same as thinking it was right, which is not the same as being able to do anything about it from the outside."
{avatarName}: "You've been walking toward this since Mo Stor."
# speaker: Lawrence
"(very quietly) Yes."
He turns from the rail for the first time. He looks at you. Not the practiced look, not the calibrated look. The look that comes when a person has been alone with something for long enough that being seen is more relief than exposure.

# speaker: Lawrence
"I am glad you are here."
He means on the boat. He means on the Silk Road. He means for the eight months since Mo Stor. He means all of it in the same three words and he does not clarify and he does not need to.

+ [The coast of Korea. Morning.] -> act8_asanbay

=== act8_crossing_quiet ===
// 📍 Bohai Sea -- Forward Rail
You stay at the rail with him. You do not ask again. He does not offer. The horizon is dark and Korea is somewhere past it and the junk is running fast over the compression lines and the stars are very clear above the Bohai Sea.

At some point during the crossing, Lawrence's hand moves from the rail to just beside yours. Not touching. Just beside. The same distance as the Gaochang ruins, the same distance as the ankle scene, the same distance that has been the language between you since the Singing Sands: close enough to name, not so close that you don't both know what it is.

The stars wheel slowly. Korea gets closer.

+ [The coast of Korea. Morning.] -> act8_asanbay

=== act8_asanbay ===
// 📍 Asan Bay -- West Coast of Joseon Korea
Korea

Shen Wei made the run in seventeen hours. She did not comment on this. The party disembarks at Asan Bay's trading dock in the early morning. The dock has the businesslike quiet of a place that has been working before dawn since before anyone can remember.

The smell is different. Not wrong -- different. Clean in a specific way, pine and salt and something resinous from the inland hills. The grain of the wood on the dock is different. The rigging on the fishing boats is different. The sound of the language from the dock workers is different, and beautiful, and Fang stops walking for exactly one second when she hears it.

She does not explain the stop. She adjusts the blade wrap and keeps moving.

Lawrence knows this sound. He heard it in 1389. His face does not change. His pace does not change. Something in his stillness is not the same stillness he has had all journey.

# speaker: Marcus
"(to Shen Wei, before she departs) If someone asks -- you were not here. You carried no particular passengers. Your manifest reflects a cargo run."
# speaker: Shenwwei
"(already turning the junk around) I have a very short memory for faces."
# speaker: Marcus
"Excellent memory."
+ [Restock in Asan Bay.] -> act8_asanbay_restock

=== act8_asanbay_restock ===
// 📍 Asan Bay -- Market
Jiwon's Country

The market in Asan Bay is compact and precise. Everything has a designated place and the designated place has been the same for three generations. The merchants work with the particular unhurriedness of people who do not need to perform speed because their quality speaks for itself.

Marcus acquires provisions for the three-day walk: dried persimmon, pine nut cakes, the buckwheat rations that will hold through mountain terrain.

Fang is in the paper stall.

Not buying. Holding a sheet of hanji -- the handmade Korean paper -- between her fingers. Feeling the weight of it. Hanji is distinctive: thicker than Chinese paper, more textured, with a specific give that comes from the mulberry bark it's made from. Jiwon sold it. She carried it from this country across the full Silk Road because she knew the buyers in Samarkand and Lanzhou and Xi'an who understood what they were buying.

The paper merchant watches Fang hold the paper. He does not interrupt.

Fang puts it down. She buys three sheets and wraps them in the blade cloth, alongside the letter.

Nobody comments on this. The sheets of hanji go into the wrap where the letter already is. The letter that came from this country, from a woman who knew the weight of this paper because she had been carrying it back and forth across the world for twenty years.

# speaker: Lawrence
"(quietly, once they are back on the road) Gyeryongsan is three days northeast. The road passes through Gongju. It is a good road."
# speaker: Fang
"You've been here."
# speaker: Lawrence
"Yes."
# speaker: Fang
"Recently?"
# speaker: Lawrence
"(a pause) Not recently."
+ [Day one. The road to Gyeryongsan.] -> act9_road_day1

=== act9_road_day1 ===
// 📍 Road Northeast from Asan Bay -- Day One
Day One: The Country Opens

The road northeast from Asan Bay climbs out of the coastal flatlands into a landscape that moves differently from anything the party has traveled through. The Silk Road runs east-west, following the logic of trade and flatness. Korea runs north-south along a spine of mountains, and the roads follow the mountains, which means the roads go up and down rather than across.

The vegetation is different. Pine forests that smell like something specific -- clean in a way that the party's lungs respond to after months of desert and cave. The light is correct here. Sun's liberation has reached the Korean coast in the weeks since Jiayuguan; the shadows move normally, the afternoon light slants correctly, the world looks like what it is supposed to look like.

An encounter on the road: a Joseon official traveling west with an escort, headed to Asan Bay. He stops the party at a fork with the polite but non-optional formality of someone who represents an authority that is still new enough to need asserting.

Lawrence speaks first, in Korean -- which surprises everyone including the official. The conversation is brief, formal, and concludes with the party being waved through. The official watches them go with an expression that is doing a great deal of work not to show how confused it is.

# speaker: Fang
"When did you learn Korean?"
# speaker: Lawrence
"1389."
He says it the same way he has said it every time. Neither more nor less than the year. Fang files it. Marcus has already filed it. The player has been filing it for three passages now.

Night camp at the edge of the pine forest, below the first real rise of the Charyeong foothills. The campfire smells different here -- the pine wood burns cleaner than the desert brush.

+ [Day two.] -> act9_road_day2

=== act9_road_day2 ===
// 📍 Charyeong Mountain Foothills -- Day Two
Day Two: The Mountain Is Already Talking

The foothills give way to the beginning of genuine mountain terrain. The road narrows. The pine forests become mixed, cedar and oak at the higher elevations. The air is colder. The party has been traveling since before dawn and the legs know it.

An encounter in a cedar grove: a traveling monk who has been descending from Gyeryongsan for three days. He is moving quickly, which is unusual for the contemplative register his robes suggest. He stops when he sees the party, because Lawrence is Lawrence, but he would have stopped anyway because he has something he needs to say and has been saying it to everyone he passes.

He says it: the mountain does not sound right. The night cycles are wrong at the summit. He went to pray at the peak shrines and the moonrise did not come. Three nights in a row. The sky was clear, the stars were present, and where the moon should have been there was nothing. He is going to find someone who can do something about this. He does not know who that person is. He suspects it is someone traveling toward the mountain, not away from it.

# speaker: Marcus
"(to the monk, gently) The person traveling toward the mountain is us."
# speaker: Monk
"(looking at the party) You are four people."
# speaker: Marcus
"We are."
# speaker: Monk
"(looking at Marcus specifically, at some length) ...Are you all four people?"
# speaker: Marcus
"Some of us are. The details are not important. What can you tell us about the peak?"
The monk tells them what he knows. The summit has been inaccessible since the moonrise stopped: a cold that is wrong for the elevation, a stillness that is not weather. He has heard from shepherds that the mountain's streams are running in reverse sequence -- not backward, but in the wrong temporal order, as if time on the mountain is not fully agreed with itself.

# speaker: Fang
"Memory."
# speaker: Marcus
"Moon's domain. Time as felt, not as measured."
# speaker: Lawrence
"(very quietly) Yes."
Night camp with a clear sky. No moon. The absence of the moon is visible. The stars are correct and complete and the space where the moon should be is present as a specific lack.

Lawrence, lying awake. The player who is also lying awake, watching the same absence. The camp is quiet. The cedar trees breathe.
+ [Day three. The summit is visible.] -> act9_road_day3

=== act9_road_day3 ===
// 📍 Upper Approach Road -- Gyeryongsan
Day Three: The Mountain Knows You Are Coming

Gyeryongsan appears at dawn on the third day. The ridgeline rises ahead of them: 845 meters, the distinctive profile that gives the mountain its name -- the crest looks, from certain angles, like the comb of a rooster, like the spine of a dragon. The Joseon surveyors considered it for the capital before choosing Hanyang. It was passed over. The mountain has been waiting in the specific way that significant things wait when they are not chosen.

Lawrence stops walking when he sees it. He stops for exactly four seconds. The party walks another three steps before they notice and stop too. He looks at the mountain. He does not press his chest. His hands are at his sides.

Four seconds. Then he walks again.

# speaker: Fang
"(not looking at him) We're close."
# speaker: Lawrence
"Yes."
The road enters the mountain's lower forest. The temperature drops. The sound changes: the birds are quieter here, and the ones that do call are calling irregularly, as if the dawn timing they usually follow is no longer a reliable guide.

The streams run in a way that is difficult to describe. They are running. The water is moving in the correct direction. But the sound they make does not correspond to the speed of the water, which does not correspond to the light on the surface, which does not correspond to the shadows cast by the rocks in the bed. Time on the mountain is not fully agreed with itself. The monk was right.

An encounter on the upper approach: the last of Death's irregulars, a heavier force than the Hebei ambush. They have been expecting the party. This is the last external fight before the dungeon. It is a test of everything the party has learned about fighting together: Lawrence's shadow magic at full capability, Fang's Florentine style, Marcus's seismic reading of the terrain, the No Recovery protocol that the party runs with the smoothness of something rehearsed -- which it now is.

After the fight:

# speaker: Marcus
"They knew we were coming."
# speaker: Fang
"They've been waiting here."
# speaker: Marcus
"Which means Death knows we are here."
A pause. Nobody says the obvious thing, which is that Death has known since at least Act 7 and possibly since Act 0, and the question of what Death is waiting for is not a question about knowledge but about timing.

# speaker: Lawrence
"(already moving, toward the summit path) We know where we are going. Death knowing the same thing changes nothing about what we have to do."
The summit path is ahead. The mountain's cold deepens.

+ [The summit. Moon.] -> act9_gyeryongsan

=== act9_gyeryongsan ===
~ lastLocation = "Act9_Gyeryongsan"
// 📍 Gyeryongsan -- Upper Summit Approach
The Last Guardian

The summit of Gyeryongsan is cold in a way that is not temperature. The cold is the absence of the warmth that moonlight provides -- not visible heat, but the warmth of the light that measures night, that tells the body when night is half-spent, that holds the memory of every night that came before.

The sky above the summit is black and correct and starlit and empty of the moon.

The dungeon entrance is the mountain itself. There is no constructed architecture. The path continues into a series of naturally formed granite passages that the mountain has been building for a hundred million years. The rock is beautiful and cold and old in the way that makes everything else feel recent.

Lawrence steps across the threshold first. He has been walking east since Mo Stor. He has been walking toward this since before the player knew what Moon meant. He walks through the entrance without hesitation, which is not the same as without cost.
+ [Enter the mountain.] -> act9_moondungeon_entry

=== act9_moondungeon_redirect ===
/* TODO: <<goto "Act9_MoonDungeon_Entry">> */

-> END

=== act9_moondungeon_entry ===
~ lastLocation = "Act9_MoonDungeon_Entry"

// 📍 Gyeryongsan Mountain · The Ceremony Space · 845 meters · Joseon Dynasty, early 1400s
The Ceremony Has Been Waiting

Ihwa stands at the center of the ceremony space with her back to the entrance. She does not turn.

She is approximately sixty-five. Her ceremonial robes are the ones she was wearing in 1389. They should not have lasted this long. They have lasted because she is in the middle of a ceremony and the ceremony is holding everything in place, including the cloth, including the candles, including the night.

Eleven candles are lit. The twelfth holder is empty.

Lawrence stops two paces inside the threshold. He does not move forward. He does not retreat. He stands with the specific stillness of someone who has walked into a room they have been thinking about for thirty-five years and arrived to find it exactly as they left it.

# speaker: Fang
"(very quiet, to Lawrence) You've been here before."
He does not answer. That is the answer.

# speaker: Marcus
"(equally quiet, reading the stations) Twelve sections. She is at the center. We are at the entrance. We are inside it."
# speaker: Fang
"Inside what?"
# speaker: Marcus
"The ceremony. It started when we crossed the threshold."
+ [Enter. The ceremony has begun.] -> act9_geori_1_3

=== act9_geori_1_3 ===
~ xp = xp + 30

// 📍 Gyeryongsan · Geori 1 through 3 · Initiation, Purification, the First Offering
The Ceremony Knows the Party
Lawrence moves through the first stations with the ease of someone who has done this before. Not because he is a mudang. Because he was here once and the ceremony held him and some part of the ceremony remembers what that felt like.

# speaker: Lawrence
"Section one calls the mountain spirits. The incense activates section two. Third station is the purification water; don't touch it with your weapon hand."
# speaker: Fang
"How do you know all of this?"
# speaker: Lawrence
"I was here for the first pass."
# speaker: Fang
"(a pause that is doing a lot of work) Right."
Marcus activates the third station. The purification water stirs without wind. Something in the mountain exhales.

+ [Continue to geori 4 through 6.] -> act9_geori_4_6

=== act9_geori_4_6 ===
~ xp = xp + 20

// 📍 Gyeryongsan · Geori 4 through 6 · The Ancestral Welcome, The Old Grievances, The Main Offering
She Knows Every Shadow on This Mountain

Lawrence's shadow extends toward the fourth station. It moves. Cleanly. It arrives somewhere else.

He looks at his hands. He looks at the station. He looks at where the shadow ended up.

# speaker: Lawrence
"That is not where I aimed it."
# speaker: Marcus
"No. It isn't."
# speaker: Fang
"Try section five. Different angle."
He tries section five. The shadow moves. It does not land where intended.

# speaker: Fang
"Lawrence."
# speaker: Lawrence
"I see it."
# speaker: Fang
"She's redirecting you."
# speaker: Lawrence
"I know."
Ihwa, at the ceremony's center, speaks for the first time since they entered. Her voice is a mudang's voice: the register that carries across the space between living and not.

# speaker: Warden
"You know this mountain's shadows. You learned them in a night. I have had thirty-five years. How many of those nights do you think I spent on the shadow geometry alone?"
Not a taunt. A statement of fact. The tone of a practitioner who has more hours in this craft than any opponent in this room.

# speaker: Marcus
"(quietly, to the party) We cannot outwork thirty-five years of ceremony practice. We need a different approach for section six."
# speaker: Fang
"Define 'different approach.'"
# speaker: Marcus
"Stop trying to navigate the ceremony. Participate in it."
# speaker: Fang
"That is not more specific."
# speaker: Marcus
"It will be when you feel the difference."
The HP drain is steady. Not punishing. The ceremony is not trying to destroy them. It is processing them. This is what the ceremony does: it takes grief and processes it into something that can be set down. The party has grief. The ceremony has found it.

+ [Enter the memory passages. Geori 7.] -> act9_geori_7_choice

=== act9_geori_7_choice ===

// 📍 Gyeryongsan · Geori 7 · The Memory of Departure
1389: The Morning After
The seventh station activates without the party touching it.

The ceremony space shifts. The candle nearest the seventh station burns a different color: the blue-white of pre-dawn in late autumn. The party feels it as pressure behind the sternum. Not pain. The specific weight of a memory that has been waiting.

What arrives is 1389: the morning after the ceremony. Gyeryongsan in blue-grey light. The mountain quiet. The path east, pale and cold. A figure walking it.

Lawrence's back. Walking away.

And from behind: the space of the ceremony where Ihwa stood in the doorway of her practice, watching him go, holding in her hands the grief he had given her to hold, which had been the point, which was what the ceremony asked of her, and which was also the moment she understood she had held it too completely and could not give it back to the night the way the ceremony required because he was already gone and the ceremony's twelfth station was already empty and the mountain morning was already just a morning.

+ [Fight through it. Push forward to station eight.] -> act9_geori_7_fight
+ [Hold still. Let the memory arrive.] -> act9_geori_7_accept

=== act9_geori_7_fight ===
~ xp = xp + 10

// 📍 Gyeryongsan · Geori 7 · Fighting the Memory
This Is Not a Fight You Can Win

The party pushes through. The memory does not part. It passes through them instead, which is worse, which is the ceremony's point: grief that is not received passes through the body rather than out of it. The party emerges from the passage intact and at a cost.

Fang, on the other side: "That was wrong."

# speaker: Marcus
"Yes."
# speaker: Fang
"How do you know?"
# speaker: Marcus
"Because I feel worse, not better, and the station did not advance."
Ihwa, from the center, without turning: "Section eight is ahead. You may try the same approach again if you prefer a consistent result."

Not cruel. The dryness of a practitioner who has seen this many times.
+ [Section 8: try it differently.] -> act9_geori_8_choice

=== act9_geori_7_accept ===
~ xp = xp + 40

// 📍 Gyeryongsan · Geori 7 · Receiving the Memory
The Morning Arrives

The party holds still. The memory of 1389 arrives.

The pre-dawn light. The mountain path. Lawrence's retreating shape, growing smaller in the grey. And from Ihwa's position in the ceremony doorway: the particular moment when she understood the ceremony was not going to complete, that the living offering would not come, that the mountain would hold what she had gathered and she would have to hold it with the mountain until something changed or nothing did.

The memory does not ask to be forgiven. It does not ask for anything. It asks to be seen.

The party sees it. They stand in the seventh station and they let the morning of 1389 exist in the room with them, which is the only thing this passage has ever asked of anyone.

Lawrence, during this, does not move. His hand is at his side. Not at his sternum. His hand is at his side and very still.

# speaker: Fang
"(very quiet, not to anyone) Oh."
The station advances. The blue-white candle shifts to the softer amber of mid-morning. Something in the ceremony space exhales.

+ [Section 8.] -> act9_geori_8_choice

=== act9_geori_8_choice ===

// 📍 Gyeryongsan · Geori 8 · The Carried Grief
Everyone in This Room Has Been Holding Something
The eighth station activates. The memory that surfaces is not 1389. It belongs to the party.

For Fang: the weight of every room she has walked into alone and made a joke in. Two hundred years of it. The texture of competence worn as armor. Not as attack. As record: this is what you have been carrying.

For Marcus: eighteen centuries of watching the things he loved outlive their meaning. The Pax Romana. The Senate. The specific knowledge of what it costs to care about something that does not know how to last. Not as attack. As weight made visible.

For the avatar: whatever it was that brought them to this game, to this party, to this mountain. The reason under the reason.

The ceremony does not demand these be surrendered. It demands only that they be named.

+ [Hold still. Receive it.] -> act9_geori_8_accept
+ [Press through. Section nine is ahead.] -> act9_geori_8_fight
{end <= -1:
    + [No Recovery: step back. The ceremony will wait.] -> act9_norecovery_early
}

=== act9_geori_8_fight ===
~ xp = xp + 10

# speaker: Marcus
"(to Fang, quietly) We are still fighting."
# speaker: Fang
"Old habit."
# speaker: Marcus
"Yes."
+ [Section 9. Last memory passage.] -> act9_geori_9_choice

=== act9_geori_8_accept ===
~ xp = xp + 40

# speaker: Fang
"(after a long pause) I don't hate this less because I understand what it's doing."
# speaker: Marcus
"Understanding never makes the thing easier. Only more legible."
# speaker: Fang
"That is the least comforting thing you have said on this entire road."
# speaker: Marcus
"Yes. And it is true."
+ [Section 9. The han Lawrence left behind.] -> act9_geori_9_choice

=== act9_geori_9_choice ===

// 📍 Gyeryongsan · Geori 9 · The Unfinished Holding
Thirty-Five Years of Someone Else's Grief

The ninth station activates. What surfaces is not a scene. It is a weight.

The han is Lawrence's: a thousand years of accumulated grief, of people outlived, of faith lost and rebuilt and lost again, of the specific exhaustion of continuing when continuation ceased to carry meaning. It is ancient and layered and it is not small. In 1389 he handed it to a mudang on a mountain for one night, and she held it the way her practice asked her to, and in the morning he left and the han did not go with him and the ceremony did not release it.

What the party feels is the weight of thirty-five years of carrying something that did not belong to you because it had nowhere else to go.
Lawrence does not move for a long moment.

Then:

# speaker: Lawrence
"(very quiet, to the ceremony space, not to Ihwa) That is mine."
A pause.

# speaker: Lawrence
"I know it is mine. I knew it when I left it. I told myself the ceremony held these things as a matter of practice, that they belonged to the space, not to her. I have known for thirty-five years that this was not the correct accounting."
The weight does not lift. The naming does not resolve it. But something in the ceremony space recognizes the acknowledgment: the ninth station's candle stops flickering. Holds steady.

+ [Receive it. The ceremony registers the naming.] -> act9_geori_9_accept
+ [Push through. One more passage and then the threshold.] -> act9_geori_9_fight

=== act9_geori_9_fight ===
~ xp = xp + 10
+ [Section 10. The threshold.] -> act9_geori_10_norecovery

=== act9_geori_9_accept ===
~ xp = xp + 50
# speaker: Fang
"(to Lawrence, not gently but not unkindly) You should have come back sooner."
# speaker: Lawrence
"Yes."
# speaker: Fang
"I know why you didn't."
# speaker: Lawrence
"Yes."
# speaker: Fang
"I'm not saying it as an accusation."
# speaker: Lawrence
"I know."
Marcus, who has been watching this exchange: "Section ten."

+ [Section 10. The threshold.] -> act9_geori_10_norecovery

=== act9_norecovery_early ===
~ xp = xp + 25
# speaker: Warden
"The ceremony does not demand speed. It demands presence. Rest if you need to."
# speaker: Fang
"(to Marcus) Did the captor just give us a health break?"
# speaker: Marcus
"She is not a captor in the way we have used the word before."
# speaker: Fang
"No. She isn't."
+ [Return to section 8.] -> act9_geori_8_choice

=== act9_geori_10_norecovery ===
~ xp = xp + 40

// 📍 Gyeryongsan · Geori 10 · The Living and the Dead Separate
The Party's Collective No Recovery
The tenth station is not a memory. It is a weight: the accumulated gravity of everything the ceremony has been holding since 1389. The party reaches it and stops.

Not because they cannot proceed. Because the station requires that they stop.

+ [Hold. Let the ceremony hold all of you.] -> act9_geori_10_accept
+ [Press through to section 11.] -> act9_geori_10_force

=== act9_geori_10_force ===
~ xp = xp + 15
+ [Section 11. The offering.] -> act9_geori_11_offering

=== act9_geori_10_accept ===
~ xp = xp + 60

// 📍 Gyeryongsan · Geori 10 · Held
The ceremony holds them. This is what section 10 does: it holds the living in the position of the living, briefly, formally, so they know what they are and where they stand before the ceremony asks them to give something.

Ihwa, from the center, without turning: "Most people fight this section. Even when they know better. The instinct to keep moving is very strong."

# speaker: Fang
"What happened to the people who fought it?"
# speaker: Warden
"There have been no people. You are the first living party to enter this space in thirty-five years."
A pause.

# speaker: Fang
"(quietly) Oh."
# speaker: Marcus
"She has been here alone."
# speaker: Fang
"(quieter) I know."
The section holds them for one more breath. Then releases.

+ [Section 11. The offering from the living.] -> act9_geori_11_offering

=== act9_geori_11_offering ===

// 📍 Gyeryongsan · Geori 11 · The Offering from the Living
What the Ceremony Has Been Waiting For
The eleventh station is empty. It has been empty for thirty-five years. This is the offering station: in the Jinogi gut, section 11 is where the living bring what they have been carrying and place it in the ceremony as witness. Not to fix it. Not to resolve it. To acknowledge that it is real, and that it was held, and that the holding mattered.

Ihwa stands at the center. She has turned fully to face the party. She is looking at Lawrence.

She does not speak.

{lawrence >= 7:
    Lawrence steps forward.

    He does not have a speech. He has never been a man who reaches for speeches when the true thing is available. What he has is this:

    # speaker: Lawrence
    "I was here in 1389. You performed the ceremony correctly. I gave you what the ceremony asked and left the next morning because I believed that what the ceremony asked was the same as what the situation required, and I have known since approximately midday of that morning that this was not the correct accounting."
    Ihwa does not move.

    # speaker: Lawrence
    "The han I gave you to hold has been yours by circumstance for thirty-five years because I did not come back to receive it and the ceremony could not release it to anyone who was not here. That is not your failing. The ceremony asked you to hold it. You held it correctly. The failure was the absent offering. The offering was mine to bring. I did not bring it."
    A long pause. The candles hold steady.

    # speaker: Lawrence
    "I am here now."
    Lawrence raises his right hand. Two fingers press flat against his sternum.
    He holds the gesture. Holds it past the point of comfort. Then, slowly, he lowers his hand. He places it, open, at his side.

    This is the offering.
- else:
    {lawrence >= 5:
        Lawrence does not step forward. He stands at the threshold of section 11 and does not move.

        {avatarName} moves beside him.

        {avatarName}: "You know what this section needs."
        A long pause.

        # speaker: Lawrence
        "Yes."
        {avatarName}: "Can you do it?"
        # speaker: Lawrence
        "(after a moment) I've been doing it for thirty-five years. I simply have not been doing it here."
        He steps forward. He says what must be said: that he was here, that he left, that the han was his and the empty section his responsibility, that he is here now. Lawrence's hand rises to his sternum. Two fingers. The gesture brief but present.

        The offering is made.
    - else:
        {avatarName} steps forward. Lawrence is at the eleventh station's threshold and not past it.

        The avatar makes the offering that belongs to Lawrence: naming the han as his, the empty section as his absence, the ceremony as real and binding and worth completing even now. The words are true. They are not his words. The ceremony registers the difference. Moon is freed; the ceremony is complete; but something in section 11 carries a gap that is the shape of what was not said by the person who should have said it.

        Ihwa receives the offering. She does not indicate whether it was enough. The ceremony does not indicate this either.

        It was real. It was not fully his.
    }
}

+ [Section 12. The release.] -> act9_geori_12_release

=== act9_geori_12_release ===
~ moonFreeCount = 5
~ moonFreed = true
~ xp = xp + 80
~ commitment = commitment + 2

// 📍 Gyeryongsan · Geori 12 · The Release
The Ceremony Completes

Ihwa moves to the twelfth station. She has not stood at the twelfth station in thirty-five years. The ceremony has been looping at eleven because twelve was always empty.

She performs the twelfth section.

This is the release: the spirits called in section one are thanked and sent. The grief gathered through the ceremony is acknowledged and allowed to dissolve into the space between the living and whatever is past the living. The han that has been collected and named and held is released: not destroyed, not erased, but moved from the space of things stuck to the space of things finished.

The loop breaks.

The candle at the twelfth station lights. The twelfth candle. All twelve candles burn together for the first time since 1389.

The mountain exhales.

Above Gyeryongsan, through the stone and the cold air and the thirty-five years of absent night: Moon rises. The actual Moon. Not the symbol, not the domain. The Moon itself, which has been imprisoned since Death's imprisonment and has not moved across the sky and has not given the proper light to anything that needed it for longer than most living things can remember.

It rises over the crest of Gyeryongsan and the mountain is the first thing to feel it. Then the ceremony space. Then the party.

Ihwa does not look up. She has been waiting for this. She knew what it would feel like. She did not know if it would feel like enough.

Lawrence does not speak.

The party does not speak.

There is nothing to say that is larger than what the Moon just did.

+ [After.] -> act9_postliberation

=== act9_postliberation ===

// 📍 Gyeryongsan · After the Ceremony
The Moon Is Up
The ceremony space is quiet. Twelve candles burn steady.

Ihwa sits at the twelfth station. She is not looking at Lawrence. She is looking at the candle she has not been able to light for thirty-five years. It burns. She does not know what she expected to feel when it finally burned. It is burning now and she is finding out.

Fang sits beside her. Without asking. Without speaking first. Without performing warmth or purpose or helpful intervention. Fang simply folds herself down onto the ceremony floor beside Ihwa the way someone sits next to a person who has been alone for a very long time and does not need advice or comfort, they need someone to be there, and Fang has always known the difference between those two things even when she pretended she did not.

# speaker: Fang
"(after a long time, quietly) Is there anything you need?"
# speaker: Warden
"(even quieter) I don't know. I've been so busy needing the ceremony to complete that I haven't thought past it."
# speaker: Fang
"That's all right. There's time now."
A pause.

# speaker: Warden
"My community is thirty-five years gone."
# speaker: Fang
"I know."
# speaker: Warden
"I don't know if I can go home."
# speaker: Fang
"You don't have to decide right now."
They sit. The twelfth candle burns.

Across the ceremony space, Marcus is at the entrance, reading the mountain through the stone of the threshold. He is noting the way the moonlight has changed the path back down: less guesswork, more shadow, the proper geometry of night that has Moon in it again. He is noting other things too but he is keeping them to himself.

Lawrence stands where he has stood since he lowered his hand. The impossible moonlight that had no source in the cave on the Kira road: it has a source now. It is coming through the ceremony's open ceiling and it is landing on his shoulders and this time it knows exactly why it is here and so does he.

He does not say anything to Ihwa. She does not say anything to him. He said what he said. The moon is up.

That is the entire scene.

+ [After.] -> act10_ihwa_aftermath

=== act9_predeath_road ===
~ xp = xp + 20

// 📍 Gyeryongsan · The Path Down · Toward Death
Five
The party descends Gyeryongsan in proper moonlight for the first time in years. Not just the party: the whole mountain, the whole valley below, the whole peninsula feels the shift. The night cycles, which have been wrong for longer than most living people can remember, are beginning to correct.

Marcus, walking, checking the stars: "The seasonal cycles will begin to normalize within a lunar cycle. The world will not fix itself immediately. But it will know the direction of fixed."

# speaker: Fang
"Good. I am tired of the world being wrong."
# speaker: Marcus
"You have been tired of this world being wrong since before I met you."
# speaker: Fang
"Different kind of wrong. This particular wrong was getting old."
Lawrence, ahead on the path, has not spoken since the ceremony. He is walking the way he has been walking since Jiayuguan: forward, without ceremony, in the direction of what comes next.

The avatar falls into step beside him.

He does not look over. He says, to the path, to the moonlight, to no one specifically:

# speaker: Lawrence
"Thank you. For the road."
Not for the ceremony. Not for section 11. For the road: the whole thing, from Mo Stor to here.

He does not look over. He keeps walking.

The path ahead leads to Death.

+ [The road continues.] -> act10_ihwa_aftermath
+ [Use the Waystone. Return to Mo Stór before the end.] -> act12_mostor_last

=== act10_death_approach ===
~ lastLocation = "Act10_Death_Approach"
// 📍 The Final Road -- Death's Domain
The Last Confrontation
The road ahead leads where it has always been leading.

+ [Read your journal.] -> journal
+ [Play again from the beginning.] -> layermap

=== act12_mostor_last ===
~ lastLocation = "Act12_MoStor_Last"
~ deathArcStarted = true
~ moStorVisits = moStorVisits + 1
// 📍 Mo Stor · The Bridge Inn · Before the End
The Last Return

The third step creaks. The smell arrives before the light. Five Guardians freed and Mo Stor smells exactly as it did in Act 0: woodsmoke, old leather, the copper pot. Some things do not change with the world. Tiberius built this place to be one of them.

He looks up before the door finishes opening. He says the avatar's name. Just the name. There are five drinks on the counter. He has had them poured since the moonrise returned over the Bohai Sea.

# speaker: Tiberius
"Five."
He does not ask what comes next. He knows what comes next. He has known since he gave the party the waystone in Act 0 and watched them walk out the door.

If Tiberius bond is 4+: He comes around the bar. He does something he has not done at any previous return. He refills each drink personally, traveling the full length of the bar. He does not rush. This is the specific tact of a man who understands that the last comfortable thing a person experiences before a hard thing should be given slowly.

The empty stool is still at the end of the bar. Nobody sits in it.

# speaker: Marcus
"(quietly, to Tiberius) The stool. You should tell them before we leave."
# speaker: Tiberius
"(equally quiet) I've been thinking that since Act 3. I haven't found the right moment."
# speaker: Marcus
"This may be the last one."
# speaker: Tiberius
"(looking at the stool, then at the party) Yes. I know."
He refills the drink. He does not tell them. The stool remains empty. Some things are held until the person who should hear them is ready, and Tiberius has spent 340 years learning that the holder is rarely the one who decides when that is.

+ [The road continues.] -> act10_ihwa_aftermath

=== act10_ihwa_aftermath ===

~ lastLocation = "Act10_Ihwa_Aftermath"

~ familiarSignalCount = familiarSignalCount + 1

// 📍 Gyeryongsan · The Ceremony Space · After
Nobody Knows What To Do With Their Hands
The ceremony is over. Nobody is ready to say what that means.

Fang is already on the floor beside Ihwa -- not saying anything, not performing warmth, just there. Marcus has found the ceiling aperture and is reading the stars through it. Not tactically. He is being still and sad in a way the party has not seen before: a very large, very old being watching a world it helped build, lit by a moon that has been absent too long.

Lawrence is standing where he lowered his hand at Geori 11. He has been standing there since the offering. He does not know what to do next. This is a condition he has not been in for approximately a thousand years.

The wolf puppy crosses the ceremony floor. It sits at Lawrence's feet. It was not invited. It does not ask permission. It simply sits.
{familiarSignalCount >= 7>><<journal "Wolf Puppy: Signal Seven" "It crossed the ceremony floor && sat at Lawrence's feet without being invited. The last signal. The old magic in him has settled." "familiar arc complete">><</if:

    + [Stay the night. (Optional.)] -> act10_night_optional
    + [The one exchange that matters, then the road.] -> act11_net_arrival

=== act10_night_optional ===

// 📍 Gyeryongsan · The Ceremony Space · Night
The First Unbroken Moonlight

The party rests in the ceremony space until morning. The Moon's light comes through the open ceiling aperture -- distinct from every prior light source in the game. It is the correct moonlight. The world's geometry remembered.

Fang falls asleep against the doorframe. One arm still loosely near Ihwa. Her version of keeping watch.

Marcus reads the stars through the aperture until the first grey of dawn. When asked later what he was reading, he says: everything. He says it as if that is a complete answer. It is.

Lawrence is still standing at dawn. Exactly where he was.

The avatar wakes to find the wolf puppy has migrated from Lawrence's feet to theirs during the night. It is asleep, warm, and completely certain of its decision.

~ moonApproach = true

# speaker: Marcus
"(when the party is moving, quietly) There is still one more thing."
# speaker: Lawrence
"I know."
That exchange does more work than any processing scene.

+ [The road forward.] -> act11_net_arrival

=== act11_net_arrival ===

~ lastLocation = "Act11_Net_Arrival"

// 📍 Gyeryongsan · The Ceremony Space · Net's Arrival
She Does Not Announce Herself
Net arrives in the ceremony space. The five freed Guardians have collectively restored enough divine connection that she can reach this geography for the first time since the infighting locked her out.

She looks like someone who has been waiting a very long time, choosing how to carry herself in the first moment she has had agency in years. She is not warm and safe. She is the mother of five imprisoned children.

# speaker: Net
"You freed them. All five. I was not able to. You will not hear me pretend otherwise."
She looks at the party. She looks at the wolf puppy. She does not explain what she knows about the puppy.

# speaker: Net
"Before I tell you what comes next, I need to know if you still want what you asked for. When you began this. The road changes what people want. I need to hear it from each of you."
+ [Answer Net's question.] -> act11_net_question_lawrence

=== act11_net_question_lawrence ===
// 📍 Gyeryongsan · Net's Question · Lawrence
Lawrence's Version
# speaker: Net
"(to Lawrence) You came wanting to die. Do you still want that?"
A pause that has a thousand years in it.

{lawrence >= 7:

    # speaker: Lawrence
    "(after a long moment) I came wanting the weight to stop. That is not the same thing as wanting to die. I have been learning the difference for the last few thousand miles."
    # speaker: Net
    "I will remember that answer."
    ~ netAnswerLawrence = "complicated"

- else:

    # speaker: Lawrence
    "(quietly, honestly) Yes."
    # speaker: Net
    "I will remember that answer."
    ~ netAnswerLawrence = "yes"

}

She does not promise she can fulfill it. She does not promise she cannot. She moves to Fang.

+ [Fang's answer.] -> act11_net_question_fang

=== act11_net_question_fang ===
// 📍 Gyeryongsan · Net's Question · Fang
Fang's Version

# speaker: Net
"You came wanting a reason to live. Do you still want to be given one, or do you want to choose your own?"
Fang sits with it for a beat. The player feels the beat.

+ [She wants to be given one.] -> act11_net_fang_given
+ [She wants to choose her own.] -> act11_net_fang_chosen

=== act11_net_fang_given ===
~ netAnswerFang = "given"

# speaker: Net
"I will remember that answer."
+ [Marcus's answer.] -> act11_net_question_marcus

=== act11_net_fang_chosen ===
~ netAnswerFang = "chosen"

# speaker: Net
"(a pause that is almost a smile) I will remember that answer."
+ [Marcus's answer.] -> act11_net_question_marcus

=== act11_net_question_marcus ===
// 📍 Gyeryongsan · Net's Question · Marcus
Marcus's Version

# speaker: Net
"You came wanting to be human again. You have been more human on this road than most people manage in a lifetime. Do you still want the form, or do you want the thing the form was a proxy for?"
Marcus's answer should surprise the player who thought they had him figured out.

+ [He still wants the form.] -> act11_net_marcus_form
+ [He wants the thing the form was a proxy for.] -> act11_net_marcus_truth

=== act11_net_marcus_form ===
~ netAnswerMarcus = "form"

# speaker: Net
"I will remember that answer."
+ [The avatar's answer.] -> act11_net_question_avatar

=== act11_net_marcus_truth ===
~ netAnswerMarcus = "truth"

# speaker: Net
"(very quietly) Yes. I thought you might arrive at that. I will remember it."
+ [The avatar's answer.] -> act11_net_question_avatar

=== act11_net_question_avatar ===
// 📍 Gyeryongsan · Net's Question · You
Your Version

Net turns to the avatar. The question is the one the player has been quietly asking themselves for the whole game.

# speaker: Net
"You came with a reason. The road has complicated it. Do you still want what you asked for?"
+ [Yes. I still want it.] -> act11_net_task
+ [No. I want something different now.] -> act11_net_task
+ [I want something I could not have named at the start.] -> act11_net_task

=== act11_net_task ===
~ netConversationComplete = true
~ xp = xp + 30

// 📍 Gyeryongsan · Net's Task
Now Go Find the One That Wanted to Hold Them

# speaker: Net
"Every captor believed their story completely. Death believed their story first. You already know how to reach what's underneath certainty. You have done it five times. Do it once more."
She describes where Death tends to gather: where the dead have been kept longest, in the greatest number, in a city that was once the center of the world. She does not name Rome. She describes it.

# speaker: Marcus
"(before she finishes the sentence) Rome."
# speaker: Net
"Every captor believed their story completely. Death believed their story first. You already know how to reach what's underneath certainty. You have done it five times. Do it once more."
# speaker: Net
"(departing) I will find you when it is done."
She leaves the way she arrived: quietly.

+ [Mo Stor before the end.] -> act12_mostor_last

=== act13_death_puzzle ===

~ lastLocation = "Act13_Death_Puzzle"

// 📍 The Road · The Map
Where Is Death?

The party has the cloth fragment from Tiberius. They have five freed locations. They have Marcus, who spent a lifetime building the administrative geography of the ancient world. The puzzle is not finding information. It is reading the pattern that has been there since Act 2.

Marcus spreads the route map. He is doing the thing he does when he does not want to arrive at a conclusion: he is cataloguing every intermediate step with exhaustive precision.

# speaker: Marcus
"Five captors. Western Turkey. Central Asia. Xinjiang. Gansu. Korea. Death moved west to east following the Silk Road -- finding the wounded at each Guardian's location. The pattern inverts when read backward. The westernmost Guardian is Water. What is west of Smyrna, older than Smyrna, where the dead have been kept longest in the greatest number --"
# speaker: Fang
"(not looking up from the cloth fragment) You already know."
A pause.

# speaker: Marcus
"(quietly) Yes. I do."
+ [Marcus names it.] -> act13_marcus_names_rome
+ [Fang finds it in the map first.] -> act13_fang_map

=== act13_marcus_names_rome ===
// 📍 The Road · The Map · Marcus
His Rome

Marcus puts the map down. He does not look at the party when he says it.

# speaker: Marcus
"Rome. The catacombs below the Via Appia Antica. Where the dead have been kept longest in the greatest number in the ancient world. My Rome. Death has been operating out of my Rome."
A pause. Three people who understand what this costs him.

# speaker: Lawrence
"When did you last see it?"
# speaker: Marcus
"1455. I didn't stay long."
+ [The cloth fragment confirms it.] -> act13_fang_map

=== act13_fang_map ===
// 📍 The Road · The Map · Fang
Thank You, Jiwon

Fang rotates the cloth fragment. She goes combat-still. The specific stillness. The party knows this stillness by now.

The markings are Silk Road caravan notation -- the same shorthand system Jiwon's merchants used. Old markers. Older than the party expected. Death's influence reached further and earlier than anyone knew.

# speaker: Fang
"I know this symbol. From Jiwon's trade routes. She used this mark for supply points."
# speaker: Lawrence
"You're telling me Death's headquarters was in Jiwon's ledger."
# speaker: Fang
"I'm telling you to thank Jiwon."
A beat of silence. Three people who know what Jiwon means to Fang.

# speaker: Fang
"(quietly) Thank you, Jiwon."

At some point in the sequence, the wolf puppy orients west. Confirmation, not solution.

~ xp = xp + 25

+ [To Rome. Mediterranean first.] -> act14_port_arrival

=== act14_port_arrival ===

~ lastLocation = "Act14_Port_Arrival"

// 📍 Mediterranean Port
The Party Needs a Ship

The captain who takes them has seen enough of the world to not be easily alarmed. He has a legitimate reason to hesitate. He is looking at a bear, a werewolf, and a vampire.

+ [Marcus presents credentials in formal Latin. (In bear form.)] -> act14_negotiate_marcus
+ [Fang presents a full logistics brief before anyone sits down.] -> act14_negotiate_fang
+ [Lawrence pays in a currency nobody else is carrying.] -> act14_negotiate_lawrence
+ [The avatar asks directly and honestly.] -> act14_negotiate_avatar

=== act14_negotiate_marcus ===
// 📍 Mediterranean Port · Negotiation · Marcus
# speaker: Captain
"(staring at the bear for a long moment) I've seen stranger things on this route."
# speaker: Marcus
"(in formal Latin, in bear form) My credentials are impeccable. My form is temporary. My gold is current."
The captain pockets the gold. He does not ask follow-up questions about the bear.

+ [To the ship.] -> act14_ship_nightdeck

=== act14_negotiate_fang ===
// 📍 Mediterranean Port · Negotiation · Fang
Fang has already calculated cargo weight, water requirements, and compensation structure before anyone sits down. The captain appreciates the professionalism.

# speaker: Captain
"(after a pause) The werewolf situation --"
# speaker: Fang
"I keep it managed."
It is so confident it reads as the full explanation. The captain decides it is.

+ [To the ship.] -> act14_ship_nightdeck

=== act14_negotiate_lawrence ===
// 📍 Mediterranean Port · Negotiation · Lawrence
He pays in a currency nobody else is carrying. The captain examines it. Asks exactly one question about its provenance.

# speaker: Lawrence
"(three words) It was earned."
The captain pockets it. Asks when they want to leave.

+ [To the ship.] -> act14_ship_nightdeck

=== act14_negotiate_avatar ===
// 📍 Mediterranean Port · Negotiation · Avatar
Clear, honest request. Destination. Passenger manifest. Compensation offered. The captain is more responsive to this than to credentials, network reputation, or payment. The direct approach is the rarest thing a passenger has offered him.

{(lawrence + fang + marcus) >= 9:

    # speaker: Captain
    "(watching the party assemble) You people move like you've been doing this for a while."
    # speaker: Avatar
    "We have."
    # speaker: Captain
    "The way the tall one watches the door. The bear -- the way he leaves space for the others to move first. That's not a hired party. That's people who know each other."
}

+ [To the ship.] -> act14_ship_nightdeck

=== act14_ship_nightdeck ===

~ lastLocation = "Act14_Ship_NightDeck"

// 📍 Mediterranean · Night Deck
No Chest-Press. No Heartbeat. Just Company.

The Damon/Elena dynamic between Lawrence and the avatar has space here that the road never offered. Two people who have survived eight acts together. The ship moves. The stars are correct overhead -- Moon's liberation has reached the Mediterranean.

No chest-press gesture (retired at Geori 11). No Heartbeat (retired at Geori 12). What the scene offers is quieter: company without performance.

Lawrence is leaning against the stern rail, looking at the water. He is not performing anything. He is simply present, which is its own kind of currency after a thousand years of carefully managed distance.

The avatar sits nearby. He does not move away.

# speaker: Lawrence
"(after a while) I used to know this coast by the way the water moved. Before the Guardians were taken. The current patterns change when the sky cycles break. I have been navigating by wrong currents for so long I had stopped noticing they were wrong."
# speaker: Lawrence
"(to no one specific) The water feels right again. I had forgotten what right felt like."
+ [Optional: Find Marcus at the stern rail.] -> act14_ship_marcus
+ [Optional: The levity moment.] -> act14_ship_levity
{fang >= 9:

    + [Optional: Fang and the letter. (Bond 9-10.)] -> act14_ship_jiwon
}

+ [Rome approaches. The crossing is done.] -> act15_viaappia_entry

=== act14_ship_marcus ===
// 📍 Mediterranean · Stern Rail · Marcus
Marcus at the stern. Watching coastlines. Recognizing geography he has not seen in eighteen centuries. Still and sad in a way the party has not seen. The bear form does not reduce this.

# speaker: Marcus
"(quietly, to no one) It looks the same. Some of it."
A pause.

# speaker: Marcus
"I keep expecting it to look different. More different. Eighteen centuries should leave more evidence. And then there is a headland or a particular angle of cliff and I know exactly where I am and the eighteen centuries disappear."
# speaker: Marcus
"(to the avatar, if they are there) Do you know what it is to recognize something that should no longer recognize you?"
+ [Back to the deck.] -> act14_ship_nightdeck

=== act14_ship_jiwon ===
// 📍 Mediterranean · Ship · Fang and the Letter
The ship is neither the road nor the destination -- the between space where things carried for a very long time can finally be looked at.

Fang is alone at the bow. She takes the letter out. She holds it for a long time. Then she opens it.

She reads. She closes it. She puts it back.

The player never finds out what it says.

~ jiwonLetterOpened = true

+ [Back to the deck.] -> act14_ship_nightdeck

=== act14_ship_levity ===
// 📍 Mediterranean · Ship · The Laugh
Someone says something absurd. The whole party laughs.

This is the sound of people who know they are walking toward Death and have chosen each other anyway. The comedy is real.
+ [Rome approaches.] -> act15_viaappia_entry

=== act15_viaappia_entry ===

~ lastLocation = "Act15_ViaAppia_Entry"

// 📍 Via Appia Antica · Rome
The Oldest Road in the World

Death sends the unresolved dead -- those who chose certainty over release. Not hostile like Death's agents, but wrong in the specific way each captor was wrong. The fight mechanic is the same logic as every prior captor encounter.

# speaker: Marcus
"That tomb belongs to a consular family. They were generous to the poor. They do not deserve to be here this way."
He says this the way he has been saying things since Act 3: information and grief operating simultaneously, each making room for the other.

+ [Encounter One. Familiar ground.] -> act15_encounter1

=== act15_encounter1 ===
// 📍 Via Appia · Encounter One
What the Party Knows

Standard mechanics from Acts 2-9. Familiar, capable, confident. The party runs its established protocol. It works.

# speaker: Marcus
"I walked this road as emperor. I walked it in mourning after. I did not expect to walk it again."
~ xp = xp + 20

+ [Encounter Two.] -> act15_encounter2

=== act15_encounter2 ===
// 📍 Via Appia · Encounter Two · The Flip
What the Road Has Learned

The unresolved dead have been watching. They have learned the party's frequencies. What worked in Encounter One has no purchase here. The flip is the same logic as Gyeryongsan: the party's standard tools are insufficient against something that has been studying them.

+ [Adapt. New approach.] -> act15_encounter2_adapt
+ [No Recovery. The others cover.] -> act15_norecovery_via

=== act15_encounter2_adapt ===
~ xp = xp + 25

+ [Encounter Three. The Protocol.] -> act15_encounter3

=== act15_norecovery_via ===
~ xp = xp + 25

+ [Cecilia Metella.] -> act15_ceciliametella

=== act15_encounter3 ===
// 📍 Via Appia · Encounter Three · The Protocol
The Party Cannot Clear the Entire Via Appia
The party runs the No Recovery protocol. They push through what they must. The road holds what remains.

~ xp = xp + 25

+ [Cecilia Metella.] -> act15_ceciliametella

=== act15_ceciliametella ===

~ marcusViaAppiaStop = true

// 📍 Via Appia · Cecilia Metella
The Emotional No Recovery

The largest tomb on the Via Appia. This is where Marcus hits his emotional limit. Not a combat No Recovery. An emotional one. He stops walking.

The party stops with him. The game does not rush it.

# speaker: Fang
"Take the time."
# speaker: Marcus
"(after a beat) I am."
He does not say what the tomb means. He does not need to. He takes the time. Then he moves. His bearing has shifted and does not shift back. Something settled on the Via Appia.

+ [Underground. The catacombs.] -> act16_catacombs_entry

=== act16_catacombs_entry ===

~ lastLocation = "Act16_Catacombs_Entry"

// 📍 Roman Catacombs · Entrance
The Absence Puzzle

300 miles of tunnels. The correct direction is not found by looking at what is there. It is found by reading what is missing.

+ [Chamber One.] -> act16_chamber1

=== act16_chamber1 ===
// 📍 Roman Catacombs · Chamber One
# speaker: Marcus
"The inscriptions are correct but the resonance is not. Someone has been using these spaces for something other than what they were built for."
He reads the walls the way he reads terrain: eighteen centuries of understanding completion and incompletion. The hollow niches are not empty. They are present but drained. Like a ceremony with no section 12.

+ [Chamber Two.] -> act16_chamber2

=== act16_chamber2 ===
// 📍 Roman Catacombs · Chamber Two
The hollow niches cluster in a pattern, denser as the party moves south. The direction is toward St. Callixtus.

# speaker: Marcus
"Denser here. Someone has been working this direction for a long time."
+ [Chamber Three.] -> act16_chamber3

=== act16_chamber3 ===
// 📍 Roman Catacombs · Chamber Three
What Fang Finds

A fragment of the papal inscription sequence unique to the Callixtine complex. Marcus identifies it with a weight the player has not heard from him before.

# speaker: Marcus
"(very quietly) These are popes I knew. I was present when two of them were consecrated. I watched what they were building while they built it. And Death was here underneath all of it, the entire time."
Fang goes combat-still. The specific stillness.

Caravan markers scratched into the catacomb walls. Silk Road notation -- the same shorthand from the cloth fragment at Tiberius. Old markers. Older than the party expected.

~ xp = xp + 30

+ [St. Callixtus. The final approach.] -> act17_stcallixtus_approach

=== act17_stcallixtus_approach ===

~ lastLocation = "Act17_StCallixtus_Approach"

// 📍 Catacombs of St. Callixtus · Approach
The Chosen

Death's agents at St. Callixtus chose their certainty. They fight with composite certainty: the Tidewarden's logic, Yildiz's precision, Kira's weight, Seo Yun-ji's exposure, Ihwa's memory-as-trap inversed. The party recognizes each mode. Combined, without a wound to reach, these agents are harder than anything prior.
+ [Approach Phase. Hard but readable.] -> act17_phase1

=== act17_phase1 ===
// 📍 St. Callixtus · Approach Phase
Familiar composite-mode enemies. Hard but readable. The party runs its established protocol.

+ [Mid-Approach Escalation.] -> act17_escalation

=== act17_escalation ===
// 📍 St. Callixtus · Escalation
They Do Not Adapt. They Press.

Relentless forward pressure. Not a flip mechanic. These agents do not adapt -- they press. There is no argument. There is only holding the ground.

Each party member will hit their limit. The No Recovery protocol runs.

{lawrence >= 7 && lawrenceArcComplete:

    + [Lawrence at the gate. (Bond 7+)] -> act17_lawrence_gate_high
- else:

    + [Lawrence steps forward.] -> act17_lawrence_gate_low
}

=== act17_lawrence_gate_high ===
// 📍 St. Callixtus · Lawrence's Limit · Bond 7+
Death's agents know he came here to die. They are offering it. He has to choose, actively, not to take it.

# speaker: Lawrence
"(combat commentary, almost to himself) What you are showing me is the death I arrived wanting. I know what it looks like. I have been looking at it for a thousand years. And I am not taking it. Not because it is not real. Because what I want now is different from what I arrived with. The difference is everyone standing behind me."
~ lawrenceDeathChoiceMade = true

He steps forward. He does not look back.

+ [The threshold. The party arrives together.] -> act17_threshold

=== act17_lawrence_gate_low ===
// 📍 St. Callixtus · Lawrence's Limit · Below Bond 7
Death's agents know he came here to die. They are offering it.

He steps forward. That is the full description of his choice. The absence of the speech is correct for this player.

+ [The threshold.] -> act17_threshold

=== act17_threshold ===
~ xp = xp + 40

// 📍 St. Callixtus · The Threshold
They Have Arrived Together

They have arrived together. That has always been the point.

+ [Enter. Death is inside.] -> act18_death_entry

=== act18_death_entry ===

~ lastLocation = "Act18_Death_Entry"

// 📍 Catacombs of St. Callixtus · The Papal Crypt
The Argument That Certainty Cannot Answer
Death does not open with combat. Death opens with the offer.

+ [Receive the offer.] -> act18_phase1_offer

=== act18_phase1_offer ===
// 📍 St. Callixtus · Phase One · The Offer
What Death Believes It Is Giving You

Death offers each party member what they originally wanted. Death genuinely believes these are gifts.

{netAnswerLawrence == "yes":

    Lawrence's offer: the death he wanted in Act 0. Simple. Clean. The release he came for.

- else:

    Lawrence's offer: the death he said in Act 11 that he no longer wanted. Death did not update its records.

}

Fang's offer: a reason to live, delivered from outside, permanent and inarguable.

Marcus's offer: Rome. Pristine. The Pax Romana restored.

Your offer: whatever was chosen in Act 0, fulfilled exactly as stated.

+ [Refuse immediately.] -> act18_refuse
+ [Accept it. Hold it. Then choose against it.] -> act18_accept_then_reject
+ [Ask Death why it is offering.] -> act18_phase2_recognition

=== act18_refuse ===
~ deathOfferEngaged = false

+ [Phase Two. The fight.] -> act18_phase3_combat

=== act18_accept_then_reject ===
~ deathOfferTaken = true
~ deathOfferEngaged = true
~ xp = xp + 50
~ lawrence = lawrence + 1
~ fang = fang + 1
~ marcus = marcus + 1

The Offer Was Real. You Chose Against It Anyway.

You hold it. For a moment. It is real -- Death did not lie. The weight of what was offered settles on you and you carry it for exactly as long as it takes to know you do not want it.

You choose against it.
+ [The fight.] -> act18_phase3_combat

=== act18_phase2_recognition ===
// 📍 St. Callixtus · Phase Two · The Recognition
The Confession

If the party engages, Death reveals something. Not a villain monologue. A confession.

Death was not acting from malice. It was acting from the same impulse as every captor: certainty. Death chose stasis over risk during the divine war. It believed that if nothing changed, nothing terrible would happen. It was wrong. And it does not know how to be wrong.

This is the wound. This is the path.

~ deathOfferEngaged = true

+ [Phase Three. The argument.] -> act18_phase3_combat

=== act18_phase3_combat ===
// 📍 St. Callixtus · Phase Three · Each Character's Path
The Argument That Certainty Cannot Answer

~ deathFought = true

# speaker: Marcus
"I governed Rome as if stability was virtue. I called it the Pax. It was a choice to preserve what we had at the cost of what we might have become. You made the same mistake at a different scale. That does not make it a different mistake."
# speaker: Fang
"I've been beside people who couldn't let go. I didn't fix them. I didn't argue with them. I sat there until they were ready. I have all day."
{lawrenceDeathChoiceMade:

    # speaker: Lawrence
    "What you are offering is release from a weight I have carried for a thousand years. I came here wanting exactly that. I am not taking it. Not because it is not real. Because what I want now is not the same thing as what I arrived with. The difference is everyone in this room with me."
}

Every party member hits their limit in sequence during Phase Three. Each steps back. Each is covered. The avatar completes the final approach.
+ [The avatar crosses the room.] -> act18_avatar_walk

=== act18_avatar_walk ===
// 📍 St. Callixtus · The Avatar's Walk
Company

The player crosses the room alone. Death has been expecting power. What arrives is the person who has been here the whole time, choosing to be here. Death has been alone in its certainty for the entire game. What it cannot answer is not an argument. It is company.

Death's certainty breaks. Not because the party won. Because the party's continued presence is an argument Death cannot answer.

~ deathLiberated = true
~ xp = xp + 60

The Binding in the Callixtine crypt unlocks with the specific sound of something held very tightly for a very long time finally letting go.

+ [Net's promise comes due.] -> act18_net_fulfillment

=== act18_net_fulfillment ===
// 📍 St. Callixtus · Net's Fulfillment
I Will Remember That Answer

Net appears. The question is asked again -- each character's answer from Act 11 is now fulfilled.

{netAnswerLawrence == "complicated" && lawrenceDeathChoiceMade:

    # speaker: Net
    "(to Lawrence) You said it was the weight, not the dying. I remember. What I owe you is not what you asked for at the start. It is what you arrived at."
    She gives him something that is not death and is not the original ask. It is what he became on the road. The player who followed Lawrence from Act 0 will know what it is without being told.

- netAnswerLawrence == "yes":

    # speaker: Net
    "(to Lawrence) You said yes. I remember. I owe you what you asked for, when you are ready for it. You get to decide when that is."
}

The fulfillments are specific, earned, and gated by bond depth and answer choices. Each lands differently for each player.

~ xp = xp + 20

+ [Mo Stór. The last return.] -> epilogue_mostor

=== epilogue_mostor ===

~ lastLocation = "Epilogue_MoStor"

~ moStorFinal = true

// 📍 Mo Stór · The Bridge Inn · After Everything
The Third Step Creaks

The waystone still works. It always worked if you meant it.

The party returns to Mo Stór. The third step creaks. The smell arrives before the light. Tiberius looks up before the door finishes opening.

There is a drink on the counter for each of them. There is one extra.

+ [The empty stool.] -> epilogue_stool

=== epilogue_stool ===
// 📍 Mo Stór · The Stool
Someone Should Sit In It

Tiberius walks around the bar. He sits in the empty stool at the end of the bar. The first time, in the entire game, the player has seen him sit in his own bar.

# speaker: Tiberius
"Someone should sit in it. It took me a while to accept that someone could be me."
He tells them. The stool's story. Specific, tender, unexpected, and true to Tiberius's register. It lands as something the player already half-knew.

~ tiberiusStoolNamed = true

A long pause.

# speaker: Tiberius
"(after a long pause) Same thing as always?"
Yes. Same thing as always. They are home.

~ xp = xp + 30

+ [Read your journal.] -> journal
+ [Play again from the beginning.] -> layermap

=== storyscript ===
/* © Studio Zisha 2026
─────────────────────────────────────────────────────────────────────────
RULE 10 EXCEPTION: DIALOGUE CARVE-OUT
Rule 10: Anytime "Win" or "Fail" is mentioned in SYSTEM UI, correct to
"Resonance" or "Fracture".

Exception: "win", "fail", and their conjugates are permitted inside
character dialogue tags (...) when they reflect
a character's natural speech. Replacing them in dialogue breaks voice,
undermines authenticity, and distorts the line's emotional register.

Canonical example preserved under this exception (Act 3, Highwind Pass):
Marcus: "She's not trying to win anymore..."
Marcus: "Someone fighting to win still believes they can..."
These are tactical battlefield observations spoken in a character's voice.
They are not outcome-state labels. They stand as written.

Rule 10 enforcement applies to: > blocks, RESONANCE/FRACTURE banners,
hint text, journal entries, and any non-dialogue narrator text.
─────────────────────────────────────────────────────────────────────────
*/
/* ── STATE VARIABLES ── */
State.variables.lawrence = 0;
State.variables.fang     = 0;
State.variables.marcus   = 0;
State.variables.tiberius = 0;
State.variables.dex      = 0;
State.variables.flow     = 0;
State.variables.end      = 0;
State.variables.stag     = 0;
State.variables.xp       = 0;
State.variables.commitment = 0;

/* ── EMOTIONAL STATE ── */
State.variables.emotion  = "Curious";

/* ── MECHANIC FLAGS ── */
State.variables.noRecoveryUnlocked = false;
State.variables.heartbeatCount     = 0;
State.variables.chestPressCount    = 0;
State.variables.jiwonSeen          = false;
State.variables.demoComplete       = false;
State.variables.commitmentUnlocked = false;

/* ── NARRATIVE FLAGS ── */
State.variables.observedForest   = false;
State.variables.marcusConsulted  = false;
State.variables.wardenPeaceful   = false;
State.variables.fireCampOpen     = false;
State.variables.tribunalDialogue = false;
State.variables.skyResonance     = "none";
State.variables.saltFlatsChoice  = "";
State.variables.drinkFinished    = false;

/* ── WAYSTONE VARIABLES ── */
State.variables.waystoneCharges  = 1;
State.variables.moStorVisits     = 0;

/* ── FAMILIAR ARC ── */
State.variables.familiarSignalCount = 0;

/* ── JOURNAL SYSTEM ── */
State.variables.journal = [];

/* ── AVATAR ── */
State.variables.avatarName = "Fortune";
State.variables.fortuneGroveAnswer = "";
State.variables.irlPlayer  = "Ishani";
State.variables.buildScope = "DEMO";

/* ── ACTS 6-7 VARIABLES ── */
State.variables.tariqLedger      = false;
State.variables.batuMet          = false;
State.variables.batuPath         = "";
State.variables.almasNegotiated  = false;
State.variables.almasVibration   = false;
State.variables.spiderWebReader  = false;
State.variables.kiraBound        = "";
State.variables.stoneFreeCount   = 0;
State.variables.gaochangScene    = false;
State.variables.partyFriction    = false;

/* ── WAYSTONE TRACKING ── */
State.variables.lastLocation = "Act8_BridgeToMoon"; // updated at each act transition

/* ── KAI ENCOUNTER FLAGS (v5) ── */
State.variables.kaiRheaPortScene   = false;  // Kai Rhea Port encounter triggered
State.variables.kaiSusceptible     = false;  // Fortune susceptible to enspell trace (incomplete -- Lawrence intervened)
State.variables.kaiEnspellAwareness = false; // Fortune was aware of the mechanism during the enspell (DEX 3+ or Lawrence 4+)
State.variables.kaiSunFreedSeen    = false;  // Kai Late Beat 1 (between Sun and Moon) triggered

/* ── AVATAR PROTECTION FLAG ── */
// Elena / ILickTheSpoon avatars: enspell compliance never includes sexual compliance regardless of completion state
// Set this flag true when avatar selection confirms Elena or ILickTheSpoon identity
State.variables.avatarProtected    = false;

/* ── ACT 8-9 FLAGS ── */
State.variables.sunFreeCount   = 0;
State.variables.moonApproach   = false;
State.variables.jiwonHanjiAdded = false;

/* ── DEATH ARC FLAGS (v10) ── */
State.variables.deathArcStarted       = false;
State.variables.netConversationComplete = false;
State.variables.netAnswerLawrence     = "";   // "yes" / "no" / "complicated"
State.variables.netAnswerFang         = "";   // "given" / "chosen"
State.variables.netAnswerMarcus       = "";   // "form" / "truth"
State.variables.netAnswerAvatar       = "";
State.variables.deathOfferEngaged     = false;
State.variables.deathOfferTaken       = false;
State.variables.lawrenceDeathChoiceMade = false;
State.variables.marcusViaAppiaStop    = false;
State.variables.jiwonLetterOpened     = false;
State.variables.deathFought           = false;
State.variables.deathLiberated        = false;
State.variables.tiberiusStoolNamed    = false;
State.variables.moStorFinal           = false;

/* ── ACT 9 -- MOON ARC FLAGS ── */
State.variables.moonFreeCount      = 0;     // set to 5 when Moon Guardian freed
State.variables.moonFreed          = false; // true after Geori 12 completes
State.variables.lawrenceArcComplete = false; // true if Lawrence Bond 7+ at Geori 11

/* ── KAI FLAGS (v4) ── */
State.variables.kaiMet               = false;   // Kai marketplace encounter triggered
State.variables.kaiBoundarySet       = false;   // Player set a boundary with Kai
State.variables.kaiCombatTriggered   = false;   // Combat with Kai occurred
State.variables.kaiNoRecoveryWitnessed = false; // Player used No Recovery during Kai combat

/* ── PARASOCIAL RELATIONSHIP FLAGS (v15) ── */
State.variables.jeff                 = 0;       // IRL Byung-Ho bond (0-10). Never display as number. Expressed through text tone only.
State.variables.fangSeen             = false;   // Fang asked the avatar the right question (Bridge_Samarkand_FangQuestion)
State.variables.fangFamiliar         = false;   // Fang named the familiar feeling at the salt flats (Bridge_SaltFlats_FangDawn)
State.variables.gaochang             = "";      // "lean" / "hold" / "passed" -- tracks player's Gaochang consent choice
State.variables.lawrenceFracture     = false;   // Player provoked Lawrence at Supply scene; trust must be rebuilt
State.variables.marcusSeenYou        = false;   // Marcus named what he observed (Marcus_Sees_You)
State.variables.marcusTouched        = false;   // Player placed hand on Marcus's arm (Marcus_CounterOath)
State.variables.heartbeatPlanted     = false;   // Player has heard the Heartbeat plant in Act 2 (internal tracker)
State.variables.avatarConsentShown   = false;   // Avatar has modeled consent-first behavior toward an NPC
/* ── STAT BAR ── */
$(document).on(':passagedisplay', function() {
var v = State.variables;
var bar = document.getElementById('stat-bar');
if (!bar) {
bar = document.createElement('div');
bar.id = 'stat-bar';
document.body.appendChild(bar);
}
bar.innerHTML =
'XP ' + v.xp + '' +
'Lawrence ' + v.lawrence + '' +
'Fang ' + v.fang + '' +
'Marcus ' + v.marcus + '' +
'Tiberius ' + v.tiberius + '' +
'DEX ' + v.dex + '' +
'FLOW ' + v.flow + '' +
'END ' + v.end + '' +
'♫ ' + v.heartbeatCount + '' +
'IRL ' + v.jeff + '';
});

/* ── CUSTOM MACROS ── */

/* >: tracks Heartbeat theme deployment */
Macro.add('heartbeat', {
handler: function() {
State.variables.heartbeatCount++;
var el = this.output;
var note = document.createElement('div');
note.className = 'sys music hb-pulse';
note.innerHTML = '♫ HEARTBEAT #' + State.variables.heartbeatCount + ': ' + this.args[0];
el.appendChild(note);
}
});

/* >: tracks Lawrence chest-press gesture */
Macro.add('chestpress', {
handler: function() {
State.variables.chestPressCount++;
var el = this.output;
var p = document.createElement('p');
p.style.cssText = 'color:#a78bfa;font-style:italic;margin:.8rem 0;';
p.innerHTML =  + this.args[0] + ;
el.appendChild(p);
}
});

/* >: inline stat display (used in specific passages) */
Macro.add('statbar', {
handler: function() {
/* rendered by StoryReady HUD; this macro is a no-op kept for compatibility */
}
});
/* ── START OVERRIDE ── */
Config.passages.start = "Opening";
Config.history.maxStates = 40;

/* ── SAFE BACKWARD NAVIGATION ── */
/* Single guard function used by BOTH the demo back button and the Journal Return link.
Prevents Engine.backward() from firing when history has no valid previous state.
Also prevents backward navigation INTO one-way narrative gates. */
window.safeBackward = function() {
/* SugarCube 2.37 -- Engine.backward() is the correct documented API.
State.length > 1 means there is at least one previous moment to return to. */
if (State.length <= 1) return false;
Engine.backward();
return true;
};

/* ── > macro ── */
Macro.add('journal', {
handler: function() {
var title = this.args[0] || '';
var body  = this.args[1] || '';
var tag   = this.args[2] || 'event';
State.variables.journal.push({
title: title,
body:  body,
tag:   tag,
passage: State.passage
});
}
});

/* ── DEMO BACK BUTTON ── */
$(document).on(':passageend', function() {
if (State.variables.buildScope !== "DEMO") return;
var passage = State.passage;
/* Static skip: true one-way gates and system passages ONLY.
MoStor_Descent is NOT a gate -- testers need to go back from there. */
var skip = ['StoryTitle','StoryStylesheet','StoryInit','StoryReady',
'Opening',
'-webkit-scrollbar','-webkit-scrollbar-thumb',
'-webkit-scrollbar-thumb:hover','-webkit-scrollbar-track',
'LayerMap','AvatarName',
'IRL_Chat_Close','IRL_Chat_Close_Name','IRL_Chat_Decline','Journal'];
if (skip.indexOf(passage) !== -1) return;
/* Dynamic skip: nothing to go back to (SugarCube 2.37 -- State.length is the count) */
if (State.length <= 1) return;
/* Prevent duplicate buttons within the same render */
if (document.querySelector('.demo-back')) return;
var psg = document.querySelector('.passage');
if (!psg) return;
var div = document.createElement('div');
div.className = 'demo-back';
var link = document.createElement('a');
link.href = '#';
link.innerHTML = '\u2190 Back';
link.addEventListener('click', function(e) {
e.preventDefault();
window.safeBackward();
});
var tag = document.createElement('span');
tag.className = 'demo-tag';
tag.textContent = ' [DEMO]';
div.appendChild(link);
div.appendChild(tag);
/* Insert AFTER last choice button -- :passageend guarantees DOM is complete */
var choices = psg.querySelectorAll('.choice');
if (choices.length > 0) {
var last = choices[choices.length - 1];
last.parentNode.insertBefore(div, last.nextSibling);
} else {
psg.appendChild(div);
}
});

-> END

=== storystylesheet ===
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=EB+Garamond:ital,wght@0,400;0,600;1,400&display=swap');

/* ── RESET & BASE ── */
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body, html { background: #0f0e17; }

/* ── STORY AREA ── */
#story {
font-family: 'EB Garamond', Georgia, serif;
font-size: 1.2rem;
color: #e8e0d0;
line-height: 1.85;
}

#passages {
max-width: 800px;
margin: 0 auto;
padding: 2rem 1.5rem 6rem;
}

.passage { padding: 0; }

/* ── ACT BANNER ── */
.act-banner {
background: linear-gradient(135deg, #1e1b4b 0%, #2d1b69 100%);
border: 1px solid #6b21a8;
border-radius: 6px;
padding: 1.4rem 2rem;
margin-bottom: 2rem;
text-align: center;
}
.act-title {
font-family: 'Cinzel', serif;
font-size: 1.7rem;
color: #f9fafb;
letter-spacing: .1em;
margin-bottom: .35rem;
}
.act-sub {
font-style: italic;
color: #a5b4fc;
font-size: .95rem;
}

/* ── LOCATION TAG ── */
.loc-tag {
display: inline-block;
background: #ede9fe;
color: #4c1d95;
font-style: italic;
font-size: .88rem;
padding: .35rem .85rem;
border-radius: 4px;
margin-bottom: 1.25rem;
}

/* ── HEADINGS ── */
h2.sc-h2 {
font-family: 'Cinzel', serif;
color: #c4b5fd;
font-size: 1.2rem;
border-bottom: 1px solid #3730a3;
padding-bottom: .3rem;
margin: 2rem 0 .9rem;
}
h3.sc-h3 {
color: #fbbf24;
font-size: 1.05rem;
margin: 1.5rem 0 .5rem;
}

/* ── BODY TEXT ── */
p { margin: .6rem 0; }

/* ── DIALOGUE ── */
.dlg {
margin: .5rem 0 .5rem 1.5rem;
padding-left: 1rem;
border-left: 3px solid #3730a3;
}
.who { font-weight: 700; font-style: normal; }
.who.lawrence  { color: #a78bfa; }
.who.fang      { color: #34d399; }
.who.marcus    { color: #60a5fa; }
.who.ishani    { color: #f9a8d4; }
.who.tiberius  { color: #fbbf24; }
.who.warden    { color: #94a3b8; }
.who.tidewarden{ color: #f87171; }
.who.sky       { color: #7dd3fc; }
.who.sera      { color: #fcd34d; }
.who.water     { color: #67e8f9; }
.who.tariq     { color: #c4b5fd; }
.who.batu      { color: #a78bfa; }
.who.kira      { color: #fb923c; }
.who.kai       { color: #c084fc; }
.who.npc       { color: #d1d5db; }
.line { color: #e8e0d0; }

/* ── SYSTEM NOTES ── */
.sys {
border-radius: 5px;
padding: .65rem 1rem;
margin: 1rem 0;
font-size: .9rem;
line-height: 1.55;
}
.sys.note  { display: none; }
.sys.info  { display: none; }
.sys.good  { background:#dcfce7; color:#14532d; border-left:4px solid #166534; }
.sys.warn  { background:#fee2e2; color:#7f1d1d; border-left:4px solid #991b1b; }
.sys.music { display: block; background:#fef3c7; color:#78350f; border-left:4px solid #b45309; }

/* ── CHOICES ── */
.choice {
display: flex;
align-items: baseline;
gap: .75rem;
margin: .45rem 0;
padding: .65rem 1rem;
background: #1a1740;
border: 1px solid #3730a3;
border-radius: 5px;
transition: background .15s, border-color .15s;
}
.choice:hover { background: #252060; border-color: #6b21a8; }
.choice a {
color: #fbbf24 !important;
font-weight: 600;
text-decoration: none !important;
flex: 1;
cursor: pointer;
}
.choice a:hover { color: #fde68a !important; }
.hint {
color: #6b7280;
font-size: .8rem;
font-style: italic;
flex: 0 0 auto;
max-width: 210px;
text-align: right;
}

/* ── STAT BAR ── */
#stat-bar {
position: fixed;
top: 0; left: 0; right: 0;
background: rgba(15,14,23,.92);
backdrop-filter: blur(6px);
border-bottom: 1px solid #1e1b4b;
padding: .4rem 1.5rem;
display: flex;
flex-wrap: wrap;
gap: .5rem 1.2rem;
font-size: .82rem;
color: #a5b4fc;
z-index: 1000;
}
#stat-bar .sv { color: #fbbf24; font-weight: 700; }
#stat-bar .sl { color: #a5b4fc; }

/* ── HEARTBEAT ANIMATION ── */
@keyframes hbpulse {
0%,100% { opacity: 1; box-shadow: 0 0 0 0 rgba(180,83,9,0); }
40%     { opacity: .7; box-shadow: 0 0 0 6px rgba(180,83,9,.3); }
}
.sys.music.hb-pulse { animation: hbpulse 1.4s ease-in-out 2; }

/* ── UI BAR ── */
#ui-bar { background: #0f0e17; border-right: 1px solid #1e1b4b; }
#ui-bar-body, #ui-bar-history, .ui-bar-body { color: #a5b4fc; }
#story-title { font-family: 'Cinzel', serif; color: #c4b5fd !important; font-size: .95rem; }

/* Scrollbar */

-> END

=== act1_fangshift ===
// 📍 Verdant Verge · Deep · Full Moon
Fang goes still. Not combat-still. Wrong-still. The kind of stillness that happens before something irreversible.

Her eyes track the full moon through the gap in the canopy. Just for a second. Then she closes them.

Lawrence says one word to Marcus, very quiet: "Now." Marcus is already moving. They have done this before. The choreography is too smooth for anything else.

The shift is not slow. The Florentine form dissolves, the two centuries of precision and discipline and performed warmth, all of it recedes in the span of three seconds. What replaces it is faster and stronger and less precise and completely unreachable. The wolf does not attack the party. It attacks everything that moves, which in a forest full of grief-bound spirits is a significant category. The ghost clusters scatter and surge and scatter again, responding to something in her energy the way they never responded to swords.

The wolf puppy has not moved. It is sitting exactly where it was, watching, waiting.

Lawrence turns to you. His expression is level. This is not an emergency to him. It is a condition he knows how to manage.

# speaker: Lawrence
"She comes back. She always comes back. The question is what you do with the next ten minutes."
+ [Call her name.] -> act1_fangshift_reach
+ [Step back. Let Lawrence and Marcus work.] -> act1_fangshift_contain
+ [Keep working the ghost puzzle while the others manage her.] -> act1_fangshift_workaround

=== act1_fangshift_reach ===
~ lawrence = lawrence + 1
// 📍 Verdant Verge · Deep · Full Moon
You call her name.

It comes out before you decide to. Just her name, into the chaos, because it is the only thing you have.

Lawrence steps in front of you. Not grabbing you. Not performing authority. He simply puts himself between you and the wolf, one arm slightly out, the way you block a door without closing it.

# speaker: Lawrence
"She can’t hear you. Not right now."
A pause. He does not move. He is not looking at you. He is watching Fang the way someone watches a storm: not for threat, for pattern.

# speaker: Lawrence
"She will. Give her the ten minutes."
He stays there until you stop. Then he turns back to Fang and the ghost clusters and manages both with the economy of someone who has had two hundred years to work out the geometry.

You stay at the edge. Marcus covers your flank. The ghost clusters press in and you hold the line because that is what there is to do.

Fang comes back from wherever she went. When she does, Lawrence is standing exactly where she left him. She clocks his position. She clocks yours. She does not say anything yet. But she noted where you were.

+ [Fang returns.] -> act1_fangshift_return

=== act1_fangshift_contain ===
~ flow = flow + 1
// 📍 Verdant Verge · Deep · Full Moon
You step back. Lawrence and Marcus move into the space you leave. Whatever protocol they have for this, it engages without discussion. Lawrence positions himself to Fang’s left and slightly behind, not trying to stop her, redirecting. Marcus covers the right flank, his size useful as geometry rather than force.

The ghost clusters press toward you on the perimeter. With Lawrence occupied, they have a direction to fill. You hold the line alone: watching the movement patterns, reading the drift, using your body to redirect clusters the way Marcus redirected Fang. Not fighting them. Pointing them.

It works, partially. Two clusters orient east toward the treeline and do not come back.

# speaker: Marcus
"(without looking away from Fang, noticing what you did) Good."
You hold the line until the moon shifts and the pull recedes. It takes longer than ten minutes. You do not count.

+ [Fang returns.] -> act1_fangshift_return

=== act1_fangshift_workaround ===
~ dex = dex + 1
~ end = end - 1
// 📍 Verdant Verge · Deep · Full Moon
You work the problem you can solve. Lawrence and Marcus can manage Fang. The ghost puzzle is still in front of you and every minute spent waiting is a minute the clusters spend pressing closer.

You watch the ghost movement. East. All of them. The same incomplete step, looping back at the treeline, starting over. The pattern is clear and repeating and it is telling you something if you can get close enough to read it without a werewolf in the periphery of your vision.

A cluster drifts through you. Cold that goes past the skin into the architecture of the bone. Your grip weakens. You keep working.

You figure out two things: the clusters are not random, and the treeline is where they stop. That is enough for now.

The ghost cluster catches your off-arm on the way out. The cold will still be in the muscle tomorrow.

# speaker: Lawrence
"(afterward, flat) You made progress. You also let a cluster walk through you from behind because you were too focused on the treeline to keep the perimeter. Next time: tell me where you’re going."
He is not angry. He is correcting. There is a difference, and you notice it.

+ [Fang returns.] -> act1_fangshift_return

=== act1_fangshift_return ===
// 📍 Verdant Verge · Deep · The Moon Shifts
The moon slides behind cloud. The pull recedes by degrees.

Fang comes back to herself.

She knows immediately. There is no confusion, no disorientation. She was somewhere else and now she is here and she knows exactly what the difference is. She stands where she is for a moment, not moving, not looking at anyone. The wolf puppy, which has been sitting exactly where it was since the shift began, gets up, walks to her feet, and sits back down. She does not look at it.

She looks at her hands. Both blades are still there. She turns them once, slowly. Checks the weight. Turns them back.

Then she picks them up, sheathes them, and turns to face the ghost clusters like nothing happened. Her first line is dry and short, which is how you know it cost her.

# speaker: Fang
"Right. Where were we."
Not a question. A door closing on a room she is not opening tonight. Lawrence and Marcus do not debrief. They do not look at each other. The silence is the kindness, and she knows it.

The ghost clusters drift. East, east, east. Waiting to be understood.

+ [Watch the ghosts' movement patterns.] -> act1_ghostwatch
+ ['They’re travelers. Where were they going?'] -> act1_ghostdirection
+ ['Lawrence, what does your magic actually see?'] -> act1_ghostmagic

=== studiozisha_copyright ===
/* Stone of Commitment: Vanquish Death - Canonical Twee v4.0
© Studio Zisha 2026
All rights reserved. */

-> END
