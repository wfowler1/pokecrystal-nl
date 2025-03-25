; block ids
DEF UNDERGROUND_DOOR_CLOSED1 EQU $2a
DEF UNDERGROUND_DOOR_CLOSED2 EQU $3e
DEF UNDERGROUND_DOOR_CLOSED3 EQU $3f
DEF UNDERGROUND_DOOR_OPEN1   EQU $2d
DEF UNDERGROUND_DOOR_OPEN2   EQU $3d

MACRO ugdoor
	DEF UGDOOR_\1_XCOORD EQU \2
	DEF UGDOOR_\1_YCOORD EQU \3
ENDM

	;      id,  x,  y
	ugdoor  1,  6, 16
	ugdoor  2,  6, 10
	ugdoor  3,  6,  2
	ugdoor  4, 10,  2
	ugdoor  5, 10, 10
	ugdoor  6, 10, 16
	ugdoor  7,  6, 12
	ugdoor  8,  8, 12
	ugdoor  9,  6,  6
	ugdoor 10,  8,  6
	ugdoor 11, 10, 12
	ugdoor 12, 12, 12
	ugdoor 13, 10,  6
	ugdoor 14, 12,  6
	ugdoor 15, 10, 18
	ugdoor 16, 12, 18

MACRO doorstate
	changeblock UGDOOR_\1_YCOORD, UGDOOR_\1_XCOORD, UNDERGROUND_DOOR_\2
ENDM

	object_const_def
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_PHARMACIST1
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_PHARMACIST2
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_ROCKET1
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_ROCKET2
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_ROCKET3
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_ROCKET_GIRL
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_TEACHER
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SUPER_NERD
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_POKE_BALL1
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_POKE_BALL2
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL

GoldenrodUndergroundSwitchRoomEntrances_MapScripts:
	def_scene_scripts
	scene_script GoldenrodUndergroundSwitchRoomEntrancesNoop1Scene, SCENE_GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL_BATTLE
	scene_script GoldenrodUndergroundSwitchRoomEntrancesNoop2Scene, SCENE_GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenrodUndergroundSwitchRoomEntrancesUpdateDoorPositionsCallback

GoldenrodUndergroundSwitchRoomEntrancesNoop1Scene:
	end

GoldenrodUndergroundSwitchRoomEntrancesNoop2Scene:
	end

GoldenrodUndergroundSwitchRoomEntrancesUpdateDoorPositionsCallback:
	checkevent EVENT_SWITCH_4
	iffalse .false4
	doorstate 1, OPEN1
.false4
	checkevent EVENT_SWITCH_5
	iffalse .false5
	doorstate 2, OPEN1
.false5
	checkevent EVENT_SWITCH_6
	iffalse .false6
	doorstate 3, OPEN1
.false6
	checkevent EVENT_SWITCH_7
	iffalse .false7
	doorstate 4, OPEN1
.false7
	checkevent EVENT_SWITCH_8
	iffalse .false8
	doorstate 5, OPEN1
.false8
	checkevent EVENT_SWITCH_9
	iffalse .false9
	doorstate 6, OPEN1
.false9
	checkevent EVENT_SWITCH_10
	iffalse .false10
	doorstate 7, CLOSED1
	doorstate 8, OPEN1
.false10
	checkevent EVENT_SWITCH_11
	iffalse .false11
	doorstate 9, CLOSED1
	doorstate 10, OPEN1
.false11
	checkevent EVENT_SWITCH_12
	iffalse .false12
	doorstate 11, CLOSED1
	doorstate 12, OPEN1
.false12
	checkevent EVENT_SWITCH_13
	iffalse .false13
	doorstate 13, CLOSED1
	doorstate 14, OPEN1
.false13
	checkevent EVENT_SWITCH_14
	iffalse .false14
	doorstate 15, CLOSED1
	doorstate 16, OPEN1
.false14
	endcallback

