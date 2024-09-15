	object_const_def
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL

Route29_MapScripts:
	def_scene_scripts
	scene_script Route29Noop1Scene, SCENE_ROUTE29_NOOP
	scene_script Route29Noop2Scene, SCENE_ROUTE29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route29TuscanyCallback

Route29Noop1Scene:
	end

Route29Noop2Scene:
	end

Route29TuscanyCallback:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	endcallback

Route29Tutorial1:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29Tutorial2:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	setscene SCENE_ROUTE29_NOOP
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	setscene SCENE_ROUTE29_NOOP
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialBoxFullText:
	text "#MON verstoppen" ; "#MON hide in"
	line "in gras. Wie weet" ; "the grass. Who"

	para "wanneer ze omhoog-" ; "knows when they'll"
	line "springen…" ; "pop out…"
	done

CatchingTutorialIntroText:
	text "Ik zag je al een" ; "I've seen you a"
	line "paar keer. Hoeveel" ; "couple times. How"

	para "#MON heb je" ; "many #MON have"
	line "gevangen?" ; "you caught?"

	para "Wil je dat ik laat" ; "Would you like me"
	line "zien hoe je een" ; "to show you how to"
	cont "#MON vangt?" ; "catch #MON?"
	done

CatchingTutorialDebriefText:
	text "Dat is dus hoe het" ; "That's how you do"
	line "moet." ; "it."

	para "Als je ze eerst" ; "If you weaken them"
	line "verzwakt, vang je" ; "first, #MON are"
	cont "#MON sneller." ; "easier to catch."
	done

CatchingTutorialDeclinedText:
	text "Oh. Oké, prima." ; "Oh. Fine, then."

	para "Maarre, als je" ; "Anyway, if you"
	line "#MON wil vang-" ; "want to catch"

	para "en, moet je veel" ; "#MON, you have"
	line "rondlopen." ; "to walk a lot."
	done

CatchingTutorialRepeatText:
	text "Huh? Moet ik laten" ; "Huh? You want me"
	line "zien hoe je" ; "to show you how to"
	cont "#MON vangt?" ; "catch #MON?"
	done

Route29YoungsterText:
	text "Yo. Hoe gaat het" ; "Yo. How are your"
	line "met je #MON?" ; "#MON?"

	para "Als ze zwak zijn" ; "If they're weak"
	line "en niet kunnen" ; "and not ready for"

	para "vechten, blijf uit" ; "battle, keep out"
	line "het gras." ; "of the grass."
	done

Route29TeacherText:
	text "Zie je de richels?" ; "See those ledges?"
	line "Het is eng om er" ; "It's scary to jump"
	cont "af te springen." ; "off them."

	para "Maar je komt dan" ; "But you can go to"
	line "in NEW BARK zonder" ; "NEW BARK without"

	para "door het gras te" ; "walking through"
	line "lopen." ; "the grass."
	done

Route29FisherText:
	text "Ik wilde even uit-" ; "I wanted to take a"
	line "rusten, dus heb" ; "break, so I saved"

	para "mijn voortgang" ; "to record my"
	line "opgeslagen." ; "progress."
	done

Route29CooltrainerMText_WaitingForDay: ; unreferenced
	text "Ik wacht op" ; "I'm waiting for"
	line "#MON die" ; "#MON that"

	para "alleen overdag" ; "appear only in the"
	line "verschijnen." ; "daytime."
	done

Route29CooltrainerMText_WaitingForNight:
	text "Ik wacht op" ; "I'm waiting for"
	line "#MON die" ; "#MON that"

	para "alleen in de nacht" ; "appear only at"
	line "verschijnen." ; "night."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "Ik wacht op" ; "I'm waiting for"
	line "#MON die" ; "#MON that"

	para "alleen in de och-" ; "appear only in the"
	line "tend verschijnen." ; "morning."
	done

MeetTuscanyText:
	text "TUSCANY: Dit is" ; "TUSCANY: I do be-"
	line "denk ik de eerste" ; "lieve that this is"

	para "keer dat we elkaar" ; "the first time"
	line "ontmoeten?" ; "we've met?"

	para "Laat me mijzelf" ; "Please allow me to"
	line "voorstellen." ; "introduce myself."

	para "Ik ben TUSCANY van" ; "I am TUSCANY of"
	line "Dinsdag." ; "Tuesday."
	done

TuscanyGivesGiftText:
	text "Ter introductie," ; "By way of intro-"
	line "accepteer alsje-" ; "duction, please"

	para "blieft dit cadeau," ; "accept this gift,"
	line "een ZIJDEN SJAAL." ; "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Is hij" ; "TUSCANY: Wouldn't"
	line "niet hartstikke" ; "you agree that it"
	cont "schattig?" ; "is most adorable?"

	para "Hij versterkt" ; "It strengthens"
	line "normaal-aanvallen." ; "normal-type moves."

	para "Je hebt er vast" ; "I am certain it"
	line "wel iets aan." ; "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Heb je" ; "TUSCANY: Have you"
	line "MONICA ontmoet," ; "met MONICA, my"
	cont "mijn grote zus?" ; "older sister?"

	para "Of mijn jonge" ; "Or my younger"
	line "broertje, WESLEY?" ; "brother, WESLEY?"

	para "Ik ben de tweede" ; "I am the second of"
	line "van zeven kinderen" ; "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Het is" ; "TUSCANY: Today is"
	line "geen dinsdag. Dat" ; "not Tuesday. That"
	cont "is spijtig…" ; "is unfortunate…"
	done

Route29Sign1Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29Sign2Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53,  9, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2

	def_bg_events
	bg_event 51,  7, BGEVENT_READ, Route29Sign1
	bg_event  3,  5, BGEVENT_READ, Route29Sign2

	def_object_events
	object_event 50, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 12,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1
	object_event 25,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 13,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 48,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
