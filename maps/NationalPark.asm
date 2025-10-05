	object_const_def
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_YOUNGSTER3
	const NATIONALPARK_POKEFAN_F2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_GAMEBOY_KID
	const NATIONALPARK_POKE_BALL2

NationalPark_MapScripts:
	def_scene_scripts

	def_callbacks

NationalParkLassScript:
	jumptextfaceplayer NationalParkLassText

NationalParkPokefanFScript:
	jumptextfaceplayer NationalParkPokefanFText

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

NationalParkYoungster1Script:
	jumptextfaceplayer NationalParkYoungster1Text

NationalParkYoungster2Script:
	jumptextfaceplayer NationalParkYoungster2Text

NationalParkTeacher2Script:
	jumptextfaceplayer NationalParkTeacher2Text

NationalParkPersian:
	faceplayer
	opentext
	writetext NationalParkPersianText
	cry PERSIAN
	waitbutton
	closetext
	end

NationalParkGameboyKidScript:
	faceplayer
	opentext
	writetext NationalParkGameboyKidText
	waitbutton
	closetext
	turnobject NATIONALPARK_GAMEBOY_KID, DOWN
	end

TrainerSchoolboyJack1:
	trainer SCHOOLBOY, JACK1, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_JACK
	endifjustbattled
	opentext
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_SCHOOLBOY_JACK
	iftrue .NumberAccepted
	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext SchoolboyJackTradeMonText
	promptbutton
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext SchoolboyJack1BeatenText, 0
	readmem wJackFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 1
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 2
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 3
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 4
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	endifjustbattled
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .GiveNugget
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftrue .NumberAccepted
	checkpoke MARILL
	iffalse .NoMarill
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PokefanBeverlyCuteMonText
	promptbutton
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.GiveNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.NoMarill:
	writetext PokefanFBeverlyMarillFriendText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkBattleNoticeSign:
	jumptext NationalParkBattleNoticeText

NationalParkTrainerTipsSign:
	jumptext NationalParkTrainerTipsText

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkLassText:
	text "Kijk! Moet je mijn" ; "Look! Check out my"
	line "tas zien!" ; "bag!"

	para "Ik heb mijn" ; "I printed out my"
	line "favorieten uit de" ; "favorites from my"

	para "#DEX afgedrukt" ; "#DEX and stuck"
	line "en er opgeplakt." ; "them on my bag."
	done

NationalParkPokefanFText:
	text "Deze POST kreeg ik" ; "This is MAIL I got"
	line "van mijn dochter." ; "from my daughter."
	cont "Word ik blij van." ; "It cheers me up."
	done

NationalParkTeacher1Text:
	text "Opletten," ; "Pay attention,"
	line "alsjeblieft!" ; "please!"

	para "…Oeps. Ik moet" ; "…Oops, I have to"
	line "stoppen steeds te" ; "quit thinking like"

	para "denken als een" ; "a teacher all the"
	line "leraar." ; "time."

	para "Jij bent vast een" ; "You must be a"
	line "#MON-trainer." ; "#MON trainer."

	para "Gezien je zo hard" ; "Since you're work-"
	line "werkt, wil ik dit" ; "ing so hard, I"

	para "graag aan je" ; "want you to have"
	line "geven." ; "this."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Geef een #MON" ; "Let a #MON hold"
	line "die SNELKLAUW." ; "that QUICK CLAW."

	para "Die zal dan soms" ; "Sometimes it will"
	line "als eerste in ge-" ; "strike first"
	cont "vechten toeslaan." ; "during battle."
	done

NationalParkYoungster1Text:
	text "Ik speel met" ; "I'm playing with"
	line "stickers geprint" ; "stickers I printed"
	cont "uit de #DEX." ; "from my #DEX."
	done

NationalParkYoungster2Text:
	text "Ik krijg stickers" ; "I get the other"
	line "van die andere" ; "guy's #DEX"
	cont "gast als ik win." ; "sticker if I win."
	done

NationalParkTeacher2Text:
	text "Ik wandel in het" ; "I take walks in"
	line "het PARK, maar" ; "the PARK, but I"

	para "loop nooit in het" ; "never go into the"
	line "gras." ; "grass."

	para "Trainers willen" ; "Trainers always"
	line "altijd vechten…" ; "want to battle…"
	done

NationalParkPersianText:
	text "PERSIAN: Fufushaa!"
	done

NationalParkGameboyKidText:
	text "Ik druk mijn" ; "I'm printing out"
	line "#DEX af." ; "my #DEX."

	para "Je kunt ook dingen" ; "You can also print"
	line "als POST en je" ; "out stuff like"

	para "PC-BOXEN" ; "MAIL and your PC"
	line "afdrukken." ; "BOXES."
	done

