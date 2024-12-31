	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route20ClearRocksCallback

Route20ClearRocksCallback:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "Ik voel me zo veel" ; "I feel so much"
	line "lichter in water." ; "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh nee!" ; "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Zwemmen gebruikt" ; "Swimming exercises"
	line "je hele lichaam." ; "your full body."

	para "Het is heel goed" ; "It's really good"
	line "voor je." ; "for you."
	done

SwimmerfLoriSeenText:
	text "Wat een indruk-" ; "What an impressive"
	line "wekkende collectie" ; "collection of GYM"

	para "aan GYMBADGES. We" ; "BADGES. We should"
	line "moeten vechten!" ; "battle!"
	done

SwimmerfLoriBeatenText:
	text "Nee!" ; "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF is niet meer" ; "SURF is no longer"
	line "de enige VM die je" ; "the only HM move"
	cont "in water gebruikt." ; "you use in water."
	done

SwimmermCameronSeenText:
	text "Volgens mij is het" ; "I guess it's im-"
	line "onmogelijk om de" ; "possible to swim"

	para "hele weg naar" ; "all the way to"
	line "JOHTO te zwemmen." ; "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiiii!" ; "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "Behalve de zee kan" ; "Besides the sea, I"
	line "ik ook in meren en" ; "can also swim in"
	cont "rivieren zwemmen." ; "ponds and rivers."
	done

CinnabarGymSignText:
	text "Wat staat er op" ; "What does this"
	line "dit bord?" ; "sign say?"

	para "CINNABAR-GYMLEIDER"
	line "BLAINE" ; "LEADER: BLAINE"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 38,  7, SEAFOAM_GYM, 1

	def_coord_events

	def_bg_events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	def_object_events
	object_event 52,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 45, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 12, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
