	object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferSuperRodText:
	text "Ik ben de" ; "I'm the FISHING"
	line "VISGOEROE's" ; "GURU's younger"
	cont "jongere broer." ; "brother."

	para "Ik zie dat je" ; "I can see that you"
	line "van vissen houdt." ; "like fishing."

	para "Geen twijfel" ; "There's no doubt"
	line "mogelijk!" ; "in my mind at all!"

	para "Dus? Ik weet dat" ; "So? I know I'm"
	line "ik gelijk heb." ; "right."
	done

GiveSuperRodText:
	text "Ja, ja. Net als ik" ; "Yes, yes. Just as"
	line "dacht!" ; "I thought!"

	para "Hier, visfan! Neem" ; "Here, fishing fan!"
	line "dit--het is een" ; "Take this--it's a"
	cont "SUPERHENGEL." ; "SUPER ROD."
	done

GaveSuperRodText:
	text "Probeer te vissen" ; "Try your hand at"
	line "in elk water dat" ; "fishing wherever"
	cont "je tegenkomt." ; "there is water."

	para "Onthoud--je kan" ; "Remember--you can"
	line "verschillende" ; "catch different"

	para "#MON vangen met" ; "#MON using"
	line "andere HENGELS." ; "different RODS."
	done

DontWantSuperRodText:
	text "Huh? Mijn eigen" ; "Huh? My own eyes"
	line "ogen bedrogen me?" ; "deceived me?"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
