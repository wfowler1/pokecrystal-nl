	object_const_def
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER

CeladonDeptStore1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonDeptStore1FReceptionistScript:
	jumptextfaceplayer CeladonDeptStore1FReceptionistText

CeladonDeptStore1FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore1FGentlemanText

CeladonDeptStore1FTeacherScript:
	jumptextfaceplayer CeladonDeptStore1FTeacherText

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

CeladonDeptStore1FReceptionistText:
	text "Hallo! Welkom bij" ; "Hello! Welcome to"
	line "het CELADON-" ; "CELADON DEPT."
	cont "WARENHUIS!" ; "STORE!"

	para "De plattegrond" ; "The directory is"
	line "hangt aan de muur." ; "on the wall."
	done

CeladonDeptStore1FGentlemanText:
	text "Dit WARENHUIS is" ; "This DEPT.STORE is"
	line "van dezelfde keten" ; "part of the same"

	para "als die in" ; "chain as the one"
	line "in GOLDENROD CITY." ; "in GOLDENROD CITY."

	para "Ze zijn tegelijk" ; "They were both"
	line "gerenoveerd." ; "renovated at the"
	; cont "renoveerd." ; "same time."
	done

CeladonDeptStore1FTeacherText:
	text "Ik ben hier" ; "This is my first"
	line "voor het eerst." ; "time here."

	para "Zo groot…" ; "It's so big…"

	para "Ik ben bang dat" ; "I'm afraid I'll"
	line "ik verdwaal." ; "get lost."
	done

CeladonDeptStore1FDirectoryText:
	text "1F: SERVICE-" ; "1F: SERVICE"
	line "    BALIE" ; "    COUNTER"

	para "2F: TRAINER-" ; "2F: TRAINER'S"
	line "    MARKT" ; "    MARKET"

	para "3F: TM-WINKEL" ; "3F: TM SHOP"

	para "4F: CADEAUWINKEL" ; "4F: WISEMAN GIFTS"

	para "5F: APOTHEEK" ; "5F: DRUG STORE"

	para "6F: DAK-" ; "6F: ROOFTOP"
	line "    TERRAS" ; "    SQUARE"
	done

CeladonDeptStore1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 1
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FTeacherScript, -1
