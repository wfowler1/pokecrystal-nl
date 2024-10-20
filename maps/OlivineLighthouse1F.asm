	object_const_def
	const OLIVINELIGHTHOUSE1F_SAILOR
	const OLIVINELIGHTHOUSE1F_POKEFAN_F

OlivineLighthouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse1FSailorScript:
	jumptextfaceplayer OlivineLighthouse1FSailorText

OlivineLighthouse1FPokefanFScript:
	jumptextfaceplayer OlivineLighthouse1FPokefanFText

OlivineLighthouse1FSailorText:
	text "Mensen trainen" ; "People train at"
	line "in deze VUURTOREN." ; "this LIGHTHOUSE."

	para "Het is niet" ; "It's not easy to"
	line "makkelijk te" ; "climb because of"
	cont "klimmen vanwege" ; "all the trainers."
	cont "alle trainers." ; 
	done

OlivineLighthouse1FPokefanFText:
	text "In het verleden" ; "In the past, #-"
	line "lichtte #MON" ; "MON used to light"

	para "'s nachts de zee" ; "the sea around"
	line "rondom OLIVINE op." ; "OLIVINE at night."

	para "De VUURTOREN was" ; "The LIGHTHOUSE was"
	line "gebouwd ter ere" ; "made in honor of"
	cont "van die #MON." ; "those #MON."
	done

OlivineLighthouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 17, OLIVINE_CITY, 9
	warp_event 11, 17, OLIVINE_CITY, 9
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_2F, 1
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_2F, 3
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_2F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FSailorScript, -1
	object_event 16,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanFScript, -1
