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
	line "Daar ben je!"

	para "Ik wil je om een"
	line "gunst vragen."

	para "Ik werk op het mo-"
	line "ment aan nieuw"

	para "#MON-onder-"
	line "zoek. Hopelijk kun"

	para "je daarbij helpen,"
	line "<PLAY_G>."

	para "Het zit zo…"

	para "Ik schrijf een"
	line "paper die ik wil"

	para "presenteren op een"
	line "conferentie."

	para "Maar ik snap denk"
	line "ik nog niet alles"

	para "waar het over"
	line "gaat."

	para "Dus!"

	para "Ik wil dat je een"
	line "#MON opvoedt"

	para "die ik recent heb"
	line "gevangen."
	done

ElmText_Accepted:
	text "Bedankt, <PLAY_G>!"

	para "Je helpt me hier"
	line "ontzettend mee!"
	done

ElmText_Refused:
	text "Maar… Alsjeblieft,"
	line "ik reken op je!"
	done

ElmText_ResearchAmbitions:
	text "Als mijn vondsten"
	line "zijn gepubliceerd,"

	para "duiken we nog wat"
	line "dieper in de vele"

	para "mysteries van"
	line "#MON."

	para "Reken daar maar"
	line "op!"
	done

ElmText_GotAnEmail:
	text "Oh, hé! Ik kreeg"
	line "een e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Oke…"
	done

ElmText_MissionFromMrPokemon:
	text "He, luister."

	para "Ik heb een kennis,"
	line "hij heet MR."
	cont "#MON."

	para "Hij ontdekt steeds"
	line "rare dingen en"

	para "deelt dan zijn"
	line "ontdekkingen."

	para "Hoe dan ook, ik"
	line "kreeg mail van hem"

	para "waarin staat dat"
	line "het nu menens is."

	para "Fascinerend, maar"
	line "we zijn druk met"

	para "ons #MON-"
	line "onderzoek…"

	para "Wacht!"

	para "Ik heb een idee!"

	para "<PLAY_G>, kan jij"
	line "voor ons gaan?"
	done

ElmText_ChooseAPokemon:
	text "Ik wil dat je een"
	line "van de #MON in"

	para "deze BALLEN voor"
	line "mij opvoedt."

	para "Je wordt de eerste"
	line "partner van deze"
	cont "#MON, <PLAY_G>!"

	para "Toe maar. Kies!"
	done

ElmText_LetYourMonBattleIt:
	text "Als wilde #MON"
	line "opduiken, laat je"
	cont "#MON vechten!"
	done

LabWhereGoingText:
	text "ELM: Wacht! Waar"
	line "ga je heen?"
	done

TakeCyndaquilText:
	text "ELM: Je kiest"
	line "CYNDAQUIL, de"
	cont "vuur-#MON?"
	done

TakeTotodileText:
	text "ELM: Wil je"
	line "TOTODILE, de"
	cont "water-#MON?"
	done

TakeChikoritaText:
	text "ELM: Dus, het is"
	line "CHIKORITA, de"
	cont "grass-#MON?"
	done

DidntChooseStarterText:
	text "ELM: Denk er goed"
	line "over na."

	para "Je partner is"
	line "belangrijk."
	done

ChoseStarterText:
	text "ELM: Ik vind"
	line "dat ook een gewel-"
	cont "dige #MON!"
	done

ReceivedStarterText:
	text "<PLAYER> koos"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "MR.#MON woont"
	line "iets verderop in"

	para "CHERRYGROVE, de"
	line "stad hiernaast."

	para "Het is bijna een"
	line "rechte weg er"

	para "naartoe, dus je"
	line "vindt het zo."

	para "Voor de zekerheid,"
	line "dit is m'n nummer"

	para "Bel me als er iets"
	line "is!"
	done

ElmDirectionsText2:
	text "Als je #MON be-"
	line "zeerd is, gebruik"

	para "deze machine om 'm"
	line "te genezen."

	para "Gebruik hem gerust"
	line "zo vaak je wil."
	done

ElmDirectionsText3:
	text "<PLAY_G>, ik"
	line "reken op je!"
	done

GotElmsNumberText:
	text "<PLAYER> kreeg ELM's"
	line "telefoonnummer."
	done

