	object_const_def
	const GOLDENRODDEPTSTORE2F_CLERK1
	const GOLDENRODDEPTSTORE2F_CLERK2
	const GOLDENRODDEPTSTORE2F_YOUNGSTER
	const GOLDENRODDEPTSTORE2F_COOLTRAINER_F
	const GOLDENRODDEPTSTORE2F_GENTLEMAN

GoldenrodDeptStore2F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_1
	closetext
	end

GoldenrodDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2
	closetext
	end

GoldenrodDeptStore2FYoungsterScript:
	jumptextfaceplayer GoldenrodDeptStore2FYoungsterText

GoldenrodDeptStore2FCooltrainerFScript:
	jumptextfaceplayer GoldenrodDeptStore2FCooltrainerFText

GoldenrodDeptStore2FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore2FGentlemanText

GoldenrodDeptStore2FDirectory:
	jumptext GoldenrodDeptStore2FDirectoryText

GoldenrodDeptStore2FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore2FUnusedText1: ; unreferenced
	text "" ; "We intend to sell"
	line "" ; "items for #MON"
	cont "" ; "to hold."

	para "" ; "This is a free"
	line "" ; "gift. Have a #-"
	cont "" ; "MON hold it."
	done

GoldenrodDeptStore2FUnusedText2: ; unreferenced
	text "" ; "By giving #MON"
	line "" ; "items to hold, I"

	para "" ; "bet trainers will"
	line "" ; "develop new battle"
	cont "" ; "techniques."
	done

GoldenrodDeptStore2FYoungsterText:
	text "#GEAR kan tot" ; "#GEAR can store"
	line "tien nummers" ; "up to ten phone"
	cont "opslaan." ; "numbers."

	para "Het is lastig" ; "It's hard to de-"
	line "te kiezen welke" ; "cide which numbers"
	cont "nummers te houden." ; "to keep."
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "Ik heb mijn ABRA" ; "I got my ABRA at"
	line "in de SPELHOEK" ; "the GAME CORNER."
	cont "gekregen." ; 

	para "Nu is het mijn" ; "Now it's my best"
	line "beste maatje." ; "partner."
	done

GoldenrodDeptStore2FGentlemanText:
	text "Dit WARENHUIS" ; "This DEPT.STORE"
	line "doet beseffen" ; "makes me realize"

	para "dat GOLDENROD" ; "that GOLDENROD is"
	line "een grote stad is." ; "a big city."

	para "De selectie" ; "The selection here"
	line "hier is" ; "is unmatched any-"
	cont "ongeëvenaard." ; "where else."
	done

GoldenrodDeptStore2FDirectoryText:
	text "Jouw" ; "Your Travel"
	line "Reisgenoot" ; "Companion"

	para "1V TRAINER'S" ; "2F TRAINER'S"
	line "MARKT" ; "   MARKET"
	done

GoldenrodDeptStore2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore2FElevatorButton

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FGentlemanScript, -1
