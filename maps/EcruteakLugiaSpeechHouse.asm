	object_const_def
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

LugiaSpeechHouseRadio:
	jumpstd Radio2Script

EcruteakLugiaSpeechHouseGrampsText:
	text "Dit gebeurde er" ; "This happened when"
	line "toen ik klein was." ; "I was young."

	para "De lucht werd" ; "The sky suddenly"
	line "plotseling zwart." ; "turned black. A"

	para "Een gigantische" ; "giant flying #-"
	line "vliegende #MON" ; "MON was blocking"
	cont "blokkeerde de zon." ; "out the sun."

	para "Ik vraag me af" ; "I wonder what that"
	line "wat die #MON was?" ; "#MON was? "

	para "Het leek op 'n vo-" ; "It was like a bird"
	line "gel en een draak." ; "and a dragon."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "Is er echt zo'n" ; "Is there really a"
	line "grote #MON?" ; "#MON that big?"

	para "Als het bestaat," ; "If it exists, it"
	line "is het vast sterk." ; "must be powerful."
	done

EcruteakLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
