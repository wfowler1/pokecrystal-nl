	object_const_def
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY

IlexForestAzaleaGate_MapScripts:
	def_scene_scripts

	def_callbacks

IlexForestAzaleaGateOfficerScript:
	jumptextfaceplayer IlexForestAzaleaGateOfficerText

IlexForestAzaleaGateGrannyScript:
	jumptextfaceplayer IlexForestAzaleaGateGrannyText

IlexForestAzaleaGateOfficerText:
	text "Het EIKENWOUD is" ; "ILEX FOREST is"
	line "groot. Pas op!" ; "big. Be careful!"
	cont "Verdwaal niet." ; "Don't get lost."
	done

IlexForestAzaleaGateGrannyText:
	text "De beschermer van" ; "The FOREST is"
	line "het WOUD houdt een" ; "overzien door" ; "watched over by"
	cont "oogje in het zeil." ; "its protector."

	para "Doe dus niks" ; "Stay out of"
	line "ondeugends!" ; "mischief!"
	done

IlexForestAzaleaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ILEX_FOREST, 2
	warp_event  0,  5, ILEX_FOREST, 3
	warp_event  9,  4, AZALEA_TOWN, 7
	warp_event  9,  5, AZALEA_TOWN, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateOfficerScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateGrannyScript, -1
