	object_const_def
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSeanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCarolAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacEthanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNolandAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanEdwardAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarCoreyAfterBattleText
	waitbutton
	closetext
	end

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_NOOP
	readvar VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd TrashCanScript

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "Ik ga naar KANTO" ; "I'm going to KANTO"
	line "om mij te testen." ; "to test my skills."
	done

CooltrainermSeanBeatenText:
	text "Ik wilde winnen!" ; "I wanted to win!"
	done

CooltrainermSeanAfterBattleText:
	text "Trainers uit JOHTO" ; "Trainers from"
	line "kunnen vechten met" ; "JOHTO can battle"

	para "GYMLEIDERS uit" ; "with KANTO GYM"
	line "KANTO." ; "LEADERS."
	done

CooltrainerfCarolSeenText:
	text "Ik train om KAM-" ; "I'm training to"
	line "PIOEN te worden!" ; "become the CHAMP!"
	done

CooltrainerfCarolBeatenText:
	text "Wat verschilt er" ; "What's so differ-"
	line "zo tussen ons?" ; "ent between us?"
	done

CooltrainerfCarolAfterBattleText:
	text "Op een dag ga" ; "I'm going to beat"
	line "ik je verslaan!" ; "you someday!"
	done

PokemaniacEthanSeenText:
	text "Ken je LILY? Ze" ; "Do you know LILY?"
	line "is een hippe DJ" ; "She's a hot DJ in"
	cont "in KANTO." ; "KANTO."
	done

PokemaniacEthanBeatenText:
	text "Gyaaaah!" ; "Gyaaaah!"
	done

PokemaniacEthanAfterBattleText:
	text "LILY? Leuk, maar" ; "LILY's nice, but"
	line "MARY is de beste!" ; "MARY's the best!"

	para "Ik wil JOHTO's" ; "I want to check"
	line "radioprogramma's" ; "out JOHTO's radio"
	cont "wel eens horen!" ; "programs!"
	done

HikerNolandSeenText:
	text "In je eentje? Kom" ; "Are you alone?"
	line "vechten, dan!" ; "Then let's battle!"
	done

HikerNolandBeatenText:
	text "Zoveel kan ik" ; "That's too much to"
	line "niet aan!" ; "handle!"
	done

HikerNolandAfterBattleText:
	text "Zouden er bergen" ; "I wonder if there"
	line "in KANTO de moeite" ; "are any mountains"

	para "waard zijn om te" ; "worth climbing in"
	line "beklimmen?" ; "KANTO?"
	done

SailorStanlySeenText:
	text "Jazeker dat ik" ; "Yeah, I'm a sail-"
	line "een matroos ben." ; "or, all right."

	para "Ik was niet aan" ; "I wasn't goofing"
	line "het niksen!" ; "off!"

	para "Deze kajuit was" ; "This cabin was"
	line "vrij, dus ik deed" ; "vacant, so I just"
	cont "snel een dutje!" ; "took a quick nap!"

	para "Ach, laat maar!" ; "Ah, forget it!"
	line "Laten we vechten!" ; "Let's battle!"
	done

SailorStanlyBeatenText:
	text "Sorry! Allemaal" ; "Sorry! It's all my"
	line "mijn schuld!" ; "fault!"
	done

SailorStanlyAfterBattleText:
	text "Als matroos moet" ; "Being a sailor, I"
	line "je veel fysiek" ; "have to do phys-"
	cont "zwaar werk doen." ; "ical labor. It's"
	cont "Vermoeiend, hoor!" ; "exhausting!"
	done

GentlemanEdwardSeenText:
	text "Oh, nee. Ik ben" ; "Oh, no. I've lost"
	line "iets heel belang-" ; "something that's"
	cont "rijks verloren." ; "very important."
	done

GentlemanEdwardBeatenText:
	text "Ik… ik kan het" ; "I… I can't find"
	line "niet vinden…" ; "it…"
	done

GentlemanEdwardAfterBattleText:
	text "Ik geef het op." ; "I give up."
	line "Je hoeft niet te" ; "You don't have to"

	para "zoeken. Vergeet" ; "look. Just forget"
	line "het maar!" ; "about it!"
	done

BurglarCoreySeenText:
	text "Yeehaw!" ; "Yeehaw!"
	line "Wat een geluk!" ; "Lucky!"
	done

BurglarCoreyBeatenText:
	text "Pech gehad! Ik" ; "How unlucky!"
	line "heb verloren!" ; "I lost!"
	done

BurglarCoreyAfterBattleText:
	text "Ik heb een mooie" ; "I found a pretty"
	line "munt gevonden." ; "coin here."

	para "Iemand hier is" ; "Someone must have"
	line "die vast kwijt…" ; "lost it…"
	done

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 19, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	def_object_events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
