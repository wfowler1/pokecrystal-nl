	object_const_def
	const ROUTE44_FISHER1
	const ROUTE44_FISHER2
	const ROUTE44_YOUNGSTER1
	const ROUTE44_SUPER_NERD
	const ROUTE44_YOUNGSTER2
	const ROUTE44_COOLTRAINER_M
	const ROUTE44_COOLTRAINER_F
	const ROUTE44_FRUIT_TREE
	const ROUTE44_POKE_BALL1
	const ROUTE44_POKE_BALL2
	const ROUTE44_POKE_BALL3

Route44_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperVance1:
	trainer BIRD_KEEPER, VANCE1, EVENT_BEAT_BIRD_KEEPER_VANCE, BirdKeeperVance1SeenText, BirdKeeperVance1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_VANCE
	endifjustbattled
	opentext
	checkflag ENGINE_VANCE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_BIRDKEEPER_VANCE
	iftrue Route44NumberAcceptedM
	checkevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BirdKeeperVanceLegendaryBirdsText
	promptbutton
	setevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_VANCE
	ifequal PHONE_CONTACTS_FULL, Route44PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route44NumberDeclinedM
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	scall Route44RegisteredNumberM
	sjump Route44NumberAcceptedM

.WantsBattle:
	scall Route44RematchM
	winlosstext BirdKeeperVance1BeatenText, 0
	readmem wVanceFightCount
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
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	reloadmapafterbattle
	loadmem wVanceFightCount, 1
	clearflag ENGINE_VANCE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, VANCE2
	startbattle
	reloadmapafterbattle
	loadmem wVanceFightCount, 2
	clearflag ENGINE_VANCE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, VANCE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_VANCE_READY_FOR_REMATCH
	checkevent EVENT_VANCE_CARBOS
	iftrue .Carbos
	checkevent EVENT_GOT_CARBOS_FROM_VANCE
	iftrue .ReceivedCarbosBefore
	scall Route44RematchGiftM
	verbosegiveitem CARBOS
	iffalse VancePackFull
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	sjump Route44NumberAcceptedM

.ReceivedCarbosBefore:
	end

.Carbos:
	opentext
	writetext BirdKeeperVance2BeatenText
	waitbutton
	verbosegiveitem CARBOS
	iffalse VancePackFull
	clearevent EVENT_VANCE_CARBOS
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	sjump Route44NumberAcceptedM

Route44AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route44AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route44RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route44NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route44NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route44PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route44RematchM:
	jumpstd RematchMScript
	end

Route44GiftM:
	jumpstd GiftMScript
	end

Route44PackFullM:
	jumpstd PackFullMScript
	end

VancePackFull:
	setevent EVENT_VANCE_CARBOS
	jumpstd PackFullMScript
	end

Route44RematchGiftM:
	jumpstd RematchGiftMScript
	end

TrainerPsychicPhil:
	trainer PSYCHIC_T, PHIL, EVENT_BEAT_PSYCHIC_PHIL, PsychicPhilSeenText, PsychicPhilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherWilton1:
	trainer FISHER, WILTON1, EVENT_BEAT_FISHER_WILTON, FisherWilton1SeenText, FisherWilton1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_WILTON
	endifjustbattled
	opentext
	checkflag ENGINE_WILTON_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .HasItem
	checkcellnum PHONE_FISHER_WILTON
	iftrue Route44NumberAcceptedM
	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherWiltonHugePoliwagText
	promptbutton
	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_FISHER_WILTON
	ifequal PHONE_CONTACTS_FULL, Route44PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route44NumberDeclinedM
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	scall Route44RegisteredNumberM
	sjump Route44NumberAcceptedM

.WantsBattle:
	scall Route44RematchM
	winlosstext FisherWilton1BeatenText, 0
	readmem wWiltonFightCount
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
	loadtrainer FISHER, WILTON1
	startbattle
	reloadmapafterbattle
	loadmem wWiltonFightCount, 1
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, WILTON2
	startbattle
	reloadmapafterbattle
	loadmem wWiltonFightCount, 2
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, WILTON3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.HasItem:
	scall Route44GiftM
	checkevent EVENT_WILTON_HAS_ULTRA_BALL
	iftrue .UltraBall
	checkevent EVENT_WILTON_HAS_GREAT_BALL
	iftrue .GreatBall
	checkevent EVENT_WILTON_HAS_POKE_BALL
	iftrue .PokeBall
