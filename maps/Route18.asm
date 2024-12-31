	object_const_def
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "Als je naar" ; "If you're looking"
	line "#MON zoekt," ; "for #MON, you"

	para "moet je in het" ; "have to look in"
	line "hoge gras zoeken." ; "the tall grass."
	done

BirdKeeperBorisBeatenText:
	text "Aaaiiiii!" ; "Ayieee!"
	done

BirdKeeperBorisAfterBattleText:
	text "Het moet leuk zijn" ; "Since you're so"
	line "om te vechten als" ; "strong, it must be"
	cont "je zo sterk bent." ; "fun to battle."
	done

BirdKeeperBobSeenText:
	text "Het FIETSPAD is" ; "CYCLING ROAD is a"
	line "een kortere route" ; "quick shortcut to"
	cont "naar CELADON." ; "CELADON."
	done

BirdKeeperBobBeatenText:
	text "…Poeh!" ; "…Whew!"
	done

BirdKeeperBobAfterBattleText:
	text "Als je geen FIETS" ; "If you don't have"
	line "hebt, kun je de" ; "a BICYCLE, you're"

	para "kortere weg hier" ; "not allowed to use"
	line "niet gebruiken." ; "the shortcut."
	done

Route18SignText:
	text "ROUTE 18"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	def_object_events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
