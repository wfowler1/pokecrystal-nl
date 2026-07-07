	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script ElmsLabMeetElmScene, SCENE_ELMSLAB_MEET_ELM
	scene_script ElmsLabNoop1Scene,   SCENE_ELMSLAB_CANT_LEAVE
	scene_script ElmsLabNoop2Scene,   SCENE_ELMSLAB_NOOP
	scene_script ElmsLabNoop3Scene,   SCENE_ELMSLAB_MEET_OFFICER
	scene_script ElmsLabNoop4Scene,   SCENE_ELMSLAB_UNUSED
	scene_script ElmsLabNoop5Scene,   SCENE_ELMSLAB_AIDE_GIVES_POTION
	scene_const SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ElmsLabMoveElmCallback

ElmsLabMeetElmScene:
	sdefer ElmsLabWalkUpToElmScript
	end

ElmsLabNoop1Scene:
	end

ElmsLabNoop2Scene:
	end

ElmsLabNoop3Scene:
	end

ElmsLabNoop4Scene:
	end

ElmsLabNoop5Scene:
	end

ElmsLabMoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_ELMSLAB_MEET_ELM
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

ElmsLabWalkUpToElmScript:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MOBILE_SYSTEM
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOOP
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2: ; unreferenced
	jumpstd TrashCanScript

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ELM: <PLAY_G>!"
	line "Daar ben je!" ; "There you are!"

	para "Ik wil je om een" ; "I needed to ask"
	line "gunst vragen." ; "you a favor."

	para "Ik werk op het" ; "I'm conducting new"
	line "moment aan nieuw" ; "#MON research"

	para "#MON-onderzoek." ; "right now. I was"
	line "Hopelijk kun jij" ; "wondering if you"

	para "daarbij helpen," ; "could help me with"
	line "<PLAY_G>." ; "it, <PLAY_G>."

	para "Het zit zo…" ; "You see…"

	para "Ik schrijf een" ; "I'm writing a"
	line "paper die ik wil" ; "paper that I want"

	para "presenteren op een" ; "to present at a"
	line "conferentie." ; "conference."

	para "Maar ik snap denk" ; "But there are some"
	line "ik nog niet hele-" ; "things I don't"

	para "maal waar het over" ; "quite understand"
	line "gaat." ; "yet."

	para "Dus!" ; "So!"

	para "Ik wil dat je een" ; "I'd like you to"
	line "#MON opvoedt" ; "raise a #MON"

	para "die ik recent heb" ; "that I recently"
	line "gevangen." ; "caught."
	done

ElmText_Accepted:
	text "Bedankt, <PLAY_G>!" ; "Thanks, <PLAY_G>!"

	para "Je helpt me hier" ; "You're a great"
	line "ontzettend mee!" ; "help!"
	done

ElmText_Refused:
	text "Maar… Alsjeblieft," ; "But… Please, I"
	line "ik heb je hulp" ; "need your help!"
	cont "nodig!"
	done

ElmText_ResearchAmbitions:
	text "Als mijn vondsten" ; "When I announce my"
	line "zijn gepubliceerd," ; "findings, I'm sure"

	para "duiken we nog wat" ; "we'll delve a bit"
	line "dieper in de vele" ; "deeper into the"

	para "mysteries van" ; "many mysteries of"
	line "#MON."

	para "Reken daar maar" ; "You can count on"
	line "op!" ; "it!"
	done

ElmText_GotAnEmail:
	text "Oh, hé! Ik kreeg" ; "Oh, hey! I got an"
	line "een e-mail!" ; "e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Oké…" ; "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "Hé, luister." ; "Hey, listen."

	para "Ik heb een kennis" ; "I have an acquain-"
	line "genaamd MR." ; "tance called MR."
	cont "#MON."

	para "Hij ontdekt steeds" ; "He keeps finding"
	line "rare dingen en" ; "weird things and"

	para "deelt dan zijn" ; "raving about his"
	line "ontdekkingen." ; "discoveries."

	para "Hoe dan ook, hij" ; "Anyway, I just got"
	line "stuurde een e-mail" ; "an e-mail from him"

	para "waarin staat dat" ; "saying that this"
	line "het nu menens is." ; "time it's real."

	para "Fascinerend, maar" ; "It is intriguing,"
	line "we zijn druk met" ; "but we're busy"

	para "ons #MON-" ; "with our #MON"
	line "onderzoek…" ; "research…"

	para "Wacht!" ; "Wait!"

	para "Ik heb een idee!" ; "I know!"

	para "<PLAY_G>, kan jij" ; "<PLAY_G>, can you"
	line "voor ons gaan?" ; "go in our place?"
	done

