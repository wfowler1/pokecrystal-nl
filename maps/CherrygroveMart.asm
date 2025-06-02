	object_const_def
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER

CherrygroveMart_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveMartClerkScript:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CherrygroveMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CherrygroveMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText

CherrygroveMartCooltrainerMText:
	text "Alle #BALLEN" ; "They're fresh out"
	line "zijn hier op!" ; "of # BALLS!"

	para "Wanneer komen er" ; "When will they get"
	line "nieuwe binnen?" ; "more of them?"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "Er zijn weer" ; "# BALLS are in"
	line "#BALLEN! Nu kan" ; "stock! Now I can"
	cont "ik #MON vangen!" ; "catch #MON!"
	done

CherrygroveMartYoungsterText:
	text "Toen ik door het" ; "When I was walking"
	line "gras liep," ; "in the grass, a"

	para "vergiftigde een" ; "bug #MON poi-"
	line "insect-#MON m'n" ; "soned my #MON!"
	cont "eigen #MON!"

	para "Ik bleef door-" ; "I just kept going,"
	line "lopen, maar toen" ; "but then my"
	cont "viel ie flauw." ; "#MON fainted."

	para "Je moet altijd wat" ; "You should keep an"
	line "TEGENGIF meenemen." ; "ANTIDOTE with you."
	done

CherrygroveMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
