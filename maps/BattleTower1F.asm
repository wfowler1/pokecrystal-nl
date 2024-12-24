	object_const_def
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	def_scene_scripts
	scene_script BattleTower1FCheckStateScene, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_script BattleTower1FNoopScene,       SCENE_BATTLETOWER1F_NOOP

	def_callbacks

BattleTower1FCheckStateScene:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	sdefer Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	sdefer BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_BATTLETOWER1F_NOOP
	; fallthrough
BattleTower1FNoopScene:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	sjump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	setval BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_BATTLETOWERBATTLEROOM_ENTER
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_BATTLETOWERELEVATOR_ENTER
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_BATTLETOWERHALLWAY_ENTER
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	setval BATTLETOWERACTION_1C
	special BattleTowerAction
	setval BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	setval BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

Script_MobileError2: ; unreferenced
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

Script_ChooseChallenge2: ; unreferenced
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

Script_StartChallenge: ; unreferenced
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump .continue

.zero
	writetext Text_CantBeRegistered
.continue
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

Script_ReachedBattleLimit: ; unreferenced
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "De GEVECHTSTOREN" ; "BATTLE TOWER"
	line "verwelkomt je!" ; "welcomes you!"

	para "Ik kan je naar een" ; "I could show you"
	line "GEVECHTSKAMER" ; "to a BATTLE ROOM."
	cont "brengen."
	done

Text_WantToGoIntoABattleRoom:
	text "Wil je naar een" ; "Want to go into a"
	line "GEVECHTSKAMER?" ; "BATTLE ROOM?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Deze kant op naar" ; "Right this way to"
	line "je GEVECHTSKAMER." ; "your BATTLE ROOM."
	done

Text_BattleTowerIntroduction_1: ; unreferenced
	text "De GEVECHTSTOREN" ; "BATTLE TOWER is a"
	line "is speciaal voor" ; "facility made for"
	cont "#MON-gevechten." ; "#MON battles."

	para "Talloze #MON-" ; "Countless #MON"
	line "trainers verzamel-" ; "trainers gather"

	para "en hier om te" ; "from all over to"
	line "vechten in" ; "hold battles in"

	para "speciaal ontworpen" ; "specially designed"
	line "GEVECHTSKAMERS." ; "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "If you defeat the"
	line "seven in a ROOM,"

	para "and you have a"
	line "good record, you"

	para "could become the"
	line "ROOM's LEADER."

	para "All LEADERS will"
	line "be recorded in the"

	para "HONOR ROLL for"
	line "posterity."

	para "You may challenge"
	line "in up to five"

	para "BATTLE ROOMS each"
	line "day."

	para "However, you may"
	line "battle only once a"

	para "day in any given"
	line "ROOM."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "De GEVECHTSTOREN" ; "BATTLE TOWER is a"
	line "is speciaal voor" ; "facility made for"
	cont "#MON-gevechten." ; "#MON battles."
	
	para "Talloze #MON-" ; "Countless #MON"
	line "trainers verzamel-" ; "trainers gather"
	
	para "en hier om te" ; "from all over to"
	line "vechten in" ; "hold battles in"
	
	para "speciaal ontworpen" ; "specially designed"
	line "GEVECHTSKAMERS." ; "BATTLE ROOMS."

	para "Er zijn veel" ; "There are many"
	line "GEVECHTSKAMER in" ; "BATTLE ROOMS in"
	cont "de GEVECHTSTOREN." ; "the BATTLE TOWER."

	para "Iedere kamer heeft" ; "Each ROOM holds"
	line "zeven trainers." ; "seven trainers."

	para "Versla ze allemaal" ; "Beat them all, and"
	line "en win een prijs." ; "win a prize."

	para "Om de sessie te" ; "To interrupt a"
	line "pauzeren, moet je" ; "session, you must"

	para "OPSLAAN. Zo niet," ; "SAVE. If not, you"
	line "dan kun je niet" ; "won't be able to"

	para "verder met je" ; "resume your ROOM"
	line "KAMER-uitdaging." ; "challenge."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Ontving een lijst" ; "Received a list of"
	line "van LEIDERS op de" ; "LEADERS on the"
	cont "ERELIJST." ; "HONOR ROLL."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Bevestig a.u.b. op" ; "Please confirm on"
	line "deze monitor." ; "this monitor."
	done

Text_ThankYou: ; unreferenced
	text "Bedankt!" ; "Thank you!"

	para ""
	done

Text_ThanksForVisiting:
	text "Bedankt voor je" ; "Thanks for"
	line "bezoek!" ; "visiting!"
	done

