	object_const_def
	const ROUTE31_FISHER
	const ROUTE31_YOUNGSTER
	const ROUTE31_BUG_CATCHER
	const ROUTE31_COOLTRAINER_M
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2

Route31_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route31CheckMomCallCallback

Route31CheckMomCallCallback:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse .DoMomCall
	endcallback

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	endcallback

TrainerBugCatcherWade1:
	trainer BUG_CATCHER, WADE1, EVENT_BEAT_BUG_CATCHER_WADE, BugCatcherWade1SeenText, BugCatcherWade1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_WADE
	endifjustbattled
	opentext
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftrue .WadeRematch
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .WadeItem
	checkcellnum PHONE_BUG_CATCHER_WADE
	iftrue .AcceptedNumberSTD
	checkevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext BugCatcherWade1AfterText
	waitbutton
	setevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumberSTD
	sjump .Continue

.AskAgain:
	scall .AskAgainSTD
.Continue:
	askforphonenumber PHONE_BUG_CATCHER_WADE
	ifequal PHONE_CONTACTS_FULL, .PhoneFullSTD
	ifequal PHONE_CONTACT_REFUSED, .DeclinedNumberSTD
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall .RegisterNumberSTD
	sjump .AcceptedNumberSTD

.WadeRematch:
	scall .RematchSTD
	winlosstext BugCatcherWade1BeatenText, 0
	readmem wWadeFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 1
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 2
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 3
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 4
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.WadeItem:
	scall .ItemSTD
	checkevent EVENT_WADE_HAS_BERRY
	iftrue .Berry
	checkevent EVENT_WADE_HAS_PSNCUREBERRY
	iftrue .Psncureberry
	checkevent EVENT_WADE_HAS_PRZCUREBERRY
	iftrue .Przcureberry
	checkevent EVENT_WADE_HAS_BITTER_BERRY
	iftrue .BitterBerry
.Berry:
	verbosegiveitem BERRY
	iffalse .PackFull
	sjump .Done
.Psncureberry:
	verbosegiveitem PSNCUREBERRY
	iffalse .PackFull
	sjump .Done
.Przcureberry:
	verbosegiveitem PRZCUREBERRY
	iffalse .PackFull
	sjump .Done
.BitterBerry:
	verbosegiveitem BITTER_BERRY
	iffalse .PackFull
.Done:
	clearflag ENGINE_WADE_HAS_ITEM
	sjump .AcceptedNumberSTD
.PackFull:
	sjump .PackFullSTD

.AskPhoneNumberSTD:
	jumpstd AskNumber1MScript
	end

.AskAgainSTD:
	jumpstd AskNumber2MScript
	end

.RegisterNumberSTD:
	jumpstd RegisteredNumberMScript
	end

.AcceptedNumberSTD:
	jumpstd NumberAcceptedMScript
	end

.DeclinedNumberSTD:
	jumpstd NumberDeclinedMScript
	end

.PhoneFullSTD:
	jumpstd PhoneFullMScript
	end

.RematchSTD:
	jumpstd RematchMScript
	end

.ItemSTD:
	jumpstd GiftMScript
	end

.PackFullSTD:
	jumpstd PackFullMScript
	end

Route31MailRecipientScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue .DescribeNightmare
	checkevent EVENT_GOT_KENYA
	iftrue .TryGiveKenya
	writetext Text_Route31SleepyMan
	waitbutton
	closetext
	end

.TryGiveKenya:
	writetext Text_Route31SleepyManGotMail
	promptbutton
	checkpokemail ReceivedSpearowMailText
	ifequal POKEMAIL_WRONG_MAIL, .WrongMail
	ifequal POKEMAIL_REFUSED, .Refused
	ifequal POKEMAIL_NO_MAIL, .NoMail
	ifequal POKEMAIL_LAST_MON, .LastMon
	; POKEMAIL_CORRECT
	writetext Text_Route31HandOverMailMon
	promptbutton
	writetext Text_Route31ReadingMail
	promptbutton
	setevent EVENT_GAVE_KENYA
	verbosegiveitem TM_NIGHTMARE
	iffalse .NoRoomForItems
	setevent EVENT_GOT_TM50_NIGHTMARE
.DescribeNightmare:
	writetext Text_Route31DescribeNightmare
	waitbutton
.NoRoomForItems:
	closetext
	end

.WrongMail:
	writetext Text_Route31WrongMail
	waitbutton
	closetext
	end

.NoMail:
	writetext Text_Route31MissingMail
	waitbutton
	closetext
	end

.Refused:
	writetext Text_Route31DeclinedToHandOverMail
	waitbutton
	closetext
	end

.LastMon:
	writetext Text_Route31CantTakeLastMon
	waitbutton
	closetext
	end

ReceivedSpearowMailText:
	db   "DUISTERE GROT leidt" ; "DARK CAVE leads"
	next "naar andere weg" ; "to another road@"

Route31YoungsterScript:
	jumptextfaceplayer Route31YoungsterText

Route31Sign:
	jumptext Route31SignText

DarkCaveSign:
	jumptext DarkCaveSignText

Route31CooltrainerMScript:
	jumptextfaceplayer Route31CooltrainerMText

Route31FruitTree:
	fruittree FRUITTREE_ROUTE_31

Route31Potion:
	itemball POTION

Route31PokeBall:
	itemball POKE_BALL

Route31CooltrainerMText:
	text "DUISTERE GROT…" ; "DARK CAVE…"

	para "Als #MON het" ; "If #MON could"
	line "konden verlichten," ; "light it up, I'd"
	cont "zou ik verkennen" ; "explore it."
	done