SchoolboyJack1SeenText:
	text "De wereld van" ; "The world of"
	line "#MON is diep." ; "#MON is deep."

	para "Er is veel dat" ; "There are still"
	line "we nog steeds" ; "lots of things we"
	cont "niet weten." ; "don't know."

	para "Maar ik weet meer" ; "But I know more"
	line "dan jij!" ; "than you do!"
	done

SchoolboyJack1BeatenText:
	text "Wa-wa-wat?" ; "Wha-wha-what?"
	done

SchoolboyJackTradeMonText:
	text "Er is nog veel te" ; "There is a lot"
	line "leren." ; "to learn."

	para "Bijvoorbeeld…" ; "For example…"

	para "Er zijn {d:NUM_TMS} soorten" ; "There are {d:NUM_TMS} kinds"
	line "TMs." ; "of TMs."

	para "Geruilde #MON" ; "Traded #MON"
	line "groeien sneller." ; "level up faster."
	done

PokefanfBeverly1SeenText:
	text "Mijn #MON zijn" ; "My #MON are"
	line "echt schatjes." ; "simply darling."

	para "Laat me vertellen" ; "Let me tell you"
	line "hoe trots mijn" ; "how proud my"
	cont "schatjes me maken." ; "darlings make me."
	done

PokefanfBeverly1BeatenText:
	text "Ik ben trotser dan" ; "I can beat you in"
	line "jij, maar…" ; "pride, but…"
	done

PokefanBeverlyCuteMonText:
	text "Ik moet zeggen, je" ; "I must say, your"
	line "#MON zijn ook" ; "#MON are quite"
	cont "best schattig." ; "cute, too."
	done

PokefanmWilliamSeenText:
	text "We adoreren onze" ; "We adore our #-"
	line "#MON, zelfs als" ; "MON, even if they"
	cont "ze ons niet mogen." ; "dislike us."

	para "Dat is het leven" ; "That's what being"
	line "van een FAN." ; "a FAN is about."
	done

PokefanmWilliamBeatenText:
	text "M-mijn #MON!" ; "M-my #MON!"
	done

PokefanmWilliamAfterBattleText:
	text "Ik verloor het" ; "I lost the battle,"
	line "gevecht, maar mijn" ; "but my #MON win"

	para "#MON blijft de" ; "the prize for"
	line "schattigste." ; "being most lovely."
	done

PokefanFBeverlyMarillFriendText:
	text "Mijn vriend heeft" ; "My friend keeps a"
	line "een MARILL!" ; "MARILL!"

	para "Ik vind ze erg" ; "I find them very"
	line "vertederend." ; "endearing."

	para "Oh, had ik maar" ; "Oh, I wish for a"
	line "een eigen MARILL…" ; "MARILL of my own…"
	done

LassKriseSeenText:
	text "Hallo? Waarom" ; "Hello? Why are you"
	line "staar je zo?" ; "staring at me?"

	para "Oh, een gevecht?" ; "Oh, a battle?"
	done

LassKriseBeatenText:
	text "…Hmmm…"
	done

LassKriseAfterBattleText:
	text "Ik dacht dat je" ; "I thought you were"
	line "staarde omdat ik" ; "staring at me"
	cont "schattig ben!" ; "because I'm cute!"
	done

NationalParkRelaxationSquareText:
	text "ONTSPANPLEIN" ; "RELAXATION SQUARE"
	line "NATIONAAL PARK" ; "NATIONAL PARK"
	done

NationalParkBattleNoticeText:
	text "Wat is dit voor" ; "What is this"
	line "bericht?" ; "notice?"

	para "Vecht alleen in" ; "Please battle only"
	line "het gras." ; "in the grass."

	para "NATIONAAL PARK" ; "NATIONAL PARK"
	line "BOSWACHTERSHUISJE" ; "WARDEN'S OFFICE"
	done

NationalParkTrainerTipsText:
	text "TRAINERTIPS" ; "TRAINER TIPS"

	para "Print POST door 't" ; "Print out MAIL by"
	line "te openen en op" ; "opening it then"
	cont "START te drukken." ; "pressing START."
	done

NationalPark_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 14, 44, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkBattleNoticeSign
	bg_event  6, 47, BGEVENT_ITEM, NationalParkHiddenFullHeal
	bg_event 12,  4, BGEVENT_READ, NationalParkTrainerTipsSign

	def_object_events
	object_event 15, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanFScript, -1
	object_event 27, 40, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 11, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster1Script, -1
	object_event 10, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 17, 41, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event 26, 40, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event 27, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	object_event 18, 29, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 16,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event  8, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassKrise, -1
	object_event 35, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 26,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event  1, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_DIG
