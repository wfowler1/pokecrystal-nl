	object_const_def
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
	def_scene_scripts
	scene_script DragonShrineTakeTestScene, SCENE_DRAGONSHRINE_TAKE_TEST
	scene_script DragonShrineNoopScene,     SCENE_DRAGONSHRINE_NOOP

	def_callbacks

DragonShrineTakeTestScene:
	sdefer DragonShrineTakeTestScript
	end

DragonShrineNoopScene:
	end

DragonShrineTakeTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	promptbutton
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	promptbutton
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	promptbutton
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	promptbutton
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	promptbutton
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	promptbutton
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	promptbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	turnobject DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_DRAGONSHRINE_NOOP
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrinePlayerReceivedRisingBadgeText
	promptbutton
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.BeatRivalInMtMoon:
	writetext DragonShrineRivalIsInTrainingText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Maat@" ; "Pal@"
	db "Hulpje@" ; "Underling@"
	db "Vriend@" ; "Friend@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Strategie@" ; "Strategy@"
	db "Opvoeden@" ; "Raising@"
	db "Valsspelen@" ; "Cheating@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Zwakkeling@" ; "Weak person@"
	db "Sterk persoon@" ; "Tough person@"
	db "Wie dan ook@" ; "Anybody@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Liefde@" ; "Love@"
	db "Geweld@" ; "Violence@"
	db "Kennis@" ; "Knowledge@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Sterk@" ; "Tough@"
	db "Beide@" ; "Both@"
	db "Zwak@" ; "Weak@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text "Hm… Goed om je" ; "Hm… Good to see"
	line "hier te zien." ; "you here."

	para "Je hoeft niet uit" ; "No need to explain"
	line "te leggen waarom." ; "why you came."

	para "CLAIR heeft je" ; "CLAIR sent you"
	line "gestuurd, of niet?" ; "here, didn't she?"

	para "Die meid is een" ; "That girl is a"
	line "handenbindertje." ; "handful…"

	para "Het spijt me, maar" ; "I am sorry, but I"
	line "ik moet je testen." ; "must test you."

	para "Geen zorgen hoor," ; "Not to worry, you"
	line "het zijn slechts" ; "are to answer only"
	cont "een paar vragen." ; "a few questions."

	para "Klaar?" ; "Ready?"
	done

DragonShrineQuestion1Text:
	text "Wat zijn #MON" ; "What are #MON"
	line "voor jou?" ; "to you?"
	done

DragonShrineQuestion2Text:
	text "Wat helpt jou om" ; "What helps you to"
	line "te winnen?" ; "win battles?"
	done

DragonShrineQuestion3Text:
	text "Tegen wat voor" ; "What kind of"
	line "trainer vecht je" ; "trainer do you"
	cont "het liefst?" ; "wish to battle?"
	done

DragonShrineQuestion4Text:
	text "Wat is belangrijk" ; "What is most"
	line "bij het opvoeden" ; "important for"
	cont "van #MON?" ; "raising #MON?"
	done

DragonShrineQuestion5Text:
	text "Sterke #MON." ; "Strong #MON."
	line "Zwakke #MON." ; "Weak #MON."

	para "Welke zijn het" ; "Which is more"
	line "belangrijkst?" ; "important?"
	done

DragonShrinePassedTestText:
	text "Hm… Is dat zo…" ; "Hm… I see…"

	para "Je geeft erg veel" ; "You care deeply"
	line "om #MON." ; "for #MON."

	para "Prijzenswaardig." ; "Very commendable."

	para "Die toewijding is" ; "That conviction is"
	line "heel belangrijk!" ; "what is important!"

	para "<PLAYER>, verlies" ; "<PLAYER>, don't"
	line "dat gevoel niet." ; "lose that belief."

	para "Het zal je helpen" ; "It will see you"
	line "bij de #MON-" ; "through at the"
	cont "LEAGUE." ; "#MON LEAGUE."
	done

DragonShrineMustIInformLanceText:
	text "CLAIR!"

	para "Dit kind is" ; "This child is"
	line "onberispelijk," ; "impeccable, in"
	cont "zowel in geest als" ; "skill and spirit!"
	cont "vaardigheid!"

	para "Erken je verlies" ; "Admit defeat and"
	line "en overhandig de" ; "confer the RISING-"
	cont "RIJZINGSBADGE!" ; "BADGE!"

	para "…Of moet ik LANCE" ; "…Or must I inform"
	line "hiervan vertellen?" ; "LANCE of this?"
	done

DragonShrineElderScoldsClairText:
	text "CLAIR…"

	para "Reflecteer op wat" ; "Reflect upon what"
	line "bij jou ontbreekt" ; "it is that you"

	para "en wat dit kind" ; "lack and this"
	line "wel heeft." ; "child has."
	done

DragonShrineComeAgainText:
	text "Kom nog eens, als" ; "Come again, if you"
	line "je dat wenst." ; "so desire."
	done

