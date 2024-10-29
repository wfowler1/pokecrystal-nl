	object_const_def
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER

GoldenrodDeptStoreRoof_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenrodDeptStoreRoofCheckSaleChangeBlockCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodDeptStoreRoofCheckSaleChangeClerkCallback

GoldenrodDeptStoreRoofCheckSaleChangeBlockCallback:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	endcallback

.SaleIsOn:
	changeblock 0, 2, $3f ; cardboard boxes
	changeblock 0, 4, $0f ; vendor booth
	endcallback

GoldenrodDeptStoreRoofCheckSaleChangeClerkCallback:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	endcallback

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	endcallback

GoldenrodDeptStoreRoofClerkScript:
	opentext
	pokemart MARTTYPE_ROOFTOP, 0
	closetext
	end

GoldenrodDeptStoreRoofPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanFText

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

GoldenrodDeptStoreRoofTwinScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTwinText

GoldenrodDeptStoreRoofSuperNerdScript:
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdOhWowText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

GoldenrodDeptStoreRoofPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanMText

GoldenrodDeptStoreRoofTeacherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTeacherText

GoldenrodDeptStoreRoofBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofBugCatcherText

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	jumptext PokeDollVendingMachineText

GoldenrodDeptStoreRoofPokefanFText:
	text "Poeh, ik ben moe." ; "Whew, I'm tired."

	para "Ik kom soms naar" ; "I sometimes come"
	line "het dak om een" ; "up to the rooftop"

	para "pauze te nemen van" ; "to take a break"
	line "al het winkelen." ; "from shopping."
	done

GoldenrodDeptStoreRoofFisherText:
	text "Pardon? Wie zegt" ; "Pardon? Who says"
	line "dat een volwassene" ; "an adult can't get"
	cont "dit niet leuk kan" ; "into this?"

	para "vinden? Ik ga" ; "I'm going to be"
	line "elke dag terug om" ; "back every day to"

	para "alle poppen te" ; "collect all the"
	line "verzamelen!" ; "dolls!"
	done

GoldenrodDeptStoreRoofTwinText:
	text "Ze hebben hier" ; "They have bargain"
	line "af en toe flinke" ; "sales here every"
	cont "uitverkoop." ; "so often."
	done

GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "Oh, wow!"
	done

GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "Wil je me met" ; "Will you quit"
	line "rust laten?" ; "bothering me?"
	done

GoldenrodDeptStoreRoofPokefanMText:
	text "Er is iets dat ik" ; "There's something"
	line "heel graag wil," ; "I really want, but"

	para "maar ik heb er" ; "I don't have the"
	line "geen geld voor…" ; "necessary cash…"

	para "Misschien verkoop" ; "Maybe I'll sell"
	line "ik de BESJES die" ; "off the BERRIES"
	cont "ik heb verzameld…" ; "I've collected…"
	done

GoldenrodDeptStoreRoofTeacherText:
	text "Oh, alles is" ; "Oh, everything is"
	line "zo goedkoop!" ; "so cheap!"

	para "Ik heb zoveel ge-" ; "I bought so much,"
	line "kocht, mijn TAS" ; "my PACK's crammed!"
	cont "zit bomvol!" ;
	done

GoldenrodDeptStoreRoofBugCatcherText:
	text "Mijn #MON raken" ; "My #MON always"
	line "altijd verlamd of" ; "get paralyzed or"

	para "vergiftigd als" ; "poisoned when the"
	line "m'n geluk opraakt…" ; "chips are down…"

	para "Dus ik kom om wat" ; "So I came to buy"
	line "VOLLEGENEZER te" ; "some FULL HEAL."

	para "kopen. Is er nog" ; "I wonder if"
	line "wat over?" ; "there's any left?"
	done

Binoculars1Text:
	text "Met deze verre-" ; "These binoculars"
	line "kijker kan ik heel" ; "let me see far"

	para "ver zien. Wellicht" ; "away. Maybe I can"
	line "zie ik m'n huis." ; "see my own house."

	para "Is het degene met" ; "Is it the one with"
	line "het groene dak?" ; "the green roof?"
	done

Binoculars2Text:
	text "Hé! Een aantal" ; "Hey! Some trainers"
	line "trainers vechten" ; "are battling on"
	cont "op de weg!" ; "the road!"

	para "Een #MON vuurt" ; "A #MON fired a"
	line "een lading" ; "flurry of leaves!"

	para "bladeren af! Nu" ; "That makes me feel"
	line "heb ik zin om te" ; "like battling"
	cont "vechten!" ; "right now!"
	done

Binoculars3Text:
	text "Een VISSER ving" ; "A FISHER caught a"
	line "een hoop MAGIKARP…" ; "lot of MAGIKARP…"

	para "Ze SPETTERen" ; "They're SPLASHing"
	line "tegelijkertijd!" ; "at the same time!"

	para "Het water stroomt" ; "Look at the water"
	line "alle kanten op!" ; "going everywhere!"
	done

PokeDollVendingMachineText:
	text "Een automaat voor" ; "A vending machine"
	line "#MON-poppen?" ; "for #MON dolls?"

	para "Werp geld in, en" ; "Insert money, then"
	line "draai aan de" ; "turn the crank…"
	cont "hendel…" ;

	para "Maar hij is" ; "But it's almost"
	line "bijna leeg…" ; "empty…"
	done

GoldenrodDeptStoreRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	def_coord_events

	def_bg_events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	def_object_events
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofClerkScript, EVENT_GOLDENROD_SALE_OFF
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanFScript, -1
	object_event  2,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTwinScript, EVENT_GOLDENROD_SALE_ON
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanMScript, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTeacherScript, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofBugCatcherScript, EVENT_GOLDENROD_SALE_OFF
