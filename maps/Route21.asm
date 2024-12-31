	object_const_def
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER

Route21_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Hoi daar! Ik" ; "Land ho! Gotta"
	line "moet doorgaan!" ; "keep going!"
	done

SwimmermSethBeatenText:
	text "Kloek…" ; "Glug…"
	done

SwimmermSethAfterBattleText:
	text "Er was een arro-" ; "This arrogant guy"
	line "gante gast bij de" ; "was at CINNABAR's"
	cont "vulkaan van" ; "volcano."
	cont "CINNABAR." ;
	done

SwimmerfNikkiSeenText:
	text "Als ik win, moet" ; "If I win, you have"
	line "je me helpen met" ; "to help me with my"
	cont "mijn zonnebrand!" ; "suntan lotion!"
	done

SwimmerfNikkiBeatenText:
	text "Ik ben bang te" ; "I'm worried about"
	line "verbranden…" ; "sunburn…"
	done

SwimmerfNikkiAfterBattleText:
	text "Ik moet oppassen" ; "I have to watch"
	line "voor vlekjes door" ; "out for blemishes"
	cont "de zon." ; "caused by the sun."
	done

FisherArnoldSeenText:
	text "Ik ben het vissen" ; "I'm bored by fish-"
	line "zat. Laten we" ; "ing. Let's battle!"
	cont "vechten!" ;
	done

FisherArnoldBeatenText:
	text "Totaal gefaald…" ; "Utter failure…"
	done

FisherArnoldAfterBattleText:
	text "Ik ga wel weer" ; "I'll just go back"
	line "vissen…" ; "to fishing…"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  2, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
