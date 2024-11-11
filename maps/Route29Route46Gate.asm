	object_const_def
	const ROUTE29ROUTE46GATE_OFFICER
	const ROUTE29ROUTE46GATE_YOUNGSTER

Route29Route46Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route29Route46GateOfficerScript:
	jumptextfaceplayer Route29Route46GateOfficerText

Route29Route46GateYoungsterScript:
	jumptextfaceplayer Route29Route46GateYoungsterText

Route29Route46GateOfficerText:
	text "Je kunt niet op" ; "You can't climb"
	line "richels klimmen." ; "ledges."

	para "Maar je kunt wel" ; "But you can jump"
	line "naar beneden om" ; "down from them to"
	cont "af te snijden." ; "take a shortcut."
	done

Route29Route46GateYoungsterText:
	text "Verschillende" ; "Different kinds of"
	line "soorten #MON" ; "#MON appear"
	cont "duiken hier op." ; "past here."

	para "Als je ze allemaal" ; "If you want to"
	line "wil vangen, moet" ; "catch them all,"

	para "je overal goed" ; "you have to look"
	line "zoeken." ; "everywhere."
	done

Route29Route46Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_46, 1
	warp_event  5,  0, ROUTE_46, 2
	warp_event  4,  7, ROUTE_29, 1
	warp_event  5,  7, ROUTE_29, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29Route46GateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29Route46GateYoungsterScript, -1
