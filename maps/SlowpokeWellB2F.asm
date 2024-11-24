	object_const_def
	const SLOWPOKEWELLB2F_GYM_GUIDE
	const SLOWPOKEWELLB2F_POKE_BALL

SlowpokeWellB2F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB2FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuideText
	promptbutton
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuideText_GotKingsRock
	waitbutton
	closetext
	end

SlowpokeWellB2FTMRainDance:
	itemball TM_RAIN_DANCE

SlowpokeWellB2FGymGuideText:
	text "Ik wacht tot ik" ; "I'm waiting to see"
	line "zie hoe een SLOW-" ; "SLOWPOKE's moment"
	cont "POKE evolueert." ; "of evolution."

	para "En ik ontdekte" ; "Through observa-"
	line "iets tijdens het" ; "tion, I made a new"
	cont "observeren." ; "discovery."

	para "Een SLOWPOKE met" ; "A SLOWPOKE with a"
	line "een KONINGSSTEEN" ; "KING'S ROCK often"

	para "wordt vaak door" ; "gets bitten by a"
	line "SHELLDER gebeten." ; "SHELLDER."

	para "Hier, deze" ; "Here, I'll share a"
	line "KONINGSSTEEN deel" ; "KING'S ROCK with"
	cont "ik met je." ; "you."
	done

SlowpokeWellB2FGymGuideText_GotKingsRock:
	text "Ik zal me als een" ; "I'm going to be"
	line "SLOWPOKE gedragen." ; "like SLOWPOKE."

	para "Ik wacht geduldig" ; "I'll wait patient-"
	line "af, tot er eentje" ; "ly, so I can see"
	cont "evolueert." ; "one evolve."
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuideScript, -1
	object_event 15,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FTMRainDance, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
