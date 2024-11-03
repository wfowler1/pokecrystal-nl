	object_const_def
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "Ik luisterde naar" ; "I listened to the"
	line "de radio toen ik" ; "radio while I was"
	cont "in de RUÏNES was." ; "at the RUINS."

	para "Ik hoorde daar een" ; "I heard a strange"
	line "vreemde uitzending." ; "broadcast there."
	done

RadioTower4FDJMaryText:
	text "MARY: Waarom?" ; "MARY: Why? Why do"
	line "Waarom moet ik" ; "I have to suffer"
	cont "dit doorstaan?" ; "through this?"

	para "MEOWTH, help me!" ; "MEOWTH, help me!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "MARY: Oh! Je bent" ; "MARY: Oh! You're"
	line "m'n kleine redder!" ; "my little savior!"

	para "Neem je dit als" ; "Will you take this"
	line "mijn dank?" ; "as my thanks?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "MARY: Het is" ; "MARY: It's just"
	line "goed voor #MON" ; "right for #MON"

	para "die normaal-type" ; "that know normal-"
	line "aanvallen kennen." ; "type moves."
	done

RadioTower4FDJMaryText_After:
	text "MARY: Luister" ; "MARY: Please tune"
	line "naar me in PROF." ; "into me on PROF."

	para "OAK'S #MONPRAAT-" ; "OAK'S #MON TALK"
	line "programma." ; "show."
	done

RadioTowerMeowthText:
	text "MEOWTH: Meowth…"
	done

GruntM10SeenText:
	text "Je wil de" ; "You plan to rescue"
	line "DIRECTEUR redden?" ; "the DIRECTOR?"

	para "Dat zal niet luk-" ; "That won't be pos-"
	line "ken, want ik ga je" ; "sible because I'm"
	cont "verslaan!" ; "going to beat you!"
	done

GruntM10BeatenText:
	text "Nee! Ongelofelijk!" ; "No! Unbelievable!"
	done

GruntM10AfterBattleText:
	text "Ik geloof mijn" ; "I don't believe"
	line "ogen niet! Ik" ; "it! I was beaten!"
	cont "ben verslagen!" ; 
	done

Executivem2SeenText:
	text "Stop! Ik sta be-" ; "Stop! I'm known as"
	line "kend als het harnas" ; "the TEAM ROCKET"
	cont "van TEAM ROCKET!" ; "fortress!"

	para "Je zal geen stap" ; "You're not taking"
	line "meer zetten!" ; "another step!"
	done

Executivem2BeatenText:
	text "Het harnas is" ; "The fortress came"
	line "gebroken!" ; "down!"
	done

Executivem2AfterBattleText:
	text "Je hebt mijn" ; "You've earned my"
	line "respect, dus hier" ; "respect, so here's"
	cont "is wat advies." ; "some advice."

	para "Het is niet te" ; "It's not too late."
	line "laat. Je kan nog" ; "You can still turn"
	cont "terug." ; "back."
	done

GruntF4SeenText:
	text "Vind ik #MON" ; "Don't I think"
	line "niet schattig?" ; "#MON are cute?"

	para "Ik vind mijn #MON" ; "I'll think my"
	line "schattig--" ; "#MON are cute--"

	para "nadat ze die van" ; "after they beat"
	line "jou verslaan!" ; "yours!"
	done

GruntF4BeatenText:
	text "Oh nee! Ze zijn" ; "Oh, no! They're so"
	line "zo nutteloos!" ; "useless!"
	done

GruntF4AfterBattleText:
	text "Ik hou van mijn" ; "I love my"
	line "mooie eigen ik!" ; "beautiful self!"

	para "Wie geeft nou" ; "Who cares about"
	line "om #MON?" ; "#MON?"
	done

ScientistRichSeenText:
	text "Uitstekend." ; "Most excellent."

	para "Deze RADIOTOREN" ; "This RADIO TOWER"
	line "zal ons grote" ; "will fulfill our"
	cont "doel vervullen." ; "grand design."
	done

ScientistRichBeatenText:
	text "Hmmm…" ; "Hmmm…"

	para "Alle grote plannen" ; "All grand plans"
	line "hebben haken en" ; "come with snags."
	cont "ogen."
	done

ScientistRichAfterBattleText:
	text "Denk je echt dat" ; "Do you honestly"
	line "je TEAM ROCKET" ; "believe you can"
	cont "kan stoppen?" ; "stop TEAM ROCKET?"
	done

RadioTower4FProductionSignText:
	text "4V PRODUCTIE" ; "4F PRODUCTION"
	done

RadioTower4FStudio2SignText:
	text "4V STUDIO 2" ; "4F STUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	def_object_events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
