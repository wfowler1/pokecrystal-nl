	object_const_def
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "Buig voor mijn" ; "Bow down before my"
	line "nobele #MON!" ; "regal #MON!"
	done

PokefanmAlexBeatenText:
	text "Hoe… Hoe durf je" ; "How… How dare you"
	line "adel te bespotten!" ; "mock royalty!"
	done

PokefanmAlexAfterBattleText:
	text "Hoopt iedereen" ; "Doesn't everyone"
	line "niet om ooit" ; "wish to someday be"
	cont "koning te worden?" ; "a king?"
	done

PokefanmJoshuaSeenText:
	text "Nihihi! Wil je" ; "Nihihi! Would you"
	line "vechten tegen mijn" ; "like to battle my"
	cont "bende PIKACHU?" ; "PIKACHU gang?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Jij hebt zo te" ; "You look like you"
	line "zien veel #MON," ; "have many #MON,"

	para "maar Pikachu" ; "but PIKACHU is"
	line "blijft de beste." ; "still the best."
	done

BirdKeeperPerrySeenText:
	text "Snelheid is de" ; "Agility is the key"
	line "sleutel van iedere" ; "attribute of bird"
	cont "vogel-#MON." ; "#MON."
	done

BirdKeeperPerryBeatenText:
	text "Je versloeg me met" ; "You beat me with"
	line "je snelheid…" ; "your speed…"
	done

BirdKeeperPerryAfterBattleText:
	text "Je #MON zijn" ; "Your #MON are"
	line "opvallend goed" ; "remarkably well-"
	cont "getraind." ; "trained."
	done

BirdKeeperBretSeenText:
	text "Check mijn #MON" ; "Check out my #-"
	line "eens. Zie hun" ; "MON. Just look at"

	para "kleuren en volle" ; "their coloring and"
	line "vachten." ; "their plumage."
	done

BirdKeeperBretBeatenText:
	text "Verdraaid!" ; "Shoot!"
	line "Niet goed genoeg!" ; "Not good enough!"
	done

BirdKeeperBretAfterBattleText:
	text "#MON zijn dol" ; "If you groom them,"
	line "op borstelen." ; "#MON get happy."
	done

HikerKennySeenText:
	text "Ik wil naar de" ; "I should go to"
	line "ROTSTUNNEL om een" ; "ROCK TUNNEL to get"
	cont "ONIX te halen." ; "myself an ONIX."
	done

HikerKennyBeatenText:
	text "Verloren…" ; "I lost…"
	done

HikerKennyAfterBattleText:
	text "Geologische ob-" ; "Geological fea-"
	line "jecten veranderen" ; "tures don't appear"
	cont "nooit, lijkt het." ; "to change."

	para "Maar eigenlijk" ; "But they actually"
	line "verschuiven ze" ; "change, little by"
	cont "steeds een beetje." ; "little."
	done

Route13TrainerTipsText:
	text "TRAINERTIPS" ; "TRAINER TIPS"

	para "Kijk! Daar, aan" ; "Look! Right there,"
	line "de linkerkant van" ; "at the left side"
	cont "het bord." ; "of the post."
	done

Route13SignText:
	text "ROUTE 13"

	para "NOORD NAAR" ; "NORTH TO SILENCE"
	line "STILTEBRUG" ; "BRIDGE"
	done

Route13DirectionsSignText:
	text "NOORD NAAR" ; "NORTH TO LAVENDER"
	line "LAVENDER TOWN" ; "TOWN"

	para "WEST NAAR" ; "WEST TO FUCHSIA"
	line "FUCHSIA CITY" ; "CITY"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	def_object_events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
