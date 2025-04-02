	object_const_def
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_SUPER_NERD1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTomAfterBattleText
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8

BikerDwayneSeenText:
	text "We zijn de KANTO" ; "We're the KANTO"
	line "#MON-FEDERATIE-" ; "#MON FEDERATION"
	cont "trainergroep." ; "trainer group."

	para "We rijden je" ; "We'll drive you"
	line "onder onze wielen!" ; "under our wheels!"
	done

BikerDwayneBeatenText:
	text "S-sorry!"
	done

BikerDwayneAfterBattleText:
	text "De KANTO-#MON-" ; "The KANTO #MON"
	line "FEDERATIE zal" ; "FEDERATION will"
	cont "nooit falen!" ; "never fall!"
	done

BikerHarrisSeenText:
	text "De wouten hebben" ; "The cops shut down"
	line "ons ONDERGRONDS" ; "our UNDERGROUND"

	para "PAD afgesloten!" ; "PATH! That really"
	line "Dat maakt me" ; "fries me!"
	cont "echt pissig!" ;
	done

BikerHarrisBeatenText:
	text "V-Vergeef me!" ; "F-forgive me!"
	done

BikerHarrisAfterBattleText:
	text "Verslagen door" ; "Wiped out by some"
	line "een snotneus uit" ; "punk from JOHTO…"
	cont "JOHTO…" ;
	done

BikerZekeSeenText:
	text "We zijn de KANTO-" ; "We're the KANTO"
	line "#MON-FEDERA-"
	cont "TIE!" ; "TION!"
	cont "Hoppa!" ; "Right on!"
	done

BikerZekeBeatenText:
	text "Oef! Sorry!" ; "Yikes! Sorry!"
	done

BikerZekeAfterBattleText:
	text "We zullen voor-" ; "We'll try not to"
	line "taan niemand meer" ; "disturb anyone"
	cont "storen…" ; "from now on…"
	done

SupernerdSamSeenText:
	text "Hoe werkt de" ; "How does the MAG-"
	line "ZWEEFTREIN?" ; "NET TRAIN work?"
	done

SupernerdSamBeatenText:
	text "Ik wil gewoon de" ; "I just want to see"
	line "ZWEEFTREIN zien…" ; "the MAGNET TRAIN…"
	done

SupernerdSamAfterBattleText:
	text "De kracht van" ; "The power of mag-"
	line "magneten is gaaf!" ; "nets is awesome!"
	done

SupernerdTomSeenText:
	text "Hm… Je hebt veel" ; "Hm… You've got"
	line "GYMBADGES." ; "many GYM BADGES."
	done

SupernerdTomBeatenText:
	text "Zoals ik al dacht…" ; "Just as I thought…"
	line "Je bent sterk!" ; "You're tough!"
	done

SupernerdTomAfterBattleText:
	text "GYMBADGES geven" ; "GYM BADGES give"
	line "je voordelen in" ; "you advantages in"
	cont "gevechten." ; "battles."
	done

Route8LockedDoorText:
	text "Het zit op slot…" ; "It's locked…"
	done

Route8UndergroundPathSignText:
	text "De folder is" ; "The flyer's torn."
	line "gescheurd." ;

	para "Het is niet" ; "It's impossible to"
	line "te lezen…" ; "read…"
	done

Route8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  4, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4,  5, ROUTE_8_SAFFRON_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, Route8UndergroundPathSign
	bg_event 10,  5, BGEVENT_READ, Route8LockedDoor

	def_object_events
	object_event 10,  8, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBikerDwayne, -1
	object_event 10,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, -1
	object_event 10, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBikerZeke, -1
	object_event 23,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	object_event 31, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdTom, -1
	object_event 33,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
