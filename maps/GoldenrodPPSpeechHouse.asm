	object_const_def
	const GOLDENRODPPSPEECHHOUSE_FISHER
	const GOLDENRODPPSPEECHHOUSE_LASS

GoldenrodPPSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodPPSpeechHouseFisherScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseFisherText

GoldenrodPPSpeechHouseLassScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseLassText

GoldenrodPPSpeechHouseBookshelf2:
	jumpstd DifficultBookshelfScript

GoldenrodPPSpeechHouseBookshelf1:
	jumpstd MagazineBookshelfScript

GoldenrodPPSpeechHouseRadio:
	jumpstd Radio2Script

GoldenrodPPSpeechHouseFisherText:
	text "Mijn #MON kon" ; "Once while I was"
	line "een keer tijdens" ; "battling, my"

	para "een gevecht geen" ; "#MON couldn't"
	line "één aanval doen." ; "make any moves."

	para "De ACTIEPUNTEN," ; "The POWER POINTS,"
	line "of AP, van de" ; "or PP, of its"

	para "aanvallen waren" ; "moves were all"
	line "allemaal op." ; "gone."
	done

GoldenrodPPSpeechHouseLassText:
	text "Soms kan een" ; "Sometimes, a"
	line "gezonde #MON" ; "healthy #MON"

	para "geen aanvallen" ; "may be unable to"
	line "meer gebruiken." ; "use its moves."

	para "Als dat gebeurt," ; "If that happens,"
	line "genees het in een" ; "heal it at a #-"
	cont "#MONCENTRUM of" ; "MON CENTER or use"
	cont "gebruik een" ; "an item."
	cont "voorwerp.";
	done

GoldenrodPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 7
	warp_event  3,  7, GOLDENROD_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf2
	bg_event  7,  1, BGEVENT_READ, GoldenrodPPSpeechHouseRadio

	def_object_events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseFisherScript, -1
	object_event  5,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseLassScript, -1
