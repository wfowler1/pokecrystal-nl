	object_const_def
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderPokecenter1FYoungsterText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderPokecenter1FYoungsterText_ReturnedMachinePart
	waitbutton
	closetext
	end

LavenderPokecenter1FGentlemanText:
	text "Ten noorden van" ; "To the north of"
	line "LAVENDER is" ; "LAVENDER is ROCK"

	para "ROTSTUNNEL. Ga er" ; "TUNNEL. Go through"
	line "doorheen om bij" ; "it to get to the"
	cont "de ENERGIECENTRALE" ; "POWER PLANT."
	cont "te komen." ;
	done

LavenderPokecenter1FTeacherText:
	text "Een programma op" ; "There's a radio"
	line "de radio speelt" ; "program that plays"
	cont "#FLUIT-muziek." ; "# FLUTE music."

	para "Oh? Ah, je radio" ; "Oh? Ah, your radio"
	line "heeft een UITBRD-" ; "needs an EXPN CARD"
	cont "KAART nodig om" ; "to tune into it."
	cont "te luisteren." ;
	done

LavenderPokecenter1FYoungsterText:
	text "Als de ENERGIE-" ; "If the POWER PLANT"
	line "CENTRALE niet" ; "isn't running, the"

	para "draait, werkt de" ; "MAGNET TRAIN won't"
	line "ZWEEFTREIN ook" ; "run either…"
	cont "niet…" ;

	para "Het betekent ook" ; "It also means the"
	line "dat het RADIO-" ; "RADIO STATION"
	cont "STATION niet kan" ; "can't broadcast…"
	cont "uitzenden…" ;
	done

LavenderPokecenter1FYoungsterText_ReturnedMachinePart:
	text "De DIRECTEUR van" ; "The DIRECTOR of"
	line "het RADIOSTATION" ; "the RADIO STATION"
	cont "was erg blij." ; "sure was happy."

	para "Hij zei dat ze" ; "He said they're"
	line "terug in de lucht" ; "back on the air"

	para "zijn omdat de" ; "because the POWER"
	line "ENERGIECENTRALE" ; "PLANT is running"
	cont "weer soepel" ; "smoothly again."
	cont "draait." ;
	done

LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, LAVENDER_TOWN, 1
	warp_event  4,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event  1,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
