	object_const_def
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY

MrFujisHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFujisHouseSuperNerdScript:
	jumptextfaceplayer MrFujisHouseSuperNerdText

MrFujisHouseLassScript:
	jumptextfaceplayer MrFujisHouseLassText

MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end

MrFujisHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrFujisHouseSuperNerdText:
	text "MR. FUJI woont" ; "MR.FUJI does live"
	line "hier wel, maar" ; "here, but he's not"

	para "is nu niet thuis." ; "home now."

	para "Hij is bij het" ; "He should be at"
	line "GEDENKHUIS." ; "the SOUL HOUSE."
	done

MrFujisHouseLassText:
	text "Ongevoelige mensen" ; "Some cold-hearted"
	line "verzorgen soms hun" ; "people stop caring"
	cont "#MON niet meer." ; "for their #MON."

	para "Opa geeft deze" ; "Grandpa takes in"
	line "dakloze #MON" ; "the poor homeless"

	para "een thuis en past" ; "#MON and takes"
	line "goed op ze." ; "care of them."
	done

MrFujisPsyduckText:
	text "PSYCHEEND:" ; "PSYDUCK: Gu-guwa?"
	line "Kwa-aak?"
	done

MrFujisNidorinoText:
	text "NAKORINO: Nido!" ; "NIDORINO: Gyun!"
	done

MrFujisPidgeyText:
	text "DUIVJE: Pijji!" ; "PIDGEY: Pijji!"
	done

MrFujisHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 2
	warp_event  3,  7, LAVENDER_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrFujisHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrFujisHouseBookshelf

	def_object_events
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  7,  4, SPRITE_PSYDUCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  5,  5, SPRITE_NIDORINO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  1,  3, SPRITE_PIDGEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPidgey, -1
