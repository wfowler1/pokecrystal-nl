	object_const_def
	const FASTSHIPCABINS_SW_SSW_NW_FISHER
	const FASTSHIPCABINS_SW_SSW_NW_BUG_CATCHER
	const FASTSHIPCABINS_SW_SSW_NW_BEAUTY
	const FASTSHIPCABINS_SW_SSW_NW_ROCKER

FastShipCabins_SW_SSW_NW_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, BugCatcherKenSeenText, BugCatcherKenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKenAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCassieAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristClyde:
	trainer GUITARIST, CLYDE, EVENT_BEAT_GUITARIST_CLYDE, GuitaristClydeSeenText, GuitaristClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	opentext
	writetext GuitaristClydeAfterBattleText
	waitbutton
	closetext
	end

.mobile
	opentext
	writetext GuitaristClydeAfterBattleMobileText
	waitbutton
	closetext
	end

FastShipBed:
	opentext
	writetext FastShipBedText1
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInFromBlack
	opentext
	writetext FastShipBedText2
	waitbutton
	closetext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .ArrivedOlivine
	opentext
	writetext FastShipArrivedVermilionText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	opentext
	writetext FastShipArrivedOlivineText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd TrashCanScript

FirebreatherLyleSeenText:
	text "Ik ga naar KANTO" ; "I'm going to KANTO"
	line "voor mijn vuur-" ; "to put on fire-"
	cont "spuwshows!" ; "breathing shows!"
	done

FirebreatherLyleBeatenText:
	text "Uitgedoofd… de" ; "Fizzle… The"
	line "vlam is klein…" ; "flame's tiny…"
	done

FirebreatherLyleAfterBattleText:
	text "Vuur zal wel zwak" ; "I guess fire is"
	line "zijn op zee, dan." ; "weak on the sea."

	para "Maakt het niet" ; "It doesn't matter?"
	line "uit? Echt?" ; "Really?"
	done

BugCatcherKenSeenText:
	text "Ik bezoek mijn" ; "I'm visiting my"
	line "oma om insecten" ; "grandma to catch"
	cont "te vangen!" ; "me some bugs!"
	done

BugCatcherKenBeatenText:
	text "Ooh, wow." ; "Ooh, wow."
	line "Jij bent lastig!" ; "You're tough!"
	done

BugCatcherKenAfterBattleText:
	text "In de bomen van" ; "You can find lots"
	line "JOHTO kun je veel" ; "of #MON in the"
	cont "#MON vinden!" ; "trees of JOHTO!"
	done

BeautyCassieSeenText:
	text "Ik wil mijn zorgen" ; "I'm trying to"
	line "graag vergeten." ; "forget my woes."
	cont "Laten we vechten!" ; "Let's battle!"
	done

BeautyCassieBeatenText:
	text "Mijn hart huilt…" ; "My heart weeps…"
	done

BeautyCassieAfterBattleText:
	text "Een zeereis werkt" ; "A voyage is best"
	line "het beste tegen" ; "for getting over"
	cont "een gebroken hart." ; "a broken heart."

	para "Maar om te treuren" ; "But a FAST SHIP"
	line "is een tripje met" ; "trip is too short"
	cont "dit schip te kort." ; "for grieving."
	done

GuitaristClydeSeenText:
	text "Ik ga mijn liedjes" ; "I'm going to audi-"
	line "laten horen op" ; "tion my songs at"

	para "GOLDENROD's RADIO-" ; "GOLDENROD's RADIO"
	line "STATION." ; "STATION."
	done

GuitaristClydeBeatenText:
	text "Yowza!" ; "Yowza!"
	line "Helemaal vervormd!" ; "Total distortion!"
	done

GuitaristClydeAfterBattleMobileText:
	text "Ik wilde mijn" ; "I was going to"
	line "debuut maken bij" ; "make my debut at"
	cont "de GEVECHTSTOREN…" ; "the BATTLE TOWER…"

	para "Ik ga terug naar" ; "I should go back"
	line "VERMILION om te" ; "to VERMILION and"
	cont "trainen, denk ik…" ; "redo my training…"
	done

GuitaristClydeAfterBattleText:
	text "Over het RADIO-" ; "Speaking of the"
	line "STATION gesproken," ; "RADIO STATION,"

	para "wat is deze week" ; "what's this week's"
	line "het geluksnummer?" ; "lucky number?"
	done

FastShipBedText1:
	text "Een knus bed Even!" ; "A comfy bed!"
	line "een uiltje knappen…" ; "Time to sleep…"
	done

FastShipBedText2:
	text "Ah, je kan er weer" ; "Ah, refreshed and"
	line "helemaal tegenaan!" ; "restored!"
	done

FastShipArrivedOlivineText:
	text "SNELSCHIP S.S.AQUA" ; "FAST SHIP S.S.
	line "is aangekomen in" ; "has arrived in"
	cont "OLIVINE CITY." ; "OLIVINE CITY."
	done

FastShipArrivedVermilionText:
	text "SNELSCHIP S.S.AQUA" ; "FAST SHIP S.S.
	line "is aangekomen in" ; "has arrived in"
	cont "VERMILION CITY." ; "VERMILION CITY."
	done

FastShipCabins_SW_SSW_NW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed
	bg_event  7,  7, BGEVENT_READ, FastShipCabinsNorthwestCabinTrashcan

	def_object_events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 26, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