ElmText_ChooseAPokemon:
	text "Ik wil dat je een" ; "I want you to"
	line "van de #MON in" ; "raise one of the"

	para "deze BALLEN voor" ; "#MON contained"
	line "mij opvoedt." ; "in these BALLS."

	para "Je wordt de eerste" ; "You'll be that"
	line "partner van deze" ; "#MON's first"
	cont "#MON, <PLAY_G>!" ; "partner, <PLAY_G>!"

	para "Toe maar. Kies!" ; "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "Als wilde #MON" ; "If a wild #MON"
	line "opduiken, laat je" ; "appears, let your"
	cont "#MON vechten!" ; "#MON battle it!"
	done

LabWhereGoingText:
	text "ELM: Wacht! Waar" ; "ELM: Wait! Where"
	line "ga je heen?" ; "are you going?"
	done

TakeCyndaquilText:
	text "ELM: Je kiest" ; "ELM: You'll take"
	line "CYNDAQUIL, de" ; "CYNDAQUIL, the"
	cont "vuur-#MON?" ; "fire #MON?"
	done

TakeTotodileText:
	text "ELM: Wil je" ; "ELM: Do you want"
	line "TOTODILE, de" ; "TOTODILE, the"
	cont "water-#MON?" ; "water #MON?"
	done

TakeChikoritaText:
	text "ELM: Dus, het is" ; "ELM: So, you like"
	line "CHIKORITA, de" ; "CHIKORITA, the"
	cont "gras-#MON?" ; "grass #MON?"
	done

DidntChooseStarterText:
	text "ELM: Denk er goed" ; "ELM: Think it over"
	line "over na." ; "carefully."

	para "Je partner is" ; "Your partner is"
	line "belangrijk." ; "important."
	done

ChoseStarterText:
	text "ELM: Ik vind" ; "ELM: I think"
	line "dat ook een" ; "that's a great"
	cont "geweldige #MON!" ; "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> koos" ; "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text "!"
	done

ElmDirectionsText1:
	text "MR.#MON woont" ; "MR.#MON lives a"
	line "iets verderop in" ; "little bit beyond"

	para "CHERRYGROVE, de" ; "CHERRYGROVE, the"
	line "stad hiernaast." ; "next city over."

	para "Het is bijna een" ; "It's almost a"
	line "rechte weg er" ; "direct route"

	para "naartoe, dus je" ; "there, so you"
	line "vindt het zo." ; "can't miss it."

	para "Voor de zekerheid," ; "But just in case,"
	line "dit is m'n nummer." ; "here's my phone"

	para "Bel me als er iets" ; "number. Call me if"
	line "is!" ; "anything comes up!"
	done

ElmDirectionsText2:
	text "Als je #MON be-" ; "If your #MON is"
	line "zeerd is, gebruik" ; "hurt, you should"

	para "dan deze machine" ; "heal it with this"
	line "om te genezen." ; "machine."

	para "Gebruik hem gerust" ; "Feel free to use"
	line "zo vaak je wil." ; "it anytime."
	done

ElmDirectionsText3:
	text "<PLAY_G>, ik" ; "<PLAY_G>, I'm"
	line "reken op je!" ; "counting on you!"
	done

GotElmsNumberText:
	text "<PLAYER> kreeg ELM's" ; "<PLAYER> got ELM's"
	line "telefoonnummer." ; "phone number."
	done

ElmDescribesMrPokemonText:
	text "MR.#MON reist" ; "MR.#MON goes"
	line "overal heen en" ; "everywhere and"
	cont "vindt rariteiten." ; "finds rarities."

	para "Helaas zijn ze" ; "Too bad they're"
	line "slechts zelden" ; "just rare and"
	cont "echt nuttig…" ; "not very useful…"
	done

ElmPokeBallText:
	text "Het bevat een" ; "It contains a"
	line "#MON gevangen" ; "#MON caught by"
	cont "door PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "Wat zou dit ding" ; "I wonder what this"
	line "doen?" ; "does?"
	done

ElmsLabHealingMachineText2:
	text "Wil je jouw" ; "Would you like to"
	line "#MON genezen?" ; "heal your #MON?"
	done

ElmAfterTheftText1:
	text "ELM: <PLAY_G>, het" ; "ELM: <PLAY_G>, this"
	line "is afschuwelijk…" ; "is terrible…"

	para "Oh, ja, wat was de" ; "Oh, yes, what was"
	line "grote ontdekking" ; "MR.#MON's big"
	cont "van MR.#MON?" ; "discovery?"
	done

