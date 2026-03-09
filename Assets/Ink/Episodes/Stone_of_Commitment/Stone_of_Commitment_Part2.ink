// ────────────────────────────────────────────────────────────────────────────
// Stone of Commitment — Ink Conversion (Part 2 of 3)
// Covers: Act 2 → Act 3 → Act 4 → Act 5
// Requires Part 1 for variable declarations.
// ────────────────────────────────────────────────────────────────────────────
// ════════════════════════════════════════════════════════════════════════════
// ACT 2 — THE SUNKEN TRIBUNAL
// ════════════════════════════════════════════════════════════════════════════
=== act2_entry ===
# scene: sea_cave_entrance
# music: fas_et_nefas_building
The shimmer that sealed the entrance yesterday is gone. The air where the barrier was still smells faintly of old journeys, but there is nothing to stop you now. The ghosts kept their end of the arrangement.
Lawrence enters first. The way he enters dangerous places tells whatever is inside everything it needs to know about him. Fang reads the stone wall as she descends. Marcus fills the corridor in a way that reads as reassuring rather than alarming.
# speaker: Lawrence
"Three hundred years of undisturbed judgment. Whatever is down here believed it was doing the right thing."
# speaker: Fang
"They always do. That's what makes them dangerous."
* [Descend into the Tribunal.] -> act2_tide_rising
=== act2_tide_rising ===
# scene: sunken_tribunal_descent
The corridor slopes down. Water pools at your ankles before you've taken twenty steps.
Marcus stops. Reads the walls by touch. The stone is carved with non-language — the same symbols you saw where the Tidewarden's stain was left above.
# speaker: Marcus
"This was designed to flood. Not as a failure. As a feature. The Tribunal was built to trap anyone who entered at low tide and could not justify their presence before the water arrived."
# speaker: Fang
"And the tide just turned."
The water is at your shins. It is rising faster than it should.
The wolf puppy in Fang's sling lifts its head. It does not orient toward the water. It orients downward, toward whatever is imprisoned below. Its ears flatten. Then, slowly, they rise again.
~ familiar_signal_count = familiar_signal_count + 1
# speaker: Fang
"(glancing down) What are you hearing that I'm not?"
# speaker: Lawrence
"(calculating) We have roughly ten minutes before retreat stops being an option."
# speaker: Fang
"Great. Love a deadline. Really adds to the ambiance."
Behind you, the corridor narrows as water pressure shifts the stones. The way in is becoming the way not-out.
* [Press forward to the main chamber.] -> act2_tidewarden
=== act2_tidewarden ===
# scene: sunken_tribunal_main_chamber
A magistrate from three centuries ago who believed in the law he served. Death offered him purpose when disruptions rendered his verdicts irrelevant. He reads charges against the Water Guardian with the certainty of a man who has never been wrong and considers this evidence.
# speaker: Tidewarden
"The charge is Uncontrolled Change. The verdict is containment. The sentence is already being served."
* ["Control isn't protection. It's fear wearing a title."] -> act2_argue
* [Question what the tribunal was built to protect.] -> act2_question
* [Attack immediately.] -> act2_attack
=== act2_argue ===
~ lawrence = lawrence + 1
~ tribunal_dialogue = true
# speaker: Lawrence
"(quietly, to you) That was precisely the right thing to say."
The Tidewarden's certainty cracks. Not much. Enough.
* [The battle begins.] -> act2_combat
=== act2_question ===
~ marcus = marcus + 1
~ tribunal_dialogue = true
# speaker: Marcus
"(to the Tidewarden) You built this to protect the harbour. The harbour is dying. What are you protecting now?"
The silence is load-bearing.
* [The battle begins.] -> act2_combat
=== act2_attack ===
~ stag = stag + 1
# speaker: Fang
"(already drawing) Yeah. I figured."
* [The battle begins.] -> act2_combat
=== act2_combat ===
# scene: sunken_tribunal_battle
The Tidewarden hits you first. A column of compressed water slams into your guard before you can read the motion. You skid backward across wet stone, boots finding no grip.
He fights with verdict-magic: declarations that become force. His certainty-armor makes him nearly impervious from above. He adapts. Your opening strike was high, so his counter comes low. You adjusted left, so his next verdict fires right.
# speaker: Fang
"He's reading you. Change your rhythm or he'll eat you alive."
You change your rhythm. It costs you a beat. The Tidewarden punishes the hesitation with a backhand of pressurized current that catches your ribs.
Lawrence removes the ground certainty stands on. Every shadow in the chamber tilts slightly wrong. Fang fights <i>in</i> the flood rather than through it. Marcus reads the chamber's vibrations through the floodwater and calls positions.
But the Tidewarden lands hits too. A slash gets through your guard and opens your forearm.
The chamber partially floods. Water to your shins. Every step costs twice the energy. The Tidewarden's verdicts come faster.
# speaker: Fang
"(grinning, water to her knees) Oh, this I can work with."
He catches you across the jaw with a tidal fist. You go down to one knee. The water is cold and it is getting colder.
<i>Not now. Not like this. You know what this is.</i>
The Tidewarden raises both hands for a finishing blow. You can see Fang adjusting, Marcus already in motion, Lawrence's hands bright with something he has been holding in reserve.
They are ready. They have been ready. They were waiting for you to let them.
* [Step back. Let the others finish it.] -> act2_no_recovery
=== act2_no_recovery ===
~ no_recovery_unlocked = true
~ xp = xp + 30
# achievement: no_recovery_mechanic_unlocked
# scene: sunken_tribunal_post_fracture
You step back. Your body thanks you before your pride does.
Fang moves without being asked. Marcus takes your flank and launches his directed charge, aimed where the Tidewarden <i>will</i> be. Lawrence drives shadow-work through the gap they made.
They finish it. Not <i>instead</i> of you. Because of you. Because you knew when to let them.
The party's choreography is too clean. They built this protocol before you arrived.
* [Watch Water be freed.] -> act2_water_freed
=== act2_water_freed ===
~ xp = xp + 50
# achievement: water_guardian_freed
# scene: sunken_tribunal_binding_frame
# music: fas_et_nefas_swell
The Binding Frame dissolves. Water doesn't burst free. She <i>flows.</i> Slowly, the way rivers reclaim their beds after a drought. The Tidewarden dissolves with the frame. Not destroyed. Released. Three hundred years is a long time to be certain about the wrong thing.
Where he stood, a stain on the stone floor. Not water damage. Not scorch. Something that looks like writing in a language that predates language. Marcus reads it, goes very still, and does not translate.
# speaker: Marcus
"We should move. Now."
He shepherds the party out faster than the moment warrants. Nobody asks why. The stain remains.
# speaker: Marcus
"(watching him go) He believed he was protecting something."
# speaker: Fang
"He was. He just forgot to ask what it wanted."
Lawrence says nothing. His jaw works once, like he started a sentence and decided against it.
* [Water speaks.] -> act2_water_speaks
=== act2_water_speaks ===
# scene: sunken_tribunal_water_return
Water's voice does not come from a direction exactly. By the time you've registered what she said, she is water again.
She examines you the way a river takes the measure of new terrain. Not appraising. Mapping. She says only: "Hm." The weight of a full sentence in one syllable.
# speaker: Water
"I have a drought to address. In the Anatolian interior, it has been unmanaged for three hundred and fourteen years, two months, and eleven days. The grain situation is recoverable. Thank you for the inconvenience."
# speaker: Fang
"Did she thank us for inconveniencing her, or thank us AND acknowledge we were an inconvenience?"
# speaker: Marcus
"I believe, in her framing, these are the same thing."
# speaker: Lawrence
"(quietly, to no one) Yes. They would be."
Lawrence's hand rises toward his chest and stops before arriving. The aborted gesture. Water sees it. You see it. The aborted gesture is louder than the completed ones.
~ chest_press_count = chest_press_count + 1
# music: heartbeat_barely_audible
~ heartbeat_count = heartbeat_count + 1
* [Return to Mo Stór.] -> bridge_mo_stor_return1
=== bridge_mo_stor_return1 ===
# scene: mo_stor_interior
# music: save_tonight_bar_version
The bar remembers your drink.
Tiberius sets it down before you reach the stool. The fire is low, which means the hour is late, which means everyone left in Mo Stór has chosen to be here at this specific time of night. You notice this. Lawrence notices you noticing.
The party sits. Nobody speaks immediately. This is different from before — the silence has different furniture now.
# speaker: Fang
"(to Tiberius) Whatever she's having, I'll have something worse."
# speaker: Marcus
"Water, please."
A beat.
# speaker: Fang
"Too soon."
# speaker: Marcus
"(the faintest approximation of a smile) I know."
The mood in the bar has shifted since you arrived. Not dramatically. Enough. The fishermen at the corner table are drinking with less urgency. The dock workers' posture has changed — the weight they were carrying without naming it has lightened by a degree. Water is flowing. Something that was wrong has been corrected. The harbor doesn't know why. It just knows the current is right again.
-> bridge_road_east
=== bridge_road_east ===
# scene: rhea_port_road
The road east begins the next morning. The party packs without ceremony: they have been doing this for centuries and the motions are as natural as breathing, which for two of them is strictly metaphorical.
Fang sharpens her off-hand blade before she packs it. She does this every morning. You have been watching long enough to know she sharpens it when she's thinking about something else entirely.
Marcus checks the weather by scent. His nose tilts toward the east. His ears rotate once and settle forward.
# speaker: Marcus
"Three days to the salt flats. The air above Highwind Pass is wrong. We will feel it before we see it."
Lawrence has already started walking. He does this — begins before the discussion of beginning has finished. It is either the most efficient or the most infuriating thing about him, depending on the morning.
-> act3_highwind_entry
// ════════════════════════════════════════════════════════════════════════════
// BRIDGE — SALT FLATS
// ════════════════════════════════════════════════════════════════════════════
=== bridge_salt_flats ===
# scene: salt_flats
The salt flats stretch in every direction — white, blinding, the specific silence of a surface that reflects everything and absorbs nothing. Your shadow is very precise here. There is nowhere for it to hide.
Fang walks beside you.
# speaker: Fang
"Can I ask you something personal?"
She doesn't wait for permission. She just checks. The distinction matters to her.
# speaker: Fang
"Why are you here? Not the quest. The actual reason."
* [The quest is the reason.] -> bridge_salt_flats_you
* [I needed something that didn't answer back.] -> bridge_salt_flats_you
* [(Look at the horizon. It's a longer answer than you have words for.)] -> bridge_salt_flats_sky
=== bridge_salt_flats_sky ===
~ flow = flow + 1
Fang follows your gaze. The horizon is perfectly flat. The sky above it is perfectly blue. The line between them is precise in a way that real horizons never are.
# speaker: Fang
"Yeah. That tracks."
She doesn't ask again. She understands that some answers live in the looking.
-> bridge_salt_flats_cost
=== bridge_salt_flats_you ===
# speaker: Fang
"(nodding, unsurprised) The 'something that doesn't answer back' thing. I know that one."
She's quiet for a moment. The salt crunches under her boots.
# speaker: Fang
"The problem is, eventually it does. Answer back. Everything does. That's either the great joke or the great mercy."
She doesn't say which one she thinks it is.
-> bridge_salt_flats_cost
=== bridge_salt_flats_cost ===
# scene: salt_flats_continuation
The sun on the salt flats is relentless. Not hot. Precise. It finds every surface and reports on it without mercy.
Marcus walks behind you both. His human form, which he uses sparingly. He is sweating, which bears do not often do, and the dignity of an eighteen-hundred-year-old Roman senator doing his best in a body that was designed for salmon rivers is considerable.
Lawrence walks point. He has been walking point since Rhea Port. Not because anyone assigned it. Because the front of the column is the most exposed position, and Lawrence has spent a thousand years making sure that whatever comes for the group hits him first.
You have been watching him do this. He has not noticed you noticing.
-> act3_highwind_entry
// ════════════════════════════════════════════════════════════════════════════
// ACT 3 — SKY TRAIL (Highwind Pass)
// ════════════════════════════════════════════════════════════════════════════
=== act3_highwind_entry ===
# scene: highwind_pass_cliffside
// Silence on arrival. Ambient wind only. No music.
The pass arrives. Wind that behaves wrong — stopping mid-gust, reversing, holding perfectly still in places where stillness is geologically impossible.
Yildiz's charts are carved into the rock face. Not vandalism. Devotion.
Lawrence stops at the cliff edge. He looks east. His hand rises toward his chest — pauses — drops. You have seen this gesture before. You have been counting without deciding to count.
~ chest_press_count = chest_press_count + 1
* [Match Lawrence's pace. Walk together.] -> act3_approach_match
* [Let Lawrence lead.] -> act3_approach_lawrence
* [Name Lawrence's hesitation. Anchor him.] -> act3_approach_anchor
=== act3_approach_match ===
~ lawrence = lawrence + 2
~ sky_resonance = 1
# achievement: highwind_mutual_ground
You fall into step beside him without deciding to. He doesn't pull ahead. He doesn't slow down.
# music: heartbeat_highwind_full_low
~ heartbeat_count = heartbeat_count + 1
* [Face Yildiz.] -> act3_yildiz
=== act3_approach_lawrence ===
~ lawrence = lawrence + 1
~ sky_resonance = 2
# achievement: highwind_lawrence_leads
He steps in front instinctively, before either of you decides it. The wind parts for him in a way that is not natural.
# music: heartbeat_highwind_full_low
~ heartbeat_count = heartbeat_count + 1
* [Face Yildiz.] -> act3_yildiz
=== act3_approach_anchor ===
~ lawrence = lawrence + 1
~ sky_resonance = 3
# achievement: highwind_anchored
# speaker: Player
"Lawrence. I trust you."
The wind steadies when you name his hesitation.
# music: heartbeat_highwind_full_low
~ heartbeat_count = heartbeat_count + 1
* [Face Yildiz.] -> act3_yildiz
=== act3_yildiz ===
# scene: cartographer_observatory
# music: back_to_me_instrumental_low
The observatory is open to the sky. Star charts etched into the stone floor glow faintly, each one a fixed point in a cosmology Yildiz spent forty years mapping. The wind does not blow through this space. It orbits, following the charts' geometry, turning the room into a living orrery.
Yildiz stands at the center. She does not look afraid. She looks like someone who has been expecting company and is mildly annoyed it took this long.
# speaker: Yildiz
"You freed Water. I felt it from here. The tides shifted and my star charts went wrong for three hours. Do you know how long it takes to recalibrate a sextant after a tidal correction?"
# speaker: Fang
"We're here to free Sky."
# speaker: Yildiz
"I know what you're here to do. I also know what Sky is. Do you?"
Nobody answers. She didn't expect them to.
* [She attacks first.] -> act3_yildiz_phase1
=== act3_yildiz_phase1 ===
# scene: observatory_phase1
Yildiz fights with cartographic precision. Fixed wind currents flow in geometrically exact paths along the star chart grooves in the floor. Step on a chart line and the wind throws you. Her astrolabe executes trajectories as force strikes. Her sextant measures party angles and applies them as splitting shockwaves.
The room is the weapon. Every chart line is a tripwire. Yildiz drew the map.
Lawrence must fight inefficiently — deliberate mistiming, abandoned follow-throughs. He knows her instruments. He is fighting someone who fights the way he would if he had forty fewer years and forty more reasons to believe.
# speaker: Fang
"The floor is a grid. She knows every square. Stay off the glowing lines."
Marcus, in bear form, is the thing Yildiz's system cannot account for. A bear does not move on geometric lines.
* [Disrupt the floor charts.] -> act3_yildiz_phase2
* [Let Marcus draw her attention.] -> act3_yildiz_phase2
=== act3_yildiz_phase2 ===
# scene: observatory_phase2
Marcus charges through the center of the observatory on all fours. Eighteen hundred years of mass. His paws crack three chart lines simultaneously. The geometric wind patterns stutter, loop, and for two seconds the room doesn't know what shape it is.
Yildiz's eyes go wide. Not fear. Fury. She slams her palm against the floor and the star charts flare.
The room reconfigures. Chart lines crawl across the stone like living things, reforming around the party's current positions. She is rewriting the battlefield in real time.
# speaker: Marcus
"She's redrawing the charts around us. The wind will follow in seconds."
# speaker: Lawrence
"(suppression field flickering) My magic is mapped. She's charted my frequency. I am fighting someone who has made a study of me and I did not consent to the examination."
# speaker: Fang
"Welcome to what that feels like."
Lawrence does not respond to that. He does hear it.
The observatory's open ceiling becomes a liability. Yildiz links the floor charts to the actual stars above. Her precision has become astronomical.
# speaker: Fang
"She just linked the floor to the sky. I don't know what that means tactically but it scares me and I don't say that often."
* [The phase shifts again.] -> act3_yildiz_phase3
=== act3_yildiz_phase3 ===
# scene: observatory_phase3
Yildiz throws the astrolabe aside. It clatters across the floor and the geometric wind patterns collapse into chaos. She draws a long knife and moves the way someone moves who learned to fight before they learned to chart.
# speaker: Fang
"(urgent) She dropped the math. She's fighting on instinct now."
# speaker: Lawrence
"(between blocks) I noticed."
# speaker: Fang
"Lawrence, she's faster than you."
# speaker: Lawrence
"I noticed that too."
Without the charts, the wind goes feral. It blows from every direction and none, gusting hard enough to slide Marcus sideways despite four legs and eight hundred pounds.
# speaker: Marcus
"(braced against the wind) She's not trying to win anymore. She's trying to make sure we don't reach the binding. Someone fighting to delay believes they've already lost. She's more dangerous now."
Yildiz's knife finds openings the astrolabe never could. Lawrence blocks three consecutive strikes and the fourth gets through, opening a line across his forearm.
# speaker: Fang
"(bleeding, to you, very direct) This is the part where you decide."
{ no_recovery_unlocked:
    * [No Recovery Fracture: step back, let the party finish.] -> act3_no_recovery
}
* [Push through to the binding.] -> act3_yildiz_break
=== act3_no_recovery ===
~ xp = xp + 30
# scene: observatory_phase3_no_recovery
You step back. Your back finds the observatory wall.
This time, nobody made you. The Tribunal forced it. Yildiz, you chose it. Here, on this mountain, in this wind — you decided. Your mind knew before your body had to tell it.
It is harder the second time. Not easier. Because the first time you could tell yourself you had no choice. This time the choice is yours and you are making it with your eyes open, watching the fight continue without you, trusting three people you have known for less than a month with the thing you started.
Fang moves into the space you just left. She does not look at where you were. She looks at where Yildiz is going to be. Her commentary strips down to survival mathematics: "Left. Low. She feints right then commits center."
Marcus adapts. He stops trying to charge and starts reading — on all fours, low to the stone, feeling Yildiz's footwork through the floor. When she commits to a lunge at Fang, he is already moving. A sweep. Eight hundred pounds of lateral force. She hits the floor and rolls, but the knife skitters away.
Lawrence stops fighting Yildiz entirely. While Fang holds and Marcus sweeps, he crosses the observatory floor to the Binding Frame. Walking. The deliberate pace of someone who has realized the objective was never to defeat the woman with the knife. He has been holding something in reserve since Phase 1 — not suppression magic. Something older. Something that sounds like a single sustained note when his hands connect with the Frame's edge.
The Binding Frame cracks.
Yildiz, on the ground, watches it happen. She could have reached for the knife. She doesn't.
You understand something the game has been trying to teach you since the Tribunal: stepping back is not leaving the fight. It is trusting the fight to the people who can finish it. Lawrence went for the Frame because you weren't in the way.
* [The binding breaks.] -> act3_yildiz_break
=== act3_yildiz_break ===
# scene: observatory_binding_frame
You reach the Binding Frame. Inside it, Sky is visible the way a held breath is visible in winter air: you can see the shape of what is being contained.
Yildiz is between you and the Frame. Knife in hand. Bleeding. Breathing hard. Forty years of mountain living and the knife still doesn't shake.
# speaker: Player
"You already know how this ends."
Yildiz doesn't answer. She adjusts her grip.
# speaker: Fang
"(low, not unkind) Put it down."
Lawrence says nothing. He understands what is happening behind Yildiz's eyes because he has stood exactly where she is standing: between the thing you built to survive your grief and the moment someone asks you to stop.
Marcus sits. Bear equivalent of lowering a weapon. He will not advance.
Yildiz looks at the Binding Frame. Inside it, Sky — the thing she charted for forty years. The storm that took someone she loved was Sky's domain. She blamed Sky. Death gave her a way to make the blame permanent.
She has been holding a knife for forty years. The cartography, the astrolabe, the precision: all of it was the knife.
The knife lowers. Not because you won. Because she just looked at Sky, through the lattice, and for the first time in forty years saw something other than the storm that took everything.
She saw what Sky looked like before the storm. She remembered why she started charting in the first place.
# speaker: Yildiz
"(very quiet, to no one) I drew my first chart when I was eleven. I just wanted to know where the wind was going."
The knife clatters on the observatory floor. The sound is very small in the open air.
* [Break the binding.] -> act3_sky_freed
=== act3_sky_freed ===
~ xp = xp + 60
# achievement: sky_guardian_freed
# scene: observatory_sky_release
The Binding Frame dissolves. Not like the Tidewarden's, which cracked and released. This one unravels. The crystallized wind filaments loosen, separate, and drift upward like threads pulled from a tapestry. The lattice thins until it is indistinguishable from the actual wind, and then it is the actual wind, and Sky is no longer inside something. Sky is the sky.
The wind above Highwind Pass begins to move correctly for the first time in months.
Yildiz is still standing where she dropped the knife. Sky turns to her. Not as a person turns. As weather turns.
# speaker: Sky
"These are accurate."
Yildiz looks up. Her face does something complicated.
# speaker: Yildiz
"They were."
# speaker: Sky
"They still are. The storm that took her... I could not have held it. But the chart was right. You read me correctly."
Yildiz's composure breaks. Not loudly. A single exhale that carries forty years of blame out of her body. She does not cry. She is the kind of woman who stands very still and lets the feeling move through her like weather.
# music: back_to_me_cut_mid_phrase
Yildiz picks up her astrolabe from the floor. Not the knife. The astrolabe. She walks out of the observatory without turning around.
# music: life_goes_on_bts_fade
Sky turns to you.
# speaker: Sky
"(to you, specifically) The desert will test you differently than the water did."
# speaker: Player
"What thing?"
# speaker: Sky
"Whether you can keep going when you can't see the shape of what you're moving toward."
* [Return to Mo Stór before the road east.] -> bridge_mo_stor_return2
=== bridge_mo_stor_return2 ===
# scene: mo_stor_interior
# music: save_tonight_desert_version
The bar feels different from this far out. Not smaller — further. The way things feel further when you've been moving long enough that the starting point recedes into the category of things that happened to someone slightly younger than you.
Tiberius pours your drink. He doesn't say anything. He's been behind this bar long enough to know when a party has done something real.
Fang sits beside you. Her off-hand is wrapped — Marcus did the bandaging, which she only allowed because he didn't ask.
# speaker: Fang
"(humming something under her breath) ...Why do I know this song?"
Nobody answers. She doesn't know the song. But someone else in this story might.
Marcus is at the far end of the bar, talking to Tiberius about the route east. Lawrence is standing near the exit — not leaving, just positioning himself between the party and whatever might come through the door. A thousand years of habit.
He glances at you. One second too long. Then the horizon.
* [The road east begins.] -> act4_desert_entry
// ════════════════════════════════════════════════════════════════════════════
// ACT 4 — THE SINGING SANDS (Karakum Desert)
// ════════════════════════════════════════════════════════════════════════════
=== act4_desert_entry ===
# scene: karakum_eastern_approach
# music: save_tonight_full_desert
The desert is a fact, not a postcard. Three days of heat and the particular psychology of a landscape that offers no landmarks. The Sands hum. Deeper now, edged.
The wolf puppy lifts its head and orients east before any threat registers. Fang is already talking.
~ familiar_signal_count = familiar_signal_count + 1
# speaker: Fang
"You know what the Singing Sands are actually singing?"
# speaker: Marcus
"Acoustic resonance from particulate friction during compression events, amplified by—"
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
Fang hums along with the hum for two bars. Then stops. Confused at herself.
# speaker: Fang
"...Why do I know this?"
Nobody answers. She doesn't know the song. But Clare might.
* [Continue into the Karakum.] -> act4_ambush
=== act4_ambush ===
# music: fas_et_nefas_building
# scene: karakum_dry_riverbed
The wolf puppy tried to warn you. An hour ago, at the dune ridge, it oriented east. Fang noticed. Nobody else did.
The sand moves first. Not underfoot. Under the surface. A compression wave you feel in your ankles before your brain processes it. Marcus drops flat, paws spread, reading.
# speaker: Marcus
"(fast) Three left, two right, one below. The one below is big. It's coming up in four seconds."
Three seconds. The ground erupts. Sand-wraiths: not ghosts, not spirits. Compressed desert given shape by Stone's disruption. They move like sand moves in a windstorm, except the windstorm has teeth.
Lawrence fires a mind lance. It connects. The wraith splits, scatters, reforms behind him. His magic is pulling against itself. Stone's disruption makes every spell feel like trying to write on a surface that keeps shifting.
# speaker: Lawrence
"My magic is fighting the terrain. Every cast costs twice what it should."
Fang draws both blades and plants for her single-tempo. The sand shifts under her back foot. The plant fails.
# speaker: Fang
"I can't plant. The ground won't hold still long enough for the tempo."
Marcus is the most effective — he tracks the wraiths through the sand by compression patterns, calling positions before they surface.
* [Hold position. Let Marcus call it.] -> act4_ambush_phase2
* [Move to the riverbed. Harder ground.] -> act4_ambush_phase2
=== act4_ambush_phase2 ===
# scene: karakum_riverbed_sands_louder
The Singing Sands get louder.
Not background. The hum resolves into rhythm. Every fourth beat, from the left. Every seventh, from below. The desert is coordinating the wraiths the way a conductor coordinates an orchestra.
# speaker: Marcus
"The hum is the pattern. Count the beats. Fourth from left, seventh from below. If you can hear the rhythm, you can predict the next strike."
Fang adapts. She stops trying to plant and starts moving with the sand instead of against it. Her commentary shifts from positions to timing: "Two beats. Now. Three beats. Left."
Then the sand walls of the riverbed start to close. Not collapsing. Moving. The wraiths are herding the party into the narrowest section.
Lawrence burns magic to hold the walls. Both hands up, suppression field extended sideways. His face is white.
# speaker: Lawrence
"(through gritted teeth) I can hold the walls or I can fight. Not both. Decide fast."
Fang goes quiet. The running commentary stops. The jokes stop.
She takes a hit. The wraith's compression edge catches her off-hand arm. She doesn't cry out. She switches to single blade and keeps fighting. Marcus sees it. Adjusts his position to cover her weak side without being asked.
The canteen on your belt cracks. The strap snapping, the vessel hitting the riverbed floor. The sound of water meeting sand. The sand drinks it. All of it. In two seconds.
# speaker: Fang
"(seeing the empty canteen, very quiet) ...No."
{ no_recovery_unlocked:
    * [Push through. Finish this yourself.] -> act4_push
    * [No Recovery Fracture: step back.] -> act4_no_recovery
- else:
    * [Push through.] -> act4_push
}
=== act4_push ===
~ end = end - 2
~ xp = xp + 20
# scene: karakum_riverbed_push
You push through. Your sword arm shakes. Your magic is gone. You are fighting with muscle and the particular stubbornness of someone who has decided that this riverbed is not where the story ends.
A wraith surfaces directly under you. You drive your blade down through the compression wave, pinning it to the harder ground beneath. The impact travels up your arm and into your shoulder. The wraith dissolves around the blade.
Lawrence drops the walls — he has no choice. His magic gutters out. He physically braces against the sand wall with his shoulder, boots digging into the riverbed floor. A thousand-year-old vampire mage reduced to holding a sand wall with his body. There is no dignity in it. He does it anyway.
Fang, one-armed, finishes the last two wraiths with a single-tempo stroke that uses the collapsing wall as a redirect.
Marcus catches the final wraith mid-scatter with his jaw. Direct. Not elegant. He spits it out and lies down.
The hum fades. The sand settles. You are on your knees. You don't remember getting there.
* [Aftermath.] -> act4_post_combat
=== act4_no_recovery ===
~ xp = xp + 20
# scene: karakum_riverbed_no_recovery
You step back. Your back hits the sand wall Lawrence is holding. You can feel his magic vibrating through the stone underneath, the effort of it translating as heat against your spine.
This is the third time. The Tribunal forced it. Yildiz, you chose it. Here, in a riverbed that's trying to become a grave, you know it the way you know breathing: without deciding.
Fang fills the space. One blade now, fighting single-tempo for the first time you've seen. It should be worse. It is not worse. It is different — stripped of the Florentine's elegance, her combat becomes something rawer.
Marcus reads the hum. Fourth beat. Seventh beat. He calls positions and Fang trusts them without looking. Two centuries of fighting beside someone. Not coordination. Anticipation.
Lawrence releases the walls. Sand surges. He drives his last magic into the sand beneath the wraiths, disrupting their compression patterns from underneath. The hum stutters. The wraiths lose cohesion for three seconds. Fang kills two in that window. Marcus catches the third mid-scatter.
The last wraith sinks. The sand settles. The hum fades to its old ambient drone.
* [Aftermath.] -> act4_post_combat
=== act4_post_combat ===
# scene: karakum_post_combat
Everyone emptied out.
Lawrence sits facing outward, posture precise even in exhaustion. His hands are flat on his knees. They have not stopped trembling since he dropped the walls. Fang crouches beside a rock, off-hand arm held against her ribs. Marcus is on his side, breathing through pain that bears process differently than people do: slowly, deliberately.
The canteen is in the sand where it fell. Empty. The stain where the water soaked in has already dried.
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
* [The canteen is empty.] -> act4_canteen_empty
=== act4_canteen_empty ===
# scene: karakum_no_water
# music: jamais_vu_bts
You walk. There is nothing else to do.
Dawn arrives. The sun is visible — a pale disc clearing the horizon. The warmth does not come with it. The desert is cold. Not night-cold. Something else. The kind of cold that happens when a fire is burning and producing no heat. The light falls on the sand and the sand does not warm.
# speaker: Lawrence
"That should not be possible."
Nobody asks what. They can feel it. The sun is present and useless.
Marcus tries to shift. The transformation stutters, catches halfway, and reverts. His ears do not rotate. When Marcus's ears stop moving, he is processing something he does not want to name.
# speaker: Marcus
"I can't feel my magic."
Lawrence raises one hand. The air around his fingers should shimmer. It does not.
# speaker: Lawrence
"Neither can I."
Fang tests her off-hand. The spectral cold from the wraith is still in the muscle. She makes a fist. Opens it. The fingers respond, but slowly.
# speaker: Fang
"Out of spells. Out of water. Out of people who believed in us."
You keep walking. The sand hums. Quieter than before. The dunes are lower, flatter. The horizon is a straight line in every direction. There is nowhere to go that looks different from where you are.
Fang's silence tell is not active. She is talking. But the jokes have stopped. What she says now is inventory: distance remaining, sun position, pace count. The voice of someone rationing energy the way you ration water.
Marcus walks with his head low. Conserving. Every few hundred paces he lifts his nose and reads the air. Each time his expression resets to the same careful neutral that means he found nothing.
Lawrence walks point. His posture is precise even now. But his gait has changed — shorter steps. He is measuring energy in increments small enough that he can pretend each one is a choice.
An hour passes. Two. Your lips crack. The sand in your lungs from the riverbed has settled into a grit that makes every breath taste like the desert is already inside you.
Fang stumbles. Catches herself. Does not acknowledge it. You see Marcus's ear tilt toward her without his head moving.
Then Lawrence stops.
He reaches into his pack. Past the blade oil, past the empty provision wraps, into the bottom. He pulls out a water skin. Small. Battered. The kind of thing you carry not because it holds enough but because it holds something.
You didn't know he was carrying it. Nobody did.
A thousand years of crossing deserts taught him to keep a reserve. Not for himself. For the moment when keeping it mattered more than having it.
He passes it to you. His hand is steady. His eyes are not.
You take it. The water is warm and tastes like leather and survival. Two sips. Maybe three.
You hold it out to Fang. She shakes her head. You hold it out to Marcus. The same. Lawrence has already turned away. He will not take any. This is not a choice he is making in the moment. This is a choice he made before he filled the skin.
You notice. He notices you noticed. Neither of you speaks.
The empty skin goes back in the pack. The party resumes walking.
* [Lawrence has a question.] -> act4_the_question
=== act4_the_question ===
# scene: karakum_the_question
The party walks. The sun is useless. Nobody has spoken since the water skin.
Lawrence falls into step beside you. Not beside Fang, not near Marcus. Beside you. The half-step distance he has been maintaining since Highwind Pass narrows to a quarter-step.
He does not look at you. He looks at the horizon. But the angle of his attention has changed in a way that a thousand years of practice cannot entirely disguise.
# speaker: Lawrence
"You're limping."
You are not limping. Your left boot has a sand crease from the riverbed that you've been favoring. The fact that he noticed the difference between a limp and a boot crease from three paces tells you everything about the precision of his attention. The fact that he named it as a limp tells you he wanted you to know he was watching.
# speaker: Player
"Sand crease. Not a limp."
# speaker: Lawrence
"I know."
A beat. He lets that land. Two people too smart and too guarded to say the obvious thing, so they say the brilliant adjacent thing and let the subtext accumulate.
Lawrence stops walking. You stop with him. Fang and Marcus continue for a few paces before the geometry changes. Fang looks back. Her jaw tightens by a fraction. She has watched Lawrence do this across two centuries.
Marcus reads the pause. Positions himself between Fang and the scene. The diplomat, managing the room even in the open desert.
Lawrence turns to face you. Full attention. Not the sideways attention he has been rationing for days. All of it.
# speaker: Lawrence
"If this is where it ends. If the desert takes us and Stone is never freed and none of it mattered... was it worth it? Coming this far. With us."
The question is strategic — he knows it will create intimacy. He has deployed this exact move before. He is not proud of it. He is doing it anyway because the emptiness is loud and you are the only thing that makes it quieter.
But his hand rises toward his sternum. Stops. Drops.
The question is also real.
{ lawrence >= 5:
    * ["Yes. Every step."] -> act4_question_yes
    * ["I don't know. But I'd do it again."] -> act4_question_again
    * [(Step closer. Hold his gaze. Say nothing.)] -> act4_question_silent
- else:
    * ["Yes. Every step."] -> act4_question_yes
    * ["I don't know. But I'd do it again."] -> act4_question_again
    * [(Hold his gaze. Say nothing.)] -> act4_question_silent
}
=== act4_question_yes ===
~ lawrence = lawrence + 1
~ xp = xp + 20
# achievement: desert_question_yes
# speaker: Player
"Yes. Every step. Even the ones that hurt. Especially those."
Lawrence exhales. Not the controlled exhalation of someone who received the answer he engineered. The uncontrolled exhalation of someone who received an answer he did not expect to feel.
# speaker: Lawrence
"...That was supposed to be harder for you to say."
# speaker: Player
"I know. That's why I said it fast. Before the smart part of my brain caught up."
He almost smiles. Not the performed smile. The other one. The one that involves zero planning and disappears before he can manage it.
# speaker: Lawrence
"The smart part of your brain is considerably inconvenient."
# speaker: Player
"You have no idea."
# music: heartbeat_question_full_90sec
~ heartbeat_count = heartbeat_count + 1
He looks away first. That has never happened before.
* [The desert releases you.] -> act5_threshold
=== act4_question_again ===
~ lawrence = lawrence + 1
~ xp = xp + 20
# achievement: desert_question_again
# speaker: Player
"I don't know if it was worth it. I don't know if 'worth it' is even the right frame. But I would do it again. All of it. The Tribunal. The ghosts. The mountain. This."
Lawrence is very still.
# speaker: Lawrence
"'This' meaning the desert?"
# speaker: Player
"'This' meaning whatever this is. Between us. The part where I keep noticing when you're watching and you keep pretending you weren't."
A long silence. The kind that happens when someone says the thing both people knew and neither was willing to name. Lawrence's jaw works once. He starts a sentence. Stops. Starts a different one. Stops that too. A thousand years of rhetoric and he cannot find the correct response.
# speaker: Lawrence
"You are... considerably more observant than I accounted for."
# speaker: Player
"Maybe you wanted me to notice."
He does not deny it. He does not confirm it. He starts walking again. After three steps, he adjusts his pace. Not the half-step back. Even.
# music: heartbeat_question_full_90sec
~ heartbeat_count = heartbeat_count + 1
* [The desert releases you.] -> act5_threshold
=== act4_question_silent ===
~ xp = xp + 20
# achievement: desert_question_silent
{ lawrence >= 5:
    ~ lawrence = lawrence + 2
    You step closer. Not a full step. Six inches. The distance between standing near someone and standing with someone. You can feel the cold of him now. Specific. The particular temperature of a man who has not been warm in a thousand years.
    You hold his gaze. His eyes are dark and very still. He is reading you the way he reads combat. The calculation is stuttering against something it cannot process: you are not performing bravery. You are simply here, six inches closer than you were, and you are not leaving.
    His hand rises toward his sternum. This time it completes. Two fingers pressed flat. He does not notice he is doing it. You do.
    ~ chest_press_count = chest_press_count + 1
    # speaker: Lawrence
    "(barely audible) You should not stand this close to me."
    You do not move.
    # speaker: Lawrence
    "(even quieter) I am not asking you to move."
    The desert wind moves your hair across your face. He almost reaches to move it. His hand lifts, pauses, returns to his side. Almost. The almost is louder than the gesture would have been.
- else:
    ~ lawrence = lawrence + 1
    You hold his gaze. The silence stretches. Lawrence looks at you with the full weight of a thousand years of managing how other people see him, and for once the management fails.
    # speaker: Lawrence
    "That is either the bravest or the cruelest answer you could have given."
    # speaker: Player
    "Which one did you want?"
    # speaker: Lawrence
    "...I am not certain anymore."
    The fact that he admitted uncertainty is seismic.
}
# music: heartbeat_question_full_90sec
~ heartbeat_count = heartbeat_count + 1
The desert wind continues. The Sands hum. The silence between you and Lawrence is a living thing — not empty, but full of everything neither of you said.
Fang, fifty paces ahead, does not turn around. Her combat commentary in the next scene will be three words shorter than usual. She will not explain why.
* [The desert releases you.] -> act5_threshold
// ════════════════════════════════════════════════════════════════════════════
// ACT 5 — DUUT MANKHAN (The Threshold)
// ════════════════════════════════════════════════════════════════════════════
=== act5_threshold ===
# scene: duut_mankhan_western_approach
// DO NOT PLAY HEARTBEAT. The silence where they expect it is the point.
The Singing Sands go silent. Between one step and the next, the hum simply stops. The absence is louder than the sound was. Your ears ring with it.
The landscape changes. The dunes flatten into hardpan, cracked and pale. Dried salt deposits catch the light. The ground is warm under your boots. Not sun-warm. Warm from below.
# speaker: Marcus
"(panting, ears flat) I need to stop for a moment."
Marcus, who has not once complained since the ambush, stops. He lies flat on the hardpan and presses his belly to the ground, seeking coolness in rock that does not have any to give.
# speaker: Fang
"(crouching beside him) Hey. Big guy. Stay with us."
# speaker: Marcus
"I am a bear. In a desert. The thermodynamic implications of this combination have been accumulating for three days and I am addressing them now."
# speaker: Fang
"He's fine. When he uses big words he's fine."
Marcus shifts to human form. When he stands, he is soaked with sweat. Fang puts her water ration in his hand. He drinks.
# speaker: Fang
"You've been shedding since the salt flats. I found your fur in my breakfast this morning, Marcus."
# speaker: Marcus
"Bears shed. It is a biological process and not a personal affront."
# speaker: Fang
"It was IN my breakfast."
# speaker: Marcus
"Consider it seasoning."
Lawrence walks a few paces ahead during this exchange. But his attention is angled backward — toward you — in the way that means he is watching without watching. You feel it the way you feel sunlight on the back of your neck.
You catch him. His eyes meet yours for exactly one second too long before returning to the horizon.
# speaker: Fang
"(to you, quiet, having seen the glance) He does that. The looking thing. I've watched him do it for two hundred years. It doesn't get less effective."
She does not say whether it's a warning or an observation. She might not know.
The hardpan stretches ahead. Somewhere ahead, the terrain begins to climb. Duut Mankhan. Stone's domain. You can feel it in the soles of your boots: the ground is getting harder, denser, as if the earth is remembering what it means to be permanent.
* [Walk forward together. All bonds intact.] -> act5_together
* [Walk forward. Something is unresolved.] -> act5_unresolved
* [Walk forward alone. You need distance.] -> act5_alone
=== act5_together ===
~ xp = xp + 40
# achievement: threshold_together
# music: fix_you_piano_only
# scene: duut_mankhan_threshold
Fang walks on your left. Her off-hand arm is still stiff, but she rolls the shoulder every few minutes, working the mobility back. She hums something under her breath. Not a song. A rhythm. The combat timing she uses when she's centering herself.
Marcus walks behind, human form, the coat from Samarkand not warm enough but worn anyway. His footsteps are deliberate — he is relearning how to walk on two legs.
Lawrence is on your right. Half a step back. Close enough that the absence of the half-step would mean something. Close enough that you can hear him breathing. You did not used to notice his breathing. You notice it now.
// The silence where Heartbeat should be is more devastating than the music.
{ jiwon_seen:
    Fang touches the chart inside her coat. Lawrence watches. Some things can only be carried together.
}
The landscape rises. The first rocks appear: not boulders, but teeth. The desert's jawline. The air tastes of mineral and age.
* [The road continues east.] -> act5_aftermath
=== act5_unresolved ===
~ xp = xp + 35
# achievement: threshold_unresolved
# music: fix_you_piano_only
# scene: duut_mankhan_threshold
Something between two of you is not finished. The silence sits in that gap like a guest who has arrived too early.
Fang walks slightly ahead, favoring her arm. Her commentary is minimal. She is rationing something.
Lawrence is near you. Too near, given the friction. Or exactly near enough, given everything else. His proximity is a statement he has not verbalized. You are beginning to understand that Lawrence's physical positioning is his primary language and that everything he says out loud is the translation — which means the translation is always slightly less than the original.
Marcus walks between the gaps. The diplomat, holding the geometry. In human form now, sweat-soaked, undignified. The least Roman he has looked in eighteen hundred years. Possibly the most honest.
You walk forward anyway. The unresolved thing comes with you.
* [The road continues east.] -> act5_aftermath
=== act5_alone ===
~ xp = xp + 30
# achievement: threshold_alone
# music: fix_you_piano_only
# scene: duut_mankhan_threshold
You walk ahead of them. Not far. Just enough that the wind between you and the party is yours alone.
Behind you, the party settles into a formation that respects the distance without abandoning it. Marcus in the center. Fang on the left. Lawrence on the right where he can watch you walk away from him without you seeing his face while he does it.
They let you. This is the hardest kind of trust — the kind that looks like distance.
Fang's voice carries forward, not directed at you. At Marcus. At the space.
# speaker: Fang
"She'll come back."
# speaker: Marcus
"I know."
# speaker: Fang
"I'm just saying."
# speaker: Marcus
"I know, Fang."
* [The road continues east.] -> act5_aftermath
=== act5_aftermath ===
# music: white_night
# scene: duut_mankhan_campfire
// Nothing. Ambient only. The crackling of a fire the party did not discuss building. They just built it. That is the change.
Nobody speaks for a long time. The fire does the work.
Marcus is cleaning his claws with a patience that is its own form of prayer. Lawrence is sitting closer to the fire than he usually does. Not seeking warmth. Seeking proximity.
Fang breaks first. Not with a joke. Not with a deflection.
# speaker: Fang
"I'm glad you're here."
Not followed by a joke. Not qualified. Not redirected. Just that.
The silence that follows is the kind that happens when someone has said the truest thing they know how to say and is waiting to see if the world punishes them for it.
It does not.
# speaker: Marcus
"(after a long time, very quietly) As am I."
Lawrence says nothing. He does not need to. He is here. He stayed.
<i>You close your laptop. Not because the session ended. Because something in you recognized the moment and needed to sit with it.</i>
<i>Your apartment is quiet. Potato lifts his head from the couch, assesses that you are not in crisis, and returns to sleep. Sammy does not wake up. The kitchen light is on. You left it on this morning when the deadline was still breathing down your neck.</i>
<i>You think about texting someone. You do not text anyone. You sit at your kitchen table in the light you forgot to turn off and you feel, for reasons you could not explain to any reasonable person, that something important just happened to you.</i>
<i>You open the laptop again. The campfire is still there.</i>
* [The road east begins.] -> act6_bridge_east
-> END
