	object_const_def
	const SPROUTTOWER1F_SAGE1
	const SPROUTTOWER1F_SAGE2
	const SPROUTTOWER1F_GRANNY
	const SPROUTTOWER1F_TEACHER
	const SPROUTTOWER1F_SAGE3
	const SPROUTTOWER1F_POKE_BALL

SproutTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

SproutTower1FSage1Script:
	jumptextfaceplayer SproutTower1FSage1Text

SproutTower1FSage2Script:
	jumptextfaceplayer SproutTower1FSage2Text

SproutTower1FGrannyScript:
	jumptextfaceplayer SproutTower1FGrannyText

SproutTower1FTeacherScript:
	jumptextfaceplayer SproutTower1FTeacherText

TrainerSageChow:
	trainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

SproutTower1FParlyzHeal:
	itemball PARLYZ_HEAL

SproutTower1FStatue:
	jumptext SproutTower1FStatueText

SageChowSeenText:
	text "Wij waken over" ; "We stand guard in"
	line "deze toren." ; "this tower."

	para "Wij zijn hier" ; "Here, we express"
	line "dankbaar om zo de" ; "our gratitude to"
	cont "#MON te eren." ; "honor all #MON."
	done

SageChowBeatenText:
	text "D-dankjewel!" ; "Th-Thank you!"
	done

SageChowAfterBattleText:
	text "Al het levende" ; "All living beings"
	line "bestaat samen door" ; "coexist through"
	cont "samen te werken." ; "cooperation."

	para "We moeten er dank-" ; "We must always be"
	line "baar voor zijn." ; "thankful for this."
	done

SproutTower1FSage1Text:
	text "Alleen als je de" ; "Only if you reach"
	line "top bereikt krijg" ; "the top will you"
	cont "je een VM." ; "obtain an HM."
	done

SproutTower1FSage2Text:
	text "SPROUT-TOREN werd" ; "SPROUT TOWER was"
	line "lang geleden ge-" ; "built long ago"

	para "bouwd om er #-" ; "as a place for"
	line "#MON te trainen." ; "#MON training."
	done

SproutTower1FGrannyText:
	text "Een BELLSPROUT van" ; "A BELLSPROUT over"
	line "meer dan 30 meter…" ; "100 feet tall…"

	para "Men zegt dat het" ; "People say that it"
	line "de middelste paal" ; "became the center"
	cont "hier werd." ; "pillar here."
	done

SproutTower1FTeacherText:
	text "Zie je hoe de pi-" ; "See the pillar"
	line "laar schudt?" ; "shaking?"

	para "mensen trainen" ; "People are train-"
	line "hierboven." ; "ing upstairs."
	done

SproutTower1FStatueText:
	text "Een #MON-beeld…" ; "A #MON statue…"

	para "Het ziet er" ; "It looks very"
	line "gedegen uit." ; "distinguished."
	done

SproutTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, VIOLET_CITY, 7
	warp_event 10, 15, VIOLET_CITY, 7
	warp_event  6,  4, SPROUT_TOWER_2F, 1
	warp_event  2,  6, SPROUT_TOWER_2F, 2
	warp_event 17,  3, SPROUT_TOWER_2F, 3

	def_coord_events

	def_bg_events
	bg_event  7, 15, BGEVENT_READ, SproutTower1FStatue
	bg_event 12, 15, BGEVENT_READ, SproutTower1FStatue

	def_object_events
	object_event  7,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SproutTower1FSage1Script, -1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SproutTower1FSage2Script, -1
	object_event 11, 12, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTower1FGrannyScript, -1
	object_event  9,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTower1FTeacherScript, -1
	object_event  3,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageChow, -1
	object_event 16,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower1FParlyzHeal, EVENT_SPROUT_TOWER_1F_PARLYZ_HEAL
