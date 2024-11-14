	object_const_def
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

ViridianPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianPokecenter1FCooltrainerMText_BlueReturned
	waitbutton
	closetext
	end

ViridianPokecenter1FCooltrainerFScript:
	jumptextfaceplayer ViridianPokecenter1FCooltrainerFText

ViridianPokecenter1FBugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1FBugCatcherText

ViridianPokecenter1FCooltrainerMText:
	text "Waar is VIRIDIAN's" ; "Where in the world"
	line "GYMLEIDER heen?" ; "is VIRIDIAN's GYM"

	para "Ik wou hem" ; "LEADER? I wanted"
	line "uitdagen." ; "to challenge him."
	done

ViridianPokecenter1FCooltrainerMText_BlueReturned:
	text "Er zijn geen" ; "There are no GYM"
	line "GYMTRAINERS in" ; "TRAINERS at the"
	cont "de VIRIDIAN-GYM." ; "VIRIDIAN GYM."

	para "De LEIDER zegt" ; "The LEADER claims"
	line "dat zijn huisregel" ; "his policy is to"

	para "is om te winnen" ; "win without having"
	line "zonder onderdanen." ; "any underlings."
	done

ViridianPokecenter1FCooltrainerFText:
	text "Ik hoorde dat de" ; "I heard that the"
	line "GYM van CINNABAR" ; "GYM in CINNABAR is"
	cont "weg is." ; "gone."

	para "Ik vraag me af wat" ; "I wonder what be-"
	line "er van BLAINE, de" ; "came of BLAINE,"
	cont "GYMLEIDER, is" ; "the GYM LEADER."
	cont "geworden." ;
	done

ViridianPokecenter1FBugCatcherText:
	text "Het is mijn droom" ; "My dream is to be-"
	line "om een GYMLEIDER" ; "come a GYM LEADER."
	cont "te worden." ;
	done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIRIDIAN_CITY, 5
	warp_event  4,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerMScript, -1
	object_event  5,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerFScript, -1
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FBugCatcherScript, -1
