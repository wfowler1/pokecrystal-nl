	object_const_def
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

MahoganyPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MahoganyPokecenter1FPokefanMScript:
	jumptextfaceplayer MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMText:
	text "Wat is dit? TEAM" ; "What's this? TEAM"
	line "ROCKET is weer" ; "ROCKET has come"
	cont "terug?" ; "back?"

	para "Ik zag wat mannen" ; "I saw some men in"
	line "in zwart bij het" ; "black at LAKE OF"
	cont "MEER VAN RAZERNIJ…" ; "RAGE…"
	done

MahoganyPokecenter1FYoungsterText:
	text "Ik verhinder mijn" ; "I stop my #MON"
	line "#MON om te" ; "from evolving too"
	cont "vroeg te evolueren." ; "early."

	para "Ik leer ze" ; "I make them learn"
	line "bepaalde aanvallen" ; "certain moves be-"
	cont "voor ik ze laat" ; "fore I let them"
	cont "evolueren." ; "evolve."
	done

MahoganyPokecenter1FCooltrainerFText:
	text "#MON worden" ; "#MON do become"
	line "sterker als ze" ; "stronger when they"

	para "evolueren, maar" ; "evolve, but they"
	line "ze leren aanvallen" ; "also learn moves"
	cont "ook langzamer." ; "more slowly."
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