ElmAfterTheftText2:
	text "<PLAYER> gaf" ; "<PLAYER> handed"
	line "MYSTERIE-EI aan" ; "the MYSTERY EGG to"
	cont "PROF.ELM."
	done

ElmAfterTheftText3:
	text "ELM: Dit?" ; "ELM: This?"
	done

ElmAfterTheftText4:
	text "Maar… Is het een" ; "But… Is it a"
	line "#MON-EI?" ; "#MON EGG?"

	para "Zo ja, dan is dit" ; "If it is, it is a"
	line "groot nieuws!" ; "great discovery!"
	done

ElmAfterTheftText5:
	text "ELM: Wat?!?" ; "ELM: What?!?"

	para "PROF.OAK gaf je" ; "PROF.OAK gave you"
	line "een #DEX?" ; "a #DEX?"

	para "<PLAY_G>, echt" ; "<PLAY_G>, is that"
	line "waar? D-dat is" ; "true? Th-that's"
	cont "geweldig!" ; "incredible!"

	para "Hij ziet als geen" ; "He is superb at"
	line "ander of mensen" ; "seeing the poten-"
	cont "potentie hebben" ; "tial of people as"
	cont "als trainers." ; "trainers."

	para "Wauw, <PLAY_G>. Je" ; "Wow, <PLAY_G>. You"
	line "hebt het wellicht" ; "may have what it"

	para "in je om KAMPIOEN" ; "takes to become"
	line "te worden." ; "the CHAMPION."

	para "Je lijkt ook goed" ; "You seem to be"
	line "op te schieten met" ; "getting on great"
	cont "je #MON." ; "with #MON too."

	para "Je zou de #MON-" ; "You should take"
	line "GYM-uitdaging" ; "the #MON GYM"
	cont "moeten proberen." ; "challenge."

	para "De eerste GYM is" ; "The closest GYM"
	line "verderop in VIOLET" ; "would be the one"
	cont "CITY." ; "in VIOLET CITY."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. Het" ; "…<PLAY_G>. The"
	line "pad om kampioen te" ; "road to the"

	para "worden is een" ; "championship will"
	line "lastige." ; "be a long one."

	para "Praat voor je gaat" ; "Before you leave,"
	line "ook nog even met" ; "make sure that you"
	cont "je moeder." ; "talk to your mom."
	done

ElmStudyingEggText:
	text "ELM: Geef niet op!" ; "ELM: Don't give"
	line "Ik bel je als ik" ; "up! I'll call if"

	para "iets te weten kom" ; "I learn anything"
	line "over dat EI!" ; "about that EGG!"
	done

ElmAideHasEggText:
	text "ELM: <PLAY_G>?"
	line "Heb je gesproken" ; "Didn't you meet my"
	cont "met m'n assistent?" ; "assistant?"

	para "Hij zou naar je" ; "He should have met"
	line "komen met het EI" ; "you with the EGG"

	para "in VIOLET CITY's" ; "at VIOLET CITY's"
	line "#MONCENTRUM." ; "#MON CENTER."

	para "Je hebt hem vast" ; "You must have just"
	line "gemist, zoek hem" ; "missed him. Try to"
	cont "daar op." ; "catch him there."
	done

ElmWaitingEggHatchText:
	text "ELM: He, is dat" ; "ELM: Hey, has that"
	line "EI nog veranderd?" ; "EGG changed any?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? Kwam het" ; "<PLAY_G>? I thought"
	line "EI uit? Ja toch?" ; "the EGG hatched."

	para "Waar is de" ; "Where is the"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAY_G>, je" ; "ELM: <PLAY_G>, you"
	line "ziet er goed uit!" ; "look great!"
	done

ShowElmTogepiText2:
	text "Wat?" ; "What?"
	line "Die #MON!?!" ; "That #MON!?!"
	done

ShowElmTogepiText3:
	text "Het EI kwam uit!" ; "The EGG hatched!"
	line "Dus, #MON komen" ; "So, #MON are"
	cont "uit EIEREN…" ; "born from EGGS…"

	para "Nee, wellicht niet" ; "No, perhaps not"
	line "alle #MON." ; "all #MON are."

	para "Wauw, er is nog" ; "Wow, there's still"
	line "steeds een hoop te" ; "a lot of research"
	cont "onderzoeken." ; "to be done."
	done