.UltraBall:
	verbosegiveitem ULTRA_BALL
	iffalse .Route44PackFullM
	sjump .ItemReceived

.GreatBall:
	verbosegiveitem GREAT_BALL
	iffalse .Route44PackFullM
	sjump .ItemReceived

.PokeBall:
	verbosegiveitem POKE_BALL
	iffalse .Route44PackFullM
.ItemReceived:
	clearflag ENGINE_WILTON_HAS_ITEM
	sjump Route44NumberAcceptedM

.Route44PackFullM:
	sjump Route44PackFullM

TrainerFisherEdgar:
	trainer FISHER, EDGAR, EVENT_BEAT_FISHER_EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherEdgarAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacZach:
	trainer POKEMANIAC, ZACH, EVENT_BEAT_POKEMANIAC_ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacZachAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAllen:
	trainer COOLTRAINERM, ALLEN, EVENT_BEAT_COOLTRAINERM_ALLEN, CooltrainermAllenSeenText, CooltrainermAllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAllenAfterBattleText
	waitbutton
	closetext
	end

Route44Sign1:
	jumptext Route44Sign1Text

Route44Sign2:
	jumptext Route44Sign2Text

Route44FruitTree:
	fruittree FRUITTREE_ROUTE_44

Route44MaxRevive:
	itemball MAX_REVIVE

Route44UltraBall:
	itemball ULTRA_BALL

Route44MaxRepel:
	itemball MAX_REPEL

Route44HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_44_HIDDEN_ELIXER

FisherWilton1SeenText:
	text "Aack! Ik verloor" ; "Aack! You made me"
	line "POLIWAG door je!" ; "lose a POLIWAG!"

	para "Wat ga je daar aan" ; "What are you going"
	line "doen?" ; "to do about it?"
	done

FisherWilton1BeatenText:
	text "Vergeet het anders" ; "Just forget about"
	line "maar." ; "it."
	done

FisherWiltonHugePoliwagText:
	text "Die POLIWAG die" ; "That POLIWAG that"
	line "ontsnapte…" ; "got away…"
	cont "Die was giga." ; "It was huge."

	para "Ik zweer het je," ; "I swear it must've"
	line "wel vijf meter!" ; "been 16 feet long!"
	done

FisherEdgarSeenText:
	text "Ik vis tot ik niet" ; "I fish until I"
	line "meer kan." ; "can't anymore."

	para "Ik vecht ook tot" ; "I also battle"
	line "ik neerval." ; "until I drop."

	para "Dat is de band die" ; "That's my"
	line "ik heb met mijn"
	cont "#MON." ; "with my #MON."
	done

FisherEdgarBeatenText:
	text "Hmmmm… "
	line "Dit is niet goed." ; "This isn't right."
	done

FisherEdgarAfterBattleText:
	text "100 keer gewonnen" ; "That's 100 wins"
	line "en 101 verloren." ; "to 101 losses."

	para "Ik ga een tijdje" ; "I won't battle"
	line "niet meer vechten." ; "again for a while."
	done

BirdKeeperVance1SeenText:
	text "Heb je gehoord van" ; "Do you know about"
	line "de legendarische" ; "the legendary bird"
	cont "vogel-#MON?" ; "#MON?"
	done

BirdKeeperVance1BeatenText:
	text "Wauw! Jij bent me" ; "Whew! You're hot"
	line "er één." ; "stuff."
	done

BirdKeeperVanceLegendaryBirdsText:
	text "ARTICUNO, ZAPDOS"
	line "en MOLTRES zijn de" ; "and MOLTRES are"

	para "drie legendarische" ; "the three legend-"
	line "vogel-#MON." ; "ary bird #MON."

	para "Ik hoorde dat er" ; "I heard there are"
	line "ook andere " ; "other legendary"
	cont "legendarische" ; "birds, though."
	cont "vogels zijn."
	done

BirdKeeperVance2BeatenText:
	text "Waarom kan ik je" ; "Why can't I ever"
	line "nooit verslaan?" ; "beat you?"

	para "Oh ja, deze is" ; "Oh yeah, here you"
	line "voor jou. Een" ; "go. It's that gift"

	para "cadeau dat ik nog" ; "I couldn't give"
	line "moest geven." ; "you last time."
	done

PsychicPhilSeenText:
	text "Ik ga zeker weten" ; "I'm gonna win,"
	line "winnen!" ; "for sure!"
	done

