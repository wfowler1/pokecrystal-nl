	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "He, <PLAY_G>! Mijn"
	line "man is altijd zo"

	para "druk--Ik hoop dat"
	line "het oké gaat."

	para "Als hij werkt met"
	line "#MON, vergeet"

	para "hij zelfs om te"
	line "eten."
	done

ElmsSonText:
	text "Als ik groot ben,"
	line "ga ik mijn papa"
	cont "helpen!"

	para "Ik ga een beroemde"
	line "#MON-professor"
	cont "worden!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "Er staat eten."
	line "Het is vast voor"
	cont "het LAB."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "Er staat eten."
	line "Het is vast voor"
	cont "#MON."
	done

ElmsHousePCText:
	text "#MON. Waar komen"
	line "ze vandaan? "

	para "Waar gaan ze naar-"
	line "toe?"

	para "Waarom zag niemand"
	line "de geboorte van"
	cont "#MON?"

	para "Ik wil het weten!"
	line "Ik wijd mijn leven"

	para "aan de studie van"
	line "#MON!"

	para "…"

	para "Het is deel van"
	line "PROF.ELM's onder-"
	cont "zoekspapieren."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
