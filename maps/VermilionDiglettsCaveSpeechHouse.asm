	object_const_def
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_GENTLEMAN

VermilionDiglettsCaveSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionDiglettsCaveSpeechHouseGentlemanScript:
	jumptextfaceplayer VermilionDiglettsCaveSpeechHouseGentlemanText

VermilionDiglettsCaveSpeechHouseGentlemanText:
	text "Jarenlang hebben" ; "Over many years,"
	line "GRAAFJE een grote" ; "DIGLETT dug a"
	cont "tunnel gegraven." ; "large tunnel."

	para "Die tunnel gaat" ; "That tunnel goes"
	line "naar een verre" ; "to a distant town."
	cont "stad."
	done

VermilionDiglettsCaveSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 6
	warp_event  3,  7, VERMILION_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionDiglettsCaveSpeechHouseGentlemanScript, -1
