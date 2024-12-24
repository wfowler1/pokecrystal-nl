	object_const_def
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY

CopycatsHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

CopycatsHouse1FPokefanMScript:
	jumptextfaceplayer CopycatsHouse1FPokefanMText

CopycatsHouse1FPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CopycatsHouse1FPokefanFText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CopycatsHouse1FPokefanFText_ReturnedMachinePart
	waitbutton
	closetext
	end

CopycatsHouse1FBlisseyScript:
	opentext
	writetext CopycatsHouse1FBlisseyText
	cry BLISSEY
	waitbutton
	closetext
	end

CopycatsHouse1FPokefanMText:
	text "Mijn dochter doet" ; "My daughter likes"
	line "graag mensen na." ; "to mimic people."

	para "Door haar" ; "Her mimicry has"
	line "imitaties wordt ze" ; "earned her the"

	para "ook wel de na-aper" ; "nickname COPYCAT"
	line "genoemd." ; "around here."
	done

CopycatsHouse1FPokefanFText:
	text "Mijn dochter is zo" ; "My daughter is so"
	line "egoïstisch…" ; "self-centered…"

	para "Ze heeft maar een" ; "She only has a few"
	line "paar vrienden." ; "friends."
	done

CopycatsHouse1FPokefanFText_ReturnedMachinePart:
	text "Recent verloor ze" ; "She recently lost"
	line "de #POP die een" ; "the # DOLL that"

	para "jongen haar drie" ; "a boy gave her"
	line "jaar geleden gaf." ; "three years ago."

	para "Daarna is ze nog" ; "Ever since then,"
	line "beter in imiteren" ; "she's gotten even"
	cont "geworden…" ; "better at mimicry…"
	done

CopycatsHouse1FBlisseyText:
	text "BLISSEY: Bliisii!"
	done

CopycatsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 8
	warp_event  3,  7, SAFFRON_CITY, 8
	warp_event  2,  0, COPYCATS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanMScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	object_event  6,  6, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FBlisseyScript, -1
