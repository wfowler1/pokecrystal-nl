RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouse2FN64Text:
	text "<PLAYER> speelde op" ; "<PLAYER> played the"
	line "de N64." ; "N64."

	para "Laten we gaan--" ; "Better get going--"
	line "geen tijd te" ; "no time to lose!"
	cont "verliezen!" ;
	done

RedsHouse2FPCText:
	text "Zo te zien is" ; "It looks like it"
	line "het al lange tijd" ; "hasn't been used"
	cont "niet gebruikt…" ; "in a long time…"
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FN64Script
	bg_event  0,  1, BGEVENT_READ, RedsHouse2FPCScript

	def_object_events