GoldenrodUndergroundSwitchRoomEntrancesSuperNerdScript:
	jumptextfaceplayer GoldenrodUndergroundSwitchRoomEntrances_SuperNerdText

GoldenrodUndergroundSwitchRoomEntrancesTeacherScript:
	jumptextfaceplayer GoldenrodUndergroundSwitchRoomEntrances_TeacherText

UndergroundRivalScene1:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL
	waitsfx
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL, UndergroundRivalApproachMovement1
	turnobject PLAYER, RIGHT
	scall UndergroundRivalBattleScript
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL, UndergroundRivalRetreatMovement1
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL
	setscene SCENE_GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_NOOP
	waitsfx
	playmapmusic
	end

UndergroundRivalScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL
	waitsfx
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL, UndergroundRivalApproachMovement2
	turnobject PLAYER, RIGHT
	scall UndergroundRivalBattleScript
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL, UndergroundRivalRetreatMovement2
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL
	setscene SCENE_GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_NOOP
	waitsfx
	playmapmusic
	end

UndergroundRivalBattleScript:
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .Continue
	setevent EVENT_RIVAL_BURNED_TOWER
	setmapscene BURNED_TOWER_1F, SCENE_BURNEDTOWER1F_RIVAL_BATTLE
.Continue:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_GOLDENROD_UNDERGROUND
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Totodile:
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Chikorita:
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.FinishRivalBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundRivalAfterText
	waitbutton
	closetext
	end

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM11AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM25:
	trainer GRUNTM, GRUNTM_25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM25AfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarDuncan:
	trainer BURGLAR, DUNCAN, EVENT_BEAT_BURGLAR_DUNCAN, BurglarDuncanSeenText, BurglarDuncanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarDuncanAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarEddie:
	trainer BURGLAR, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEddieAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM13AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF3AfterBattleText
	waitbutton
	closetext
	end

Switch1Script:
	opentext
	writetext SwitchRoomText_Switch1
	promptbutton
	checkevent EVENT_SWITCH_1
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval 1
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_1
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval -1
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_1
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

Switch2Script:
	opentext
	writetext SwitchRoomText_Switch2
	promptbutton
	checkevent EVENT_SWITCH_2
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval 2
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_2
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval -2
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_2
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

Switch3Script:
	opentext
	writetext SwitchRoomText_Switch3
	promptbutton
	checkevent EVENT_SWITCH_3
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval 3
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval -3
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

EmergencySwitchScript:
	opentext
	writetext SwitchRoomText_Emergency
	promptbutton
	checkevent EVENT_EMERGENCY_SWITCH
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	setval 7
	writemem wUndergroundSwitchPositions
	setevent EVENT_EMERGENCY_SWITCH
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	setval 0
	writemem wUndergroundSwitchPositions
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

GoldenrodUndergroundSwitchRoomEntrances_DontToggle:
	closetext
	end

GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors:
	readmem wUndergroundSwitchPositions
	ifequal 0, .Position0
	ifequal 1, .Position1
	ifequal 2, .Position2
	ifequal 3, .Position3
	ifequal 4, .Position4
	ifequal 5, .Position5
	ifequal 6, .Position6
	ifequal 7, .EmergencyPosition
.Position0:
	playsound SFX_ENTER_DOOR
	scall .Clear4
	scall .Clear5
	scall .Clear6
	scall .Clear7
	scall .Clear8
	scall .Clear9
	scall .Clear10
	scall .Clear11
	scall .Clear12
	scall .Clear13
	scall .Clear14
	refreshmap
	closetext
	end

.Position1:
	playsound SFX_ENTER_DOOR
	scall .Set4
	scall .Set10
	scall .Set13
	scall .Clear9
	scall .Clear11
	scall .Clear12
	scall .Clear14
	refreshmap
	closetext
	end

.Position2:
	playsound SFX_ENTER_DOOR
	scall .Set5
	scall .Set11
	scall .Set12
	scall .Clear8
	scall .Clear10
	scall .Clear13
	scall .Clear14
	refreshmap
	closetext
	end

