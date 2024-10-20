	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "OLIVINE ligt" ; "OLIVINE is on the"
	line "aan zee!" ; "sea!"

	para "En als het aan" ; "And if it's on the"
	line "zee ligt, zijn" ; "sea, there are"
	cont "er vissen!" ; "bound to be fish!"

	para "Ik vis hier" ; "I've fished here"
	line "al 30 jaar." ; "for 30 years."

	para "Wil je de zee" ; "Would you like to"
	line "trotseren en" ; "face the sea and"
	cont "gaan vissen?" ; "fish?"
	done

GiveGoodRodText:
	text "Ah, hahah!" ; "Ah, hahah!"
	line "We hebben een" ; "We have ourselves"
	cont "nieuwe visser!" ; "a new angler!"
	done

GaveGoodRodText:
	text "Vissen zijn er" ; "Fish aren't found"
	line "niet alleen in" ; "in the sea alone."
	cont "de zee." ; 

	para "Ze zwemmen waar" ; "They go wherever"
	line "er water is." ; "there is water."
	done

DontWantGoodRodText:
	text "Waaa? Je wil" ; "Whaaat? You don't"
	line "niet vissen!?" ; "like to fish!?"
	cont "Onbegrijpelijk!" ; "Incomprehensible!"
	done

HaveGoodRodText:
	text "Hoe gaat het? Al" ; "How are things?"
	line "'n grote gevangen?" ; "Land the big one?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
