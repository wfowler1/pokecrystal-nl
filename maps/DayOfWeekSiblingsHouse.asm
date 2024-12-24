	object_const_def
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "Er staat hier iets" ; "There's something"
	line "geschreven." ; "written here."

	para "Wil je lezen?" ; "Read it?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "Aan mijn broers en" ; "To my brothers and"
	line "zussen:" ; "sisters:"

	para "Met trots dienen" ; "We take pride in"
	line "wij #MON-" ; "serving #MON"
	cont "trainers."

	para "Als trainers met" ; "When trainers talk"
	line "je praten, geef ze" ; "to you, give them"
	cont "iets nuttigs." ; "something useful."

	para "Liefs," ; "Love,"
	line "MONICA"

	para "Verder lezen?" ; "Keep reading?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Maandag, MONICA" ; "Monday, MONICA"
	line "ROUTE 40"

	para "Dinsdag, TUSCANY" ; "Tuesday, TUSCANY"
	line "ROUTE 29"

	para "Woensdag, WESLEY" ; "Wednesday, WESLEY"
	line "MEER VAN RAZERNIJ" ; "LAKE OF RAGE"

	para "Donderdag, ARTHUR" ; "Thursday, ARTHUR"
	line "ROUTE 36"

	para "Vrijdag, FRIEDA" ; "Friday, FRIEDA"
	line "ROUTE 32"

	para "Zaterdag, SANTOS" ; "Saturday, SANTOS"
	line "BLACKTHORN CITY"

	para "Zondag, SUNNY" ; "Sunday, SUNNY"
	line "ROUTE 37"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
