	object_const_def
	const UNIONCAVEB2F_ROCKER
	const UNIONCAVEB2F_COOLTRAINER_F1
	const UNIONCAVEB2F_COOLTRAINER_F2
	const UNIONCAVEB2F_POKE_BALL1
	const UNIONCAVEB2F_POKE_BALL2
	const UNIONCAVEB2F_LAPRAS

UnionCaveB2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, UnionCaveB2FLaprasCallback

UnionCaveB2FLaprasCallback:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	endcallback

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	endcallback

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 20
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

TrainerCooltrainermNick:
	trainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermNickAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfEmmaAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB2FElixer:
	itemball ELIXER

UnionCaveB2FHyperPotion:
	itemball HYPER_POTION

CooltrainermNickSeenText:
	text "Er zijn twee" ; "There are two"
	line "soorten mensen." ; "kinds of people."

	para "Mensen met stijl," ; "Those who have"
	line "en mensen" ; "style, and those"
	cont "zonder." ; "who don't."

	para "Welke van de twee" ; "What kind of"
	line "ben jij?" ; "person are you?"
	done

CooltrainermNickBeatenText:
	text "Jouw stijl is" ; "You've got"
	line "oogverblindend!" ; "dazzling style!"
	done

CooltrainermNickAfterBattleText:
	text "Ik vind jouw" ; "Your #MON style"
	line "#MON-stijl mooi" ; "is stunning and"
	cont "en kleurrijk." ; "colorful, I admit."

	para "Je wordt alleen" ; "You'll just keep"
	line "maar beter!" ; "getting better!"
	done

CooltrainerfGwenSeenText:
	text "Ik ben aan het" ; "I'm in training."
	line "trainen. Vechten?" ; "Care for a round?"
	done

CooltrainerfGwenBeatenText:
	text "Aww, nee! Je bent" ; "Aww, no! You're"
	line "te sterk voor me." ; "too good for me."
	done

CooltrainerfGwenAfterBattleText:
	text "Ik blijf trainen" ; "I'm going to train"
	line "om mezelf te" ; "by myself until I"
	cont "verbeteren." ; "improve."
	done

CooltrainerfEmmaSeenText:
	text "Ik ga overal heen" ; "If the #MON I"
	line "waar m'n favoriete" ; "liked were there,"
	cont "#MON zijn." ; "I'd go anywhere."

	para "Dat is wat echte" ; "That's what a real"
	line "trainers doen." ; "trainer does."
	done

CooltrainerfEmmaBeatenText:
	text "Ik aai liever mijn" ; "I'd rather pet my"
	line "kindjes dan dit!" ; "babies than this!"
	done

CooltrainerfEmmaAfterBattleText:
	text "Eens per week komt" ; "Just once a week,"
	line "er een #MON" ; "a #MON comes to"
	cont "naar de waterkant." ; "the water's edge."

	para "Ik wilde die" ; "I wanted to see"
	line "#MON zien…" ; "that #MON…"
	done

UnionCaveB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  3, UNION_CAVE_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15, 19, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermNick, -1
	object_event  5, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfGwen, -1
	object_event  3, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfEmma, -1
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FElixer, EVENT_UNION_CAVE_B2F_ELIXER
	object_event 12, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FHyperPotion, EVENT_UNION_CAVE_B2F_HYPER_POTION
	object_event 11, 31, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
