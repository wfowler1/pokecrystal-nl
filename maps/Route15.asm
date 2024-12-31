	object_const_def
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer TEACHER, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyKippAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyBillyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherColetteSeenText:
	text "Ben je iets" ; "Have you forgotten"
	line "vergeten?" ; "anything?"
	done

TeacherColetteBeatenText:
	text "Kyaaah!"
	done

TeacherColetteAfterBattleText:
	text "Voordat ik lerares" ; "Before I became a"
	line "werd, vergat ik" ; "teacher, I used to"

	para "vroeger een hoop" ; "forget a lot of"
	line "dingen." ; "things."
	done

TeacherHillarySeenText:
	text "Op zonnige dagen" ; "On sunny days, I"
	line "denk ik dat de" ; "think that the"

	para "kinderen liever" ; "kids would rather"
	line "op het schoolplein" ; "be playing in the"

	para "spelen dan in de" ; "schoolyard than"
	line "klas leren." ; "studying in class."
	done

TeacherHillaryBeatenText:
	text "Ik wou niet" ; "I didn't want to"
	line "verliezen…" ; "lose…"
	done

TeacherHillaryAfterBattleText:
	text "Leren is belang-" ; "Studying is impor-"
	line "rijk, maar sport" ; "tant, but exercise"
	cont "is net zo" ; "is just as vital."
	cont "essentieel." ;
	done

SchoolboyKippSeenText:
	text "Wacht. Ik moet" ; "Hang on. I have to"
	line "m'n moeder bellen." ; "phone my mom."
	done

SchoolboyKippBeatenText:
	text "Sorry, mam!" ; "Sorry, Mom!"
	line "Ik ben verslagen!" ; "I was beaten!"
	done

SchoolboyKippAfterBattleText:
	text "Mijn moeder maakt" ; "My mom worries so"
	line "zich veel zorgen," ; "much about me, I"

	para "ik moet haar vaak" ; "have to phone her"
	line "bellen." ; "all the time."
	done

SchoolboyTommySeenText:
	text "Laten we vechten." ; "Let's battle."
	line "Ik verlies niet!" ; "I won't lose!"
	done

SchoolboyTommyBeatenText:
	text "Ik vergat mijn" ; "I forgot to do my"
	line "huiswerk te maken!" ; "homework!"
	done

SchoolboyTommyAfterBattleText:
	text "Sayonara! Ik" ; "Sayonara! I just"
	line "heb dat geleerd" ; "learned that in my"
	cont "in m'n les Japans." ; "Japanese class."
	done

SchoolboyJohnnySeenText:
	text "We zijn op" ; "We're on a field"
	line "excursie naar" ; "trip to LAVENDER"

	para "LAVENDER RADIO-" ; "RADIO TOWER for"
	line "TOREN voor" ; "social studies."
	cont "maatschappijleer." ;
	done

SchoolboyJohnnyBeatenText:
	text "Je bent waanzinnig" ; "You're wickedly"
	line "sterk!" ; "tough!"
	done

SchoolboyJohnnyAfterBattleText:
	text "Ik ben moe van" ; "I'm tired of walk-"
	line "het lopen. Ik" ; "ing. I need to"
	cont "neem pauze." ; "take a break."
	done

SchoolboyBillySeenText:
	text "Mijn favoriete vak" ; "My favorite class"
	line "is gym!" ; "is gym!"
	done

SchoolboyBillyBeatenText:
	text "Oh, nee! Hoe kon" ; "Oh, no!"
	line "ik verliezen?" ; "How could I lose?"
	done

SchoolboyBillyAfterBattleText:
	text "Als #MON een" ; "If #MON were a"
	line "schoolvak was, zou" ; "subject at school,"
	cont "ik de beste zijn!" ; "I'd be the best!"
	done

Route15SignText:
	text "ROUTE 15"

	para "FUCHSIA CITY -"
	line "LAVENDER TOWN"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	def_object_events
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
