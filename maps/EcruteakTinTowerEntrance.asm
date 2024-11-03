	object_const_def
	const ECRUTEAKTINTOWERENTRANCE_SAGE1
	const ECRUTEAKTINTOWERENTRANCE_SAGE2
	const ECRUTEAKTINTOWERENTRANCE_SAGE3
	const ECRUTEAKTINTOWERENTRANCE_GRAMPS

EcruteakTinTowerEntrance_MapScripts:
	def_scene_scripts
	scene_script EcruteakTinTowerEntranceNoop1Scene, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
	scene_script EcruteakTinTowerEntranceNoop2Scene, SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, EcruteakTinTowerEntranceInitializeSagesCallback

EcruteakTinTowerEntranceNoop1Scene:
	end

EcruteakTinTowerEntranceNoop2Scene:
	end

EcruteakTinTowerEntranceInitializeSagesCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BlockTower
	endcallback

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	checkitem CLEAR_BELL
	iftrue .NoClearBell
	setscene SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
.NoClearBell:
	endcallback

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	endcallback

EcruteakTinTowerEntranceSageBlocksLeft:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftrue EcruteakTinTowerEntranceAlreadyBlocked
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE2, EcruteakTinTowerEntranceSageBlocksLeftMovement
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 4, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE1
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE2
	end

EcruteakTinTowerEntranceSageBlocksRight:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftrue EcruteakTinTowerEntranceAlreadyBlocked
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE1, EcruteakTinTowerEntranceSageBlocksRightMovement
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE2, 5, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE2
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE1
	end

EcruteakTinTowerEntranceAlreadyBlocked:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext EcruteakTinTowerEntranceSageText
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext EcruteakTinTowerEntranceSageText_GotFogBadge
	waitbutton
	closetext
	end

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .AllowedThrough
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RangClearBell
	checkitem CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceSageText_NoClearBell
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceSageText_HearsClearBell
	waitbutton
	closetext
	setscene SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.AllowedThrough:
	writetext EcruteakTinTowerEntranceSageText_PleaseDoGoOn
	waitbutton
	closetext
	end

.RangClearBell:
	writetext EcruteakTinTowerEntranceSageText_HeardClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceWanderingSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceWanderingSageText
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceWanderingSageText_GotClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceGrampsScript:
	jumptextfaceplayer EcruteakTinTowerEntranceGrampsText

EcruteakTinTowerEntranceSageBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageText:
	text "TIN TOREN is ver-" ; "TIN TOWER is off"
	line "boden toegang voor" ; "limits to anyone"

	para "iedereen zonder" ; "without ECRUTEAK"
	line "ECRUTEAK GYM-" ; "GYM's BADGE."
	cont "BADGE." ; 

	para "Sorry, maar je" ; "Sorry, but you'll"
	line "moet vertrekken." ; "have to leave."
	done

EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "Verboden toegang" ; "TIN TOWER is off"
	line "zonder ECRUTEAK-" ; "limits to anyone"

	para "GYMBADGE." ; "without ECRUTEAK"
	line "" ; "GYM's BADGE."

	para "Ah!" ; "Ah!"

	para "ECRUTEAK's GYM" ; "ECRUTEAK's GYM"
	line "BADGE! Ga je" ; "BADGE! Please, go"
	cont "gang." ; "right through."
	done

EcruteakTinTowerEntranceSageText_NoClearBell:
	text "Een bijzondere" ; "A momentous event"
	line "gebeurtenis heeft" ; "has occurred."
	cont "plaatsgevonden." ; 

	para "Het spijt me," ; "I beg your pardon,"
	line "maar ik moet je" ; "but I must ask you"
	cont "vragen om te" ; "to leave."
	cont "vertrekken." ; 

	para "…Wat kalmeert" ; "…What soothes the"
	line "de ziel…" ; "soul…"

	para "Het WIJZE DRIETAL" ; "The WISE TRIO say"
	line "zegt dingen die" ; "things that are so"

	para "erg moeilijk te" ; "very difficult to"
	line "begrijpen zijn…" ; "understand…"
	done

EcruteakTinTowerEntranceSageText_HearsClearBell:
	text "Een bijzondere" ; "A momentous event"
	line "gebeurtenis heeft" ; "has occurred."
	cont "plaatsgevonden." ; 

	para "Het spijt me," ; "I beg your pardon,"
	line "maar ik moet je" ; "but I must ask you"
	cont "vragen om te" ; "to leave."
	cont "vertrekken." ; 

	para "<……><……><……>" ; "<……><……><……>"

	para "Ah!" ; "Ah!"

	para "Het geluid van" ; "The sound of that"
	line "de HELDERE BEL!" ; "CLEAR BELL!"

	para "Het… is subliem!" ; "It… It's sublime!"

	para "Ik heb nog nooit" ; "I've never heard"
	line "zo'n mooi" ; "so beautiful a"
	cont "geluid gehoord!" ; "sound before!"

	para "De klank van die" ; "That bell's chime"
	line "bel is een" ; "is indicative of"
	cont "weerspiegeling van" ; "the bearer's soul."
	cont "de ziel van de" ; 
	cont "drager." ; 

	para "Jij…" ; "You…"

	para "Misschien lukt" ; "You may be able to"
	line "het je om	door" ; "make it through"
	cont "TIN TOREN te komen." ; "TIN TOWER."

	para "Toe, ga verder." ; "Please, do go on."
	done

EcruteakTinTowerEntranceSageText_PleaseDoGoOn:
	text "Toe, ga verder." ; "Please, do go on."
	done

EcruteakTinTowerEntranceSageText_HeardClearBell:
	text "De klank van die" ; "That bell's chime"
	line "bel is een" ; "is indicative of"
	cont "weerspiegeling van" ; "the bearer's soul."
	cont "de ziel van de" ; 
	cont "drager." ; 

	para "Jij…" ; "You…"

	para "Misschien lukt" ; "You may be able to"
	line "het je om	door" ; "make it through"
	cont "TIN TOREN te komen." ; "TIN TOWER."

	para "Toe, ga verder." ; "Please, do go on."
	done

EcruteakTinTowerEntranceWanderingSageText:
	text "De TIN TOREN" ; "The TIN TOWER"
	line "is een toren met" ; "ahead is a nine-"

	para "negen verdiep-" ; "tier tower of"
	line "ingen vol godde-" ; "divine beauty."
	cont "lijke schoonheid." ; 

	para "Het kalmeert" ; "It soothes the"
	line "de ziel van allen" ; "soul of all who"
	cont "die het zien." ; "see it."
	done

EcruteakTinTowerEntranceWanderingSageText_GotClearBell:
	text "De TIN TOREN" ; "The TIN TOWER"
	line "schudde! Een #-" ; "shook! A #MON"

	para "MON moet zijn" ; "must have returned"
	line "teruggekeerd!" ; "to the top!"
	done

EcruteakTinTowerEntranceGrampsText:
	text "Twee torens…" ; "Two towers…"
	line "Twee #MON…" ; "Two #MON…"

	para "Maar toen een" ; "But when one"
	line "afbrandde, vlogen" ; "burned down, both"

	para "beide #MON weg," ; "#MON flew away,"
	line "om nooit terug" ; "never to return."
	cont "te keren." ; 
	done

EcruteakTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 4
	warp_event 17, 15, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 17,  3, WISE_TRIOS_ROOM, 3

	def_coord_events
	coord_event  4,  7, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS, EcruteakTinTowerEntranceSageBlocksLeft
	coord_event  5,  7, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS, EcruteakTinTowerEntranceSageBlocksRight

	def_bg_events

	def_object_events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_1
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_2
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceGrampsScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
