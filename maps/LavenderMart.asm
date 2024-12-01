	object_const_def
	const LAVENDERMART_CLERK
	const LAVENDERMART_POKEFAN_M
	const LAVENDERMART_ROCKER

LavenderMart_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
	end

LavenderMartPokefanMScript:
	jumptextfaceplayer LavenderMartPokefanMText

LavenderMartRockerScript:
	jumptextfaceplayer LavenderMartRockerText

LavenderMartPokefanMText:
	text "VERDRIJVER is een" ; "REPEL is a neces-"
	line "noodzaak als je" ; "sity if you are"

	para "een grot gaat" ; "going to explore a"
	line "verkennen." ; "cave."

	para "Hoewel ik graag" ; "Even though I like"
	line "op ontdekking ga," ; "exploring, I still"

	para "heb ik nog niet" ; "haven't made it to"
	line "alle grotten" ; "all the caves."
	cont "gezien." ; 
	done

LavenderMartRockerText:
	text "Ik hoorde van een" ; "I heard about a"
	line "vakman die " ; "craftsman who"

	para "speciale BALLEN" ; "makes custom BALLS"
	line "maakt in het" ; "in the JOHTO town"

	para "JOHTO-dorp AZALEA." ; "of AZALEA. I wish"
	line "Ik wou dat ik er" ; "I had some."
	cont "wat had." ; 
	done

LavenderMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartClerkScript, -1
	object_event  6,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderMartPokefanMScript, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartRockerScript, -1