ElmGiveEverstoneText1:
	text "Bedankt, <PLAY_G>!" ; "Thanks, <PLAY_G>!"
	line "Je helpt geheimen" ; "You're helping"

	para "bij #MON te" ; "unravel #MON"
	line "ontrafelen!" ; "mysteries for us!"

	para "Neem dit maar als" ; "I want you to have"
	line "blijk van onze" ; "this as a token of"
	cont "waardering." ; "our appreciation."
	done

ElmGiveEverstoneText2:
	text "Dat is een" ; "That's an"
	line "EEUWIGSTEEN." ; "EVERSTONE."

	para "Sommige soorten" ; "Some species of"
	line "#MON evolueren" ; "#MON evolve"

	para "als ze een bepaald" ; "when they grow to"
	line "level bereiken." ; "certain levels."

	para "Een #MON met" ; "A #MON holding"
	line "een EEUWIGSTEEN" ; "the EVERSTONE"
	cont "evolueert niet." ; "won't evolve."

	para "Geef hem aan een" ; "Give it to a #-"
	line "#MON die je" ; "MON you don't want"
	cont "niet wil" ; "to evolve."
	cont "evolueren.";
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>, ik" ; "ELM: <PLAY_G>, I'll"
	line "bel als er iets" ; "call you if any-"
	cont "is." ; "thing comes up."
	done

AideText_AfterTheft:
	text "…zucht… Die" ; "…sigh… That"
	line "gestolen #MON." ; "stolen #MON."

	para "Hoe zou het met" ; "I wonder how it's"
	line "hen gaan?" ; "doing."

	para "Ze zeggen dat een" ; "They say a #MON"
	line "#MON opgevoed" ; "raised by a bad"

	para "door een slecht" ; "person turns bad"
	line "persoon ook" ; "itself."
	cont "slecht wordt."
	done

ElmGiveMasterBallText1:
	text "ELM: Hé, <PLAY_G>!" ; "ELM: Hi, <PLAY_G>!"
	line "Dankzij jou gaat" ; "Thanks to you, my"

	para "mijn onderzoek" ; "research is going"
	line "geweldig!" ; "great!"

	para "Neem dit als blijk" ; "Take this as a"
	line "van mijn" ; "token of my"
	cont "waardering." ; "appreciation."
	done

ElmGiveMasterBallText2:
	text "De MEESTERBAL is" ; "The MASTER BALL is"
	line "de beste!" ; "the best!"

	para "Het is de ultieme" ; "It's the ultimate"
	line "BAL! Hij vangt" ; "BALL! It'll catch"

	para "iedere #MON" ; "any #MON with-"
	line "zonder problemen." ; "out fail."

	para "Alleen erkende" ; "It's given only to"
	line "#MON-onderzoe-" ; "recognized #MON"
	cont "kers krijgen dit." ; "researchers."

	para "Jij hebt er vast" ; "I think you can"
	line "meer aan dan ik," ; "make much better"

	para "<PLAY_G>!" ; "use of it than I"
	; line "can, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "Daar ben je!" ; "There you are!"

	para "Ik belde omdat ik" ; "I called because I"
	line "iets aan je wil" ; "have something for"
	cont "geven." ; "you."

	para "Hier, het is een" ; "See? It's an"
	line "BOOTKAARTJE." ; "S.S.TICKET."

	para "Nu kun je #MON" ; "Now you can catch"
	line "in KANTO vangen." ; "#MON in KANTO."
	done

ElmGiveTicketText2:
	text "Het schip vertrekt" ; "The ship departs"
	line "uit OLIVINE CITY." ; "from OLIVINE CITY."

	para "Maar dat wist je" ; "But you knew that"
	line "al, <PLAY_G>." ; "already, <PLAY_G>."

	para "Je bent immers al" ; "After all, you've"
	line "overal geweest met" ; "traveled all over"
	cont "je #MON." ; "with your #MON."

	para "Doe de groeten aan" ; "Give my regards to"
	line "PROF.OAK in KANTO!"
	done

ElmsLabMonEggText: ; unreferenced
	text "Het #MON-EI dat" ; "It's the #MON"
	line "PROF.ELM" ; "EGG being studied"
	cont "bestudeert." ; "by PROF.ELM."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, ik wil" ; "<PLAY_G>, I want"
	line "je dit geven voor" ; "you to have this"
	cont "je klusje." ; "for your errand."
	done

AideText_AlwaysBusy:
	text "We zijn met twee," ; "There are only two"
	line "dus we hebben het" ; "of us, so we're"
	cont "altijd druk." ; "always busy."
	done

