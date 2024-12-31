	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Waaah!" ; "BLAINE: Waaah!"

	para "Mijn GYM in CINNA-" ; "My GYM in CINNABAR"
	line "BAR is afgebrand." ; "burned down."

	para "Door de vulkaan" ; "My fire-breathing"
	line "zijn mijn vuur-" ; "#MON and I are"

	para "spuwende #MON" ; "homeless because"
	line "en ik dakloos." ; "of the volcano."

	para "Waaah!" ; "Waaah!"

	para "Maar in deze grot" ; "But I'm back in"
	line "ben ik gewoon" ; "business as a GYM"

	para "weer een GYM-" ; "LEADER here in"
	line "leider." ; "this cave."

	para "Als je mij kan" ; "If you can beat"
	line "verslaan, geef ik" ; "me, I'll give you"
	cont "je een BADGE." ; "a BADGE."

	para "Ha! Hopelijk heb" ; "Ha! You'd better"
	line "je BRANDZALF mee!" ; "have BURN HEAL!"
	done

BlaineWinLossText:
	text "BLAINE: Geweldig." ; "BLAINE: Awesome."
	line "Ik ben opgebrand…" ; "I've burned out…"

	para "Deze VULKAANBADGE" ; "You've earned"
	line "heb je verdiend!" ; "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "VULKAANBADGE." ; "VOLCANOBADGE."
	done

BlaineAfterBattleText:
	text "BLAINE: Deze keer" ; "BLAINE: I did lose"
	line "verloor ik, maar" ; "this time, but I'm"

	para "de volgende keer" ; "going to win the"
	line "win ik." ; "next time."

	para "Laten we nogmaals" ; "When I rebuild my"
	line "strijden als ik" ; "CINNABAR GYM,"

	para "CINNABAR GYM heb" ; "we'll have to have"
	line "herbouwd." ; "a rematch."
	done

BlaineFightDoneText:
	text "BLAINE: Mijn vuur-" ; "BLAINE: My fire"
	line "#MON zullen nog" ; "#MON will be"

	para "sterker zijn." ; "even stronger."
	line "Kijk maar uit!" ; "Just you watch!"
	done

SeafoamGymGuideWinText:
	text "Yo!" ; "Yo!"

	para "… Huh? Is het" ; "… Huh? It's over"
	line "al voorbij?" ; "already?"

	para "Sorry, sorry!" ; "Sorry, sorry!"

	para "CINNABAR GYM be-" ; "CINNABAR GYM was"
	line "staat niet meer," ; "gone, so I didn't"

	para "dus ik wist niet" ; "know where to find"
	line "waar je was." ; "you."

	para "Maar, hé, ik wist" ; "But, hey, you're"
	line "dat je zou winnen." ; "plenty strong even"

	para "Je hebt m'n advies" ; "without my advice."
	line "niet meer nodig!" ; "I knew you'd win!"
	done

SeafoamGymGuideWinText2:
	text "Een #MON-GYM" ; "A #MON GYM can"
	line "kan overal zijn" ; "be anywhere as"

	para "zolang er een" ; "long as the GYM"
	line "GYMLEIDER is." ; "LEADER is there."

	para "Een gebouw is niet" ; "There's no need"
	line "per se nodig." ; "for a building."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
