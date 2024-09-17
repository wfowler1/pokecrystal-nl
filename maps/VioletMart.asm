	object_const_def
	const VIOLETMART_CLERK
	const VIOLETMART_GRANNY
	const VIOLETMART_COOLTRAINER_M

VioletMart_MapScripts:
	def_scene_scripts

	def_callbacks

VioletMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
	closetext
	end

VioletMartGrannyScript:
	jumptextfaceplayer VioletMartGrannyText

VioletMartCooltrainerMScript:
	jumptextfaceplayer VioletMartCooltrainerMText

VioletMartGrannyText:
	text "Vang je een #-" ; "When you first"
	line "MON, dan is die" ; "catch a #MON,"
	cont "wellicht zwakt." ; "it may be weak."

	para "Maar uiteindelijk" ; "But it will even-"
	line "Zal deze groot" ; "tually grow to be"
	cont "en sterk worden." ; "strong."

	para "Het is van belang" ; "It's important to"
	line "#MON met liefde" ; "treat #MON with"
	cont "te behandelen." ; "love."
	done

VioletMartCooltrainerMText:
	text "#MON kunnen ob-" ; "#MON can hold"
	line "jecten als DRANKJE" ; "items like POTION"
	cont "en ANTIGIF dragen." ; "and ANTIDOTE."

	para "Maar ze weten niet" ; "But they don't"
	line "hoe mensgemaakte" ; "appear to know how"

	para "voorwerpen worden" ; "to use manmade"
	line "gebruikt." ; "items."
	done

VioletMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIOLET_CITY, 1
	warp_event  3,  7, VIOLET_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartClerkScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartGrannyScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletMartCooltrainerMScript, -1
