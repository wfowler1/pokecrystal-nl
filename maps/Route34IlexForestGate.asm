	object_const_def
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route34IlexForestGate_MapScripts:
	def_scene_scripts
	scene_const SCENE_ROUTE34ILEXFORESTGATE_TEACHER_BLOCKS_IF_FOREST_IS_RESTLESS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route34IsForestRestlessCallback

Route34IsForestRestlessCallback:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .Normal
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	endcallback

.Normal:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	endcallback

Route34IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .skip
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	turnobject ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, Route34IlexForestGateTeacherBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, DOWN
	opentext
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, Route34IlexForestGateTeacherReturnsMovement
.skip:
	end

Route34IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route34IlexForestGateTeacherText
	promptbutton
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route34IlexForestGateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end

.ForestIsRestless:
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	promptbutton
	closetext
	end

Route34IlexForestGateButterfreeScript:
	opentext
	writetext Route34IlexForestGateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route34IlexForestGateLassScript:
	jumptextfaceplayer Route34IlexForestGateLassText

Route34IlexForestGateTeacherBlocksPlayerMovement:
	step UP
	step UP
	step_end

Route34IlexForestGateTeacherReturnsMovement:
	step DOWN
	step RIGHT
	step_end

Route34IlexForestGateTeacherText:
	text "Och, schatje. Je" ; "Oh, honey. You're"
	line "vult je #DEX?" ; "making a #DEX?"

	para "Vast lastig als" ; "It must be hard if"
	line "#MON maar niet" ; "#MON won't"

	para "verschijnen. Pro-" ; "appear. Try using"
	line "beer deze TM." ; "this TM."
	done

Route34IlexForestGateTeacher_GotSweetScent:
	text "Het is ZOETE GEUR." ; "It's SWEET SCENT."

	para "Gebruik deze waar" ; "Use it wherever"
	line "je #MON vindt." ; "#MON appear."

	para "#MON worden" ; "#MON will be"
	line "erdoor gelokt." ; "enticed by it."
	done

Route34IlexForestGateTeacher_ForestIsRestless:
	text "Er is iets mis" ; "Something's wrong"
	line "in het EIKENWOUD…" ; "in ILEX FOREST…"

	para "Beter blijf je" ; "You should stay"
	line "uit de buurt." ; "away right now."
	done

Route34IlexForestGateButterfreeText:
	text "BUTTERFREE: Freeh!" ; "BUTTERFREE: Freeh!"
	done

Route34IlexForestGateLassText:
	text "Zag je het altaar" ; "Did you see the"
	line "ter ere van de" ; "shrine honoring"
	cont "beschermer?" ; "the protector?"

	para "Die waakt voor" ; "It watches over"
	line "eeuwig over" ; "the FOREST from"
	cont "het WOUD." ; "across time."

	para "Ik denk dat het" ; "I think that it"
	line "een grastype-" ; "must be a grass-"
	cont "#MON moet zijn." ; "type #MON."
	done

Route34IlexForestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	def_coord_events
	coord_event  4,  7, SCENE_ROUTE34ILEXFORESTGATE_TEACHER_BLOCKS_IF_FOREST_IS_RESTLESS, Route34IlexForestGateCelebiEvent

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateLassScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	object_event  5,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
