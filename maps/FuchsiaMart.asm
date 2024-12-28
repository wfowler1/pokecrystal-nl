	object_const_def
	const FUCHSIAMART_CLERK
	const FUCHSIAMART_FISHER
	const FUCHSIAMART_COOLTRAINER_F

FuchsiaMart_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FUCHSIA
	closetext
	end

FuchsiaMartFisherScript:
	jumptextfaceplayer FuchsiaMartFisherText

FuchsiaMartCooltrainerFScript:
	jumptextfaceplayer FuchsiaMartCooltrainerFText

FuchsiaMartFisherText:
	text "Ik wou wat" ; "I was hoping to"
	line "SAFARIZONE-" ; "buy some SAFARI"

	para "souvenirs kopen," ; "ZONE souvenirs,"
	line "maar het is dicht…" ; "but it's closed…"
	done

FuchsiaMartCooltrainerFText:
	text "De kleindochter" ; "The SAFARI ZONE"
	line "van de SAFARIZONE-" ; "WARDEN's grand-"
	cont "OPZICHTER leeft" ; "daughter lives in"
	cont "in de stad." ; "town."
	done

FuchsiaMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 1
	warp_event  3,  7, FUCHSIA_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaMartClerkScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaMartFisherScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaMartCooltrainerFScript, -1