Text_BeatenAllTheTrainers_Mobile: ; unreferenced
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "Your feat may be"
	line "worth registering,"

	para "<PLAYER>. With your"
	line "results, you may"

	para "be chosen as a"
	line "ROOM LEADER."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Gefeliciteerd!" ; "Congratulations!"

	para "Je versloeg alle" ; "You've beaten all"
	line "trainers!" ; "the trainers!"

	para "Hiervoor krijg je" ; "For that, you get"
	line "deze toffe prijs!" ; "this great prize!"

	para ""
	done

Text_AskRegisterRecord_Mobile: ; unreferenced
	text "Would you like to"
	line "register your"

	para "record with the"
	line "CENTER?"
	done

Text_PlayerGotFive:
	text "<PLAYER> kreeg 5" ; "<PLAYER> got five"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxItemNameLength
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Oeps, je TAS zit" ; "Oops, your PACK is"
	line "volgepropt." ; "stuffed full."

	para "Maak plek vrij en" ; "Please make room"
	line "kom terug." ; "and come back."
	done

Text_YourRegistrationIsComplete: ; unreferenced
	text "Je registratie is" ; "Your registration"
	line "compleet." ; "is complete."

	para "Kom snel weer!" ; "Please come again!"
	done

Text_WeHopeToServeYouAgain:
	text "We hopen je snel" ; "We hope to serve"
	line "Weer te helpen." ; "you again."
	done

Text_PleaseStepThisWay:
	text "Kom deze kant maar" ; "Please step this"
	line "op." ; "way."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Wil je horen wat" ; "Would you like to"
	line "gebeurt in de" ; "hear about the"
	cont "GEVECHTSOREN?" ; "BATTLE TOWER?"
	done

Text_CantBeRegistered:
	text "Bestand voorgaande" ; "Your record from"
	line "GEVECHTSKAMER kan" ; "the previous"

	para "niet worden" ; "BATTLE ROOM can't"
	line "geregistreerd. OK?" ; "niet worden bewaard." ; "be registered. OK?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Bestand voorgaande" ; "Your record from"
	line "GEVECHTSKAMER kan" ; "the previous"
	
	para "niet worden" ; "BATTLE ROOM can't"
	line "geregistreerd." ; "niet worden bewaard." ; "be registered.?"

	para "Het vorige bestand" ; "Also, the existing"
	line "wordt ook gewist." ; "record will be"
	cont "Is dat OK?" ; "deleted. OK?"
	done

Text_CheckTheLeaderHonorRoll: ; unreferenced
	text "Bekijk ERELIJST" ; "Check the LEADER"
	line "met LEIDERS?" ; "HONOR ROLL?"
	done

Text_ReadBattleTowerRules:
	text "De regels voor de" ; "BATTLE TOWER rules"
	line "GEVECHTSTOREN." ; "are written here."

	para "Wil je ze lezen?" ; "Read the rules?"
	done

Text_BattleTowerRules:
	text "Drie #MON mogen" ; "Three #MON may"
	line "deelnemen." ; "enter battles."

	para "Alle drie moeten" ; "All three must be"
	line "anders zijn." ; "different."

	para "Ook moeten ze" ; "The items they"
	line "andere voorwerpen" ; "hold must also be"
	cont "vasthouden." ; "different."

	para "Sommige #MON" ; "Certain #MON"
	line "kunnen ook een" ; "may also have"

	para "restrictie op hun" ; "level restrictions"
	line "level hebben." ; "placed on them."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Pardon!" ; "Excuse me!"
	line "Je hebt niet OPGE-" ; "You didn't SAVE"

	para "SLAGEN voor je de" ; "before exiting"
	line "GEVECHTSKAMER" ; "the BATTLE ROOM."
	cont "verlies."

	para "Het spijt me zeer," ; "I'm awfully sorry,"
	line "maar je uitdaging" ; "but your challenge"

	para "wordt ongeldig" ; "will be declared"
	line "verklaard." ; "invalid."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Je #MON worden" ; "Your #MON will"
	line "volledig voor je" ; "be healed to full"
	cont "genezen." ; "health."
	done

Text_NextUpOpponentNo:
	text "En nu tegenstander" ; "Next up, opponent"
	line "nr.@" ; "no.@"
	text_ram wStringBuffer3 ; MaxLength 1
	text ". Klaar?" ; ". Ready?"
	done

