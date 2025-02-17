	object_const_def
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4
	const FUCHSIAGYM_GYM_GUIDE

FuchsiaGym_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaGymJanineScript:
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	applymovement FUCHSIAGYM_JANINE, Movement_NinjaSpin
	faceplayer
	opentext
	writetext JanineText_DisappointYou
	waitbutton
	closetext
	winlosstext JanineText_ToughOne, 0
	loadtrainer JANINE, JANINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_ALICE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
	opentext
	writetext Text_ReceivedSoulBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	sjump .AfterBattle
.FightDone:
	faceplayer
	opentext
.AfterBattle:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	writetext JanineText_ToxicSpeech
	promptbutton
	verbosegiveitem TM_TOXIC
	iffalse .AfterTM
	setevent EVENT_GOT_TM06_TOXIC
.AfterTM:
	writetext JanineText_ApplyMyself
	waitbutton
	closetext
	end

LassAliceScript:
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_1, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	special LoadUsedSpritesGFX
.AliceUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceAfterScript
	writetext LassAliceBeforeText
	waitbutton
	closetext
	winlosstext LassAliceBeatenText, 0
	loadtrainer LASS, ALICE
	startbattle
	iftrue .AliceBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_ALICE
	end

.AliceBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

.AliceAfterScript:
	writetext LassAliceAfterText
	waitbutton
	closetext
	end

LassLindaScript:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_2, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	special LoadUsedSpritesGFX
.LindaUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaAfterScript
	writetext LassLindaBeforeText
	waitbutton
	closetext
	winlosstext LassLindaBeatenText, 0
	loadtrainer LASS, LINDA
	startbattle
	iftrue .LindaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

.LindaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

.LindaAfterScript:
	writetext LassLindaAfterText
	waitbutton
	closetext
	end

PicnickerCindyScript:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_3, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	special LoadUsedSpritesGFX
.CindyUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyAfterScript
	writetext PicnickerCindyBeforeText
	waitbutton
	closetext
	winlosstext PicnickerCindyBeatenText, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftrue .CindyBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

.CindyBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

.CindyAfterScript:
	writetext PicnickerCindyAfterText
	waitbutton
	closetext
	end

CamperBarryScript:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_4, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
.BarryUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryAfterScript
	writetext CamperBarryBeforeText
	waitbutton
	closetext
	winlosstext CamperBarryBeatenText, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftrue .BarryBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

.BarryBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

.BarryAfterScript:
	writetext CamperBarryAfterText
	waitbutton
	closetext
	end

FuchsiaGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .FuchsiaGymGuideWinScript
	writetext FuchsiaGymGuideText
	waitbutton
	closetext
	end

.FuchsiaGymGuideWinScript:
	writetext FuchsiaGymGuideWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JANINE, JANINE1
	jumpstd GymStatue2Script

Movement_NinjaSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

JanineText_DisappointYou:
	text "Fufufufu…"

	para "Sorry om je teleur" ; "I'm sorry to dis-"
	line "te stellen…" ; "appoint you…"

	para "Grapje!" ; "I'm only joking!"

	para "Ik ben de echte!" ; "I'm the real deal!"

	para "JANINE van FUCHSIA" ; "JANINE of FUCHSIA"
	line "GYM, dat ben ik!" ; "GYM, that's me!"
	done

JanineText_ToughOne:
	text "JANINE: Je bent" ; "JANINE: You're a"
	line "een taaie. Je hebt" ; "tough one. You"
	cont "echt gewonnen…" ; "definitely won…"

	para "Hier de ZIELBADGE." ; "Here's SOULBADGE."
	line "Neem maar." ; "Take it."
	done

Text_ReceivedSoulBadge:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "ZIELBADGE." ; "SOULBADGE."
	done

JanineText_ToxicSpeech:
	text "JANINE: Je bent" ; "JANINE: You're so"
	line "zo sterk! Ik heb" ; "tough! I have a"
	cont "iets speciaals!" ; "special gift!"

	para "Het is VERGIFTIG," ; "It's TOXIC, a pow-"
	line "een krachtig gif" ; "erful poison that"

	para "dat gestaag de" ; "steadily saps the"
	line "LP afbreekt." ; "victim's HP."
	done