.Position3:
	playsound SFX_ENTER_DOOR
	scall .Set6
	scall .Set10
	scall .Set13
	scall .Clear7
	scall .Clear11
	scall .Clear12
	scall .Clear14
	refreshmap
	closetext
	end

.Position4:
	playsound SFX_ENTER_DOOR
	scall .Set7
	scall .Set11
	scall .Set12
	scall .Clear6
	scall .Clear10
	scall .Clear13
	scall .Clear14
	refreshmap
	closetext
	end

.Position5:
	playsound SFX_ENTER_DOOR
	scall .Set8
	scall .Set10
	scall .Set13
	scall .Clear5
	scall .Clear11
	scall .Clear12
	scall .Clear14
	refreshmap
	closetext
	end

.Position6:
	playsound SFX_ENTER_DOOR
	scall .Set9
	scall .Set11
	scall .Set12
	scall .Set14
	scall .Clear4
	scall .Clear10
	scall .Clear13
	refreshmap
	closetext
	end

.EmergencyPosition:
	playsound SFX_ENTER_DOOR
	scall .Clear4
	scall .Clear5
	scall .Set6
	scall .Clear7
	scall .Set8
	scall .Set9
	scall .Clear10
	scall .Set11
	scall .Set12
	scall .Clear13
	scall .Set14
	refreshmap
	closetext
	setval 6
	writemem wUndergroundSwitchPositions
	end

.Set4:
	doorstate 1, OPEN1
	setevent EVENT_SWITCH_4
	end

.Set5:
	doorstate 2, OPEN1
	setevent EVENT_SWITCH_5
	end

.Set6:
	doorstate 3, OPEN1
	setevent EVENT_SWITCH_6
	end

.Set7:
	doorstate 4, OPEN1
	setevent EVENT_SWITCH_7
	end

.Set8:
	doorstate 5, OPEN1
	setevent EVENT_SWITCH_8
	end

.Set9:
	doorstate 6, OPEN1
	setevent EVENT_SWITCH_9
	end

.Set10:
	doorstate 7, CLOSED1
	doorstate 8, OPEN1
	setevent EVENT_SWITCH_10
	end

.Set11:
	doorstate 9, CLOSED1
	doorstate 10, OPEN1
	setevent EVENT_SWITCH_11
	end

.Set12:
	doorstate 11, CLOSED1
	doorstate 12, OPEN1
	setevent EVENT_SWITCH_12
	end

.Set13:
	doorstate 13, CLOSED1
	doorstate 14, OPEN1
	setevent EVENT_SWITCH_13
	end

.Set14:
	doorstate 15, CLOSED1
	doorstate 16, OPEN1
	setevent EVENT_SWITCH_14
	end

.Clear4:
	doorstate 1, CLOSED2
	clearevent EVENT_SWITCH_4
	end

.Clear5:
	doorstate 2, CLOSED2
	clearevent EVENT_SWITCH_5
	end

.Clear6:
	doorstate 3, CLOSED2
	clearevent EVENT_SWITCH_6
	end

.Clear7:
	doorstate 4, CLOSED2
	clearevent EVENT_SWITCH_7
	end

.Clear8:
	doorstate 5, CLOSED2
	clearevent EVENT_SWITCH_8
	end

.Clear9:
	doorstate 6, CLOSED2
	clearevent EVENT_SWITCH_9
	end

.Clear10:
	doorstate 7, CLOSED3
	doorstate 8, OPEN2
	clearevent EVENT_SWITCH_10
	end

.Clear11:
	doorstate 9, CLOSED3
	doorstate 10, OPEN2
	clearevent EVENT_SWITCH_11
	end

.Clear12:
	doorstate 11, CLOSED3
	doorstate 12, OPEN2
	clearevent EVENT_SWITCH_12
	end

.Clear13:
	doorstate 13, CLOSED3
	doorstate 14, OPEN2
	clearevent EVENT_SWITCH_13
	end

