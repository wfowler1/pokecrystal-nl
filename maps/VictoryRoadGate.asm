	object_const_def
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_BLACK_BELT1
	const VICTORYROADGATE_BLACK_BELT2

VictoryRoadGate_MapScripts:
	def_scene_scripts
	scene_script VictoryRoadGateNoop1Scene, SCENE_VICTORYROADGATE_BADGE_CHECK
	scene_script VictoryRoadGateNoop2Scene, SCENE_VICTORYROADGATE_NOOP

	def_callbacks

VictoryRoadGateNoop1Scene:
	end

VictoryRoadGateNoop2Scene:
	end

VictoryRoadGateBadgeCheckScript:
	turnobject PLAYER, LEFT
	sjump _VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
_VictoryRoadGateBadgeCheckScript:
	opentext
	writetext VictoryRoadGateOfficerText
	promptbutton
	readvar VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_VICTORYROADGATE_NOOP
	end

VictoryRoadGateLeftBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateLeftBlackBeltText

VictoryRoadGateRightBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateRightBlackBeltText

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end

VictoryRoadGateOfficerText:
	text "Alleen als je je-" ; "Only trainers who"
	line "zelf hebt bewezen," ; "have proven them-"
	cont "mag je door." ; "selves may pass."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "Je hebt niet alle" "You don't have all"
	line "GYMBADGES van" ; "the GYM BADGES of"
	cont "JOHTO." ; "JOHTO."

	para "Het spijt me," ; "I'm sorry, but I"
	line "maar ik kan je" ; "can't let you go"
	cont "niet doorlaten." ; "through."
	done

VictoryRoadGateEightBadgesText:
	text "Oh! De acht" ; "Oh! The eight"
	line "BADGES van JOHTO!" ; "BADGES of JOHTO!"

	para "Alsjeblieft, ga" ; "Please, go right"
	line "gerust verder!" ; "on through!"
	done

VictoryRoadGateLeftBlackBeltText:
	text "Dit pad gaat naar" ; "This way leads to"
	line "de ZILVERBERG." ; "MT.SILVER."

	para "De #MON daar" ; "You'll see scary-"
	line "zijn echt schrik-" ; "strong #MON out"
	cont "barend sterk." ; "there."
	done

VictoryRoadGateRightBlackBeltText:
	text "Ben je op weg naar" ; "Off to the #MON"
	line "de #MON-LEAGUE?" ; "LEAGUE, are you?"

	para "De ELITE FOUR zijn" ; "The ELITE FOUR are"
	line "angstaanjagend" ; " so strong it's"

	para "sterk, en ze zijn" ; "scary, and they're"
	line "klaar voor je!" ; "ready for you!"
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  7, ROUTE_22, 1
	warp_event 18,  7, ROUTE_22, 1
	warp_event  9, 17, ROUTE_26, 1
	warp_event 10, 17, ROUTE_26, 1
	warp_event  9,  0, VICTORY_ROAD, 1
	warp_event 10,  0, VICTORY_ROAD, 1
	warp_event  1,  7, ROUTE_28, 2
	warp_event  2,  7, ROUTE_28, 2

	def_coord_events
	coord_event 10, 11, SCENE_VICTORYROADGATE_BADGE_CHECK, VictoryRoadGateBadgeCheckScript

	def_bg_events

	def_object_events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event  7,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateLeftBlackBeltScript, EVENT_OPENED_MT_SILVER
	object_event 12,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateRightBlackBeltScript, EVENT_FOUGHT_SNORLAX
