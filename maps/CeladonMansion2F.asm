CeladonMansion2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd DifficultBookshelfScript

CeladonMansion2FComputerText:
	text "<PLAYER> zette de" ; "<PLAYER> turned on"
	line "PC aan." ; "the PC."

	para "…"

	para "Iemand was aan het" ; "Someone was in the"
	line "componeren een" ; "middle of compos-"
	cont "e-mail…" ; "ing an e-mail."

	para "…Ik hoop je KANTO" ; "…I hope you'll"
	line "komt bezoeken." ; "come visit KANTO."

	para "Ik denk je" ; "I think you'll be"
	line "verbaasd zult zijn" ; "surprised at how"

	para "hoeveel er hier" ; "much things have"
	line "is veranderd." ; "changed here."

	para "Je zult ook" ; "You'll also see"
	line "verschillende" ; "many #MON that"
	cont "#MON zien die"
	cont "niet in JOHTO"
	cont "wonen."

	; para "aren't native to"
	; line "JOHTO."

	para "Aan de PRODUCENT" ; "To the PRODUCER"

	para "…"
	done

CeladonMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "ONTMOETING KAMER" ; "MEETING ROOM"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	def_coord_events

	def_bg_events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	def_object_events
