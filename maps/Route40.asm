	object_const_def
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route40MonicaCallback

Route40MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd SmashRockScript

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

Route40_StepRightUp6Movement: ; unreferenced
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp5Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp4Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Een warming-up" ; "You have to warm"
	line "voor het zwemmen" ; "up before going"
	cont "is belangrijk." ; "into the water."

	para "Dat weet iedereen." ; "That's basic."
	done

SwimmermSimonBeatenText:
	text "OK! Ik geef op!" ; "OK! Uncle! I give!"
	done

SwimmermSimonAfterBattleText:
	text "CIANWOOD is een" ; "CIANWOOD CITY is"
	line "aardig stuk" ; "a good distance"
	cont "verderop." ; "away from here."
	done

SwimmermRandallSeenText:
	text "He, jij bent jong" ; "Hey, you're young"
	line "en fit!" ; "and fit!"

	para "Niet op je #MON" ; "Don't ride your"
	line "rijden! Zwem!" ; "#MON! Swim!"
	done

SwimmermRandallBeatenText:
	text "Uh-oh. Ik verloor…" ; "Uh-oh. I lost…"
	done

SwimmermRandallAfterBattleText:
	text "Zwemmen traint je" ; "Swimming exercises"
	line "hele lichaam. Het" ; "your entire body."
	cont "is gezond." ; "It's healthy."
	done

SwimmerfElaineSeenText:
	text "Ga je naar" ; "Are you going to"
	line "CIANWOOD?"

	para "Wat dacht je van" ; "How about a quick"
	line "eerst vechten?" ; "battle first?"
	done

SwimmerfElaineBeatenText:
	text "Die verloor ik!" ; "I lost that one!"
	done

SwimmerfElaineAfterBattleText:
	text "Ik denk dat ik" ; "I'd say I'm a bet-"
	line "een betere zwemmer" ; "ter swimmer than"
	cont "ben. Jawel!" ; "you. Yeah!"
	done

SwimmerfPaulaSeenText:
	text "Geen zwembandjes" ; "No inner tube for"
	line "voor mij." ; "me."

	para "Ik hang aan een" ; "I'm hanging on to"
	line "zee-#MON!" ; "a sea #MON!"
	done

SwimmerfPaulaBeatenText:
	text "Ooh, ik voel me" ; "Ooh, I'm feeling"
	line "duizelig!" ; "dizzy!"
	done

SwimmerfPaulaAfterBattleText:
	text "Terwijl ik zo" ; "While I float like"
	line "drijf, nemen de" ; "this, the waves"
	cont "golven me mee." ; "carry me along."
	done

Route40Lass1Text:
	text "Je ziet het niet" ; "Although you can't"
	line "vanaf hier, maar" ; "see it from here,"

	para "CIANWOOD is in de" ; "CIANWOOD is across"
	line "verte." ; "the sea."
	done

Route40PokefanMText:
	text "Hm! Er staat een" ; "Hm! There's a big"
	line "groot gebouw daar!" ; "building up ahead!"

	para "Wat is het?" ; "What is it?"
	done

Route40PokefanMText_Mobile:
	text "Hm! Zie al die" ; "Hm! Look at all"
	line "serieus kijkende" ; "those serious-"
	cont "trainers binnen-" ; "looking trainers"
	cont "stromen." ; "streaming in."

	para "Wat? Wat?" ; "What? What?"
	done

Route40Lass2Text:
	text "Ik kwam per schip" ; "I came to OLIVINE"
	line "naar OLIVINE om de" ; "by ship to see the"

	para "omgeving te zien" ; "sights and soak up"
	line "en sfeer te" ; "the atmosphere."
	cont "proeven."

	para "Zo'n haven voelt" ; "Being a port, it"
	line "anders dan een" ; "feels so different"
	cont "grote stad." ; "from a big city."
	done

Route40StandingYoungsterText:
	text "Al de GEVECHTS-" ; "Have you gone to"
	line "TOREN bezocht?" ; "the BATTLE TOWER?"

	para "Ik denk dat veel" ; "I think a lot of"
	line "sterke trainers" ; "tough trainers"

	para "daar al zijn" ; "have gathered"
	line "samengekomen." ; "there already."

	para "Gezien al jouw" ; "But since you have"
	line "badges, kun je" ; "so many BADGES,"

	para "ze wellicht wel" ; "you shouldn't do"
	line "verslaan." ; "badly at all."
	done

MeetMonicaText:
	text "MONICA: Fijn je te" ; "MONICA: Glad to"
	line "ontmoeten. Ik ben" ; "meet you. I'm"

	para "maandagse MONICA." ; "MONICA of Monday."
	done

MonicaGivesGiftText:
	text "Als teken van" ; "As a token of our"
	line "vriendschap heb ik" ; "friendship, I have"
	cont "een cadeautje!" ; "a gift for you!"
	done

MonicaGaveGiftText:
	text "MONICA: Het is een" ; "MONICA: It's an"
	line "voorwerp dat" ; "item that raises"

	para "vlieg-aanvallen" ; "the power of fly-"
	line "sterker maakt." ; "ing-type moves."

	para "Geef het aan een" ; "You should equip a"
	line "vogel-#MON in" ; "bird #MON with"
	cont "je team." ; "that item."
	done

MonicaMondayText:
	text "MONICA: Mijn" ; "MONICA: My broth-"
	line "boers en zussen" ; "ers and sisters"

	para "zijn overal te" ; "are all over the"
	line "vinden." ; "place."

	para "Probeer ze alle-" ; "See if you could"
	line "maal te ontmoeten!" ; "find them all!"
	done

MonicaNotMondayText:
	text "MONICA: Helaas," ; "MONICA: I don't"
	line "vandaag is het" ; "think today is"
	cont "geen maandag…" ; "Monday. How sad…"
	done

Route40SignText:
	text "ROUTE 40"

	para "CIANWOOD CITY -"
	line "OLIVINE CITY"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	def_object_events
	object_event 14, 15, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 16,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
