	object_const_def
	const ROUTE43_SUPER_NERD1
	const ROUTE43_SUPER_NERD2
	const ROUTE43_SUPER_NERD3
	const ROUTE43_FISHER
	const ROUTE43_LASS
	const ROUTE43_YOUNGSTER
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL

Route43_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route43CheckIfRocketsScene

Route43CheckIfRocketsScene:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .NoRockets
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_ROCKET_SHAKEDOWN
	endcallback

.NoRockets:
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_NOOP
	endcallback

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBen:
	trainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBenAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	endifjustbattled
	opentext
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	readmem wBrentFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 1
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 2
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 3
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
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

.Rematch:
	jumpstd RematchMScript
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY3, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	endifjustbattled
	opentext
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue .HasPinkBow
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftrue .NumberAccepted
	checkpoke CLEFAIRY
	iffalse .NoClefairy
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	promptbutton
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffanyBeatenText, 0
	readmem wTiffanyFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.HasPinkBow:
	scall .Gift
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_TIFFANY_GAVE_PINK_BOW
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.NoClefairy:
	writetext PicnickerTiffanyClefairyText
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

.Rematch:
	jumpstd RematchFScript
	end

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

Route43FruitTree:
	fruittree FRUITTREE_ROUTE_43

Route43MaxEther:
	itemball MAX_ETHER

PokemaniacBenSeenText:
	text "Ik ben dol op" ; "I love #MON!"
	line "#MON!"

	para "Daarom begon ik" ; "That's why I"
	line "met verzamelen--" ; "started--and why"

	para "en blijf ik dat" ; "I'll keep on col-"
	line "ook doen!" ; "lecting #MON!"
	done

PokemaniacBenBeatenText:
	text "Hoe kon je mij dit" ; "How could you do"
	line "aandoen?" ; "this to me?"
	done

PokemaniacBenAfterBattleText:
	text "Wat ik leuk" ; "What else do I"
	line "vind naast #MON?" ; "like besides"

	para "MARY op de radio." ; "MARY on the radio."
	line "Echt een schatje!" ; "I bet she's cute!"
	done

PokemaniacBrentSeenText:
	text "He! Heb jij" ; "Hey! Do you have"
	line "zeldzame #MON?" ; "any rare #MON?"
	done

PokemaniacBrentBeatenText:
	text "Oh, mijn arme" ; "Oh, my poor #-"
	line "#MON! Schatjes!" ; "MON! Darlings!"
	done

PokemaniacBrentAfterBattleText:
	text "Ik zou al blij" ; "I'd be happy just"
	line "zijn met één" ; "to own a single"
	cont "zeldzame #MON." ; "rare #MON."
	done

PokemaniacRonSeenText:
	text "Moet je horen wat" ; "Would you get"
	line "mij gebeurde." ; "this?"

	para "Ene <RIVAL>-gast" ; "Some <RIVAL> guy"
	line "bespotte mijn" ; "made fun of my"
	cont "#MON!"

	para "Verdorie! Mijn" ; "Darn it! My #-"
	line "#MON zijn top!" ; "MON's great!"
	done

PokemaniacRonBeatenText:
	text "Mijn NIDOKING deed" ; "My NIDOKING did"
	line "het best goed!" ; "pretty right on!"
	done

PokemaniacRonAfterBattleText:
	text "Mensen kunnen best" ; "It's okay for"
	line "andere types" ; "people to like"

	para "#MON leuk" ; "different types"
	line "vinden." ; "of #MON."

	para "#MON draait" ; "#MON isn't just"
	line "niet alleen om" ; "about having the"
	cont "de sterksten." ; "most powerful one."
	done

FisherMarvinSeenText:
	text "Ik zit in een dip." ; "I'm in a slump."

	para "Misschien is het" ; "Maybe it's the"
	line "mijn uitrusting." ; "gear I'm using."

	para "Laten we ter af-" ; "Let's battle for a"
	line "wisseling vechten!" ; "change!"
	done

FisherMarvinBeatenText:
	text "Ik verloor, maar" ; "I lost, but I feel"
	line "ik voel me beter." ; "better anyway."
	done

FisherMarvinAfterBattleText:
	text "KURT's LOKAASBAL" ; "KURT's LURE BALL"
	line "is het beste om" ; "is the best for"

	para "opgeviste #MON te" ; "catching hooked"
	line "vangen." ; "#MON."

	para "Dan is hij veel" ; "It's much more"
	line "effectiever dan" ; "effective than a"
	cont "een HYPERBAL." ; "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "Ik kan zoveel met" ; "I can do so much"
	line "mijn #MON--echt" ; "with my #MON--"
	cont "superleuk!" ; "it's super-fun!"
	done

CamperSpencerBeatenText:
	text "Verliezen is hele-" ; "Losing isn't fun"
	line "maal niet leuk…" ; "at all…"
	done

CamperSpencerAfterBattleText:
	text "Wat is gaande bij" ; "What is going on"
	line "MEER VAN RAZERNIJ?" ; "at LAKE OF RAGE?"

	para "We wilden daar" ; "We were planning"
	line "gaan kamperen." ; "to camp there."
	done

PicnickerTiffanySeenText:
	text "Ga je ook naar" ; "Are you going to"
	line "MEER VAN RAZERNIJ?" ; "LAKE OF RAGE too?"

	para "Laten we eventjes" ; "Let's play for a "
	line "spelen!" ; "little while!"
	done

PicnickerTiffanyBeatenText:
	text "Te veel gespeeld!" ; "I played too much!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Ik picknick hier" ; "I'm having a pic-"
	line "met #MON." ; "nic with #MON."

	para "Wil je meedoen?" ; "Won't you join us?"
	done

PicnickerTiffanyClefairyText:
	text "Is mijn CLEFAIRY" ; "Isn't my CLEFAIRY"
	line "niet onwijs" ; "just the most"
	cont "schattig?" ; "adorable thing?"
	done

Route43Sign1Text:
	text "ROUTE 43"

	para "MEER VAN RAZERNIJ" ; "LAKE OF RAGE -"
	line "MAHOGANY TOWN"
	done

Route43Sign2Text:
	text "ROUTE 43"

	para "MEER VAN RAZERNIJ" ; "LAKE OF RAGE -"
	line "MAHOGANY TOWN"
	done

Route43TrainerTipsText:
	text "TRAINERTIPS"

	para "Alle #MON" ; "All #MON have"
	line "hebben voor- en" ; "pros and cons"

	para "nadelen afhangend" ; "depending on their"
	line "van hun types." ; "types."

	para "Als types anders" ; "If their types"
	line "zijn, kan een" ; "differ, a higher-"

	para "sterkere #MON" ; "level #MON may"
	line "toch verliezen." ; "lose in battle."

	para "Leer welke types" ; "Learn which types"
	line "sterk en zwak zijn" ; "are strong and"

	para "tegen het type van" ; "weak against your"
	line "je #MON." ; "#MON's type."
	done

Route43_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_READ, Route43Sign1
	bg_event 11, 49, BGEVENT_READ, Route43Sign2
	bg_event 16, 38, BGEVENT_READ, Route43TrainerTips

	def_object_events
	object_event 13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event 14,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event  9, 25, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTiffany, -1
	object_event 13, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
	object_event  1, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route43FruitTree, -1
	object_event 12, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route43MaxEther, EVENT_ROUTE_43_MAX_ETHER
