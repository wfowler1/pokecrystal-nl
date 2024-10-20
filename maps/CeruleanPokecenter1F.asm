	object_const_def
	const CERULEANPOKECENTER1F_NURSE
	const CERULEANPOKECENTER1F_SUPER_NERD
	const CERULEANPOKECENTER1F_GYM_GUIDE

CeruleanPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeruleanPokecenter1FSuperNerdScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText

.mobile
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText_Mobile

CeruleanPokecenter1FGymGuideScript:
	jumptextfaceplayer CeruleanPokecenter1FGymGuideText

CeruleanPokecenter1FSuperNerdText:
	text "In gevechten" ; "For battles, I'd"
	line "gebruik ik liever" ; "much rather use"

	para "#MON die ik heb" ; "#MON I've been"
	line "groot gebracht," ; "raising, even if"

	para "ook al zijn ze" ; "they're weaker"
	line "zwakker dan nieuw" ; "than some newly"
	cont "gevangen #MON." ; "caught #MON."
	done

CeruleanPokecenter1FSuperNerdText_Mobile:
	text "Vecht je met je" ; "Do you battle by"
	line "mobiele telefoon?" ; "mobile phone?"

	para "Als tijdens een" ; "If time runs out"
	line "gevecht de tijd op" ; "during a battle,"

	para "is, is wachten op" ; "waiting to see who"
	line "wie heeft gewonnen" ; "won is really"
	cont "zenuwslopend." ; "nerve wracking."
	done

CeruleanPokecenter1FGymGuideText:
	text "De ZWEEFTREIN" ; "The MAGNET TRAIN"
	line "haalt wel" ; "travels at over"

	para "550 kmu. Binnen" ; "340 mph. It goes"
	line "no-time reis je" ; "between KANTO and"

	para "tussen JOHTO" ; "JOHTO in almost no"
	line "en KANTO." ; "time at all."

	para "JOHTO, je bent" ; "It really makes"
	line "er zo!" ; "JOHTO accessible."
	done

CeruleanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CERULEAN_CITY, 4
	warp_event  4,  7, CERULEAN_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FSuperNerdScript, -1
	object_event  1,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FGymGuideScript, -1
