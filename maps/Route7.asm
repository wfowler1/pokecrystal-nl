Route7_MapScripts:
	def_scene_scripts

	def_callbacks

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route7UndergroundPathSignText:
	text "Wat is deze folder?" ; "What's this flyer?"

	para "…Ongure trainers" ; "… Uncouth trainers"
	line "hebben gevochten" ; "have been holding"

	para "in het ONDERGRONDS" ; "battles in the"
	line "PAD." ; "UNDERGROUND PATH."

	para "Vanwege aanhou-" ; "Because of rising"
	line "dende klachten van" ; "complaints by lo-"
	cont "omwonenden is het" ; "cal residents, the"
	cont "ONDERGRONDS PAD" ; "UNDERGROUND PATH"
	cont "tot nader order" ; "has been sealed"
	cont "afgesloten." ; "indefinitely."

	para "POLITIE CELADON" ; "CELADON POLICE"
	done

Route7LockedDoorText:
	text "Het zit op slot…" ; "It's locked…"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  6,  9, BGEVENT_READ, Route7LockedDoor

	def_object_events