AideText_TheftTestimony:
	text "Ik hoorde buiten" ; "There was a loud"
	line "ineens herrie…" ; "noise outside…"

	para "Toen we gingen" ; "When we went to"
	line "kijken, was een" ; "look, someone"
	cont "#MON gestolen." ; "stole a #MON."

	para "Ongelofelijk dat" ; "It's unbelievable"
	line "iemand dat zou" ; "that anyone would"
	cont "doen!" ; "do that!"

	para "…zucht… Die" ; "…sigh… That"
	line "gestolen #MON." ; "stolen #MON."

	para "Hoe zou het er mee" ; "I wonder how it's"
	line "gaan. Men zegt" ; "doing."

	para "dat een #MON" ; "They say a #MON"
	line "opgevoed door" ; "raised by a bad"

	para "een slecht iemand" ; "person turns bad"
	line "ook slecht wordt." ; "itself."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Gebruik deze op je" ; "Use these on your"
	line "#DEX-missie!" ; "#DEX quest!"
	done

AideText_ExplainBalls:
	text "Vang #MON om ze" ; "To add to your"
	line "toe te voegen aan" ; "vangen om ze in je" ; "#DEX, you have"
	cont "je #DEX." ; "#DEX te" ; "to catch #MON."

	para "Gooi #BALLEN" ; "Throw # BALLS"
	line "naar wilde #MON" ; "at wild #MON"
	cont "om ze te vangen." ; "to get them."
	done

ElmsLabOfficerText1:
	text "Ik hoorde dat een" ; "I heard a #MON"
	line "#MON is gejat…" ; "was stolen here…"

	para "PROF.ELM vertelde" ; "I was just getting"
	line "mij er net alles" ; "some information"
	cont "over." ; "from PROF.ELM."

	para "Kennelijk was het" ; "Apparently, it was"
	line "een jongeman met" ; "a young male with"
	cont "lang, rood haar…" ; "long, red hair…"

	para "Wat?" ; "What?"

	para "Heb je gevochten" ; "You battled a"
	line "met zo iemand?" ; "trainer like that?"

	para "Heb je zijn naam" ; "Did you happen to"
	line "ook gehoord?" ; "get his name?"
	done

ElmsLabOfficerText2:
	text "OK! Dus hij heet" ; "OK! So <RIVAL>"
	line "<RIVAL>." ; "was his name."

	para "Bedankt voor je" ; "Thanks for helping"
	line "hulp!" ; "my investigation!"
	done

ElmsLabWindowText1:
	text "Het raam is open." ; "The window's open."

	para "Een fijn briesje" ; "A pleasant breeze"
	line "waait naar binnen." ; "is blowing in."
	done

ElmsLabWindowText2:
	text "Hij brak hier" ; "He broke in"
	line "naar binnen!" ; "through here!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opende" ; "<PLAYER> opened a"
	line "een boek." ; "book."

	para "Reistip 1:" ; "Travel Tip 1:"

	para "Druk op START voor" ; "Press START to"
	line "het MENU." ; "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opende" ; "<PLAYER> opened a"
	line "een boek." ; "book."

	para "Reistip 2:" ; "Travel Tip 2:"

	para "Leg je reis vast" ; "Record your trip"
	line "met OPSLAAN!" ; "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opende" ; "<PLAYER> opened a"
	line "een boek." ; "book."

	para "Reistip 3:" ; "Travel Tip 3:"

	para "Open je TAS en" ; "Open your PACK and"
	line "druk op SELECT om" ; "press SELECT to"
	cont "te verplaatsen." ; "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opende" ; "<PLAYER> opened a"
	line "een boek." ; "book."

	para "Reistip 4:" ; "Travel Tip 4:"

	para "Check je #MON-" ; "Check your #MON"
	line "acties. Druk op" ; "moves. Press the"

	para "A om de plek te" ; "A Button to switch"
	line "veranderen." ; "moves."
	done

ElmsLabTrashcanText:
	text "De verpakking van" ; "The wrapper from"
	line "de snack die PROF." ; "the snack PROF.ELM"
	cont "ELM at, ligt hier." ; "ate is in there…"
	done

ElmsLabPCText:
	text "OBSERVATIES OVER" ; "OBSERVATIONS ON"
	line "#MON-EVOLUTIE" ; "#MON EVOLUTION"

	para "…Op het scherm" ; "…It says on the"
	line "staat…" ; "screen…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
