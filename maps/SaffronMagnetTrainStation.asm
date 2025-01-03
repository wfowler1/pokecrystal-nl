	object_const_def
	const SAFFRONMAGNETTRAINSTATION_OFFICER
	const SAFFRONMAGNETTRAINSTATION_GYM_GUIDE
	const SAFFRONMAGNETTRAINSTATION_TEACHER
	const SAFFRONMAGNETTRAINSTATION_LASS

SaffronMagnetTrainStation_MapScripts:
	def_scene_scripts
	scene_script SaffronMagnetTrainStationNoopScene, SCENE_SAFFRONMAGNETTRAINSTATION_ARRIVE_FROM_GOLDENROD

	def_callbacks

SaffronMagnetTrainStationNoopScene:
	end

SaffronMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToGoldenrod
	writetext SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval TRUE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	waitbutton
	closetext
	end

SaffronMagnetTrainStationGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronMagnetTrainStationGymGuideText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronMagnetTrainStationTeacherScript:
	jumptextfaceplayer SaffronMagnetTrainStationTeacherText

SaffronMagnetTrainStationLassScript:
	jumptextfaceplayer SaffronMagnetTrainStationLassText

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "Sorry, de" ; "I'm sorry, but the"
	line "ZWEEFTREIN is" ; "MAGNET TRAIN isn't"
	cont "buiten gebruik." ; "operating now."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "We vertrekken zo" ; "We'll soon depart"
	line "naar GOLDENROD." ; "for GOLDENROD."

	para "Kom je aan boord?" ; "Are you coming on"
	;line "boord?" ; "board?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "Mag ik je" ; "May I see your"
	line "TREINKAARTJE zien?" ; "rail PASS, please?"

	para "Oké. Deze kant" ; "OK. Right this"
	line "op, alsjeblieft." ; "way, please."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Je hebt geen" ; "Sorry, but you"
	line "TREINKAARTJE." ; "don't have a PASS."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "Tot ziens!" ; "We hope to see you"
	;line "" ; "again."
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "We zijn in SAFFRON" ; "We have arrived in"
	line "aangekomen." ; "SAFFRON."

	para "Tot ziens!" ; "We hope to see you"
	;line "" ; "again."
	done

SaffronMagnetTrainStationGymGuideText:
	text "De ZWEEFTREIN" ; "The MAGNET TRAIN"
	line "is een super-" ; "is a super-modern"

	para "moderne spoorlijn" ; "rail liner that"
	line "die elektriciteit" ; "uses electricity"

	para "en magneten benut" ; "and magnets to"
	line "om geweldige snel-" ; "attain incredible"
	cont "heid te bereiken." ; "speed."

	para "Maar als er geen" ; "However, if there"
	line "elektriciteit is…" ; "isn't any elec-"
	;cont "tricity…"
	done

SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart:
	text "Poeh…" ; "Whew…"

	para "Hoe vaak ben" ; "How many times"
	line "ik heen en weer" ; "have I gone back"

	para "gegaan tussen" ; "and forth between"
	line "KANTO en JOHTO?" ; "KANTO and JOHTO?"
	done

SaffronMagnetTrainStationTeacherText:
	text "Voordat het ZWEEF-" ; "Before the MAGNET"
	line "TREINSTATION er" ; "TRAIN STATION was"

	para "was, was er een" ; "built, there was a"
	line "huis daar." ; "house there."

	para "Een klein meisje" ; "A little girl"
	line "genaamd de NA-APER" ; "named COPYCAT used"
	cont "woonde daar." ; "to live there."
	done

SaffronMagnetTrainStationLassText:
	text "Hoi. Heb je een" ; "Hi. Do you have a"
	line "TREINKAARTJE? Ik" ; "rail PASS? I have"

	para "heb er een. Alle" ; "one. All the peo-"
	line "mensen in SAFFRON" ; "ple in SAFFRON who"

	para "die de ZWEEFTREIN" ; "ride the MAGNET"
	line "nemen, hebben" ; "TRAIN have PASSES."
	cont "TREINKAARTJES." ;
	done

SaffronMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_SAFFRONMAGNETTRAINSTATION_ARRIVE_FROM_GOLDENROD, Script_ArriveFromGoldenrod

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 10, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuideScript, -1
	object_event  6, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
