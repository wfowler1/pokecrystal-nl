	object_const_def
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SaffronPokecenter1FTeacherScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherText

.mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherMobileText

SaffronPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "Hoe zijn de" ; "What are JOHTO's"
	line "#MONCENTRA in" ; "#MON CENTERS"
	cont "JOHTO?" ; "like?"

	para "…Oh, oké. Dus" ; "…Oh, I see. So"
	line "niet heel anders" ; "they're not much"

	para "dan die hier in" ; "different from the"
	line "KANTO." ; "ones in KANTO."

	para "Dan kan ik zonder" ; "I can go to JOHTO"
	line "zorgen naar JOHTO!" ; "without worrying,"
	;cont "JOHTO!" ; "then!"
	done

SaffronPokecenter1FTeacherMobileText:
	text "Hoe zijn de" ; "What are JOHTO's"
	line "#MONCENTRA in" ; "#MON CENTERS"
	cont "JOHTO?" ; "like?"

	para "Oh, oké. Dus ze" ; "…Oh, I see."
	line "laten je linken" ; "So they let you"

	para "met mensen van" ; "link with people"
	line "ver weg?" ; "far away?"

	para "Dan zal ik mijn" ; "Then I'll get my"
	line "vriend in JOHTO" ; "friend in JOHTO to"

	para "een MARILL laten" ; "catch a MARILL and"
	line "vangen en ruilen!" ; "trade it to me!"
	done

SaffronPokecenter1FFisherText:
	text "Ik kwam toevallig" ; "I just happened to"
	line "door ROTSTUNNEL." ; "come through ROCK"

	para "Er was wat" ; "TUNNEL. There was"
	line "commotie bij de" ; "some commotion at"
	cont "ENERGIECENTRALE." ; "the POWER PLANT."
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "Grotten storten" ; "Caves collapse"
	line "makkelijk in." ; "easily."

	para "Verscheidene grot-" ; "Several caves have"
	line "ten zijn verdwenen" ; "disappeared in the"

	para "in de afgelopen" ; "past few years,"
	line "jaren, zoals die" ; "like the one out-"
	cont "buiten CERULEAN." ; "side CERULEAN."

	para "Als een pro-" ; "As a pro HIKER,"
	line "WANDELAAR is dat" ; "that's common"
	cont "algemene kennis." ; "knowledge."
	done

SaffronPokecenter1FYoungsterText:
	text "SILPH B.V's" ; "SILPH CO.'s HEAD"
	line "HOOFDKANTOOR en" ; "OFFICE and the"

	para "het ZWEEFTREIN-" ; "MAGNET TRAIN STA-"
	line "STATION--dat zijn" ; "TION--they're the"

	para "de bezienswaardig-" ; "places to see in"
	line "heden in SAFFRON." ; "SAFFRON."
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SAFFRON_CITY, 4
	warp_event  4,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FFisherScript, -1
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