PsychicPhilBeatenText:
	text "Arrgh… Een" ; "Arrgh… That's a"
	line "schokkend verlies…" ; "shocking loss…"
	done

PsychicPhilAfterBattleText:
	text "Het is belangrijk" ; "It's important to"
	line "om toegewijd te" ; "have conviction"
	cont "zijn." ; "on your side."
	done

PokemaniacZachSeenText:
	text "Ik doe alles om" ; "I'll do anything"
	line "zeldzame #MON" ; "to get my hands on"
	cont "te bemachtigen!" ; "rare #MON!"
	done

PokemaniacZachBeatenText:
	text "Oooh, je #MON" ; "Oooh, your #MON"
	line "zijn aanlokkelijk." ; "are so appealing."
	done

PokemaniacZachAfterBattleText:
	text "Als een #MON" ; "If a #MON has"
	line "andere kleuren" ; "different colors"

	para "heeft dan normaal," ; "from usual, it's"
	line "is die meer waard." ; "more valuable."

	para "Wat? Zeg je dat" ; "What? You mean"
	line "het niet waar is?" ; "that's not true?"
	done

CooltrainermAllenSeenText:
	text "Ik zie aan je dat" ; "I can tell you're"
	line "je een goede" ; "a good trainer by"
	cont "trainer bent." ; "looking at you."

	para "Ik ben goed met" ; "I'm good at #-"
	line "#MON, en jij zo" ; "MON, and I can see"
	cont "te zien ook." ; "that you are too."
	done

CooltrainermAllenBeatenText:
	text "Tch! Een compleet" ; "Tch! It's a total"
	line "verlies voor mij." ; "loss on my part."
	done

CooltrainermAllenAfterBattleText:
	text "Wauw. Je hebt" ; "Wow. You have a"
	line "echt veel badges." ; "lot of BADGES."

	para "Geen wonder dat je" ; "No wonder you're"
	line "zo sterk bent." ; "so tough."

	para "Zou ECRUTEAK GYM's" ; "I wonder if"
	line "MORTY nog aan het" ; "ECRUTEAK GYM's"

	para "trainen zijn op" ; "MORTY is still in"
	line "dit moment?" ; "training?"

	para "Hij ramde me echt" ; "He really hammered"
	line "in elkaar." ; "me."
	done

CooltrainerfCybilSeenText:
	text "Je ziet er sterk" ; "You look strong."
	line "uit."

	para "Goede trainers" ; "Good trainers seek"
	line "zoeken instinctief" ; "tough opponents"
	cont "de sterksten." ; "instinctively."
	done

CooltrainerfCybilBeatenText:
	text "Nope! Dit is het" ; "Nope! This won't"
	line "niet voor mij." ; "do at all."
	done

CooltrainerfCybilAfterBattleText:
	text "We worden allemaal" ; "We all get better"
	line "beter door vaak te" ; "by experiencing"
	cont "vechten." ; "many battles."

	para "Ik vocht veel om" ; "I battled a lot to"
	line "te worden wat ik" ; "become what I am"
	cont "nu ben--een elite." ; "today--an elite."
	done

Route44Sign1Text:
	text "ROUTE 44"
	line "IJSPAD NABIJ" ; "ICE PATH AHEAD"
	done

Route44Sign2Text:
	text "ROUTE 44"

	para "MAHOGANY TOWN -"
	line "BLACKTHORN CITY"
	done

Route44_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 56,  7, ICE_PATH_1F, 1

	def_coord_events

	def_bg_events
	bg_event 53,  7, BGEVENT_READ, Route44Sign1
	bg_event  6, 10, BGEVENT_READ, Route44Sign2
	bg_event 32,  9, BGEVENT_ITEM, Route44HiddenElixer

	def_object_events
	object_event 35,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton1, -1
	object_event 19, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherEdgar, -1
	object_event 10,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicPhil, -1
	object_event 43,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacZach, -1
	object_event 51,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperVance1, -1
	object_event 41, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainermAllen, -1
	object_event 31, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfCybil, -1
	object_event  9,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route44FruitTree, -1
	object_event 30,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44MaxRevive, EVENT_ROUTE_44_MAX_REVIVE
	object_event 45,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44UltraBall, EVENT_ROUTE_44_ULTRA_BALL
	object_event 14,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44MaxRepel, EVENT_ROUTE_44_MAX_REPEL
