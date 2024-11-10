	object_const_def
	const ROUTE36RUINSOFALPHGATE_OFFICER
	const ROUTE36RUINSOFALPHGATE_GRAMPS

Route36RuinsOfAlphGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route36RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route36RuinsOfAlphGateOfficerText

Route36RuinsOfAlphGateGrampsScript:
	jumptextfaceplayer Route36RuinsOfAlphGateGrampsText

Route36RuinsOfAlphGateOfficerText:
	text "Vraag jij je ooit" ; "Don't you wonder"
	line "af wie zoiets" ; "who'd make some-"
	cont "zou maken?" ; "thing like this?"
	cont "En waarom?" ; "And why?"
	done

Route36RuinsOfAlphGateGrampsText:
	text "Zag je die rare" ; "Did you see that"
	line "boom midden op de" ; "strange tree in"
	cont "weg?" ; "the road?"

	para "Dat verklaart" ; "That may explain"
	line "wellicht waarom" ; "why fewer people"

	para "minder mensen de" ; "are visiting the"
	line "RUÏNES VAN ALF" ; "RUINS OF ALPH."
	cont "bezoeken."
	done

Route36RuinsOfAlphGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_36, 3
	warp_event  5,  0, ROUTE_36, 4
	warp_event  4,  7, RUINS_OF_ALPH_OUTSIDE, 9
	warp_event  5,  7, RUINS_OF_ALPH_OUTSIDE, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36RuinsOfAlphGateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route36RuinsOfAlphGateGrampsScript, -1
