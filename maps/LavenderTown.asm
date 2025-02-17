	object_const_def
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LavenderTownFlypointCallback

LavenderTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd PokecenterSignScript

LavenderMartSignText:
	jumpstd MartSignScript

LavenderTownPokefanMText:
	text "Wat een gebouw," ; "That's quite some"
	line "hè?" ; "building, eh?"

	para "Het is KANTO's" ; "It's KANTO's RADIO"
	line "RADIOTOREN." ; "TOWER."
	done

LavenderTownTeacherText:
	text "KANTO heeft veel" ; "KANTO has many"
	line "goede radioshows." ; "good radio shows."
	done

LavenderTownGrampsText:
	text "Mensen komen van" ; "People come from"
	line "ver om de zielen" ; "all over to pay"

	para "te eren van" ; "their respects to"
	line "#MON die zijn" ; "the departed souls"
	cont "heengegaan." ; "of #MON."
	done

LavenderTownYoungsterText:
	text "Je hebt een #-" ; "You need a #"
	line "FLUIT nodig om" ; "FLUTE to wake"
	cont "slapende #MON" ; "sleeping #MON."
	cont "te wekken." ; 

	para "Elke trainer" ; "Every trainer has"
	line "moet dat weten!" ; "to know that!"
	done

LavenderTownSignText:
	text "LAVENDER TOWN"

	para "Het Edele" ; "The Noble Purple"
	line "Purperen Dorp" ; "Town"
	done

KantoRadioStationSignText:
	text "KANTO RADIO-" ; "KANTO RADIO"
	line "STATION"

	para "Jouw Favoriete" ; "Your Favorite"
	line "Programma's In" ; "Programs On-Air"
	cont "de Lucht, de Klok" ; "Around the Clock!"
	cont "Rond!" ; 
	done

VolunteerPokemonHouseSignText:
	text "LAVENDER VRIJWIL-" ; "LAVENDER VOLUNTEER"
	line "LIGER #MONHUIS" ; "#MON HOUSE"
	done

SoulHouseSignText:
	text "GEDENKHUIS" ; "SOUL HOUSE"

	para "Moge de Zielen" ; "May the Souls of"
	line "van #MON Vredig" ; "#MON Rest Easy"
	cont "Rusten" ; 
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  5,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 13, LAVENDER_NAME_RATER, 1
	warp_event  1,  5, LAVENDER_MART, 2
	warp_event 13, 11, SOUL_HOUSE, 1
	warp_event 14,  5, LAV_RADIO_TOWER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  3, BGEVENT_READ, LavenderTownSign
	bg_event 15,  7, BGEVENT_READ, KantoRadioStationSign
	bg_event  3,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event  6,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  2,  5, BGEVENT_READ, LavenderMartSignText

	def_object_events
	object_event 12,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  2, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