JanineText_ApplyMyself:
	text "JANINE: Ik ga" ; "JANINE: I'm going"
	line "mijn eigen" ; "to really apply"

	para "vaardigheden echt" ; "myself and improve"
	line "verbeteren." ; "my skills."

	para "Ik wil beter" ; "I want to become"
	line "worden dan mijn" ; "better than both"
	cont "vader en jij!" ; "Father and you!"
	done

LassAliceBeforeText:
	text "Fufufu!"

	para "Ik ben JANINE, de" ; "I'm JANINE, the"
	line "GYMLEIDER!" ; "GYM LEADER!"

	para "Nee, toch niet!" ; "No, I'm not!"
	line "Hebbes, sukkel!" ; "Gotcha, sucker!"
	done

LassAliceBeatenText:
	text "Ik nam je in de" ; "I had you fooled…"
	line "maling…" ;
	done

LassAliceAfterText:
	text "Hoe zal je onze" ; "How will you dis-"
	line "echte LEIDER" ; "tinguish our real"
	cont "herkennen?" ; "LEADER?"
	done

LassLindaBeforeText:
	text "Gefopt!" ; "Fooled you!"
	line "Hahaha!"
	done

LassLindaBeatenText:
	text "Ooh… Ik verloor…" ; "Ooh… I lost…"
	line "Je bent niet zwak…" ; "You're not weak…"
	done

LassLindaAfterText:
	text "Nou? Perfecte" ; "Well? Wasn't my"
	line "vermomming, toch?" ; "disguise perfect?"
	done

PicnickerCindyBeforeText:
	text "Ik ben JANINE!" ; "I'm JANINE!"

	para "Hoe wist je dat" ; "How did you know I"
	line "ik echt was?" ; "was real?"

	para "Laten we vechten!" ; "Let's battle!"
	done

PicnickerCindyBeatenText:
	text "Verdorie!" ; "Darn it!"
	line "Ik wou winnen!" ; "I wanted to win!"
	done

PicnickerCindyAfterText:
	text "Je bent vast moe" ; "You must be"
	line "inmiddels." ; "getting tired."
	done

CamperBarryBeforeText:
	text "Wahahaha!"

	para "Zeker!" ; "You betcha!"
	line "Ik ben JANINE!" ; "I'm JANINE!"
	done

CamperBarryBeatenText:
	text "Mijn vermomming" ; "My disguise was"
	line "was goed! Balen!" ; "right on! Dang!"
	done

CamperBarryAfterText:
	text "Hé, jij. Was mijn" ; "Hey, you. Was my"
	line "kostuum schattig" ; "disguise cute or"
	cont "of niet?" ; "what, huh?"
	done

FuchsiaGymGuideText:
	text "Yo, KAMPIOEN in 't" ; "Yo, CHAMP in"
	line "verschiet!" ; "making!"

	para "Oeps! Kijk goed" ; "Whoops! Take a"
	line "rond. De trainers" ; "good look around"

	para "lijken allemaal" ; "you. The trainers"
	line "op de LEIDER," ; "all look like the"
	cont "JANINE." ; "LEADER, JANINE."

	para "Wie van hen is" ; "Which of them is"
	line "de echte JANINE?" ; "the real JANINE?"
	done

FuchsiaGymGuideWinText:
	text "Dat was een goed" ; "That was a great"
	line "gevecht, trainer" ; "battle, trainer"
	cont "uit JOHTO!" ; "from JOHTO!"
	done

FuchsiaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, FUCHSIA_CITY, 3
	warp_event  5, 17, FUCHSIA_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, FuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, FuchsiaGymStatue

	def_object_events
	object_event  1, 10, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymJanineScript, -1
	object_event  5,  7, SPRITE_FUCHSIA_GYM_1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassAliceScript, -1
	object_event  5, 11, SPRITE_FUCHSIA_GYM_2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassLindaScript, -1
	object_event  9,  4, SPRITE_FUCHSIA_GYM_3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_FUCHSIA_GYM_4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CamperBarryScript, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymGuideScript, -1
