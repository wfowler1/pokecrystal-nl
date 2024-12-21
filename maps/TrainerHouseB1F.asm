	object_const_def
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_CHRIS

TrainerHouseB1F_MapScripts:
	def_scene_scripts
	scene_script TrainerHouseB1FNoopScene, SCENE_TRAINERHOUSEB1F_ASK_BATTLE

	def_callbacks

TrainerHouseB1FNoopScene:
	end

TrainerHouseReceptionistScript:
	turnobject PLAYER, UP
	opentext
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .FoughtTooManyTimes
	writetext TrainerHouseB1FIntroText
	promptbutton
	special TrainerHouse
	iffalse .GetCal3Name
	gettrainername STRING_BUFFER_3, CAL, CAL2
	sjump .GotName

.GetCal3Name:
	gettrainername STRING_BUFFER_3, CAL, CAL3
.GotName:
	writetext TrainerHouseB1FYourOpponentIsText
	promptbutton
	writetext TrainerHouseB1FAskWantToBattleText
	yesorno
	iffalse .Declined
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	writetext TrainerHouseB1FGoRightInText
	waitbutton
	closetext
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FCalBeforeText
	waitbutton
	closetext
	special TrainerHouse
	iffalse .NoSpecialBattle
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL2
	startbattle
	reloadmapafterbattle
	iffalse .End
.NoSpecialBattle:
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL3
	startbattle
	reloadmapafterbattle
.End:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	end

.Declined:
	writetext TrainerHouseB1FPleaseComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.FoughtTooManyTimes:
	writetext TrainerHouseB1FSecondChallengeDeniedText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

Movement_EnterTrainerHouseBattleRoom:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end

Movement_ExitTrainerHouseBattleRoom:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Movement_TrainerHouseTurnBack:
	step RIGHT
	turn_head LEFT
	step_end

TrainerHouseB1FIntroText:
	text "Hoi. Welkom in" ; "Hi. Welcome to our"
	line "onze TRAININGHAL." ; "TRAINING HALL."

	para "Hier mag je eens" ; "You may battle a"
	line "per dag met een" ; "trainer once per"
	cont "trainer vechten." ; "day."
	done

TrainerHouseB1FYourOpponentIsText:
	text_ram wStringBuffer3 ; MaxLength MaxTrainerNameLength
	text " is jouw tegen-" ; " is your"
	line "stander vandaag." ; "opponent today."
	done

TrainerHouseB1FAskWantToBattleText:
	text "Heb je zin om te" ; "Would you like to"
	line "vechten?" ; "battle?"
	done

TrainerHouseB1FGoRightInText:
	text "Ga alsjeblieft" ; "Please go right"
	line "verder." ; "through."

	para "Je mag direct" ; "You may begin"
	line "beginnen." ; "right away."
	done

TrainerHouseB1FPleaseComeAgainText:
	text "Sorry. Alleen" ; "Sorry. Only those"
	line "trainers die gaan" ; "trainers who will"

	para "vechten, mogen" ; "be battling are"
	line "naar binnen." ; "allowed to go in."
	done

TrainerHouseB1FSecondChallengeDeniedText:
	text "Het spijt me. Dit" ; "I'm sorry."
	line "zou je tweede keer" ; "This would be your"

	para "zijn vandaag. Je" ; "second time today."
	line "mag maar eens" ; "You're permitted"

	para "per dag naar" ; "to enter just once"
	line "binnen." ; "a day."
	done

TrainerHouseB1FCalBeatenText:
	text "Verloren…" ; "I lost…"
	line "Verdorie…" ; "Darn…"
	done

TrainerHouseB1FCalBeforeText:
	text "Speciaal voor een" ; "I traveled out"
	line "gevecht met jou" ; "here just so I"
	cont "ben ik nu hier." ; "could battle you."
	done

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  4, TRAINER_HOUSE_1F, 3

	def_coord_events
	coord_event  7,  3, SCENE_TRAINERHOUSEB1F_ASK_BATTLE, TrainerHouseReceptionistScript

	def_bg_events

	def_object_events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 11, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
