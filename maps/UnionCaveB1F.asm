	object_const_def
	const UNIONCAVEB1F_POKEFAN_M1
	const UNIONCAVEB1F_POKEFAN_M2
	const UNIONCAVEB1F_SUPER_NERD1
	const UNIONCAVEB1F_SUPER_NERD2
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2

UnionCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB1FTMSwift:
	itemball TM_SWIFT

UnionCaveB1FXDefend:
	itemball X_DEFEND

UnionCaveB1FBoulder:
	jumpstd StrengthBoulderScript

HikerPhillipSeenText:
	text "Het is even gele-" ; "It's been a while"
	line "den dat ik voor 't" ; "since I last saw"
	cont "laatst iemand zag." ; "another person."

	para "Niet zo verlegen." ; "Don't be shy."
	line "Laten we vechten!" ; "Let's battle!"
	done

HikerPhillipBeatenText:
	text "Uurggh…" ; "Uurggh…"
	done

HikerPhillipAfterBattleText:
	text "Ik ben al zo" ; "I've been lost for"
	line "lang verdwaald…" ; "a long time…"

	para "Niet zo erg hoor," ; "I don't mind it"
	line "maar ik heb zooo-" ; "here, but I am"
	cont "veel honger!" ; "soooo hungry!"
	done

HikerLeonardSeenText:
	text "Nou ja, zeg!" ; "What do you know!"
	line "Een bezoeker!" ; "A visitor!"
	done

HikerLeonardBeatenText:
	text "Wahahah! Jij bent" ; "Wahahah! You're a"
	line "een pittige!" ; "feisty one!"
	done

HikerLeonardAfterBattleText:
	text "Ja, ik woon hier." ; "I live down here."

	para "Als je wil, kan je" ; "You can, too, if"
	line "hier ook wonen." ; "you'd like."

	para "Er is genoeg" ; "There's plenty of"
	line "ruimte, zie je?" ; "room, you see."
	done

PokemaniacAndrewSeenText:
	text "Wie is daar?" ; "Who's there?"

	para "Laat mij en mijn" ; "Leave me and my"
	line "#MON met rust!" ; "#MON alone!"
	done

PokemaniacAndrewBeatenText:
	text "Ga…" ; "Go…"
	line "Ga weg!" ; "Go away!"
	done

PokemaniacAndrewAfterBattleText:
	text "Alleen ik en mijn" ; "Just me and my"
	line "#MON. Ik ben" ; "#MON. I'm de-"
	cont "dol van vreugde." ; "lirious with joy."
	done

PokemaniacCalvinSeenText:
	text "Ik ben helemaal" ; "I came all the way"
	line "hier voor mijn" ; "here to conduct my"
	cont "#MON-onderzoek." ; "#MON research."

	para "In een echt ge-" ; "Let me demonstrate"
	line "vecht zal ik je" ; "my findings in a"
	cont "leren wat ik weet!" ; "real battle!"
	done

PokemaniacCalvinBeatenText:
	text "Je hebt mij een" ; "You demonstrated"
	line "lesje geleerd!" ; "on me!"
	done

PokemaniacCalvinAfterBattleText:
	text "Zal ik mijn be-" ; "I should compile"
	line "vindingen wereld-" ; "and announce my"
	cont "kundig maken?" ; "study findings."

	para "Misschien word ik" ; "I might even be-"
	line "wel net zo beroemd" ; "come famous like"
	cont "als PROF.ELM." ; "PROF.ELM."
	done

UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3, 11, RUINS_OF_ALPH_OUTSIDE, 8
	warp_event  7, 19, UNION_CAVE_1F, 1
	warp_event  3, 33, UNION_CAVE_1F, 2
	warp_event 17, 31, UNION_CAVE_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerPhillip, -1
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerLeonard, -1
	object_event  5, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacAndrew, -1
	object_event 17, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  2, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FTMSwift, EVENT_UNION_CAVE_B1F_TM_SWIFT
	object_event  7, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FBoulder, -1
	object_event 17, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FXDefend, EVENT_UNION_CAVE_B1F_X_DEFEND
