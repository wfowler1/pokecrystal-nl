	object_const_def
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUIDE1
	const POWERPLANT_GYM_GUIDE2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUIDE3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST

PowerPlant_MapScripts:
	def_scene_scripts
	scene_script PowerPlantNoop1Scene, SCENE_POWERPLANT_NOOP
	scene_script PowerPlantNoop2Scene, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks

PowerPlantNoop1Scene:
	end

PowerPlantNoop2Scene:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuide2Movement
	turnobject POWERPLANT_GYM_GUIDE1, DOWN
	turnobject POWERPLANT_GYM_GUIDE2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOOP
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuide1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuide2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuide4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlantManagerTakeThisTMText
	promptbutton
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd DifficultBookshelfScript

PowerPlantOfficer1ApproachGymGuide2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "Een dief heeft bij" ; "A thief broke into"
	line "de ENERGIECENTRALE" ; "the POWER PLANT…"

	para "ingebroken… Waarom" ; "What is the world"
	line "zou je dat doen?" ; "coming to?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Ik heb net gehoord" ; "I just got word"
	line "van CERULEAN." ; "from CERULEAN."

	para "Het lijkt er op" ; "It appears that a"
	line "dat er hier een" ; "shady character"

	para "schimmig figuur" ; "has been loitering"
	line "rondhing." ; "around."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Mag ik je vragen" ; "Could I ask for"
	line "om je medewerking?" ; "your cooperation?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "We moeten onze" ; "We'll have to beef"
	line "veiligheidsmaat-" ; "up our security"
	cont "regelen opkrikken." ; "presence."
	done

PowerPlantGymGuide1SomeoneStoleAPartText:
	text "Iemand ging er met" ; "Someone made off"
	line "een essentieel" ; with a part that's"

	para "onderdeel van de" ; "essential for the"
	line "generator vandoor." ; "generator."

	para "Zonder dit deel" ; "Without it, the"
	line "is de nieuwe gene-" ; "new generator's"
	cont "rator nutteloos!" ; "useless!"
	done

PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "De generator werkt" ; "The generator's up"
	line "weer en produceert" ; "and running. It's"

	para "elektriciteit in" ; "making electricity"
	line "overvloed." ; "to spare."
	done

PowerPlantGymGuide2PowerPlantUpAndRunningText:
	text "Vroeger is deze" ; "This POWER PLANT"
	line "ENERGIECENTRALE" ; "had been abandoned"
	cont "stopgezet." ; "in the past."

	para "Om de ZWEEFTREIN" ; "We got it back up"
	line "van energie te" ; "and running to"

	para "voorzien, is ie" ; "provide power to"
	line "weer opgestart." ; "the MAGNET TRAIN."
	done

PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "De generator" ; "The generator's"
	line "doet het weer!" ; "running again!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "De MANAGER van de" ; "The POWER PLANT's"
	line "ENERGIECENTRALE is" ; "MANAGER is up"
	cont "verderop." ; "ahead."

	para "Hij is boos en" ; "But since someone"
	line "verdrietig omdat" ; "wrecked the gener-"
	cont "iemand de" ; "ator, he's been"
	cont "generator heeft" ; "both sad and"
	cont "vernield…" ; "furious…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Sinds de generator" ; "Since the gener-"
	line "weer werkt, is de" ; "ator's been fixed,"

	para "MANAGER ook weer" ; "the MANAGER has"
	line "in een blije bui." ; "been cheerful."
	done

PowerPlantGymGuide4MagnetTrainConsumesElectricityText:
	text "De ZWEEFTREIN" ; "The MAGNET TRAIN"
	line "heeft veel elek-" ; "consumes a lot of"
	cont "triciteit nodig." ; "electricity."

	para "Zonder de nieuwe" ; "It can't move if"
	line "generator beweegt" ; "the new generator"
	cont "ie niet." ; "isn't operating."
	done

PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "Oké dan! We" ; "All right! We can"
	line "kunnen de ZWEEF-" ; "finally get the"

	para "TREIN weer aan" ; "MAGNET TRAIN"
	line "de praat krijgen." ; "running again."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "MANAGER: Ik, ik," ; "MANAGER: I, I, I'm"
	line "ik kan wel iemand" ; "ready to blast"
	cont "opblazen!" ; "someone!"

	para "Wie ruïneerde mijn" ; "Who would dare"
	line "generator?" ; "ruin my generator?"

	para "Ik ben er zo lang" ; "I spent so much"
	line "mee bezig geweest!" ; "time on it!"

	para "Als ik hem in z'n" ; "If I catch him,"
	line "kraag vat, krijgt" ; "he's going to get"

	para "ie m'n ZAPKANON" ; "a taste of my ZAP"
	line "voor zijn kiezen!" ; "CANNON!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "MANAGER: Ik ver-" ; "MANAGER: I won't"
	line "geef hem nooit!" ;  "forgive him!"

	para "De dader krijgt" ; "The culprit can"
	line "er van langs, ook" ; "cry and apologize,"

	para "al verontschuldigt" ; "but I'll still"
	line "hij zich nog zo." ; "hammer him!"

	para "Gahahahah!" ; "Gahahahah!"
	done

PowerPlantManagerThatsThePartText:
	text "MANAGER: Ah! Ja!" ; "MANAGER: Ah! Yeah!"

	para "Dat DEEL miste" ; "That's the missing"
	line "van mijn geliefde" ; "PART from my be-"
	cont "generator. Je hebt" ; "loved generator!"
	cont "het gevonden?" ; "You found it?"
	done

PowerPlantManagerTakeThisTMText:
	text "Wahah! Dank je!" ; "Wahah! Thanks!"

	para "Hier! Een TM" ; "Here! Take this TM"
	line "als beloning!" ; "as a reward!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "MANAGER: TM07 is" ; "MANAGER: TM07 is"
	line "mijn ZAPKANON." ; "my ZAP CANNON."

	para "Een hele sterke" ; "It's a powerful"
	line "techniek!" ; "technique!"

	para "Niet erg accuraat," ; "It's not what any-"
	line "maar hij komt" ; "one would consider"

	para "zeker hard aan" ; "accurate, but it"
	line "als ie raakt!" ; "packs a wallop!"
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "MANAGER: Mijn ge-" ; "MANAGER: My be-"
	line "liefde generator!" ; "loved generator!"

	para "Blijf de elektri-" ; "Keep pumping the"
	line "citeit opwekken!" ; "electricity out!"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	def_object_events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
