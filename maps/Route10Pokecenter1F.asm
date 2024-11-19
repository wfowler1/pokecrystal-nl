	object_const_def
	const ROUTE10POKECENTER1F_NURSE
	const ROUTE10POKECENTER1F_GENTLEMAN
	const ROUTE10POKECENTER1F_GYM_GUIDE
	const ROUTE10POKECENTER1F_COOLTRAINER_F

Route10Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route10Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route10Pokecenter1FGentlemanScript:
	jumptextfaceplayer Route10Pokecenter1FGentlemanText

Route10Pokecenter1FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext Route10Pokecenter1FGymGuideText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext Route10Pokecenter1FGymGuideText_ReturnedMachinePart
	waitbutton
	closetext
	end

Route10Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route10Pokecenter1FCooltrainerFText

Route10Pokecenter1FGentlemanText:
	text "Een #MONCENTRUM" ; "A #MON CENTER"
	line "naast een grot?" ; "near a cave?"

	para "Dat is hartstikke" ; "That's mighty"
	line "handig." ; "convenient."
	done

Route10Pokecenter1FGymGuideText:
	text "De MANAGER van de" ; "The POWER PLANT's"
	line "ENERGIECENTRALE" ; "MANAGER is looking"

	para "zoekt een sterke" ; "for a strong #-"
	line "#MON-trainer."

	para "Hij heeft hulp" ; "He needs help"
	line "nodig om iets" ; "getting back"

	para "dat was gestolen" ; "something that"
	line "terug te krijgen." ; "was stolen."
	done

Route10Pokecenter1FGymGuideText_ReturnedMachinePart:
	text "Ik hoorde dat" ; "I hear TEAM ROCKET"
	line "TEAM ROCKET weer" ; "got back together"

	para "bij elkaar kwam" ; "in JOHTO but fell"
	line "in JOHTO maar me-" ; "apart right away."
	cont "teen uiteenviel." ;

	para "Ik wist daar" ; "I didn't know any-"
	line "niets van." ; "thing about that."
	done

Route10Pokecenter1FCooltrainerFText:
	text "Als je naar buiten" ; "When you go out-"
	line "gaat, kun je het" ; "side, you can see"

	para "dak van een groot" ; "the roof of a big"
	line "gebouw zien." ; "building."

	para "Dat is de" ; "That's the POWER"
	line "ENERGIECENTRALE." ; "PLANT."
	done

Route10Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_10_NORTH, 1
	warp_event  4,  7, ROUTE_10_NORTH, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGentlemanScript, -1
	object_event  7,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGymGuideScript, -1
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FCooltrainerFScript, -1
