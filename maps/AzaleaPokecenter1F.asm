	object_const_def
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script AzaleaPokecenter1FNoopScene ; unusable

	def_callbacks

AzaleaPokecenter1FNoopScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AzaleaPokecenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FFishingGuruText

AzaleaPokecenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText

AzaleaPokecenter1FGentlemanText:
	text "Heb je #MON met" ; "Do your #MON"
	line "VM-aanvallen?" ; "know HM moves?"

	para "Die kun je ook" ; "Those moves can"
	line "gebruiken als je" ; "be used even if"

	para "#MON zijn" ; "your #MON has"
	line "uitgeschakeld." ; "fainted."
	done

AzaleaPokecenter1FUnusedText: ; unreferenced
	text "Ene BILL bedacht" ; "This BILL guy"
	line "het systeem om" ; "created the system"

	para "#MON te be-" ; "for storing"
	line "waren in een PC." ; "#MON in a PC."

	para "BILL's PC heeft" ; "BILL's PC can"
	line "ruimte voor 20" ; "store up to 20"
	cont "#MON per BOX." ; "#MON per BOX."
	done

AzaleaPokecenter1FFishingGuruText:
	text "BILL's PC heeft" ; "BILL's PC can"
	line "ruimte voor 20" ; "store up to 20"
	cont "#MON per BOX." ; "#MON per BOX."
	done

AzaleaPokecenter1FPokefanFText:
	text "Ben je bekend met" ; "Do you know about"
	line "ABRIKHORNS?" ; "APRICORNS?"

	para "Breek ze open" ; "Crack one open,"
	line "hol ze uit en" ; "hollow it out and"

	para "stop er een spe-" ; "fit it with a"
	line "ciaal apparaat in." ; "special device."

	para "Zo kun je er #-" ; "Then you can catch"
	line "MON mee vangen." ; "#MON with it."

	para "Voordat BALLEN" ; "Before # BALLS"
	line "waren uitgevonden," ; "were invented,"

	para "gebruikte iedereen" ; "everyone used"
	line "ABRIKHORNS." ; "APRICORNS."
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
