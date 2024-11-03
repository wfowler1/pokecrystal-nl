	object_const_def
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd Radio2Script

EcruteakItemfinderAdventureText:
	text "Ah. Je bent op" ; "Ah. You're on an"
	line "avontuur met" ; "adventure with"
	cont "je #MON?" ; "your #MON?"

	para "Nou, wat is een" ; "Well, what's an"
	line "avontuur zonder" ; "adventure without"
	cont "schatzoeken?" ; "treasure hunting?"

	para "Heb ik gelijk," ; "Am I right, or am"
	line "of heb ik gelijk?" ; "I right?"
	done

EcruteakItemfinderTrueSpiritText:
	text "Mooi! Je begrijpt" ; "Good! You under-"
	line "de ware aard" ; "stand the true"

	para "van avontuur." ; "spirit of adven-"
	line "" ; "ture."

	para "Daar hou ik van!" ; "I like that! Take"
	line "Neem dit mee." ; "this with you."
	done

ItemfinderExplanationText:
	text "Er liggen veel" ; "There are many"
	line "voorwerpen op de" ; "items lying about"

	para "grond die je" ; "that aren't ob-"
	line "niet kan zien." ; "vious."

	para "Gebruik DETECTOR" ; "Use ITEMFINDER to"
	line "om te checken" ; "check if there is"

	para "of er een voorwerp" ; "an item on the"
	line "op de grond ligt." ; "ground near you."

	para "Het geeft niet" ; "It doesn't show"
	line "precies de plek," ; "the exact spot,"

	para "dus je moet zelf" ; "so you'll have to"
	line "wel even zoeken." ; "look yourself."

	para "Oja--ik hoorde dat" ; "Oh yeah--I heard"
	line "er voorwerpen zijn" ; "there are items"

	para "in ECRUTEAK's" ; "in ECRUTEAK's"
	line "VERBRANDE TOREN." ; "BURNED TOWER."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh… Ieder z'n" ; "Oh… To each his"
	line "ding, denk ik…" ; "own, I suppose…"
	done

EcruteakHistoryBookText:
	text "GESCHIEDENIS" ; "HISTORY OF"
	line "VAN ECRUTEAK" ; "ECRUTEAK"

	para "Wil je het lezen?" ; "Want to read it?"
	done

EcruteakTwoTowersText:
	text "Er waren twee to-" ; "In ECRUTEAK, there"
	line "rens in ECRUTEAK." ; "were two towers."

	para "Elke toren was het" ; "Each tower was the"
	line "nest van machtige" ; "roost of powerful"
	cont "vliegende #MON." ; "flying #MON."

	para "Maar een van de" ; "But one of the"
	line "torens brandde tot" ; "towers burned to"
	cont "de grond af." ; "the ground."

	para "De twee #MON" ; "The two #MON"
	line "zijn sindsdien" ; "haven't been seen"
	cont "niet meer gezien…" ; "since…"

	para "Blijf lezen?" ; "Keep reading?"
	done

EcruteakThreeMonText:
	text "In ECRUTEAK waren" ; "ECRUTEAK was also"
	line "ook drie #MON" ; "home to three"

	para "die rondom de" ; "#MON that raced"
	line "stad raceten." ; "around the town."

	para "Er werd gezegd dat" ; "They were said to"
	line "ze geboren waren" ; "have been born of"

	para "uit water, donder" ; "water, lightning"
	line "en vuur." ; "and fire."

	para "Maar ze konden" ; "But they could not"
	line "hun grote kracht" ; "contain their"
	cont "niet beheersen." ; "excessive power."

	para "Dus verdwenen ze" ; "So they say the"
	line "naar zeggen zo" ; "three ran like the"

	para "snel als de wind" ; "wind off into the"
	line "weg in de weiden." ; "grassland."
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
