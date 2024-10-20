	object_const_def
	const OLIVINEMART_CLERK
	const OLIVINEMART_COOLTRAINER_F
	const OLIVINEMART_LASS

OlivineMart_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OLIVINE
	closetext
	end

OlivineMartCooltrainerFScript:
	jumptextfaceplayer OlivineMartCooltrainerFText

OlivineMartLassScript:
	jumptextfaceplayer OlivineMartLassText

OlivineMartCooltrainerFText:
	text "Kennen jouw #MON" ; "Do your #MON"
	line "al de vaardigheid" ; "already know the"

	para "om mensen over het" ; "move for carrying"
	line "water dragen?" ; "people on water?"
	done

OlivineMartLassText:
	text "Mijn BUTTERFREE" ; "My BUTTERFREE came"
	line "kwam van mijn" ; "from my boyfriend"
	cont "vriendje overzee." ; "overseas."

	para "Het bracht wat" ; "It carried some"
	line "POST van hem." ; "MAIL from him."

	para "Wil je weten" ; "Want to know what"
	line "wat erin staat?" ; "it says?"

	para "Eens zien… Nee!" ; "Let's see… Nope!"
	line "Het is geheim!" ; "It's a secret!"
	done

OlivineMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 8
	warp_event  3,  7, OLIVINE_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartClerkScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivineMartCooltrainerFScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartLassScript, -1
