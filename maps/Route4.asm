	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "Ik voed mijn #-" ; "I'm raising my"
	line "MON op. Wil je met" ; "#MON. Want to"
	cont "me vechten?" ; "battle with me?"
	done

BirdKeeperHankBeatenText:
	text "Verdorie! Dat" ; "Ack! I lost that"
	line "heb ik verloren…" ; "one…"
	done

BirdKeeperHankAfterBattleText:
	text "Als je een exacte" ; "If you have a"
	line "#MON hebt die" ; "specific #MON"

	para "je wil trainen," ; "that you want to"
	line "breng die eerst" ; "raise, put it out"

	para "naar voren en wis-" ; "first, then switch"
	line "sel 'm gelijk om." ; "it right away."

	para "Zo doe ik het." ; "That's how to do"
	line "" ; "it."
	done

PicnickerHopeSeenText:
	text "Ik denk dat ik" ; "I have a feeling"
	line "kan winnen." ; "that I can win."

	para "Eens zien of ik" ; "Let's see if I'm"
	line "gelijk heb!" ; "right!"
	done

PicnickerHopeBeatenText:
	text "Aww, je bent te" ; "Aww, you are too"
	line "sterk." ; "strong."
	done

PicnickerHopeAfterBattleText:
	text "Ik hoorde dat" ; "I heard CLEFAIRY"
	line "CLEFEE op de" ; "appear at MT.MOON."
	cont "MAANBERG ver-" ;

	para "schijnen. Maar" ; "But where could"
	line "waar zouden ze" ; "they be?"
	cont "zijn?" ;
	done

PicnickerSharonSeenText:
	text "Um…"
	line "Ik…" ; "I…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……Ik zal meer" ; "……I'll go train"
	line "gaan trainen…" ; "some more…"
	done

MtMoonSquareSignText:
	text "MAANBERGPLEIN" ; "MT.MOON SQUARE"

	para "Ga gewoon de de" ; "Just go up the"
	line "trap op." ; "stairs."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall

	def_object_events
	object_event 17,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  9,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 21,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
