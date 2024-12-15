	object_const_def
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

LakeOfRageHiddenPowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	promptbutton
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.Done:
	closetext
	end

HiddenPowerHouseBookshelf:
	jumpstd DifficultBookshelfScript

HiddenPowerGuyText1:
	text "Je bent ver" ; "…You have strayed"
	line "afgezworven…" ; "far…"

	para "Hier mediteerde" ; "Here I have medi-"
	line "ik. Binnen mij is" ; "tated. Inside me,"

	para "een nieuwe kracht" ; "a new power has"
	line "ontwaakt." ; "been awakened."

	para "Laat mij deze" ; "Let me share my"
	line "kracht delen met" ; "power with your"

	para "je #MON." ; "#MON."
	line "Neem dit, kind." ; "Take this, child."
	done

HiddenPowerGuyText2:
	text "Zie je het? Dat is" ; "Do you see it? It"
	line "VERBORGEN KRACHT!" ; "is HIDDEN POWER!"

	para "Het ontwaakt de" ; "It draws out the"
	line "kracht van een" ; "power of #MON"
	cont "#MON om mee aan" ; "for attacking."
	cont "te vallen."

	para "Onthoud dit: het" ; "Remember this: its"
	line "type en de kracht" ; "type and power de-"
	cont "hangen af van de" ; "pend on the #-"
	cont "#MON." ; "MON using it."
	done

HiddenPowerGuyText3:
	text "Ik mediteer…" ; "I am meditating…"
	done

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
