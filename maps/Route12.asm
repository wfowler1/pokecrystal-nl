	object_const_def
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "Geduld is de" ; "Patience is the"
	line "sleutel tot vissen" ; "key to both fish-"
	cont "en #MON." ; "ing and #MON."
	done

FisherMartinBeatenText:
	text "Waaah!" ; "Gwaaah!"
	done

FisherMartinAfterBattleText:
	text "Ik heb geen geduld" ; "I'm too impatient"
	line "voor vissen…" ; "for fishing…"
	done

FisherStephenSeenText:
	text "Ik voel me zo" ; "I feel so content,"
	line "prettig, vissend" ; "fishing while lis-"
	cont "terwijl ik naar de" ; "tening to some"
	cont "radio luister." ; "tunes on my radio."
	done

FisherStephenBeatenText:
	text "Mijn stomme radio" ; "My stupid radio"
	line "leidde me af!" ; "distracted me!"
	done

FisherStephenAfterBattleText:
	text "Heb je KANTO's" ; "Have you checked"
	line "radioprogramma's" ; "out KANTO's radio"

	para "geluisterd? We" ; "programs? We get a"
	line "hebben veel keuze." ; "good variety here."
	done

FisherBarneySeenText:
	text "Wat is het belang-" ; "What's most impor-"
	line "rijkste in onze" ; "tant in our every-"
	cont "dagelijkse levens?" ; "day lives?"
	done

FisherBarneyBeatenText:
	text "Het antwoord komt" ; "The answer is"
	line "hierna!" ; "coming up next!"
	done

FisherBarneyAfterBattleText:
	text "Ik vind elektri-" ; "I think electric-"
	line "citeit het belang-" ; "ity is the most"

	para "rijkste in onze" ; "important thing in"
	line "dagelijkse levens." ; "our daily lives."

	para "Als dat niet zo" ; "If it weren't,"
	line "was, zou men zich" ; "people wouldn't"

	para "niet zo opwinden" ; "have made such a"
	line "toen de ENERGIE-" ; "fuss when the"

	para "CENTRALE buiten" ; "POWER PLANT went"
	line "gebruik was." ; "out of commission."
	done

FisherKyleSeenText:
	text "Weet je nog?" ; "Do you remember?"
	done

FisherKyleBeatenText:
	text "Je weet het nog?" ; "You do remember?"
	done

FisherKyleAfterBattleText:
	text "De ruk die je aan" ; "The tug you feel"
	line "de hengel voelt" ; "on the ROD when"

	para "als je een #MON" ; "you hook a #-"
	line "aan de lijn hebt…" ; "MON…"

	para "Dat is het beste" ; "That's the best"
	line "gevoel ooit voor" ; "feeling ever for"
	cont "een visser als ik." ; "an angler like me."
	done

Route12SignText:
	text "ROUTE 12"

	para "NOORDWAARTS NAAR" ; "NORTH TO LAVENDER"
	line "LAVENDER TOWN" ; "TOWN"
	done

FishingSpotSignText:
	text "VISPLEK" ; "FISHING SPOT"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	def_object_events
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 14, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
