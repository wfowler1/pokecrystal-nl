	object_const_def
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_M
	const CHERRYGROVEGYMSPEECHHOUSE_BUG_CATCHER

CherrygroveGymSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveGymSpeechHousePokefanMScript:
	jumptextfaceplayer CherrygroveGymSpeechHousePokefanMText

CherrygroveGymSpeechHouseBugCatcherScript:
	jumptextfaceplayer CherrygroveGymSpeechHouseBugCatcherText

CherrygroveGymSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

CherrygroveGymSpeechHousePokefanMText:
	text "Wil je zien of" ; "You're trying to"
	line "je een goede" ; "see how good you"

	para "#MON-TRAINER" ; "are as a #MON"
	line "bent?" ; "trainer?"

	para "Bezoek dan alle" ; "You better visit"
	line "#MON-GYMS" ; "the #MON GYMS"

	para "in JOHTO en ver-" ; "all over JOHTO and"
	line "zamel BADGES." ; "collect BADGES."
	done

CherrygroveGymSpeechHouseBugCatcherText:
	text "Als ik later groot" ; "When I get older,"
	line "ben wil ik GYM-" ; "I'm going to be a"
	cont "LEIDER worden!" ; "GYM LEADER!"

	para "Ik laat mijn" ; "I make my #MON"
	line "#MON vechten" ; "battle with my"

	para "met die van" ; "friend's to make"
	line "vrienden!" ; "them tougher!"
	done

CherrygroveGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 3
	warp_event  3,  7, CHERRYGROVE_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHousePokefanMScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHouseBugCatcherScript, -1