.Clear14:
	doorstate 15, CLOSED3
	doorstate 16, OPEN2
	clearevent EVENT_SWITCH_14
	end

GoldenrodUndergroundSwitchRoomEntrancesSmokeBall:
	itemball SMOKE_BALL

GoldenrodUndergroundSwitchRoomEntrancesFullHeal:
	itemball FULL_HEAL

GoldenrodUndergroundSwitchRoomEntrancesHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_HIDDEN_MAX_POTION

GoldenrodUndergroundSwitchRoomEntrancesHiddenRevive:
	hiddenitem REVIVE, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_HIDDEN_REVIVE

UndergroundRivalApproachMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundRivalApproachMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundRivalRetreatMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

UndergroundRivalRetreatMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

UndergroundRivalBeforeText:
	text "Stop!" ; "Hold it!"

	para "Ik zag je, dus ben" ; "I saw you, so I"
	line "je gevolgd." ; "tailed you."

	para "Loop me niet in de" ; "I don't need you"
	line "weg terwijl ik" ; "underfoot while I"

	para "ik TEAM ROCKET" ; "take care of TEAM"
	line "uitschakel." ; "ROCKET."

	para "…Wacht eens." ; "…Wait a second."
	line "Je hebt me eerder" ; "You beat me be-"
	cont "verslagen, toch?" ; "fore, didn't you?"

	para "Dat was slechts" ; "That was just a"
	line "geluk." ; "fluke."

	para "Maar nu is je" ; "But I repay my"
	line "geluk op!" ; "debts!"
	done

UndergroundRivalWinText:
	text "…Waarom…" ; "…Why…"
	line "Waarom verlies ik?" ; "Why do I lose?"

	para "Ik heb de sterkste" ; "I've assembled the"
	line "#MON verzameld." ; "toughest #MON."

	para "Ik heb hard" ; "I didn't ease up"
	line "gewerkt. Dus" ; "on the gas."

	para "waarom verlies ik?" ; "So why do I lose?"
	done

UndergroundRivalAfterText:
	text "…Ik snap het" ; "…I don't under-"
	line "niet…" ; "stand…"

	para "Is 't waar wat die" ; "Is what that LANCE"
	line "LANCE-gast zei?" ; "guy said true?"

	para "Dat ik #MON" ; "That I don't treat"
	line "slecht behandel?" ; "#MON properly?"

	para "Liefde…" ; "Love…"

	para "Vertrouwen…" ; "Trust…"

	para "Is dat echt" ; "Are they really"
	line "wat ik mis?" ; "what I lack?"

	para "Verhindert dat" ; "Are they keeping"
	line "me te winnen?" ; "me from winning?"

	para "Ik… Ik snap het" ; "I… I just don't"
	line "gewoon niet." ; "understand."

	para "Maar hier eindigt" ; "But it's not going"
	line "het niet." ; "to end here."

	para "Niet nu. Niet" ; "Not now. Not"
	line "hierom." ; "because of this."

	para "Ik geef mijn" ; "I won't give up my"
	line "droom niet op om" ; "dream of becoming"

	para "'s werelds beste" ; "the world's best"
	line "#MON trainer te" ; "#MON trainer!"
	cont "worden!"
	done

UndergroundRivalLossText:
	text "Dit is mijn ware" ; "Humph. This is my"
	line "kracht, watje." ; "real power, wimp."

	para "Ik maak van TEAM" ; "I'll make TEAM"
	line "ROCKET verleden" ; "ROCKET history."
	cont "tijd."

	para "En ik ga die" ; "And I'm going to"
	line "LANCE onder m'n" ; "grind that LANCE"
	cont "voet vermorzelen." ; "under my heels."
	done

GoldenrodUndergroundSwitchRoomEntrances_SuperNerdText:
	text "Ik was uitgedaagd" ; "I was challenged"
	line "om beneden te" ; "to a battle down-"
	cont "vechten." ; "stairs."

	para "Het is daar best" ; "It's rough down"
	line "pittig. Wees" ; "there. You'd"
	cont "voorzichtig." ; "better be careful."
	done

