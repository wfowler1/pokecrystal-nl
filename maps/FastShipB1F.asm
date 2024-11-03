	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	def_scene_scripts
	scene_script FastShipB1FNoop1Scene, SCENE_FASTSHIPB1F_SAILOR_BLOCKS
	scene_script FastShipB1FNoop2Scene, SCENE_FASTSHIPB1F_NOOP

	def_callbacks

FastShipB1FNoop1Scene:
	end

FastShipB1FNoop2Scene:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	promptbutton
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FastShipB1FTrashcan:
	jumpstd TrashCanScript

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "He, kind. Zou je" ; "Hey, kid. Could I"
	line "mijn maatje voor" ; "get you to look"
	cont "me willen vinden?" ; "for my buddy?"

	para "hij is ergens aan" ; "He's goofing off"
	line "het niksen, de" ; "somewhere, that"
	cont "flierefluiter!" ; "lazy bum!"

	para "Ik wil zelf wel" ; "I want to go find"
	line "zoeken, maar ik" ; "him, but I'm on"
	cont "heb nu dienst." ; "duty right now."
	done

FastShipB1FOnDutySailorRefusedText:
	text "Oh, jeetje…" ; "Oh, gee…"

	para "De KAPITEIN zal" ; "The CAPTAIN will"
	line "woedend zijn…" ; "be furious…"
	done

FastShipB1FOnDutySailorThanksText:
	text "Dank je! Ik heb" ; "Thanks, kid!"
	line "hem een lesje" ; "I chewed him out"

	para "geleerd, zodat hij" ; "good so he'll quit"
	line "het voortaan laat!" ; "slacking off!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "Een klein meisje?" ; "A little girl?"

	para "Misschien heb ik" ; "I may have seen"
	line "haar wel gezien." ; "her go by here."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "De eetkamer is" ; "The dining room is"
	line "verderop." ; "up ahead."

	para "De trap daar gaat" ; "The stairs at the"
	line "naar de kabine" ; "end lead to the"
	cont "van de KAPITEIN." ; "CAPTAIN's cabin."
	done

SailorJeffSeenText:
	text "Niks beter dan een" ; "Nothing beats a"
	line "gevecht tijdens" ; "battle when I'm"
	cont "mijn pauze." ; "on my break."
	done

SailorJeffBeatenText:
	text "Winnen, verliezen," ; "Win or lose, my"
	line "pauze is voorbij!" ; "break's over!"
	done

SailorJeffAfterBattleText:
	text "Ik moet serieu-" ; "I guess I can't"
	line "zer mijn best doen" ; "win if I don't get"
	cont "als ik wil winnen." ; "serious."
	done

PicnickerDebraSeenText:
	text "Ik verveel me zo." ; "I'm so bored."
	line "Wil je vechten?" ; "Want to battle?"
	done

PicnickerDebraBeatenText:
	text "Auw! Je bent" ; "Yow! You're too"
	line "te sterk!" ; "strong!"
	done

PicnickerDebraAfterBattleText:
	text "SAFFRON, CELADON…" ; "SAFFRON, CELADON…"
	line "Ik hoorde dat er" ; "I hear there are"

	para "veel grote steden" ; "many big cities"
	line "in KANTO zijn." ; "in KANTO."
	done

JugglerFritzSeenText:
	text "Urrf…" ; "Urrf…"
	line "Ik ben zeeziek!" ; "I'm seasick!"
	done

JugglerFritzBeatenText:
	text "Ik kan geen spier" ; "I can't move any-"
	line "meer verroeren." ; "more…"
	done

JugglerFritzAfterBattleText:
	text "Geen schepen meer" ; "No more ships for"
	line "voor mij. Voortaan" ; "me. Next time,"

	para "neem ik de" ; "I'm taking the"
	line "ZWEEFTREIN." ; "MAGNET TRAIN."
	done

SailorGarrettSeenText:
	text "Hier werken wij" ; "This is where we"
	line "als matrozen!" ; "sailors work!"
	done

SailorGarrettBeatenText:
	text "Verloren op m'n" ; "I lost on my home"
	line "eigen thuisbasis…" ; "field…"
	done

