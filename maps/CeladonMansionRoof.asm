	object_const_def
	const CELADONMANSIONROOF_FISHER

CeladonMansionRoof_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofFisherScript:
	jumptextfaceplayer CeladonMansionRoofFisherText

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

CeladonMansionRoofFisherText:
	text "Hoge plekken--" ; "High places--I do"
	line "ik hou ervan!" ; "love them so!"

	para "Ik zou zeggen dat" ; "I'd say the only"
	line "het enige dat net" ; "thing that loves"

	para "zoveel van hoogtes" ; "heights as much as"
	line "houdt als ik," ; "me is smoke!"
	cont "rook is!" ; 
	done

CeladonMansionRoofGraffitiText:
	text "Er is graffiti" ; "There's graffiti"
	line "op de muur…" ; "on the wall…"

	para "<PLAYER> voegde" ; "<PLAYER> added a"
	line "een snorretje toe!" ; "moustache!"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, CeladonMansionRoofGraffiti

	def_object_events
	object_event  7,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofFisherScript, -1
