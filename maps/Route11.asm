	object_const_def
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "Je kan niet vals-" ; "There's no cheat-"
	line "spelen in #MON." ; "ing in #MON."

	para "Laten we het" ; "Let's keep it fair"
	line "eerlijk houden!" ; "and square!"
	done

YoungsterOwenBeatenText:
	text "Huh? Hoe kon" ; "Huh? How did this"
	line "dit gebeuren?" ; "happen?"
	done

YoungsterOwenAfterBattleText:
	text "Ik vocht eerlijk" ; "I fought fair and"
	line "en met trots." ; "square with honor."

	para "Ik heb er geen" ; "I don't regret"
	line "spijt van." ; "this at all."
	done

YoungsterJasonSeenText:
	text "Het kietelt een" ; "It itches and"
	line "beetje als ik" ; "tickles a bit when"

	para "een korte broek" ; "I wear shorts in"
	line "in het gras draag." ; "the grass."
	done

YoungsterJasonBeatenText:
	text "Aiiiiiii!" ; "Aiyaaah!"
	line "Ik werd vertrapt!" ; "I got stomped!"
	done

YoungsterJasonAfterBattleText:
	text "Ik ga meer #MON" ; "I'm going to catch"
	line "in het gras" ; "more #MON in"
	cont "vangen." ; "the grass."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "Ik verloor terwijl" ; "I lost while I had"
	line "ik mijn ogen dicht" ; "my eyes closed…"
	cont "had…" ;
	done

PsychicFidelSeenText:
	text "Ik kan het zien…" ; "I can see it…"

	para "Alles over jou" ; "Everything to see"
	line "zien…" ; "about you…"
	done

PsychicFidelBeatenText:
	text "Ik kon je kracht" ; "I couldn't foresee"
	line "niet voorzien…" ; "your power…"
	done

PsychicFidelAfterBattleText:
	text "Kracht in over-" ; "Strength in con-"
	line "tuiging…" ; "viction…"

	para "Je bent sterk" ; "You're strong be-"
	line "omdat je in je" ; "cause you believe"
	cont "#MON gelooft." ; "in your #MON."
	done

Route11SignText:
	text "ROUTE 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	def_object_events
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  8,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
