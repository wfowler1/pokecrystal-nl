	object_const_def
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInFromBlack
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	; variablesprite SPRITE_AZALEA_ROCKET, SPRITE_RIVAL
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutToWhite
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd StrengthBoulderScript

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "KURT: Hé daar," ; "KURT: Hey there,"
	line "<PLAYER>!" ; "<PLAYER>!"

	para "De bewaker boven-" ; "The guard up top"
	line "aan vertrok toen" ; "took off when I"
	cont "ik naar hem riep." ; "shouted at him."

	para "Maar daarna viel" ; "But then I took a"
	line "ik naar beneden," ; "tumble down the"
	cont "deze PUT in." ; "WELL."

	para "Ik landde hard" ; "I slammed down"
	line "op mijn rug en kan" ; "hard on my back,"
	cont "niet meer bewegen." ; "so I can't move."

	para "Bah! Ik had ze met" ; "Rats! If I were"
	line "mijn #MON ge-" ; "fit, my #MON"

	para "straft als ik nog" ; "would've punished"
	line "in orde was…" ; "them…"

	para "Nou ja, niks aan" ; "Ah, it can't be"
	line "te doen." ; "helped."

	para "<PLAYER>, laat ze" ; "<PLAYER>, show them"
	line "in mijn plaats" ; "how gutsy you are"
	cont "jouw lef zien!" ; "in my place!"
	done

KurtLeaveSlowpokeWellText:
	text "KURT: Goed gedaan," ; "KURT: Way to go,"
	line "<PLAYER>!" ; "<PLAYER>!"

	para "TEAM ROCKET is er" ; "TEAM ROCKET has"
	line "vandoor gegaan." ; "taken off."

	para "Mijn rug voelt ook" ; "My back's better"
	line "beter. Laten we" ; "too. Let's get out"
	cont "hier weggaan." ; "of here."
	done

GruntM29SeenText:
	text "Grrr! Ik bewaakte" ; "Darn! I was stand-"
	line "boven de boel tot-" ; "ing guard up top"

	para "dat een ouwe gek" ; "when some old coot"
	line "ging schreeuwen." ; "yelled at me."

	para "Ik schrok er zo" ; "He startled me so"
	line "van, dat ik naar" ; "much that I fell"
	cont "beneden viel." ; "down here."

	para "Ik denk dat ik m'n" ; "I think I'll vent"
	line "woede op jou ga" ; "my anger by taking"
	cont "afreageren!" ; "it out on you!"
	done

GruntM29BeatenText:
	text "Arrgh! Dit is ZO" ; "Arrgh! This is NOT"
	line "niet mijn dag!" ; "my day!"
	done

GruntM29AfterBattleText:
	text "Klopt, we snijden" ; "Sure, we've been"
	line "staarten van LANG-" ; "hacking the tails"

	para "SAAM af om ze te" ; "off SLOWPOKE and"
	line "verkopen." ; "selling them."

	para "We doen echt alles" ; "Everything we do"
	line "voor de winst." ; "is for profit."

	para "Jazeker! Wij zijn" ; "That's right!"
	line "TEAM ROCKET, en" ; "We're TEAM ROCKET,"

	para "we doen alles voor" ; "and we'll do any-"
	line "het geld!" ; "thing for money!"
	done

GruntM1SeenText:
	text "Wat wil je?" ; "What do you want?"

	para "Verwacht geen ge-" ; "If you interrupt"
	line "nade als je ons" ; "our work, don't"
	cont "werk stoort!" ; "expect any mercy!"
	done

GruntM1BeatenText:
	text "Redelijk gedaan" ; "You did OK today,"
	line "dit keer, volgende" ; "but wait till next"
	cont "keer krijg ik je!" ; "time!"
	done

TrainerGruntM1WhenTalkText:
	text "Ja, TEAM ROCKET" ; "Yeah, TEAM ROCKET"
	line "was drie jaar ge-" ; "was broken up"
	cont "leden opgedoekt." ; "three years ago."

	para "Maar ondergronds" ; "But we continued"
	line "gingen onze acti-" ; "our activities"
	cont "viteiten door." ; "underground."

	para "Kijk nu toe hoe we" ; "Now you can have"
	line "nieuwe problemen" ; "fun watching us"
	cont "veroorzaken!" ; "stir up trouble!"
	done

GruntM2SeenText:
	text "Geen LANGSAAM-" ; "Quit taking SLOW-"
	line "STAARTEN stelen?" ; "POKETAILS?"

	para "Dat zou TEAM" ; "If we obeyed you,"
	line "ROCKET zijn re-" ; "TEAM ROCKET's rep"
	cont "putatie kosten!" ; "would be ruined!"
	done

GruntM2BeatenText:
	text "Gewoon…" ; "Just…"
	line "Te sterk…" ; "Too strong…"
	done

GruntM2AfterBattleText:
	text "We willen geld," ; "We need the money,"
	line "maar LANGSAAM-" ; "but selling SLOW-"
	cont "STAARTEN verkopen?" ; "POKETAILS?"

	para "TEAM ROCKET-lid" ; "It's tough being a"
	line "zijn is pittig!" ; "ROCKET GRUNT!"
	done

GruntF1SeenText:
	text "Jij? Ons stoppen?" ; "Stop taking TAILS?"

	para "Probeer ons allen" ; "Yeah, just try to"
	line "maar te verslaan!" ; "defeat all of us!"
	done

GruntF1BeatenText:
	text "Jij rotkind!" ; "You rotten brat!"
	done

GruntF1AfterBattleText:
	text "LANGSAAMSTAARTEN" ; "SLOWPOKETAILS"
	line "groeien wel terug!" ; "grow back fast!"

	para "Wat is er mis met" ; "What's wrong with"
	line "ze te verkopen?" ; "selling them?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Een LANGSAAM met" ; "A SLOWPOKE with"
	line "afgesneden staart…" ; "its TAIL cut off…"

	para "Huh? Hij heeft een" ; "Huh? It has MAIL."
	line "BRIEF vast. Lezen?" ; "Read it?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> leest de" ; "<PLAYER> read the"
	line "BRIEF." ; "MAIL."

	para "Wees braaf en" ; "Be good and look"
	line "pas op het huis" ; "after the house"

	para "met opa en met" ; "with Grandpa and"
	line "LANGSAAM." ; "SLOWPOKE."

	para "Liefs, Pa" ; "Love, Dad"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Een LANGSAAM met" ; "A SLOWPOKE with"
	line "afgesneden staart…" ; "its TAIL cut off…"
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