GoldenrodUndergroundSwitchRoomEntrances_TeacherText:
	text "Er zijn wat wink-" ; "There are some"
	line "els beneden…" ; "shops downstairs…"

	para "Maar er zijn" ; "But there are"
	line "ook trainers." ; "also trainers."

	para "Ik ben bang om" ; "I'm scared to go"
	line "daarheen te gaan." ; "down there."
	done

GruntM11SeenText:
	text "Open één luik en" ; "Open one shutter,"
	line "een ander sluit." ; "another closes."

	para "Ik wed dat je" ; "Bet you can't get"
	line "niet verder komt!" ; "where you want!"
	done

GruntM11BeatenText:
	text "Verdorie! Ik viel" ; "Drat! I was sunk"
	line "prooi aan beslui-" ; "by indecision!"
	cont "teloosheid!" ;
	done

GruntM11AfterBattleText:
	text "Ik ben verward…" ; "I'm confused too…"
	line "De schakelaar" ; "The switch on the"

	para "aan het eind moet" ; "end is the one to"
	line "je als eerst" ; "press first, but…"
	cont "drukken, maar…" ;
	done

GruntM25SeenText:
	text "Kwahaha!" ; "Kwahaha!"

	para "Verward door de" ; "Confounded by the"
	line "luiken, zeker?" ; "shutters, are we?"

	para "Als je me kan ver-" ; "I'll let you in on"
	line "slaan, vertel ik" ; "a secret if you"
	cont "een geheimpje!" ; "can beat me!"
	done

GruntM25BeatenText:
	text "Oeff… Ik heb" ; "Uwww…"
	line "het verpest." ; "I blew it."
	done

GruntM25AfterBattleText:
	text "Oké. Een hint!" ; "All right. A hint!"

	para "Verander de volg-" ; "Change the order"
	line "orde van schakel-" ; "of switching."
	cont "en." ;

	para "Dat verandert de" ; "That'll change the"
	line "manier waarop de" ; "ways the shutters"
	cont "luiken openen." ; "open and close."
	done

BurglarDuncanSeenText:
	text "Geef me je" ; "Fork over your"
	line "spullen!" ; "goodies!"
	done

BurglarDuncanBeatenText:
	text "Genade!" ; "Mercy!"
	done

BurglarDuncanAfterBattleText:
	text "Stelen en ver-" ; "Steal and sell!"
	line "kopen! Dat is de" ; "That's basic in"
	cont "basis in misdaad," ; "crime, kid!"
	cont "ettertje!" ;
	done

BurglarEddieSeenText:
	text "Ze hebben dit pro-" ; "They ditched this"
	line "ject gedumpt voor-" ; "project before"
	cont "dat het klaar was." ; "they finished."

	para "Ik zoek naar over-" ; "I'm searching for"
	line "gebleven spullen." ; "leftover loot."
	done

BurglarEddieBeatenText:
	text "Over de top!" ; "Over the top!"
	done

BurglarEddieAfterBattleText:
	text "OPSLAGKELDER?" ; "UNDERGROUND WARE-"
	line "" ; "HOUSE?"

	para "Waarom wil je" ; "What do you want"
	line "daar heen?" ; "to go there for?"

	para "Er is niets" ; "There's nothing"
	line "daar beneden." ; "down there."
	done

GruntM13SeenText:
	text "Het kan me niet" ; "I don't care if"
	line "schelen of je ver-" ; "you're lost."
	cont "dwaald bent." ;

	para "Als je hier komt," ; "You show up here,"
	line "ben je niets dan" ; "you're nothing but"
	cont "een slachtoffer!" ; "a victim!"
	done

GruntM13BeatenText:
	text "Zo! Je denkt dat" ; "Urk! Yeah, think"
	line "je cool bent, hè?" ; "you're cool, huh?"
	done

