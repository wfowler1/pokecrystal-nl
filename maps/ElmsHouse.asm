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
	text "He, <PLAY_G>! Mijn" ; "Hi, <PLAY_G>! My"
	line "man is altijd zo" ; "husband's always"

	para "druk--Ik hoop dat" ; "so busy--I hope"
	line "het oké gaat." ; "he's OK."

	para "Als hij werkt met" ; "When he's caught"
	line "#MON, vergeet" ; "up in his #MON"

	para "hij zelfs om te" ; "research, he even"
	line "eten." ; "forgets to eat."
	done

ElmsSonText:
	text "Als ik groot ben," ; "When I grow up,"
	line "ga ik mijn papa" ; "I'm going to help"
	cont "helpen!" ; "my dad!"

	para "Ik ga een beroemde" ; "I'm going to be a"
	line "#MON-professor" ; "great #MON"
	cont "worden!" ; "professor!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "Er staat eten." ; "There's some food"
	line "Het is vast voor" ; "here. It must be"
	cont "het LAB." ; "for the LAB."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "Er staat eten." ; "There's some food"
	line "Het is vast voor" ; "here. This must be"
	cont "#MON." ; "for #MON."
	done

ElmsHousePCText:
	text "#MON. Waar komen" ; "#MON. Where do"
	line "ze vandaan?" ; "they come from? "

	para "Waar gaan ze naar-" ; "Where are they"
	line "toe?" ; "going?"

	para "Waarom zag niemand" ; "Why has no one"
	line "de geboorte van" ; "ever witnessed a"
	cont "#MON?" ; "#MON's birth?"

	para "Ik wil het weten!" ; "I want to know! I"
	line "Ik wijd mijn leven" ; "will dedicate my"

	para "aan de studie van" ; "life to the study"
	line "#MON!" ; "of #MON!"

	para "…"

	para "Het is deel van" ; "It's a part of"
	line "PROF.ELM's onder-" ; "PROF.ELM's re-"
	cont "zoekspapieren." ; "search papers."
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
