	object_const_def
	const PEWTERMART_CLERK
	const PEWTERMART_YOUNGSTER
	const PEWTERMART_SUPER_NERD

PewterMart_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PEWTER
	closetext
	end

PewterMartYoungsterScript:
	jumptextfaceplayer PewterMartYoungsterText

PewterMartSuperNerdScript:
	jumptextfaceplayer PewterMartSuperNerdText

PewterMartYoungsterText:
	text "Hoi! Check mijn" ; "Hi! Check out my"
	line "GYARADOS!"

	para "Ik heb 't opgevoed" ; "I raised it from a"
	line "van een MAGIKARP." ; "MAGIKARP. I can't"

	para "Ik kan niet ge-" ; "believe how strong"
	line "loven hoe sterk" ; "it has become."
	cont "het is geworden." ; 
	done

PewterMartSuperNerdText:
	text "Er was vroeger" ; "There once was a"
	line "een rare oude man" ; "weird old man who"
	cont "die MAGIKARP" ; "sold MAGIKARP."
	cont "verkocht." ; 

	para "Hij zei dat de" ; "He was saying the"
	line "MAGIKARP van het" ; "MAGIKARP from the"

	para "MEER VAN RAZERNIJ" ; "LAKE OF RAGE were"
	line "uitstekend waren." ; "excellent."
	done

PewterMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PEWTER_CITY, 3
	warp_event  3,  7, PEWTER_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartClerkScript, -1
	object_event  9,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartYoungsterScript, -1
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMartSuperNerdScript, -1