GruntM13AfterBattleText:
	text "Je moet wel erg" ; "You must have ice"
	line "koelbloedig zijn" ; "in your veins to"
	cont "om TEAM ROCKET" ; "dis TEAM ROCKET."
	cont "aan te pakken." ;
	done

SwitchRoomText_Switch1:
	text "Het label zegt" ; "It's labeled"
	line "SCHAKELAAR 1." ; "SWITCH 1."
	done

GruntF3SeenText:
	text "Ben je verdwaald?" ; "Are you lost? No,"
	line "Nee, zo te zien" ; "you can't be."

	para "niet. Je bent" ; "You don't have"
	line "niet bang." ; "that scared look."

	para "Ik geef je iets om" ; "I'll give you"
	line "bang voor te zijn!" ; "something to be"
	; cont "scared about!"
	done

GruntF3BeatenText:
	text "Hoe kon je?" ; "How could you?"
	done

GruntF3AfterBattleText:
	text "Ga maar verder!" ; "Go wherever you'd"
	line "Uit mijn zicht!" ; "like! Get lost!"
	cont "Kan me niet" ; "See if I care!"
	cont "schelen!" ; 
	done

SwitchRoomText_OffTurnOn:
	text "Het is UIT." ;  "It's OFF."
	line "Zet het AAN?" ; "Turn it ON?"
	done

SwitchRoomText_OnTurnOff:
	text "Het is AAN." ; "It's ON."
	line "Zet het UIT?" ; "Turn it OFF?"
	done

SwitchRoomText_Switch2:
	text "Het label zegt" ; "It's labeled"
	line "SCHAKELAAR 2." ; "SWITCH 2."
	done

SwitchRoomText_Switch3:
	text "Het label zegt" ; "It's labeled"
	line "SCHAKELAAR 3." ; "SWITCH 3."
	done

SwitchRoomText_Emergency:
	text "Het label zegt" ; "It's labeled"
	line "NOODGEVAL." ; "EMERGENCY."
	done

GoldenrodUndergroundSwitchRoomEntrances_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, GOLDENROD_UNDERGROUND, 6
	warp_event 22, 10, GOLDENROD_UNDERGROUND_WAREHOUSE, 1
	warp_event 23, 10, GOLDENROD_UNDERGROUND_WAREHOUSE, 2
	warp_event  5, 25, GOLDENROD_UNDERGROUND, 2
	warp_event  4, 29, GOLDENROD_CITY, 14
	warp_event  5, 29, GOLDENROD_CITY, 14
	warp_event 21, 25, GOLDENROD_UNDERGROUND, 1
	warp_event 20, 29, GOLDENROD_CITY, 13
	warp_event 21, 29, GOLDENROD_CITY, 13

	def_coord_events
	coord_event 19,  4, SCENE_GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL_BATTLE, UndergroundRivalScene1
	coord_event 19,  5, SCENE_GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_RIVAL_BATTLE, UndergroundRivalScene2

	def_bg_events
	bg_event 16,  1, BGEVENT_READ, Switch1Script
	bg_event 10,  1, BGEVENT_READ, Switch2Script
	bg_event  2,  1, BGEVENT_READ, Switch3Script
	bg_event 20, 11, BGEVENT_READ, EmergencySwitchScript
	bg_event  8,  9, BGEVENT_ITEM, GoldenrodUndergroundSwitchRoomEntrancesHiddenMaxPotion
	bg_event  1,  8, BGEVENT_ITEM, GoldenrodUndergroundSwitchRoomEntrancesHiddenRevive

	def_object_events
	object_event  9, 12, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarDuncan, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  8, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM13, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM11, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM25, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 19, 12, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3, 27, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundSwitchRoomEntrancesTeacherScript, -1
	object_event 19, 27, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundSwitchRoomEntrancesSuperNerdScript, -1
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundSwitchRoomEntrancesSmokeBall, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	object_event 14,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundSwitchRoomEntrancesFullHeal, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_FULL_HEAL
	object_event 23,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_GOLDENROD_UNDERGROUND
