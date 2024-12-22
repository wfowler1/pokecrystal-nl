	object_const_def
	const BLACKTHORNMART_CLERK
	const BLACKTHORNMART_COOLTRAINER_M
	const BLACKTHORNMART_BLACK_BELT

BlackthornMart_MapScripts:
	def_scene_scripts

	def_callbacks

BlackthornMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end

BlackthornMartCooltrainerMScript:
	jumptextfaceplayer BlackthornMartCooltrainerMText

BlackthornMartBlackBeltScript:
	jumptextfaceplayer BlackthornMartBlackBeltText

BlackthornMartCooltrainerMText:
	text "MAXOPWEKKER kun je" ; "You can't buy MAX"
	line "niet kopen, maar" ; "REVIVE, but it"

	para "het herstelt een" ; "fully restores a"
	line "#MON volledig." ; "fainted #MON."

	para "Let op--het her-" ; "Beware--it won't"
	line "stelt niet AP, de" ; "restore PP, the"

	para "ACTIEPUNTEN nodig" ; "POWER POINTS"
	line "voor aanvallen." ; "needed for moves."
	done

BlackthornMartBlackBeltText:
	text "MAXVERDRIJF houdt" ; "MAX REPEL keeps"
	line "zwakke #MON bij" ; "weak #MON away"
	cont "je weg." ; "from you."

	para "Het is de langst-" ; "It's the longest"
	line "durende versie van" ; "lasting of the"
	cont "VERDRIJF-sprays." ; "REPEL sprays."
	done

BlackthornMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 4
	warp_event  3,  7, BLACKTHORN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartCooltrainerMScript, -1
	object_event  5,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornMartBlackBeltScript, -1
