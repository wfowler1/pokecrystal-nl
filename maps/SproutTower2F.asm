	object_const_def
	const SPROUTTOWER2F_SAGE1
	const SPROUTTOWER2F_SAGE2
	const SPROUTTOWER2F_POKE_BALL

SproutTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end

TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end

SproutTower2FStatue:
	jumptext SproutTower2FStatueText

SproutTower2FXAccuracy:
	itemball X_ACCURACY

SageNicoSeenText:
	text "Hoe hard we ook" ; "However hard we"
	line "vechten, de TOREN" ; "battle, the TOWER"
	cont "blijft staan." ; "will stand strong."
	done

SageNicoBeatenText:
	text "Ik deed mijn best" ; "I fought hard but"
	line "maar ben te zwak." ; "I'm too weak."
	done

SageNicoAfterBattleText:
	text "De flexibele pi-" ; "The flexible pil-"
	line "laar beschermt de" ; "lar protects the"

	para "TOREN, zelfs bij" ; "TOWER, even from"
	line "aardbevingen." ; "earthquakes."
	done

SageEdmondSeenText:
	text "…Buigend als een" ; "…Sway like leaves"
	line "blad in de wind…" ; "in the wind…"
	done

SageEdmondBeatenText:
	text "Oh, ik ben zwak!" ; "Oh, I'm weak!"
	done

SageEdmondAfterBattleText:
	text "Ik probeerde BELL-" ; "I tried to copy"
	line "SPROUTS bewegingen" ; "BELLSPROUT's"

	para "te doen tijdens" ; "gentle movements"
	line "het gevecht…" ; "for battle…"

	para "Maar ik heb niet" ; "But I didn't train"
	line "genoeg geoefend." ; "well enough."
	done

SproutTower2FStatueText:
	text "Een #MON-beeld…" ; "A #MON statue…"

	para "Die ziet er fraai" ; "It looks very"
	line "uit." ; "distinguished."
	done

SproutTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  4, SPROUT_TOWER_1F, 3
	warp_event  2,  6, SPROUT_TOWER_1F, 4
	warp_event 17,  3, SPROUT_TOWER_1F, 5
	warp_event 10, 14, SPROUT_TOWER_3F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 15, BGEVENT_READ, SproutTower2FStatue

	def_object_events
	object_event 12,  3, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNico, -1
	object_event  9, 14, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageEdmond, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER_2F_X_ACCURACY
