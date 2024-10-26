	object_const_def
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER

AzaleaMart_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

AzaleaMartCooltrainerMScript:
	jumptextfaceplayer AzaleaMartCooltrainerMText

AzaleaMartBugCatcherScript:
	jumptextfaceplayer AzaleaMartBugCatcherText

AzaleaMartCooltrainerMText:
	text "Er zijn hier geen" ; "There's no GREAT"
	line "SUPERBALLEN." ; "BALL here. #"

	para "Dan maar gewone" ; "BALLS will have"
	line "#BALLEN." ; "to do."

	para "Kon KURT maar zijn" ; "I wish KURT would"
	line "speciale BALLEN" ; "make me some of"
	cont "voor me maken." ; "his custom BALLS."
	done

AzaleaMartBugCatcherText:
	text "Een SUPERBAL werkt" ; "A GREAT BALL is"
	line "beter om een" ; "better for catch-"
	cont "#MON te vangen" ; "ing #MON than a"
	cont "dan een #BAL." ; "# BALL."

	para "Maar die van KURT" ; "But KURT's might"
	line "werken soms" ; "be better some-"
	cont "nóg beter." ; "times."
	done

AzaleaMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartClerkScript, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartCooltrainerMScript, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaMartBugCatcherScript, -1
