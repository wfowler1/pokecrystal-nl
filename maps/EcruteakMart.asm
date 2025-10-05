	object_const_def
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

EcruteakMart_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

EcruteakMartSuperNerdScript:
	jumptextfaceplayer EcruteakMartSuperNerdText

EcruteakMartGrannyScript:
	jumptextfaceplayer EcruteakMartGrannyText

EcruteakMartSuperNerdText:
	text "Mijn EEVIE" ; "My EEVEE evolved"
	line "evolueerde in" ; "into an ESPEON."
	cont "een ESPERK." ; 

	para "Maar de EEVIE" ; "But my friend's"
	line "van mijn vriend" ; "EEVEE turned into"
	cont "werd een UMBRAPERK." ; "an UMBREON."

	para "Waarom? We hebben" ; "I wonder why? We"
	line "onze EEVIE op" ; "both were raising"

	para "dezelfde manier" ; "our EEVEE in the"
	line "opgevoed…" ; "same way…"
	done

EcruteakMartGrannyText:
	text "Als je OPWEKKER" ; "If you use REVIVE,"
	line "gebruikt, zal een" ; "a #MON that's"

	para "flauwgevallen" ; "fainted will wake"
	line "#MON meteen" ; "right up."
	cont "wakker worden." ; 
	done

EcruteakMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ECRUTEAK_CITY, 9
	warp_event  3,  7, ECRUTEAK_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartGrannyScript, -1
