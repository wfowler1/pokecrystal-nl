	object_const_def
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BEAUTY
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BattleTowerOutsideNoopCallback
	callback MAPCALLBACK_OBJECTS, BattleTowerOutsideShowCiviliansCallback

BattleTowerOutsideNoopCallback:
	endcallback

BattleTowerOutsideShowCiviliansCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBeautyScript:
	jumptextfaceplayer BattleTowerOutsideBeautyText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_NotYetOpen: ; unreferenced
	text "Wauw, de GEVECHTS-" ; "Wow, the BATTLE"
	line "TOREN is giga!" ; "TOWER is huge! My"

	para "Mijn nek doet pijn" ; "neck is tired from"
	line "van het omhoog-" ; "looking up at it."
	cont "kijken."
	done

BattleTowerOutsideYoungsterText_Mobile: ; unreferenced
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "Since there are a"
	line "whole bunch of"

	para "trainers inside,"
	line "there must also be"

	para "a wide variety of"
	line "#MON."
	done

BattleTowerOutsideYoungsterText:
	text "Wauw, de GEVECHTS-" ; "Wow, the BATTLE"
	line "TOREN is giga!" ; "TOWER is huge!"

	para "Er zijn vast veel" ; "There must be many"
	line "soorten #MON" ; "kinds of #MON"
	cont "daarbinnen!" ; "in there!"
	done

BattleTowerOutsideBeautyText_NotYetOpen: ; unreferenced
	text "What on earth do"
	line "they do here?"

	para "If the name says"
	line "anything, I guess"

	para "it must be for"
	line "#MON battles."
	done

BattleTowerOutsideBeautyText:
	text "Je mag maar drie" ; "You can use only"
	line "#MON kiezen." ; "three #MON."

	para "Het is lastig" ; "It's so hard to"
	line "kiezen welke drie" ; "decide which three"

	para "je mee moet gaan" ; "should go into"
	line "vechten…" ; "battle…"
	done

BattleTowerOutsideSailorText_Mobile: ; unreferenced
	text "Ehehehe…"
	line "I sneaked out of"
	cont "work to come here."

	para "I'm never giving"
	line "up until I become"
	cont "a LEADER!"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, ik sloop" ; "Hehehe, I snuck"
	line "weg van werk." ; "out from work."

	para "Ik kan niet weg" ; "I can't bail out"
	line "tot ik win!" ; "until I've won!"

	para "Ik moet alles" ; "I have to win it"
	line "winnen! Echt!" ; "all. That I must!"
	done

BattleTowerOutsideSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "GEVECHTSTOREN" ; "BATTLE TOWER"
	done

BattleTowerOutsideSignText:
	text "GEVECHTSTOREN" ; "BATTLE TOWER"

	para "De Ultieme" ; "Take the Ultimate"
	line "TRAINER-UITDAGING!" ; "Trainer Challenge!"
	done

BattleTowerOutsideText_DoorsClosed: ; unreferenced
; originally shown when the Battle Tower was closed
	text "The BATTLE TOWER's"
	line "doors are closed…"
	done

BattleTowerOutsideText_DoorsOpen: ; unreferenced
; originally shown after the Battle Tower opened
	text "It's open!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	def_object_events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
