	object_const_def
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

Route25_MapScripts:
	def_scene_scripts
	scene_script Route25Noop1Scene, SCENE_ROUTE25_NOOP
	scene_script Route25Noop2Scene, SCENE_ROUTE25_MISTYS_DATE

	def_callbacks

Route25Noop1Scene:
	end

Route25Noop2Scene:
	end

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement1
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement1
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement1
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement2
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement2
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement2
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue .AfterBattle
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoomForNugget
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	opentext
.AfterBattle:
	writetext CooltrainermKevinAfterBattleText
	waitbutton
.NoRoomForNugget:
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

Route25MistysDateLeavesMovement1:
	big_step DOWN
	step_end

Route25MistysDateLeavesMovement2:
	big_step DOWN
	big_step DOWN
	step_end

Route25MistyApproachesPlayerMovement1:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyApproachesPlayerMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement1:
	step DOWN
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement2:
	step UP
	step LEFT
	step_end

Route25MistyLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "MISTY: Aww!" ; "MISTY: Aww! Why"
	line "Waarom kom je" ; "did you have to"

	para "hier en onderbreek" ; "show up and bug us"
	line "je ons nu?" ; "now?"

	para "Weet je hoe ze" ; "Do you know what"
	line "mensen zoals jij" ; "they call people"
	cont "noemen?" ; "like you?"

	para "Ettertjes! Je" ; "Pests! You heard"
	line "hoort me, ettertje!" ; "me right, pest!"

	para "…"

	para "…Oh? Die BADGES" ; "…Oh? Those BADGES"
	line "die je hebt… Zijn" ; "you have… Are they"
	cont "dat JOHTO-GYMBADGES?" ; "JOHTO GYM BADGES?"

	para "Als je er acht hebt," ; "If you have eight,"
	line "ben je vast goed." ; "you must be good."

	para "Oké dan. Kom naar" ; "OK, then. Come to"
	line "de CERULEAN GYM." ; "CERULEAN GYM."

	para "Ik neem het graag" ; "I'll be happy to"
	line "tegen je op." ; "take you on."

	para "Ik ben MISTY, de" ; "I'm MISTY, the"
	line "GYMLEIDER in" ; "GYM LEADER in"
	cont "CERULEAN."
	done

SchoolboyDudleySeenText:
	text "Versla zes van" ; "Beat the six of us"
	line "ons trainers om" ; "trainers to win a"
	cont "een fantastische" ; "fabulous prize!"
	cont "prijs te winnen!" ;

	para "Denk je dat je" ; "Think you've got"
	line "het aan kan?" ; "what it takes?"
	done

SchoolboyDudleyBeatenText:
	text "Wow! Goed gedaan." ; "Whoo! Good stuff."
	done

SchoolboyDudleyAfterBattleText:
	text "Ik deed mijn best." ; "I did my best."
	line "Ik heb geen spijt." ; "I have no regrets."
	done

LassEllenSeenText:
	text "Ik ben tweede. Nu" ; "I'm second."
	line "wordt het menens!" ; "Now it's serious!"
	done

LassEllenBeatenText:
	text "Hoe kon ik" ; "How could I lose?"
	line "verliezen?" ;
	done

LassEllenAfterBattleText:
	text "Ik deed mijn best." ; "I did my best."
	line "Ik heb geen spijt." ; "I have no regrets."
	done

SchoolboyJoeSeenText:
	text "Hier is nr. 3!" ; "Here's No. 3!"
	line "Ik hou me niet in." ; "I won't be easy."
	done

SchoolboyJoeBeatenText:
	text "Auw! Verpletterd!" ; "Ow! Stomped flat!"
	done

SchoolboyJoeAfterBattleText:
	text "Ik deed mijn best." ; "I did my best."
	line "Ik heb geen spijt." ; "I have no regrets."
	done

LassLauraSeenText:
	text "Ik ben nr. 4!" ; "I'm No. 4!"
	line "Ben je al moe?" ; "Getting tired?"
	done

LassLauraBeatenText:
	text "Ik verloor ook…" ; "I lost too…"
	done

LassLauraAfterBattleText:
	text "Ik deed mijn best." ; "I did my best."
	line "Ik heb geen spijt." ; "I have no regrets."
	done

CamperLloydSeenText:
	text "Oké! Ik ben nr. 5." ; "OK! I'm No. 5."
	line "Ik maak je af!" ; "I'll stomp you!"
	done

CamperLloydBeatenText:
	text "Wow! Te veel." ; "Whoa! Too much."
	done

CamperLloydAfterBattleText:
	text "Ik deed mijn best." ; "I did my best."
	line "Ik heb geen spijt." ; "I have no regrets."
	done

LassShannonSeenText:
	text "Ik ben de laatste," ; "I'm the last in"
	line "maar ik zeg je," ; "line, but I tell"
	cont "ik ben pittig!" ; "you, I'm tough!"
	done

LassShannonBeatenText:
	text "Meen je niet." ; "You're kidding."
	done

LassShannonAfterBattleText:
	text "Ik deed mijn best." ; "I did my best."
	line "Ik heb geen spijt." ; "I have no regrets."
	done

SupernerdPatSeenText:
	text "Mehehehe…" ; "Mufufufu…"

	para "Ik heb niets met" ; "I have nothing to"
	line "het zestal trainers" ; "do with the six-"
	cont "te maken." ; "pack trainers."

	para "Ik wachtte hier om" ; "I waited here to"
	line "je te verslaan" ; "beat you when you"

	para "zodra de gevechten" ; "were tired out by"
	line "je vermoeiden." ; "all the battles."
	done

SupernerdPatBeatenText:
	text "Ben je helemaal" ; "Aren't you tired"
	line "niet moe?" ; "at all?"
	done

SupernerdPatAfterBattleText:
	text "Sorry… Ik zal niet" ; "I'm sorry… I won't"
	line "meer valsspelen…" ; "cheat anymore…"
	done

CooltrainermKevinNuggetText:
	text "Je deed één" ; "You took on one"
	line "gevecht meer dan" ; "more battle than"

	para "je verwachtte," ; "you expected, but"
	line "maar je won toch." ; "you won anyway."

	para "Zoals beloofd win" ; "As promised, you"
	line "je een prijs." ; "win a prize."
	done

CooltrainermKevinSeenText:
	text "Maar nadat ik heb" ; "But after seeing"
	line "gezien hoe je vecht," ; "how you battle, I"

	para "wil ik weten hoe" ; "want to see how"
	line "ik het doe." ; "I'll fare."

	para "Wat denk je? Laat" ; "How about it? Let"
	line "mij je uitdagen." ; "me take you on."
	done

CooltrainermKevinBeatenText:
	text "Zo'n goed gevecht" ; "I've never had a"
	line "had ik nog nooit!" ; "battle this good!"
	done

CooltrainermKevinAfterBattleText:
	text "Dat was een" ; "That was a great"
	line "goed gevecht!" ; "battle!"

	para "Jij en je #MON" ; "You and your #-"
	line "zijn echt" ; "MON are truly out-"
	cont "indrukwekkend!" ; "standing!"
	done

BillsHouseSignText:
	text "ZEEHUISJE" ; "SEA COTTAGE"
	line "HUIS VAN BILL" ; "BILL'S HOUSE"
	done

UnusedBillsHouseSignText: ; unreferenced
	text "HUISJE VAN BILL" ; "BILL'S HOUSE"
	done

Route25_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 47,  5, BILLS_HOUSE, 1

	def_coord_events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	def_bg_events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion

	def_object_events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 31,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	object_event 37,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
