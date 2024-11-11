	object_const_def
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RouteBattleTowerGateShowSailorCallback

RouteBattleTowerGateShowSailorCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

Route40BattleTowerGateUnusedText1: ; unreferenced
	text "Kwam je ook om de" ; "Did you come to"
	line "STRIJDTOREN te" ; "see the BATTLE"
	cont "bekijken?" ; "TOWER too?"

	para "Ik geloof dat ze" ; "But I guess you"
	line "nog dicht zijn." ; "can't go in yet."
	done

Route40BattleTowerGateUnusedText2: ; unreferenced
	text "De STRIJDTOREN is" ; "BATTLE TOWER has"
	line "nu geopend." ; "opened."

	para "Ik wil erheen," ; "I want to go, but"
	line "maar ik weet nog" ; "I haven't thought"

	para "geen one-liner" ; "up a cool line for"
	line "voor als ik win." ; "when I win."
	done

Route40BattleTowerGateRockerText:
	text "Ga jij naar de" ; "Are you going to"
	line "STRIJDTOREN?" ; "the BATTLE TOWER?"

	para "Het is geheim," ; "This is a secret,"
	line "maar als je vaak" ; "but if you win a"

	para "wint, kun je" ; "whole lot, you can"
	line "ook speciale" ; "win special gifts."
	cont "cadeaus winnen."
	done

Route40BattleTowerGateUnusedText3: ; unreferenced
	text "Ik ga mijn #MON" "I'm going to train"
	line "trainen zodat ik" "my #MON so I'll"

	para "klaar ben voor" "be all ready for"
	line "de STRIJDTOREN." "the BATTLE TOWER."
	done

Route40BattleTowerGateTwinText:
	text "De niveaus van de" "The levels of the"
	line "#MON die ik wil" "#MON I want to"

	para "gebruiken zijn" "use are all"
	line "allemaal anders." "different."

	para "Ik moet echt gaan" "I have to go train"
	line "trainen!" "them now!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
