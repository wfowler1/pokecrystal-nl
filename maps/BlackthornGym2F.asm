	object_const_def
	const BLACKTHORNGYM2F_COOLTRAINER_M
	const BLACKTHORNGYM2F_COOLTRAINER_F
	const BLACKTHORNGYM2F_BOULDER1
	const BLACKTHORNGYM2F_BOULDER2
	const BLACKTHORNGYM2F_BOULDER3
	const BLACKTHORNGYM2F_BOULDER4
	const BLACKTHORNGYM2F_BOULDER5
	const BLACKTHORNGYM2F_BOULDER6

BlackthornGym2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, BlackthornGym2FSetUpStoneTableCallback

BlackthornGym2FSetUpStoneTableCallback:
	writecmdqueue .CommandQueue
	endcallback

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, BLACKTHORNGYM2F_BOULDER1, .Boulder1
	stonetable 3, BLACKTHORNGYM2F_BOULDER2, .Boulder2
	stonetable 4, BLACKTHORNGYM2F_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear BLACKTHORNGYM2F_BOULDER1
	sjump .Fall

.Boulder2:
	disappear BLACKTHORNGYM2F_BOULDER2
	sjump .Fall

.Boulder3:
	disappear BLACKTHORNGYM2F_BOULDER3
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext BlackthornGym2FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

BlackthornGymBoulder:
	jumpstd StrengthBoulderScript

TrainerCooltrainermCody:
	trainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfFran:
	trainer COOLTRAINERF, FRAN, EVENT_BEAT_COOLTRAINERF_FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfFranAfterBattleText
	waitbutton
	closetext
	end

CooltrainermCodySeenText:
	text "Het is niet dat" ; "It's not as if we"
	line "we allemaal draak-" ; "all use dragon-"
	cont "#MON gebruiken." ; "type #MON."
	done

CooltrainermCodyBeatenText:
	text "Verdraaid! Ik had" ; "Rats! If only I"
	line "alleen een draak!" ; "had a dragon!"
	done

CooltrainermCodyAfterBattleText:
	text "Leden van onze" ; "Members of our"
	line "drakenstam" ; "dragon-user clan"

	para "mogen enkel draak-" ; "can use dragon"
	line "#MON gebruiken" ; "#MON only after"

	para "als onze MEESTER" ; "our MASTER allows"
	line "het toelaat." ; "it."
	done

CooltrainerfFranSeenText:
	text "Ik kan niet een" ; "I can't allow a"
	line "naamloze trainer" ; "nameless trainer"
	cont "langs me laten!" ; "past me!"

	para "CLAIR zou dan" ; "CLAIR would be"
	line "woedend worden!" ; "livid if I did!"
	done

CooltrainerfFranBeatenText:
	text "Aww… Ik verloor…" ; "Awww… I lost…"
	done

CooltrainerfFranAfterBattleText:
	text "Uh-oh… CLAIR gaat" ; "Uh-oh… CLAIR is"
	line "boos worden…" ; "going to be mad…"
	done

BlackthornGym2FBoulderFellText:
	text "De kei viel er" ; "The boulder fell"
	line "doorheen!" ; "through!"
	done

BlackthornGym2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  7, BLACKTHORN_GYM_1F, 3
	warp_event  7,  9, BLACKTHORN_GYM_1F, 4
	warp_event  2,  5, BLACKTHORN_GYM_1F, 5 ; hole
	warp_event  8,  7, BLACKTHORN_GYM_1F, 6 ; hole
	warp_event  8,  3, BLACKTHORN_GYM_1F, 7 ; hole

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event  4, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfFran, -1
	object_event  8,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	object_event  2,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	object_event  6, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	object_event  3,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	object_event  6,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	object_event  8, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
