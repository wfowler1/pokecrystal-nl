	object_const_def
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2

Route3_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

FirebreatherOtisSeenText:
	text "Ah! Het weer is" ; "Ah! The weather's"
	line "top, zoals altijd." ; "as fine as ever."
	done

FirebreatherOtisBeatenText:
	text "Het is zonnig," ; "It's sunny, but"
	line "maar ik ben nat…" ; "I'm all wet…"
	done

FirebreatherOtisAfterBattleText:
	text "Als het regent is" ; "When it rains,"
	line "het lastig om aan" ; "it's hard to get"
	cont "te steken…" ; "ignition…"
	done

YoungsterWarrenSeenText:
	text "Hmm… Ik weet niet" ; "Hmmm… I don't know"
	line "wat ik moet doen…" ; "what to do…"
	done

YoungsterWarrenBeatenText:
	text "Ik wist dat ik" ; "I knew I'd lose…"
	line "zou verliezen…" ;
	done

YoungsterWarrenAfterBattleText:
	text "Je zag er sterk" ; "You looked strong."
	line "uit." ;

	para "Ik was bang om met" ; "I was afraid to"
	line "je te vechten…" ; "take you on…"
	done

YoungsterJimmySeenText:
	text "Ik kan rennen" ; "I can run like the"
	line "als de wind!" ; "wind!"
	done

YoungsterJimmyBeatenText:
	text "Weggeblazen!" ; "Blown away!"
	done

YoungsterJimmyAfterBattleText:
	text "Ik draag het hele" ; "I wear shorts the"
	line "jaar rond korte" ; "whole year round."
	cont "broeken." ;

	para "Dat is mijn" ; "That's my fashion"
	line "fashionbeleid." ; "policy."
	done

FirebreatherBurtSeenText:
	text "Kom naar voren" ; "Step right up and"
	line "en kijk eens!" ; "take a look!"
	done

FirebreatherBurtBeatenText:
	text "Auw! Dat is heet!" ; "Yow! That's hot!"
	done

FirebreatherBurtAfterBattleText:
	text "Ik ben de beste" ; "The greatest fire-"
	line "vuurspuwer in" ; "breather in KANTO,"
	cont "KANTO." ; "that's me."

	para "Maar niet de" ; "But not the best"
	line "beste trainer…" ; "trainer…"
	done

Route3MtMoonSquareSignText:
	text "MAANBERGPLEIN" ; "MT.MOON SQUARE"

	para "Ga gewoon de trap" ; "Just go up the"
	line "op." ; "stairs."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 52,  1, MOUNT_MOON, 1

	def_coord_events

	def_bg_events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	def_object_events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 49,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
