	object_const_def
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUIDE

CeruleanGym_MapScripts:
	def_scene_scripts
	scene_script CeruleanGymNoopScene,         SCENE_CERULEANGYM_NOOP
	scene_script CeruleanGymGruntRunsOutScene, SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	def_callbacks

CeruleanGymNoopScene:
	end

CeruleanGymGruntRunsOutScene:
	sdefer CeruleanGymGruntRunsOutScript
	end

CeruleanGymGruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymGruntIntroText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	opentext
	writetext CeruleanGymGruntBigMistakeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntMovesCloseMovement
	opentext
	writetext CeruleanGymGruntByeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOOP
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOOP
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	writetext MistyFightDoneText
	waitbutton
	closetext
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

CeruleanGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuideWinScript
	writetext CeruleanGymGuideText
	waitbutton
	closetext
	end

.CeruleanGymGuideWinScript:
	writetext CeruleanGymGuideWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MISTY, MISTY1
	jumpstd GymStatue2Script

CeruleanGymGruntRunsDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymGruntRunsOutMovement:
	big_step RIGHT
	big_step DOWN
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymGruntMovesCloseMovement:
	big_step DOWN
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "Oeps! Ik spijt!" ; "Oops! I so sorry!"
	line "Jij niet pijn," ; "You not hurt,"
	cont "okay?" ; "okay?"

	para "Ik heel druk." ; "I very busy."
	line "Geen tijd voor" ; "No time for talk-"
	cont "praten met jou." ; "ing with you. Not"
	cont "Niet goed als" ; "good for me if"
	cont "iemand mij ziet." ; "seen by somebody."
	done

CeruleanGymGruntBigMistakeText:
	text "Oh nee! Jij mij" ; "Oh no! You seen"
	line "al gezien! Grote" ; "me already! I make"
	cont "fout van mij!" ; "big mistake!"
	done

CeruleanGymGruntByeText:
	text "He, jij! Vergeet" ; "Hey, you! Forget"
	line "jij mij zag, okay?" ; "you see me, okay?"

	para "Jij zag, hoorde," ; "You see, hear,"
	line "weet niets," ; "know nothing,"

	para "oké?" ; "okay?"
	line "Dag, kind! Niets!" ; "Bye, kid! Nothing!"

	para "Dag-dag, weg-weg!" ; "Bye-bye a go-go!"
	done

CeruleanGymNote1Text:
	text "Sorry, ik ben er" ; "Sorry, I'll be out"
	line "even niet." ; "for a while."
	cont "MISTY, GYMLEIDER" ; "MISTY, GYM LEADER"
	done

CeruleanGymNote2Text:
	text "MISTY is weg," ; "Since MISTY's out,"
	line "dus wij ook." ; "we'll be away too."
	cont "GYMTRAINERS" ; "GYM TRAINERS"
	done

MistyIntroText:
	text "MISTY: Ik heb op" ; "MISTY: I was ex-"
	line "je gewacht, jij" ; "pecting you, you"
	cont "lastpak!" ; "pest!"

	para "Je hebt dan wel" ; "You may have a"
	line "veel JOHTO GYM-" ; "lot of JOHTO GYM"

	para "BADGES, maar beter" ; "BADGES, but you'd"
	line "onderschat je me" ; better not take me"
	cont "niet." ; "too lightly."

	para "Mijn water-" ; "My water-type"
	line "#MON zijn taai!" ; "#MON are tough!"
	done

MistyWinLossText:
	text "MISTY: Je bent" ; "MISTY: You really"
	line "echt goed…" ; "are good…"

	para "Ik geef toe dat" ; "I'll admit that"
	line "je vaardig bent…" ; "you are skilled…"

	para "Alsjeblieft. De" ; "Here you go. It's"
	line "WATERVALBADGE." ; "CASCADEBADGE."
	done

ReceivedCascadeBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "WATERVALBADGE." ; "CASCADEBADGE."
	done

MistyFightDoneText:
	text "MISTY: zijn er" ; "MISTY: Are there"
	line "veel sterke train-" ; "many strong train-"
	cont "ers in JOHTO? Ik" ; "ers in JOHTO? Like"
	cont "bedoel, als jij?"; "you, I mean."

	para "Ooit ga ik" ; "I'm going to"
	line "reizen, om tegen" ; "travel one day, so"

	para "ervaren trainers" ; "I can battle some"
	line "te vechten." ; "skilled trainers."
	done

SwimmerfDianaSeenText:
	text "Sorry dat ik" ; "Sorry about being"
	line "even weg was." ; "away. Let's get on"
	cont "Hier gaan we!" ; "with it!"
	done

SwimmerfDianaBeatenText:
	text "Ik geef me over!" ; "I give up! You're"
	line "Jij wint!" ; "the winner!"
	done

SwimmerfDianaAfterBattleText:
	text "Ik zal zachtjes" ; "I'll be swimming"
	line "zwemmen." ; "quietly."
	done

SwimmerfBrianaSeenText:
	text "Hopelijk word je" ; "Don't let my ele-"
	line "niet zenuwachtig" ; "gant swimming un-"
	cont "van m'n elegantie." ; "nerve you."
	done

SwimmerfBrianaBeatenText:
	text "Ooh, je hebt me" ; "Ooh, you calmly"
	line "rustig aangepakt…" ; "disposed of me…"
	done

SwimmerfBrianaAfterBattleText:
	text "Nu niet naast" ; "Don't be too smug"
	line "je schoenen lopen." ; "about beating me."

	para "Als je niet oplet," ; "MISTY will destroy"
	line "veegt MISTY de" ; "you if you get"
	cont "vloer met je aan." ; "complacent."
	done

SwimmermParkerSeenText:
	text "Blub…" ; "Glub…"

	para "Ik ben eerst!" ; "I'm first! Come"
	line "Kom dan!" ; "and get me!"
	done

SwimmermParkerBeatenText:
	text "Het is niet waar…" ; "This can't be…"
	done

SwimmermParkerAfterBattleText:
	text "MISTY is de" ; "MISTY has gotten"
	line "laatste jaren veel" ; "much better in the"
	cont "beter geworden." ; "past few years."

	para "Blijf op je hoede," ; "Don't let your"
	line "anders word je" ; "guard down, or"
	cont "verwoest!" ; "you'll be crushed!"
	done

CeruleanGymGuideText:
	text "Yo! KAMPIOEN" ; "Yo! CHAMP in"
	line "in wording!" ; "making!"

	para "MISTY was weg," ; "Since MISTY was"
	line "dus ik heb buiten" ; away, I went out"

	para "ook lol gehad." ; "for some fun too."
	line "He-he-he." ; "He-he-he."
	done

CeruleanGymGuideWinText:
	text "Tjonge, nu weet ik" ; "Hoo, you showed me"
	line "hoe sterk je bent." ; "how tough you are."

	para "Wat een fantas-" ; "As always, that"
	line "tisch gevecht," ; "was one heck of a"
	cont "zoals altijd!" ; "great battle!"
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	def_object_events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuideScript, EVENT_TRAINERS_IN_CERULEAN_GYM
