	object_const_def
	const ROUTE46_POKEFAN_M
	const ROUTE46_YOUNGSTER
	const ROUTE46_LASS
	const ROUTE46_FRUIT_TREE1
	const ROUTE46_FRUIT_TREE2
	const ROUTE46_POKE_BALL

Route46_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperTed:
	trainer CAMPER, TED, EVENT_BEAT_CAMPER_TED, CamperTedSeenText, CamperTedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperTedAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerErin1:
	trainer PICNICKER, ERIN1, EVENT_BEAT_PICNICKER_ERIN, PicnickerErin1SeenText, PicnickerErin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_ERIN
	endifjustbattled
	opentext
	checkflag ENGINE_ERIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_PICNICKER_ERIN
	iftrue Route46NumberAcceptedF
	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerErinAfterBattleText
	promptbutton
	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	scall Route46AskNumber1F
	sjump .AskForNumber

.AskedAlready:
	scall Route46AskNumber2F
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_ERIN
	ifequal PHONE_CONTACTS_FULL, Route46PhoneFullF
	ifequal PHONE_CONTACT_REFUSED, Route46NumberDeclinedF
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall Route46RegisteredNumberF
	sjump Route46NumberAcceptedF

.WantsBattle:
	scall Route46RematchF
	winlosstext PicnickerErin1BeatenText, 0
	readmem wErinFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, ERIN1
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 1
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, ERIN2
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 2
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, ERIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	checkevent EVENT_ERIN_CALCIUM
	iftrue .HasCalcium
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftrue .GotCalciumAlready
	scall Route46RematchGiftF
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjump Route46NumberAcceptedF

.GotCalciumAlready:
	end

.HasCalcium:
	opentext
	writetext PicnickerErin2BeatenText
	waitbutton
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	clearevent EVENT_ERIN_CALCIUM
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjump Route46NumberAcceptedF

Route46AskNumber1F:
	jumpstd AskNumber1FScript
	end

Route46AskNumber2F:
	jumpstd AskNumber2FScript
	end

Route46RegisteredNumberF:
	jumpstd RegisteredNumberFScript
	end

Route46NumberAcceptedF:
	jumpstd NumberAcceptedFScript
	end

Route46NumberDeclinedF:
	jumpstd NumberDeclinedFScript
	end

Route46PhoneFullF:
	jumpstd PhoneFullFScript
	end

Route46RematchF:
	jumpstd RematchFScript
	end

ErinNoRoomForCalcium:
	setevent EVENT_ERIN_CALCIUM
	jumpstd PackFullFScript
	end

Route46RematchGiftF:
	jumpstd RematchGiftFScript
	end

TrainerHikerBailey:
	trainer HIKER, BAILEY, EVENT_BEAT_HIKER_BAILEY, HikerBaileySeenText, HikerBaileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBaileyAfterBattleText
	waitbutton
	closetext
	end

Route46Sign:
	jumptext Route46SignText

Route46XSpeed:
	itemball X_SPEED

Route46FruitTree1:
	fruittree FRUITTREE_ROUTE_46_1

Route46FruitTree2:
	fruittree FRUITTREE_ROUTE_46_2

HikerBaileySeenText:
	text "Oke! Ik laat je" ; "Awright! I'll show"
	line "de kracht zien van" ; "you the power of"
	cont "berg-#MON!" ; "mountain #MON!"
	done

HikerBaileyBeatenText:
	text "Genade! Je liet me" ; "Mercy! You showed"
	line "jouw kracht zien!" ; "me your power!"
	done

HikerBaileyAfterBattleText:
	text "Het is voorbij." ; "It's over. I don't"
	line "Prima hoor. Zo" ; "mind. We HIKERS"
	cont "zijn wandelaars." ; "are like that."
	done

CamperTedSeenText:
	text "Ik voed ook #-" ; "I'm raising #-"
	line "MON op!" ; "MON too!"

	para "Wil je met mij" ; "Will you battle"
	line "vechten?" ; "with me?"
	done

CamperTedBeatenText:
	text "Wa…?" ; "Wha…?"
	done

CamperTedAfterBattleText:
	text "Ik deed mijn best" ; "I did my best but"
	line "en faalde toch." ; "came up short."

	para "Geen smoesjes--Ik" ; "No excuses--I"
	line "verloor van je." ; "admit I lost."
	done

PicnickerErin1SeenText:
	text "Ik voed ook #-" ; "I raise #MON"
	line "MON op!" ; "too!"

	para "Wil je met mij" ; "Will you battle"
	line "vechten?" ; "with me?"
	done

PicnickerErin1BeatenText:
	text "Oh, drommels!" ; "Oh, rats!"
	done

PicnickerErinAfterBattleText:
	text "Ik heb veel GYMs" ; "I've been to many"
	line "bezocht, maar die" ; "GYMS, but the GYM"

	para "in GOLDENROD is" ; "in GOLDENROD is my"
	line "mijn favoriet." ; "favorite."

	para "Hij staat vol met" ; "It's filled with"
	line "mooie bloemen!" ; "pretty flowers!"
	done

PicnickerErin2BeatenText:
	text "Aww… Ik blijf maar" ; "Aww… I keep losing"
	line "steeds verliezen!" ; "all the time!"

	para "Ik moet meer mijn" ; "I'll just have to"
	line "best gaan doen!" ; "try harder!"

	para "Hoe dan ook, be-" ; "Anyway, thanks for"
	line "dankt dat je weer" ; "battling me again"

	para "wilde vechten. En" ; "and again. Here's"
	line "hier is dat cadeau" ; "that present from"
	cont "van laatst." ; "the other time."
	done

Route46SignText:
	text "ROUTE 46"
	line "BERGPAD NABIJ" ; "MOUNTAIN RD. AHEAD"
	done

Route46_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 33, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  8, 33, ROUTE_29_ROUTE_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_READ, Route46Sign

	def_object_events
	object_event 12, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBailey, -1
	object_event  4, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperTed, -1
	object_event  2, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree2, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46XSpeed, EVENT_ROUTE_46_X_SPEED