SailorGarrettAfterBattleText:
	text "We hebben andere" ; "We get different"
	line "passagiers tussen" ; "passengers from"

	para "VERMILION CITY en" ; "VERMILION CITY to"
	line "OLIVINE CITY." ; "OLIVINE CITY."
	done

FisherJonahSeenText:
	text "Ik kan hier niet" ; "Even though we're"
	line "vissen, ook al" ; "out on the sea, I"
	cont "zijn we op zee!" ; "can't fish!"

	para "Wat saai! Laten" ; "This is boring!"
	line "we vechten!" ; "Let's battle!"
	done

FisherJonahBeatenText:
	text "Ik… Ik verveel" ; "I… I'm not bored"
	line "me niet meer…" ; "anymore…"
	done

FisherJonahAfterBattleText:
	text "Ik ga vissen aan" ; "I plan to fish off"
	line "VERMILION's kade." ; "VERMILION's pier."
	done

BlackbeltWaiSeenText:
	text "Ik train m'n benen" ; "I'm building up my"
	line "door af te zetten" ; "legs by bracing"

	para "tegen het wiegen" ; "against the ship's"
	line "van het schip!" ; "rocking!"
	done

BlackbeltWaiBeatenText:
	text "Heen en weer" ; "Rocked and rolled"
	line "geschud!" ; "over!"
	done

BlackbeltWaiAfterBattleText:
	text "Ik kon de KARATE-" ; "I couldn't find"
	line "KONING niet vinden" ; "the KARATE KING in"
	cont "in JOHTO." ; "JOHTO."

	para "Die zou ergens" ; "He's supposed to"
	line "in een grot aan" ; "be training in a"
	cont "het trainen zijn." ; "cave somewhere."
	done

SailorKennethSeenText:
	text "Ik ben matroos!" ; "I'm a sailor man!"

	para "Maar ik train ook" ; "But I'm training"
	line "#MON, om KAM-" ; "#MON, so I can"
	cont "PIOEN te worden!" ; "become the CHAMP!"
	done

SailorKennethBeatenText:
	text "Wel duidelijk dat" ; "My lack of train-"
	line "ik weinig train…" ; "ing is obvious…"
	done

SailorKennethAfterBattleText:
	text "Acht BADGES! Die" ; "Eight BADGES!"
	line "moeten bewijzen" ; "They must prove"

	para "dat je GYM LEIDERS" ; "that you've beaten"
	line "hebt verslagen." ; "GYM LEADERS."

	para "Geen wonder dat" ; "No wonder you're"
	line "je zo goed bent!" ; "so good!"
	done

TeacherShirleySeenText:
	text "Blijf van mijn" ; "Don't lay a finger"
	line "studenten af!" ; "on my students!"
	done

TeacherShirleyBeatenText:
	text "Aaack!" ; "Aaack!"
	done

TeacherShirleyAfterBattleText:
	text "We zijn op school-" ; "We're on a field"
	line "reisje naar de" ; "trip to the RUINS"
	cont "RUÏNES bij VIOLET." ; "outside VIOLET."
	done

SchoolboyNateSeenText:
	text "Ken je de RUÏNES" ; "Do you know the"
	line "VAN ALF?" ; "RUINS OF ALPH?"
	done

SchoolboyNateBeatenText:
	text "Yaargh!" ; "Yaargh!"
	done

SchoolboyNateAfterBattleText:
	text "Radio's pikken" ; "Radios pick up"
	line "rare signalen op" ; "strange signals"
	cont "in de RUÏNES." ; "inside the RUINS."
	done

SchoolboyRickySeenText:
	text "In de RUÏNES VAN" ; "There are some odd"
	line "ALF zijn vreemde" ; "stone panels in"
	cont "stenen panelen." ; "the RUINS OF ALPH."
	done

SchoolboyRickyBeatenText:
	text "Ik ben verslagen!" ; "I was done in!"
	done

SchoolboyRickyAfterBattleText:
	text "Ik las dat er" ; "I read that there"
	line "vier van die" ; "are four of those"
	cont "panelen zijn." ; "stone panels."
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 30,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksRight

	def_bg_events
	bg_event 27,  9, BGEVENT_READ, FastShipB1FTrashcan

	def_object_events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
