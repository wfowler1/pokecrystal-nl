	object_const_def
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball X_ATTACK

UnionCave1FPotion:
	itemball POTION

UnionCave1FAwakening:
	itemball AWAKENING

UnionCave1FUnusedSign: ; unreferenced
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "Ben je onderweg" ; "You're headed to"
	line "naar AZALEA?" ; "AZALEA, are you?"

	para "Met mijn #MON" ; "Let my #MON see"
	line "test ik of je" ; "if you are good"
	cont "goed genoeg bent." ; "enough to battle."
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!" ; "Oh, oh, oh!"
	done

HikerRussellAfterBattleText:
	text "Oké, dan! Ik" ; "All right, then!"
	line "heb besloten." ; "I've decided."

	para "Ik blijf hier" ; "I'm not leaving"
	line "tot mijn #MON" ; "until my #MON"
	cont "sterker zijn!" ; "get tougher!"
	done

PokemaniacLarrySeenText:
	text "Ik zoek over de" ; "I roam far and"
	line "hele wereld naar" ; "wide in search of"
	cont "#MON." ; "#MON."

	para "Ben jij ook naar" ; "Are you looking"
	line "#MON op zoek?" ; "for #MON too?"

	para "Dan ben je mijn" ; "Then you're my"
	line "verzamelrivaal!" ; "collecting rival!"
	done

PokemaniacLarryBeatenText:
	text "Ugh. Mijn arme" ; "Ugh. My poor #-"
	line "#MON…" ; "MON…"
	done

PokemaniacLarryAfterBattleText:
	text "Elke vrijdag hoor" ; "Every Friday, you"
	line "je het gebrul van" ; "can hear #MON"

	para "een #MON, diep" ; "roars from deep"
	line "vanuit de grot." ; "inside the cave."
	done

HikerDanielSeenText:
	text "Whoa! Wat een" ; "Whoa! What a"
	line "verrassing!" ; "surprise!"

	para "Ik had hier" ; "I didn't expect to"
	line "niemand verwacht!" ; "see anyone here!"
	done

HikerDanielBeatenText:
	text "Whoa! Ik ben" ; "Whoa! I'm beaten"
	line "dik verslagen!" ; "big time!"
	done

HikerDanielAfterBattleText:
	text "Er werd mij een" ; "I was conned into"
	line "SLOWPOKESTAART" ; "buying a SLOWPOKE-"
	cont "aangesmeerd." ; "TAIL."

	para "Echt zielig voor" ; "I feel sorry for"
	line "die arme #MON…" ; "the poor #MON."
	done

FirebreatherBillSeenText:
	text "ZUBAT's aanvallen" ; "ZUBAT's SUPERSONIC"
	line "verwarren telkens" ; "keeps confusing"
	cont "mijn #MON." ; "my #MON."

	para "Het irriteert me" ; "I'm seriously"
	line "mateloos!" ; "upset about that!"
	done

FirebreatherBillBeatenText:
	text "Ik ben uitgeblust!" ; "I flamed out!"
	done

FirebreatherBillAfterBattleText:
	text "In het weekend" ; "On weekends, you"
	line "hoor je diep in" ; "can hear strange"

	para "de grot een" ; "roars from deep in"
	line "vreemd gebrul." ; "the cave."
	done

FirebreatherRaySeenText:
	text "Met licht is een" ; "If it's light, a"
	line "grot niet eng." ; "cave isn't scary."

	para "Als je sterk bent," ; "If you're strong,"
	line "zijn #MON niet" ; "#MON aren't"
	cont "eng." ; "scary."
	done

FirebreatherRayBeatenText:
	text "FLITS!" ; "FLASH!"
	done

FirebreatherRayAfterBattleText:
	text "Het vuur van mijn" ; "It's my #MON's"
	line "#MON verlicht" ; "fire that lights"
	cont "deze grot." ; "up this cave."
	done

UnionCave1FUnusedSignText:
	text "EENHEIDSTUNNEL" ; "UNION CAVE"
	done

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  4, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	object_event 11,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 15, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event 14, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 17, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 12, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
