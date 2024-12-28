	object_const_def
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

GoldenrodDeptStore1F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore1FBugCatcherText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore1FReceptionistText:
	text "Welkom in GOLDEN-" ; "Welcome to GOLDEN-"
	line "ROD WARENHUIS." ; "ROD DEPT.STORE."
	done

GoldenrodDeptStore1FGentlemanText:
	text "Het WARENHUIS" ; "The DEPT.STORE"
	line "heeft een prima" ; "has a decent se-"
	cont "selectie." ; "lection."

	para "Maar sommige voor-" ; "But some items"
	line "werpen zijn alleen" ; "are only available"

	para "beschikbaar als" ; "as GAME CORNER"
	line "SPELHOEK-prijzen." ; "prizes."
	done

GoldenrodDeptStore1FPokefanFText:
	text "Ik verheug me om" ; "I'm raring to shop"
	line "vandaag weer te" ; "again today!"
	cont "winkelen!" ; 
	done

GoldenrodDeptStore1FBugCatcherText:
	text "Mam is goed in" ; "Mom's good at"
	line "koopjesjagen." ; "bargain hunting."

	para "Ze koopt altijd" ; "She always buys"
	line "dingen met lage" ; "stuff at lower"
	cont "prijzen." ; "prices."
	done

GoldenrodDeptStore1FDirectoryText:
	text "BG SERVICEBALIE" ; "1F SERVICE COUNTER"

	para "1V TRAINER'S" ; "2F TRAINER'S"
	line "MARKT" ; "   MARKET"

	para "2V GEVECHT" ; "3F BATTLE"
	line "COLLECTIE" ; "   COLLECTION"

	para "3V MEDICIJNDOOS" ; "4F MEDICINE BOX"

	para "4V TM-HOEK" ; "5F TM CORNER"

	para "5V RUSTPLEIN" ; "6F TRANQUIL SQUARE"

	para "DAKTERRAS" ; "ROOFTOP LOOKOUT"
	done

GoldenrodDeptStore1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 9
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
