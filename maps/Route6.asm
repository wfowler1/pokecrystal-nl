	object_const_def
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "De weg is afge-" ; "The road is closed"
	line "sloten tot het" ; "until the problem"

	para "probleem bij de" ; "at the POWER PLANT"
	line "ENERGIECENTRALE" ; "is solved."
	cont "is opgelost." ;
	done

Route6UndergroundPathSignText:
	text "ONDERGRONDS PAD" ; "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

PokefanmRexSeenText:
	text "Mijn FANPIE is" ; "My PHANPY is the"
	line "de schattigste van" ; "cutest in the"
	cont "de wereld." ; "world."
	done

PokefanmRexBeatenText:
	text "Mijn FANPIE!" ; "My PHANPY!"
	done

PokefanmRexAfterBattleText:
	text "Kijk hoe lief mijn" ; "Look how adorable"
	line "FANPIE doet!" ; "my PHANPY acts!"

	para "Is het niet zo" ; "Isn't it cute"
	line "schattig dat je" ; "enough to make"
	cont "hart smelt?" ; "your heart melt?"
	done

PokefanmAllanSeenText:
	text "Mijn TEDDIURSA is" ; "My TEDDIURSA is"
	line "de schattigste" ; "the cutest in the"
	cont "van de wereld." ; "world."
	done

PokefanmAllanBeatenText:
	text "Mijn TEDDIURSA!" ; "My TEDDIURSA!"
	done

PokefanmAllanAfterBattleText:
	text "Kijk hoe lief mijn" ; "Look how adorable"
	line "TEDDIURSA doet!" ; "my TEDDIURSA acts!"

	para "Is het niet zo" ; "Isn't it cute"
	line "schattig dat je" ; "enough to make"
	cont "hart smelt?" ; "your heart melt?"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
