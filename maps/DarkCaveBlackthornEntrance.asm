	object_const_def
	const DARKCAVEBLACKTHORNENTRANCE_PHARMACIST
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2

DarkCaveBlackthornEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCaveBlackthornEntrancePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue .GotBlackglasses
	writetext DarkCaveBlackthornEntrancePharmacistText1
	promptbutton
	verbosegiveitem BLACKGLASSES
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
.GotBlackglasses:
	writetext DarkCaveBlackthornEntrancePharmacistText2
	waitbutton
.PackFull:
	closetext
	end

DarkCaveBlackthornEntranceRevive:
	itemball REVIVE

DarkCaveBlackthornEntranceTMSnore:
	itemball TM_SNORE

DarkCaveBlackthornEntrancePharmacistText1:
	text "Whoa! ik schrok" ; "Whoa! You startled"
	line "van je!" ; "me there!"

	para "Ik had mijn ZWARTE" ; "I had my BLACK-"
	line "BRIL op, dus ik" ; "GLASSES on, so I"

	para "kon je niet goed" ; "didn't notice you"
	line "zien." ; "at all."

	para "Wat ik hier aan" ; "What am I doing"
	line "het doen ben?" ; "here?"

	para "He, maak je daar" ; "Hey, don't you"
	line "geen zorgen over." ; "worry about it."

	para "Ik geef je een" ; "I'll give you a"
	line "ZWARTE BRIL, als" ; "pair of BLACK-"
	cont "jij vergeet dat ik" ; "GLASSES, so forget"
	cont "hier was, OK?" ; "you saw me, OK?"
	done

DarkCaveBlackthornEntrancePharmacistText2:
	text "De ZWARTE BRIL" ; "BLACKGLASSES ups"
	line "maakt duister-" ; "the power of dark-"
	cont "aanvallen sterker." ; "type moves."
	done

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, ROUTE_45, 1
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntrancePharmacistScript, -1
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceRevive, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event  7, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