ElmDescribesMrPokemonText:
	text "MR.#MON komt"
	line "overal en vindt"
	cont "eigenaardigheden."

	para "Helaas zijn ze"
	line "slechts zelden"
	cont "echt nuttig…"
	done

ElmPokeBallText:
	text "Bevat een #MON"
	line "gevangen door"
	cont "PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "Wat zou dit ding"
	line "doen?"
	done

ElmsLabHealingMachineText2:
	text "Wil je jouw"
	line "#MON genezen?"
	done

ElmAfterTheftText1:
	text "ELM: <PLAY_G>, het"
	line "is afschuwelijk…"

	para "Oh, ja, wat was de"
	line "ontdekking van"
	cont "MR.#MON?"
	done

ElmAfterTheftText2:
	text "<PLAYER> gaf"
	line "MYSTERIE-EI aan"
	cont "PROF.ELM."
	done

ElmAfterTheftText3:
	text "ELM: Dit?"
	done

ElmAfterTheftText4:
	text "Naar… Is het een"
	line "#MON EI?"

	para "Zo ja, dan is dit"
	line "groot nieuws!"
	done

ElmAfterTheftText5:
	text "ELM: Wat?!?"

	para "PROF.OAK gaf je"
	line "een #DEX?"

	para "<PLAY_G>, echt"
	line "waar? D-dat is"
	cont "geweldig!"

	para "Hij ziet als geen"
	line "ander of mensen"
	cont "potentie hebben"
	cont "als trainers."

	para "Wauw, <PLAY_G>. Je"
	line "hebt het wellicht"

	para "in je om KAMPIOEN"
	line "te worden."

	para "Je lijkt ook goed"
	line "op te schieten met"
	cont "jouw #MON."

	para "Overweeg de"
	line "#MON GYM-uit-"
	cont "daging te doen."

	para "De eerste GYM is"
	line "is verderop in"
	cont "VIOLET CITY."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. Het"
	line "pad om kampioen te"

	para "worden is een"
	line "lastige."

	para "Praat voor je gaat,"
	line "ook nog even met"
	cont "je moeder."
	done

ElmStudyingEggText:
	text "ELM: Geef niet op!"
	line "Ik bel je als ik"

	para "iets te weten komt"
	line "over dat EI!"
	done

ElmAideHasEggText:
	text "ELM: <PLAY_G>?"
	line "Heb je gesproken"
	cont "met m'n assistent?"

	para "Hij zou naar je"
	line "komen met het EI"

	para "in VIOLET CITY's"
	line "#MON CENTER."

	para "Je hebt hem vast"
	line "gemist, probeer"
	cont "'m daar te vinden."
	done

ElmWaitingEggHatchText:
	text "ELM: He, is dat"
	line "EI nog veranderd?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? Kwam het"
	line "EI uit? Ja toch?"

	para "Waar is de"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAY_G>, je"
	line "ziet er goed uit!"
	done

ShowElmTogepiText2:
	text "Wat?"
	line "Die #MON!?!"
	done

ShowElmTogepiText3:
	text "Het EI kwam uit!"
	line "Dus, #MON komen"
	cont "uit EIEREN…"

	para "Nee, wellicht niet"
	line "alle #MON."

	para "Wauw, er is nog"
	line "steeds een hoop te"
	cont "onderzoeken."
	done

ElmGiveEverstoneText1:
	text "Bedankt, <PLAY_G>!"
	line "Je helpt geheimen"

	para "bij #MON te"
	line "ontrafelen!"

	para "Neem dit maar als"
	line "blijk van onze"
	cont "waardering."
	done

ElmGiveEverstoneText2:
	text "Dat is een"
	line "ALTIJDSTEEN."

	para "Sommige soorten"
	line "#MON evolueren"

	para "als ze een bepaald"
	line "niveau bereiken."

	para "Een #MON met"
	line "een ALTIJDSTEEN"
	cont "evolueert niet."

	para "Geef hem aan  een"
	line "#MON die je niet"
	cont "wil evolueren."
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>, ik"
	line "bel als er iets is."
	done

AideText_AfterTheft:
	text "…zucht… Die"
	line "gestolen #MON."

	para "Hoe zou het met"
	line "hen gaan?"

	para "Ze zeggen dat een"
	line "#MON opgevoed"

	para "door een slecht"
	line "persoon ook"
	cont "slecht wordt."
	done

