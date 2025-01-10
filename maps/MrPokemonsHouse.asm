	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_script MrPokemonsHouseNoopScene,          SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

MrPokemonsHouseMeetMrPokemonScene:
	sdefer MrPokemonsHouseMrPokemonEventScript
	end

MrPokemonsHouseNoopScene:
	end

MrPokemonsHouseMrPokemonEventScript:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInFromBlack
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Hallo, hallo! Jij" ; "Hello, hello! You"
	line "bent vast <PLAY_G>." ; "must be <PLAY_G>."

	para "PROF.ELM zei al" ; "PROF.ELM said that"
	line "dat je langskwam." ; "you would visit."
	done

MrPokemonIntroText2:
	text "Dit is wat PROF." ; "This is what I"
	line "ELM voor mij moet" ; "want PROF.ELM to"
	cont "onderzoeken." ; "examine."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "MYSTERIE-EI." ; "MYSTERY EGG."
	done

MrPokemonIntroText3:
	text "Ik ken een stel" ; "I know a couple"
	line "met een #MON-" ; "who run a #MON"
	cont "DAGVERBLIJF." ; "DAY-CARE service."

	para "Zij gaven mij dit" ; "They gave me that"
	line "EI." ; "EGG."

	para "Ik raakte geïntri-" ; "I was intrigued,"
	line "geerd, dus stuurde" ; "so I sent mail to"
	cont "PROF.ELM een mail." ; "PROF.ELM."

	para "PROF.ELM is de" ; "For #MON evolu-"
	line "autoriteit over" ; "tion, PROF.ELM is"
	cont "#MON-evolutie." ; "the authority."
	done

MrPokemonIntroText4:
	text "Zelfs PROF.OAK" ; "Even PROF.OAK here"
	line "hier erkent dat." ; "recognizes that."
	done

MrPokemonIntroText5:
	text "Als mijn aanname" ; "If my assumption"
	line "klopt, weet PROF." ; "is correct, PROF."
	cont "ELM wat te doen." ; "ELM will know it."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Ga je terug naar" ; "You are returning"
	line "PROF.ELM?" ; "to PROF.ELM?"

	para "Hier. Je #MON" ; "Here. Your #MON"
	line "mag wel even" ; "should have some"
	cont "uitrusten." ; "rest."
	done

MrPokemonText_ImDependingOnYou:
	text "Ik reken op jouw" ; "I'm depending on"
	line "hulp!" ; "you!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Het leven is ge-" ; "Life is delight-"
	line "weldig! Er is" ; "ful! Always, new"

	para "altijd iets nieuws" ; "discoveries to be"
	line "te ontdekken!" ; "made!"
	done

MrPokemonsHouse_OakText1:
	text "OAK: Aha! Dus jij" ; "OAK: Aha! So"
	line "bent <PLAY_G>!" ; "you're <PLAY_G>!"

	para "Ik ben OAK! Ik" ; "I'm OAK! A #MON"
	line "onderzoek #MON!" ; "researcher."

	para "Ik bezocht net" ; "I was just visit-"
	line "mijn oude vriend" ; "ing my old friend"
	cont "MR.#MON."

	para "Ik hoorde dat je" ; "I heard you were"
	line "een klusje doet" ; "running an errand"

	para "voor PROF.ELM, dus" ; "for PROF.ELM, so I"
	line "ik wachtte op je." ; "waited here."

	para "Wat is dit? Een" ; "Oh! What's this?"
	line "zeldzame #MON!" ; "A rare #MON!"

	para "Eens zien…" ; "Let's see…"

	para "Ah, ik snap het!" ; "Hm, I see!"

	para "PROF.ELM gaf jou" ; "I understand why"
	line "deze #MON voor" ; "PROF.ELM gave you"

	para "dit klusje, of" ; "a #MON for this"
	line "niet soms?" ; "errand."

	para "Onderzoekers zoals" ; "To researchers"
	line "PROF.ELM en ik" ; "like PROF.ELM and"

	para "zien #MON als" ; "I, #MON are our"
	line "onze vrienden." ; "friends."

	para "Hij zag dat jij je" ; "He saw that you"
	line "#MON met liefde" ; "would treat your"

	para "en zorg zou" ; "#MON with love"
	line "behandelen." ; "and care."

	para "…Ah!"

	para "Op jou kan iemand" ; "You seem to be"
	line "vertrouwen." ; "dependable."

	para "Wil je mij anders" ; "How would you like"
	line "met iets helpen?" ; "to help me out?"

	para "Dit hier is de" ; "See? This is the"
	line "nieuwste #DEX." ; "latest version of"

	para "Hij bewaart auto-" ; "It automatically"
	line "matisch data van" ; "records data on"

	para "#MON die je" ; "#MON you've"
	line "ziet of vangt." ; "seen or caught."

	para "Het is een hi-tech" ; "It's a hi-tech"
	line "encyclopedie!" ; "encyclopedia!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "#DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Ontmoet veel" ; "Go meet many kinds"
	line "soorten #MON en" ; "of #MON and"

	para "maak die #DEX" ; "complete that"
	line "compleet!" ; "#DEX!"

	para "Maar ik ben hier" ; "But I've stayed"
	line "te lang gebleven." ; "too long."

	para "Ik moet weer naar" ; "I have to get to"
	line "GOLDENROD voor" ; "GOLDENROD for my"
	cont "mijn radioshow." ; "usual radio show."

	para "<PLAY_G>, ik" ; "<PLAY_G>, I'm"
	line "reken op je!" ; "counting on you!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? Die SCHAAL!" ; "Hm? That SCALE!"
	line "Wat is dat?" ; "What's that?"
	cont "Een rode GYARADOS?" ; "A red GYARADOS?"

	para "Dat is zeldzaam!" ; "That's rare! "
	line "Ik, ik wil het…" ; "I, I want it…"

	para "<PLAY_G>, wil je" ; "<PLAY_G>, would you"
	line "met mij ruilen?" ; "care to trade it?"

	para "Ik kan je deze" ; "I can offer this"
	line "EP.DELER geven die" ; "EXP.SHARE I got"
	cont "PROF.OAK me gaf." ; "from PROF.OAK."
	done

MrPokemonText_Disappointed:
	text "Ai, wat jammer." ; "That's disappoint-"
	line "Dat is toevallig" ; "ing. That happens"
	cont "heel erg zeldzaam." ; "to be very rare."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "Het zit vol met" ; "It's packed with"
	line "tijdschriften in" ; "foreign magazines."

	para "een vreemde taal." ; "Can't even read"
	line "Snap er niks van…" ; "their titles…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "Het is een grote" ; "It's a big com-"
	line "computer. Hmm. Hij" ; "puter. Hmm. It's"
	cont "is stuk." ; "broken."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "Een stapel met" ; "A whole pile of"
	line "vreemde munten!" ; "strange coins!"

	para "Misschien uit een" ; "Maybe they're from"
	line "ander land…" ; "another country…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
