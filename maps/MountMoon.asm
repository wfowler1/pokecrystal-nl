	object_const_def
	const MOUNTMOON_RIVAL

MountMoon_MapScripts:
	def_scene_scripts
	scene_script MountMoonRivalEncounterScene, SCENE_MOUNTMOON_RIVAL_BATTLE
	scene_script MountMoonNoopScene,           SCENE_MOUNTMOON_NOOP

	def_callbacks

MountMoonRivalEncounterScene:
	sdefer MountMoonRivalBattleScript
	end

MountMoonNoopScene:
	end

MountMoonRivalBattleScript:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_RIVAL, MountMoonRivalMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonRivalTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonRivalTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_RIVAL, MountMoonRivalMovementAfter
	disappear MOUNTMOON_RIVAL
	setscene SCENE_MOUNTMOON_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonRivalMovementBefore:
	step LEFT
	step LEFT
	step LEFT
	step_end

MountMoonRivalMovementAfter:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonRivalTextBefore:
	text "<……> <……> <……>"

	para "Lang geleden," ; "It's been a while,"
	line "<PLAYER>."

	para "…Sinds ik van" ; "…Since I lost to"
	line "je verloor, heb" ; "you, I thought"

	para "ik nagedacht over" ; "about what I was"
	line "wat mij ontbrak." ; "lacking with my"
	;cont "#MON…"

	para "En ik heb nu het" ; "And we came up"
	line "antwoord gevonden." ; "with an answer."

	para "<PLAYER>, we laten" ; "<PLAYER>, now we'll"
	line "het je nu zien!" ; "show you!"
	done

MountMoonRivalTextWin:
	text "<……> <……> <……>"

	para "Ik dacht dat ik" ; "I thought I raised"
	line "mijn #MON het" ; "my #MON to be"

	para "allerbeste had" ; "the best they"
	line "opgevoed…" ; "could be…"

	para "…Maar het was" ; "…But it still"
	line "weer onvoldoende…" ; "wasn't enough…"
	done

MountMoonRivalTextAfter:
	text "<……> <……> <……>"

	para "…Je won," ; "…You won, fair"
	line "eerlijk en wel." ; "and square."

	para "Ik geef het toe." ; "I admit it. But"
	line "Maar dit is niet" ; "this isn't the"
	cont "het einde." ; "end."

	para "Ik word de beste" ; "I'm going to be"
	line "#MON-trainer" ; "the greatest #-"
	cont "ooit." ; "MON trainer ever."

	para "Want deze lui" ; "Because these guys"
	line "staan achter me." ; "are behind me."

	para "…Luister, <PLAYER>." ; "…Listen, <PLAYER>."

	para "Op een dag ga" ; "One of these days"
	line "ik bewijzen hoe" ; "I'm going to prove"

	para "goed ik ben door" ; "how good I am by"
	line "je te verslaan." ; "beating you."
	done

MountMoonRivalTextLoss:
	text "<……> <……> <……>"

	para "Ik heb mijn schuld" ; "I've repaid my"
	line "aan jou afgelost." ; "debt to you."

	para "Met mijn #MON" ; "With my #MON,"
	line "ga ik de KAMPIOEN" ; "I'm going to beat"

	para "verslaan en word" ; "the CHAMPION and"
	line "ik 's werelds" ; "become the world's"
	cont "beste trainer." ; "greatest trainer."
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