ElmGiveMasterBallText1:
	text "ELM: He, <PLAY_G>!"
	line "Dankzij jou gaat"

	para "mijn onderzoek"
	line "geweldig!"

	para "Neem dit als blijk"
	line "van mijn"
	cont "waardering."
	done

ElmGiveMasterBallText2:
	text "De MEESTERBAL is"
	line "de beste!"

	para "Het is de ultieme"
	line "BAL! Hij vangt"

	para "iedere #MON"
	line "zonder problemen."

	para "Alleen erkende"
	line "#MON-onderzoe-"
	cont "kers krijgen dit."

	para "Jij kan er vast"
	line "meer mee dan ik"

	para "kan, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "Daar ben je!"

	para "Ik belde omdat ik"
	line "iets aan je wil"
	cont "geven."

	para "Hier, het is een"
	line "S.S.TICKET."

	para "Nu kun je #MON"
	line "in KANTO vangen."
	done

ElmGiveTicketText2:
	text "Het schip vertrekt"
	line "uit OLIVINE CITY."

	para "Maar dat wist je"
	line "al, <PLAY_G>."

	para "Je bent immers al"
	line "overal geweest met"
	cont "jouw #MON."

	para "Doe de groeten aan"
	line "PROF.OAK in KANTO!"
	done

ElmsLabMonEggText: ; unreferenced
	text "Het #MON-ei dat"
	line "PROF.ELM bestu-"
	cont "deert."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, ik wil"
	line "je dit geven voor"
	cont "je klusje."
	done

AideText_AlwaysBusy:
	text "We zijn met twee,"
	line "dus we hebben het"
	cont "altijd druk."
	done

AideText_TheftTestimony:
	text "Ik hoorde buiten"
	line "ineens herrie…"

	para "Toen we gingen"
	line "kijken, was een"
	cont "#MON gestolen."

	para "Ongelofelijk dat"
	line "iemand dat zou"
	cont "doen!"

	para "…zucht… Die"
	line "gestolen #MON."

	para "Hoe zou het er mee"
	line "gaan."

	para "Men zegt dat een"
	line "#MON opgevoed door"

	para "een slecht iemand"
	line "ook slecht wordt."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Gebruik deze op je"
	line "#DEX-missie!"
	done

AideText_ExplainBalls:
	text "Je moet #MON"
	line "vangen om ze in je"
	cont "#DEX te krijgen."

	para "Gooi #BALLEN"
	line "naar wilde #MON"
	cont "om ze te vangen."
	done

ElmsLabOfficerText1:
	text "Ik hoorde dat een"
	line "#MON is gejat…"

	para "Ik hoorde er net"
	line "over van PROF.ELM"

	para "Kennelijk was het"
	line "een jongeman met"
	cont "lang, rood haar…"

	para "Wat?"

	para "Heb je gevochten"
	line "met zo iemand?"

	para "Heb je zijn naam"
	line "ook gehoord?"
	done

ElmsLabOfficerText2:
	text "OK! Dus hij heet"
	line "<RIVAL>."

	para "Bedankt voor je"
	line "hulp!"
	done

ElmsLabWindowText1:
	text "Het raam is open."

	para "Een fijn briesje"
	line "waait naar binnen."
	done

ElmsLabWindowText2:
	text "Hij brak hier"
	line "naar binnen!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opende"
	line "een boek."

	para "Reistip 1:"

	para "Druk op START voor"
	line "het MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opende"
	line "een boek."

	para "Reistip 2:"

	para "Leg je reis vast"
	line "met OPSLAAN!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opende"
	line "een boek."

	para "Reistip 3:"

	para "Open je TAS en"
	line "druk op SELECT om"
	cont "te verplaatsen."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opende"
	line "een boek."

	para "Reistip 4:"

	para "Check je #MON-"
	line "aanvallen. Druk op"

	para "A om de plek te"
	line "veranderen."
	done

ElmsLabTrashcanText:
	text "De verpakking van"
	line "de snack die PROF."
	cont "ELM at ligt hier."
	done

ElmsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…Op het scherm"
	line "staat…"
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