DragonShrineTakeThisDratiniText:
	text "Hm… Goed om je" ; "Hm… Good to see"
	line "hier te zien." ; "you here."

	para "Je aankomst hier" ; "Your arrival is"
	line "is fortuinlijk." ; "most fortunate."

	para "Ik heb iets voor" ; "I have something"
	line "je." ; "for you."

	para "Neem deze DRAKIE" ; "Take this DRATINI"
	line "als bewijs dat ik" ; "as proof that I"

	para "jouw waarde heb" ; "have recognized"
	line "gezien." ; "your worth."
	done

DragonShrinePlayerReceivedDratiniText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "DRAKIE!"
	done

DragonShrinePartyFullText:
	text "Hm? Je #MON-" ; "Hm? Your #MON"
	line "team is vol." ; "party is full."
	done

DragonShrineSymbolicDragonText:
	text "Draak-#MON zijn" ; "Dragon #MON are"
	line "symbolisch voor" ; "symbolic of our"
	cont "onze stam." ; "clan."

	para "Je hebt getoond" ; "You have shown"
	line "dat ik jou één kan" ; "that you can be"

	para "toevertrouwen." ; "entrusted with"
	; line "one."
	done

DragonShrineClairsGrandfatherText:
	text "CLAIR heeft een" ; "CLAIR appears to"
	line "waardevolle les" ; "have learned an"

	para "van jou geleerd." ; "invaluable lesson"
	; line "from you."

	para "Ik dank je als" ; "I thank you as her"
	line "haar grootvader." ; "grandfather."
	done

DragonShrineRivalIsInTrainingText:
	text "Een jongen van" ; "A boy close to"
	line "jouw leeftijd" ; "your age is in"
	cont "traint hier." ; "training here."

	para "Hij lijkt erg op" ; "He is much like"
	line "CLAIR toen zij" ; "CLAIR when she was"

	para "jonger was. Het is" ; "younger. It is a"
	line "zorgwekkend…" ; "little worrisome…"
	done

DragonShrineWrongAnswerText1:
	text "Hah? Ik hoorde je" ; "Hah? I didn't"
	line "niet goed…" ; "quite catch that…"
	done

DragonShrineWrongAnswerText2:
	text "Wat zei je nou" ; "What was it you"
	line "precies?" ; "said?"
	done

DragonShrineRightAnswerText:
	text "Oh, duidelijk…" ; "Oh, I understand…"
	done

DragonShrineElder2Text:
	text "Het is lang" ; "It's been quite"
	line "geleden sinds een" ; "some time since a"

	para "trainer door onze" ; "trainer has gained"
	line "MEESTER werd" ; "our MASTER's rare"
	cont "erkend." ; "approval."

	para "Sterker nog, LANCE" ; "In fact, not since"
	line "was de laatste." ; "Master LANCE."
	done

DragonShrineElder3Text:
	text "Ken je jonge" ; "You know young"
	line "meester LANCE?" ; "Master LANCE?"

	para "Hij lijkt erg op" ; "He looks so much"
	line "onze meester toen" ; "like our MASTER"
	cont "hij jong was." ; "did in his youth."

	para "Het zit in hun" ; "It's in their"
	line "bloed." ; "blood."
	done

DragonShrineClairYouPassedText:
	text "Hoe ging het?" ; "So how did it go?"

	para "Stom om te vragen," ; "I guess there's no"
	line "eigenlijk." ; "point in asking."

	para "Je faalde, toch?" ; "You did fail?"

	para "<……><……><……><……><……><……>"

	para "…Wat? Je slaagde?" ; "…What? You passed?"
	done

DragonShrineClairThatCantBeText:
	text "Dat kan niet!" ; "That can't be!"
	done

DragonShrineClairYoureLyingText:
	text "Je liegt!" ; "You're lying!"

	para "Zelfs ik ben niet" ; "Even I haven't"
	line "goedgekeurd!" ; "been approved!"
	done

DragonShrineIUnderstandText:
	text "I-ik snap het…" ; "I-I understand…"
	done

DragonShrineHereRisingBadgeText:
	text "Hier, dit is de" ; "Here, this is the"
	line "RIJZINGSBADGE…" ; "RISINGBADGE…"

	para "Kom op! Pak aan!" ; "Hurry up! Take it!"
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "RIJZINGSBADGE." ; "RISINGBADGE."
	done

DragonShrineRisingBadgeExplanationText:
	text "De RIJZINGSBADGE" ; "RISINGBADGE will"
	line "laat je #MON" ; "enable your"

	para "met een aanval" ; "#MON to use the"
	line "watervallen be-" ; "move for climbing"
	cont "klimmen." ; "waterfalls."

	para "Ook zullen alle" ; "Also, all #MON"
	line "#MON je als" ; "will recognize you"

	para "trainer erkennen" ; "as a trainer and"
	line "en ieder commando" ; "obey your every"

	para "gehoorzamen zonder" ; "command without"
	line "uitzonderingen." ; "question."
	done

DragonShrineSpeechlessText:
	text "<……><……><……><……><……><……>"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
