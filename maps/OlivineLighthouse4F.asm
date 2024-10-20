	object_const_def
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "JASMINE maakt" ; "JASMINE must be"
	line "zich erg zorgen om" ; "worried sick about"
	cont "de #MON hier." ; "the #MON here."

	para "Ze glimlacht zelfs" ; "She won't even"
	line "niet meer." ; "smile these days."
	done

SailorKentBeatenText:
	text "Ik kan ook niet" ; "I can't manage a"
	line "meer glimlachen…" ; "smile either…"
	done

SailorKentAfterBattleText:
	text "Over ziek ge-" ; "Speaking of sick,"
	line "sproken, ik heb" ; "I've heard there's"

	para "gehoord dat er" ; "a good PHARMACY in"
	line "een goede APOTHEEK" ; "CIANWOOD."
	cont "in CIANWOOD is." ; 
	done

LassConnie1SeenText:
	text "JASMINE is de" ; "JASMINE is this"
	line "GYMLEIDER van" ; "city's GYM LEADER." 
	cont "deze stad." ; 

	para "Ik wil haar" ; "I mean to bring"
	line "mee terugnemen." ; "her back with me."

	para "Niemand zal me" ; "Nobody had better"
	line "in de weg staan!" ; "get in my way!"
	done

LassConnie1BeatenText:
	text "Aaah! Mijn #MON!" ; "Aaack! My #MON!"
	done

LassConnie1AfterBattleText:
	text "Oké. Iedereen zou" ; "Right. Anybody"
	line "zich zorgen maken" ; "would be worried"
	cont "als zijn of haar" ; "if his or her own"
	cont "#MON ziek is." ; "#MON were hurt."

	para "Ik bid voor de" ; "I'll pray for the"
	line "#MON hier, zodat" ; "#MON here, so"

	para "JASMINE terug naar" ; "JASMINE can come"
	line "de GYM kan komen." ; "back to the GYM."
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
