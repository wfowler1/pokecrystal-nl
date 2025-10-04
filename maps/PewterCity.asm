	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlypointCallback

PewterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "Heb je de PEWTER-" ; "Have you visited"
	line "GYM bezocht?" ; "PEWTER GYM?"

	para "De LEIDER gebruikt" ; "The LEADER uses"
	line "rotstype #MON." ; "rock-type #MON."
	done

PewterCityBugCatcherText:
	text "CLEFEE komen" ; "At night, CLEFAIRY"
	line "'s nachts naar" ; "come out to play"
	cont "om te spelen op de" ; "at MT.MOON."
	cont "MAANBERG." ; 

	para "Maar niet elke" ; "But not every"
	line "nacht." ; "night."
	done

PewterCityGrampsText:
	text "Ah, je komt" ; "Ah, you came all"
	line "helemaal hier" ; "the way out here"
	cont "vanuit JOHTO?" ; "from JOHTO?"

	para "Herinneringen" ; "That brings back"
	line "komen naar boven." ; "memories. When I"

	para "Toen ik jong was," ; "was young, I went"
	line "ging ik naar" ; "to JOHTO to train."

	para "JOHTO om te" ; "You remind me so"
	line "trainen. Je her-" ; "much of what I was"

	para "innert me aan hoe" ; "like as a young"
	line "ik was toen ik" ; "man."
	cont "jong was." ;

	para "Hier. Neem dit" ; "Here. I want you"
	line "voorwerp dat ik" ; "to have this item"
	cont "in JOHTO heb" ; "I found in JOHTO."
	cont "gevonden." ;
	done

PewterCityGrampsText_GotSilverWing:
	text "Naar nieuwe, on-" ; "Going to new, un-"
	line "bekende plekken" ; "known places and"
	cont "gaan en nieuwe" ; "seeing new people…"
	cont "mensen zien…" ;

	para "Dat is de vreugde" ; "Those are the joys"
	line "van het reizen." ; "of travel."
	done

PewterCitySignText:
	text "PEWTER CITY"
	line "Een Steengrijze" ; "A Stone Gray City"
	cont "Stad" ;
	done

PewterGymSignText:
	text "PEWTER CITY"
	line "#MON-GYMLEIDER:"
	cont "BROCK" ; "LEADER: BROCK"

	para "De Rotsvaste" ; "The Rock Solid"
	line "#MON Trainer"
	done

PewterMuseumSignText:
	text "Er is een" ; "There's a notice"
	line "briefje hier…" ; "here…"

	para "PEWTER WETEN-" ; "PEWTER MUSEUM OF"
	line "SCHAPSMUSEUM is" ; "SCIENCE is closed"
	cont "gesloten voor" ; "for renovations…"
	cont "renovatie…" ;
	done

PewterCityMtMoonGiftShopSignText:
	text "Er is een" ; "There's a notice"
	line "briefje hier…" ; "here…"

	para "MAANBERG-" ; "MT.MOON GIFT SHOP"
	line "SOUVENIRWINKEL" ; "NOW OPEN!"
	cont "NU OPEN!" ;
	done

PewterCityWelcomeSignText:
	text "WELKOM IN" ; "WELCOME TO"
	line "PEWTER CITY!"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
