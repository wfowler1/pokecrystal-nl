	object_const_def
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "Welkom bij het" ; "Welcome to TRAINER"
	line "TRAINERHUIS, de" ; "HOUSE, the newest"

	para "nieuwste en hipste" ; "and most happening"
	line "plek in VIRIDIAN." ; "place in VIRIDIAN."

	para "Alleen trainers" ; "We're open to"
	line "mogen naar binnen." ; "trainers only."

	para "Beneden kun je" ; "You can battle"
	line "vechten tegen de" ; "against the best"

	para "beste van de" ; "of the best right"
	line "beste trainers." ; "downstairs."
	done

TrainerHouse1FCooltrainerMText:
	text "VIRIDIAN ligt het" ; "VIRIDIAN is the"
	line "dichtst bij het" ; "town closest to"
	cont "INDIGO-PLATEAU." ; "INDIGO PLATEAU."

	para "Deze plek is ge-" ; "They built this"
	line "bouwd omdat zoveel" ; "place because so"

	para "trainers hier" ; "many trainers pass"
	line "passeerden op" ; "through on their"

	para "weg naar het" ; "way up to INDIGO"
	line "INDIGO-PLATEAU." ; "PLATEAU."
	done

TrainerHouse1FCooltrainerFText:
	text "Beneden houden ze" ; "They hold practice"
	line "oefenpotjes tegen" ; "battles downstairs"
	cont "elkaar." ; "here."

	para "Ik zou graag zien" ; "I would love to"
	line "hoe een trainer" ; "see how well a"

	para "uit JOHTO het er" ; "trainer from JOHTO"
	line "vanaf brengt." ; "battles."
	done

TrainerHouse1FYoungsterText:
	text "Je wordt geen" ; "I guess you can't"
	line "KAMPIOEN zonder de" ; "become the CHAMP"

	para "wereld rond te" ; "unless you go all"
	line "reizen en tegen" ; "over the place and"

	para "allerlei soorten" ; "battle all kinds"
	line "mensen te vechten." ; "of people."

	para "De KAMPIOEN uit" ; "The CHAMPION from"
	line "PALLET reisde naar" ; "PALLET traveled to"

	para "alle steden en" ; "all the cities and"
	line "dorpen van KANTO." ; "towns in KANTO."
	done

TrainerHouse1FGentlemanText:
	text "Pfoe… Even een" ; "Whew… I'm taking a"
	line "pauze van #MON-" ; "rest from #MON"
	cont "gevechten." ; "battles."
	done

TrainerHouseSign1Text:
	text "Oefengevechten" ; "Practice battles"
	line "worden beneden in" ; "are held in the"

	para "de TRAININGHAL" ; "TRAINING HALL"
	line "gehouden." ; "downstairs."

	para "Vaardige trainers" ; "Skilled trainers"
	line "worden uitgenodigd" ; "are invited to"
	cont "om deel te nemen." ; "participate."
	done

TrainerHouseSign2Text:
	text "Voor oefenpotjes" ; "There are no rules"
	line "gelden geen voor-" ; "or regulations for"

	para "schriften. Alles" ; "practice matches."
	line "is toegestaan, net" ; "Just like in field"

	para "als in echte" ; "battles, anything"
	line "gevechten!" ; "goes!"
	done

TrainerHouseIllegibleText:
	text "…Wat is dit?" ; "…What's this?"
	line "Een strategiememo?" ; "A strategy memo?"

	para "De tekst lijkt" ; "This writing looks"
	line "op ONIX-sporen…" ; "like ONIX tracks…"

	para "Het is compleet" ; "It's completely"
	line "onleesbaar…" ; "illegible…"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	def_object_events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