BugCatcherWade1SeenText:
	text "Ik heb een hoop" ; "I caught a bunch"
	line "#MON gevangen." ; "#MON. Let me"
	cont "Laten we vechten!" ; "battle with you!"
	done

BugCatcherWade1BeatenText:
	text "Awwwww…"
	done

BugCatcherWade1AfterText:
	text "Zelfs als je zes" ; "You can catch"
	line "#MON hebt kun" ; "#MON even if"

	para "je er meer" ; "you have six with"
	line "vangen." ; "you."

	para "Ze worden dan" ; "If you catch one,"
	line "automatisch naar" ; "it'll go to your"
	cont "je BOX gestuurd." ; "BOX automatically."
	done

Text_Route31SleepyMan:
	text "… Hnuurg… Huh?"

	para "Ik heb vandaag te" ; "I walked too far"
	line "veel gelopen toen" "today looking for"
	cont "ik #MON zocht." ; "#MON."

	para "Ik heb zere voeten" ; "My feet hurt and"
	line "en ben moe…" ; "I'm sleepy…"

	para "Als ik een wilde" ; "If I were a wild"
	line "#MON was, was" ; "#MON, I'd be"
	cont "ik zo te vangen…" ; "easy to catch…"

	para "…Zzzz…"
	done

Text_Route31SleepyManGotMail:
	text "…Zzzz… Huh?"

	para "Wat is dat? Heb je" ; "What's that? You"
	line "POST voor me?" ; "have MAIL for me?"
	done

Text_Route31HandOverMailMon:
	text "<PLAYER> gaf" ; "<PLAYER> handed"
	line "de #MON die" ; "over the #MON"
	cont "POST vasthoudt." ; "holding the MAIL."
	done

Text_Route31ReadingMail:
	text "Eens zien…" ; "Let's see…"

	para "DUISTERE GROT gaat" ; "…DARK CAVE leads"
	line "naar andere weg…" ; "to another road…"

	para "Dat is goed om te" ; "That's good to"
	line "weten." ; "know."

	para "Bedankt dat je dit" ; "Thanks for bring-"
	line "naar me bracht." ; "ing this to me."

	para "Mijn vriend is een" ; "My friend's a good"
	line "goede gast, en jij" ; "guy, and you're"
	cont "ben ook oke!" ; "swell too!"

	para "Ik wil ook iets" ; "I'd like to do"
	line "goeds doen als" ; "something good in"
	cont "bedankje!" ; "return too!"

	para "Ik weet al wat!" ; "I know! I want you"
	line "je mag dit hebben!" ; "to have this!"
	done

Text_Route31DescribeNightmare:
	text "TM50 is" ; "TM50 is NIGHTMARE."
	line "NACHTMERRIE."

	para "het is een brute" ; "It's a wicked move"
	line "aanval die de LP" ; "that steadily cuts"

	para "van een slapende" ; "the HP of a sleep-"
	line "vijand tapt. ; "ing enemy.""

	para "Ooooh…"
	line "Wat eng…" "That's scary…"

	para "Ik wil geen nare" ; "I don't want to"
	line "dromen hebben." ; "have bad dreams."
	done

Text_Route31WrongMail:
	text "Deze POST is niet" ; "This MAIL isn't"
	line "voor mij." ; "for me."
	done

Text_Route31MissingMail:
	text "Waarom is deze" ; "Why is this #-"
	line "#MON speciaal?" ; "MON so special?"

	para "Hij heeft geen" ; "It doesn't have"
	line "POST." ; "any MAIL."
	done

Text_Route31DeclinedToHandOverMail:
	text "Wat? Wil je hele-" ; "What? You don't"
	line "maal niks?" ; "want anything?"
	done

Text_Route31CantTakeLastMon:
	text "Als ik die #MON" ; "If I take that"
	line "van je afneem," ; "#MON from you,"

	para "waar ga je dan mee" ; "what are you going"
	line "vechten?" ; "to use in battle?"
	done

Route31YoungsterText:
	text "Ik vond een goede" ; "I found a good"
	line "#MON in de" ; "#MON in DARK"
	cont "DUISTERE GROT." ; "CAVE."

	para "Ik ga hem trainen" ; "I'm going to raise"
	line "om te vechten" ; "it to take on"
	cont "tegen FALKNER." ; "FALKNER."

	para "Hij leidt VIOLET" ; "He's the leader of"
	line "CITY's GYM." ; "VIOLET CITY's GYM."
	done

Route31SignText:
	text "ROUTE 31"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done

DarkCaveSignText:
	text "DUISTERE GROT" ; "DARK CAVE"
	done

Route31_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  6, ROUTE_31_VIOLET_GATE, 3
	warp_event  4,  7, ROUTE_31_VIOLET_GATE, 4
	warp_event 34,  5, DARK_CAVE_VIOLET_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event  7,  5, BGEVENT_READ, Route31Sign
	bg_event 31,  5, BGEVENT_READ, DarkCaveSign

	def_object_events
	object_event 17,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31MailRecipientScript, -1
	object_event  9,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31YoungsterScript, -1
	object_event 21, 13, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherWade1, -1
	object_event 33,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31CooltrainerMScript, -1
	object_event 16,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31FruitTree, -1
	object_event 29,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31Potion, EVENT_ROUTE_31_POTION
	object_event 19, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31PokeBall, EVENT_ROUTE_31_POKE_BALL
