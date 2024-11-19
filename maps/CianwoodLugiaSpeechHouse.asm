	object_const_def
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTeacherText

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

CianwoodLugiaSpeechHouseTeacherText:
	text "Je komt uit" ; "You came from"
	line "OLIVINE?"

	para "Herinner je de" ; "Do you remember"
	line "vier eilanden op" ; "the four islands"
	cont "de route?" ; "along the way?"

	para "Ik hoorde dat een" ; "I heard that a "
	line "mythisch zeewezen" ; "mythical sea crea-"
	cont "zich daar ergens" ; "ture is hiding in"
	cont "verstopt." ; "them."
	done

CianwoodLugiaSpeechHouseLassText:
	text "Ik hoorde dat je" ; "I heard that you"
	line "het alleen kan" ; "can only see it if"

	para "zien als je een" ; "you have a SILVER"
	line "ZILVERVEER hebt." ; "WING."

	para "Het heeft vast" ; "It must have the"
	line "dezelfde geur als" ; "same scent as the"
	cont "het wezen." ; "creature."
	done

CianwoodLugiaSpeechHouseTwinText:
	text "Ik heb gehoord dat" ; "I've heard that"
	line "de draaikolken" ; "the whirlpools"

	para "rond de eilanden" ; "around the islands"
	line "worden veroorzaakt" ; "are caused by the"
	cont "door het zeewezen." ; "sea creature."

	para "Je hebt wellicht" ; "You might need a"
	line "een speciale aan-" ; "special move to"
	cont "val nodig om er" ; "get past them."
	cont "doorheen te komen." ;
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
