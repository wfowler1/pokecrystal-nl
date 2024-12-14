	object_const_def
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	promptbutton
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	promptbutton
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Laat me je een eng" ; "Let me recount a"
	line "verhaal vertellen…" ; "terrifying tale…"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "Hoewel, het is" ; "Then again, it's"
	line "niet zo spannend" ; "not as scary while"

	para "nu het nog licht" ; "it's still light"
	line "is buiten." ; "outside."

	para "Kom terug na zons-" ; "Come back after"
	line "ondergang, OK?" ; "sunset, OK?"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "Er was eens een" ; "Once upon a time,"
	line "jongen die een" ; "there was a little"

	para "hele nieuwe FIETS" ; "boy who was given"
	line "had gekregen…" ; "a new BICYCLE…"

	para "Hij wilde hem" ; "He wanted to try"
	line "meteen proberen…" ; "it right away…"

	para "Hij had zoveel" ; "He was having so"
	line "plezier dat hij" ; "much fun that he"

	para "niet merkte dat de" ; "didn't notice the"
	line "zon onderging…" ; "sun had set…"

	para "Toen hij in het" ; "While riding home"
	line "pikkedonker naar" ; "in the pitch-black"

	para "huis reed, werd" ; "night, the bike"
	line "zijn fiets trager!" ; "suddenly slowed!"

	para "De pedalen werden" ; "The pedals became"
	line "zwaar!" ; "heavy!"

	para "Toen hij stopte" ; "When he stopped"
	line "met trappen, ging" ; "pedaling, the bike"

	para "zijn fiets ineens" ; "began slipping"
	line "achteruit!" ; "backwards!"

	para "Alsof de fiets" ; "It was as if the"
	line "vervloekt was en" ; "bike were cursed"

	para "hem de vergetel-" ; "and trying to drag"
	line "heid in trok!" ; "him into oblivion!"

	para "…" ; "…"

	para "…" ; "…"

	para "AAAAAAAAAAH!" ; "SHRIEEEEK!"

	para "De jongen fietste" ; "The boy had been"
	line "dus bergopwaarts" ; riding uphill on"
	cont "op het FIETSPAD!" ; "CYCLING ROAD!"

	para "…" ; "…"
	line "Dat was schrikken!" ; "Ba-dum ba-dum!"

	para "Omdat je zo gedul-" ; "For listening so"
	line "dig luisterde, heb" ; "patiently, you may"
	cont "ik TM03 voor je!" ; "take this--TM03!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "TM03 is VLOEK." ; "TM03 is CURSE."

	para "Met deze angst-" ; "It's a terrifying"
	line "aanjagende aanval" ; "move that slowly"

	para "verliest je rivaal" ; "whittles down the"
	line "langzaam HP." ; "victim's HP."
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
