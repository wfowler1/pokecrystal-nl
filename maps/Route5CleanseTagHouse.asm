	object_const_def
	const ROUTE5CLEANSETAGHOUSE_GRANNY
	const ROUTE5CLEANSETAGHOUSE_TEACHER

Route5CleanseTagHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route5CleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext Route5CleanseTagHouseGrannyText1
	promptbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext Route5CleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	closetext
	end

Route5CleanseTagHouseTeacherScript:
	jumptextfaceplayer Route5CleanseTagHouseTeacherText

HouseForSaleBookshelf:
	jumpstd DifficultBookshelfScript

Route5CleanseTagHouseGrannyText1:
	text "Aaiiiiaaaah!" ; "Eeyaaaah!"

	para "Ik voel een" ; "I sense a sinister"
	line "sinistere schaduw" ; "shadow hovering"
	cont "over je zweven." ; "over you."

	para "Neem dit om het" ; "Take this to ward"
	line "te verdrijven!" ; "it off!"
	done

Route5CleanseTagHouseGrannyText2:
	text "Je was in levens-" ; "You were in mortal"
	line "gevaar, maar nu" ; "danger, but you"
	cont "ben je beschermd." ; "are protected now."
	done

Route5CleanseTagHouseTeacherText:
	text "Mijn oma gelooft" ; "My grandma is into"
	line "dat ze kwade" ; "warding off what"

	para "geesten kan" ; "she believes to be"
	line "verdrijven." ; "evil spirits."

	para "Sorry dat ze je" ; "I'm sorry that she"
	line "liet schrikken." ; "startled you."
	done

Route5CleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_5, 4
	warp_event  3,  7, ROUTE_5, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event  1,  1, BGEVENT_READ, HouseForSaleBookshelf

	def_object_events
	object_event  2,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseGrannyScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseTeacherScript, -1
