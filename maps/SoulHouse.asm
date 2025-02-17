	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "MR.FUJI: Welkom." ; "MR.FUJI: Welcome."

	para "Hmm… Het lijkt er" ; "Hmm… You appear to"
	line "dat jij je #MON" ; "be raising your"

	para "op een liefdevolle" ; "#MON in a kind"
	line "manier opvoedt." ; "and loving manner."

	para "Velen komen hier" ; "#MON lovers"
	line "om hun respect te" ; "come here to pay"

	para "betuigen voor" ; "their respects to"
	line "overleden #MON." ; "tuigen voor over"departed #MON."

	para "Toon alsjeblieft" ; "Please offer con-"
	line "je medeleven voor" ; "dolences for the"

	para "de zielen van de" ; "souls of the de-"
	line "overleden #MON." ; "parted #MON."

	para "Dat maakt ze vast" ; "I'm sure that will"
	line "en zeker gelukkig." ; "make them happy."
	done

SoulHouseTeacherText:
	text "Er zijn hier" ; "There are other"
	line "meer graven van" ; "graves of #MON"
	cont "#MON, denk ik." ; "here, I think."

	para "Er zijn veel" ; "There are many"
	line "kamers waar alleen" ; "chambers that only"
	cont "MR.FUJI in mag." ; "MR.FUJI may enter."
	done

SoulHouseLassText:
	text "Ik bezoek #MON-" ; "I came with my mom"
	line "graven met mijn" ; "to visit #MON"
	cont "moeder…" ; "graves…"
	done

SoulHouseGrannyText:
	text "De #MON die bij" ; "The #MON that"
	line "me woonden…" ; "lived with me…"

	para "Het waren net mijn" ; "I loved them like"
	line "kleinkinderen…" ; "my grandchildren…"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