Text_SaveBeforeConnecting_Mobile: ; unreferenced
	text "Your session will"
	line "be SAVED before"

	para "connecting with"
	line "the CENTER."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Voor je naar de" ; "Before entering"
	line "GEVECHTSKAMER gaat" ; "the BATTLE ROOM,"

	para "wordt je voortgang" ; "your progress will"
	line "opgeslagen." ; "be saved."
	done

Text_SaveAndEndTheSession:
	text "OPSLAAN en de" ; "SAVE and end the"
	line "sessie beëindigen?" ; "session?"
	done

Text_SaveBeforeReentry:
	text "Je bestand wordt" ; "Your record will"
	line "OPGESLAGEN voor je" ; "be SAVED before"

	para "terug naar de" ; "you go back into"
	line "vorige kamer gaat." ; "the previous ROOM."
	done

Text_CancelYourBattleRoomChallenge:
	text "Annuleer uitdaging" ; "Cancel your BATTLE"
	line "in GEVECHTSKAMER?" ; "ROOM challenge?"
	done

Text_RegisterRecordOnFile_Mobile: ; unreferenced
	text "We hebben je" ; "We have your"
	line "vorige bestand nog" ; "previous record on"

	para "staan. Wil je die" ; "file. Would you"
	line "registreren in het" ; "like to register"
	cont "CENTRUM?" ; "it at the CENTER?"
	done

Text_WeveBeenWaitingForYou:
	text "We stonden op je" ; "We've been waiting"
	line "te wachten. Deze" ; "for you. This way"

	para "kant op voor een" ; "to a BATTLE ROOM,"
	line "GEVECHTSKAMER." ; "please."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Je mag iedere dag" ; "You may enter only"
	line "vijf GEVECHTS-" ; "five BATTLE ROOMS"
	cont "KAMERS bezoeken." ; "each day."

	para "Kom alsjeblieft" ; "Please come back"
	line "morgen weer terug." ; "tomorrow."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Sorry, het is niet" ; "Sorry, but it's"
	line "mogelijk je" ; "not possible to"

	para "huidige bestand te" ; "register your"
	line "registreren bij" ; "current record at"

	para "het CENTRUM omdat" ; "the CENTER because"
	line "teveel tijd is" ; "too much time has"

	para "verlopen sinds je" ; "elapsed since the"
	line "de uitdaging bent" ; "start of your"
	cont "begonnen." ; "challenge."
	done

Text_RegisterRecordTimedOut_Mobile: ; unreferenced
; duplicate of Text_TooMuchTimeElapsedNoRegister
	text "Sorry, but it's"
	line "not possible to"

	para "register your most"
	line "recent record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done

Text_AMonLevelExceeds:
	text "Eén of meer van je" ; "One or more of"
	line "#MON is een" ; "your #MON's"
	cont "hoger dan L@" ; "levels exceeds @"
	text_decimal wScriptVar, 1, 2
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49 ; MaxLength MaxPokemonNameLength
	text " mag" ; " may not"
	line "niet GEVECHTSKAMER" ; "enter a BATTLE"
	cont "onder L70 in." ; "ROOM under L70."

	para "Deze GEVECHTSKAMER" ; "This BATTLE ROOM"
	line "is voor L@" ; "is for L@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Verwoest door de" ; "Destroyed by the"
	line "eerste vijand in" ; "first opponent in"

	para "een mum van tijd…" ; "no time at all…"
	line "Ik ben een loser…" ; "I'm no good…"
	done

Text_BattleTowerCooltrainerF:
	text "Er zijn veel" ; "There are lots of"
	line "GEVECHTSKAMERS," ; "BATTLE ROOMS, but"

	para "maar ik ga ze" ; "I'm going to win"
	line "allemaal winnen!" ; "them all!"
	done

Text_BattleTowerGranny:
	text "Het is afzien, dat" ; "It's a grueling"
	line "je geen voorwerpen" ; "task, not being"

	para "in gevechten mag" ; "able to use items"
	line "gebruiken." ; "in battle."

	para "De truc is om je" ; "Making your"
	line "#MON iets vast" ; "#MON hold items"

	para "te laten houden in" ; "is the key to"
	line "gevechten." ; "winning battles."
	done

Text_BattleTowerBugCatcher:
	text "Ik wil zien hoe" ; "I'm trying to see"
	line "ver ik kan komen" ; "how far I can go"

	para "met alleen maar" ; "using just bug"
	line "insect-#MON." ; "#MON."

	para "Hopelijk zijn er" ; "Don't let there be"
	line "geen vuur-#MON…" ; "any fire #MON…"
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	def_object_events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
