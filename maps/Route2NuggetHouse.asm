	object_const_def
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseBookshelf: ; unreferenced
	jumpstd DifficultBookshelfScript

Route2NuggetHouseFisherText:
	text "Hoi! Wauw, ik ben" ; "Hi! Wow, I'm glad"
	line "blij je te zien." ; "to see you."

	para "Je bent de eerste" ; "You're the first"
	line "bezoeker in" ; "visitor I've had"
	cont "lange tijd." ; "in a long time."

	para "Ik ben superblij!" ; "I'm super-happy!"
	line "Ik heb iets kleins" ; "Let me give you a"
	cont "voor je." ; "little present."
	done

Route2NuggetHouseFisherText_GotNugget:
	text "Dat is een" ; "That's a NUGGET."
	line "GOUDKLOMPJE." ;

	para "Ik kan je geen" ; "I can't give you"
	line "klompje wijs-" ; "any nuggets of"

	para "heid geven, dus" ; "wisdom, so that'll"
	line "daar moet je" ; "have to do!"
	cont "het mee doen!" ;
	done

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
