	object_const_def
	const ROUTE5SAFFRONGATE_OFFICER

Route5SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route5SaffronGateOfficerScript:
	jumptextfaceplayer Route5SaffronGateOfficerText

Route5SaffronGateOfficerText:
	text "Je komt uit JOHTO," ; "You're from JOHTO,"
	line "toch?" ; "aren't you?"

	para "Wat vind je van" ; "How do you like"
	line "KANTO? Het is" ; "KANTO? It's nice,"
	cont "mooi hè?" ; "don't you agree?"
	done

Route5SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_5, 2
	warp_event  5,  0, ROUTE_5, 3
	warp_event  4,  7, SAFFRON_CITY, 9
	warp_event  5,  7, SAFFRON_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SaffronGateOfficerScript, -1
