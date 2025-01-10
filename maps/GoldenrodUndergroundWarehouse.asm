	object_const_def
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundWarehouseResetSwitchesCallback

GoldenrodUndergroundWarehouseResetSwitchesCallback:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntM24SeenText:
	text "Hoe ben je zo" ; "How did you get"
	line "ver gekomen?" ; "this far?"

	para "Nouja, maakt" ; "I guess it can't"
	line "niet uit. Ik zorg" ; "be helped. I'll"
	cont "wel dat je oprot." ; "dispose of you."
	done

GruntM24BeatenText:
	text "Ik ben verslagen…" ; "I got disposed of…"
	done

GruntM24AfterBattleText:
	text "TEAM ROCKET zal" ; "TEAM ROCKET will"
	line "blijven bestaan," ; "keep going, wait-"
	cont "wachtend tot" ; "ing for the return"
	cont "GIOVANNI terug-" ; "of GIOVANNI."
	cont "keert." ;

	para "We gaan tot" ; "We'll do whatever"
	line "het uiterste." ; "it takes."
	done

GruntM14SeenText:
	text "Je gaat niet" ; "You're not going"
	line "verder dan dit!" ; "any farther!"

	para "Ik toon geen" ; "I don't show mercy"
	line "genade aan mijn" ; "to my enemies, not"
	cont "vijanden, ook niet" ; "even brats!"
	cont "aan ettertjes!" ;
	done

GruntM14BeatenText:
	text "Verdraaid!" ; "Blast it!"
	done

GruntM14AfterBattleText:
	text "Ik heb verloren…" ; "I lost…"

	para "Vergeef me," ; "Please forgive me,"
	line "GIOVANNI!" ; "GIOVANNI!"
	done

GruntM15SeenText:
	text "Whahahaha!" ; "Hyuck-hyuck-hyuck!"
	line "Ik herken jou!" ; "I remember you!"

	para "Je had me goed" ; "You got me good"
	line "te pakken in onze" ; "at our hideout!"
	cont "schuilplaats!" ;
	done

GruntM15BeatenText:
	text "Whahahaha!" ; "Hyuck-hyuck-hyuck!"
	line "Ah, dus zo?" ; "So, that's how?"
	done

GruntM15AfterBattleText:
	text "Whahahaha!" ; "Hyuck-hyuck-hyuck!"
	line "Dat was geweldig!" ; "That was a blast!"
	cont "Ik zal je niet" ; "I'll remember you!"
	cont "vergeten!" ;
	done

DirectorIntroText:
	text "DIRECTEUR: Wie?" ; "DIRECTOR: Who?"
	line "Wat? Je komt me" ; "What? You came to"
	cont "redden?" ; "rescue me?"

	para "Dankjewel!" ; "Thank you!"

	para "De RADIOTOREN!" ; "The RADIO TOWER!"

	para "Wat gebeurt" ; "What's happening"
	line "daar?" ; "there?"

	para "Overgenomen door" ; "Taken over by TEAM"
	line "TEAM ROCKET?" ; "ROCKET?"

	para "Hier. Neem deze" ; "Here. Take this"
	line "SLEUTELKAART." ; "CARD KEY."
	done

DirectorCardKeyText:
	text "DIRECTEUR: Gebruik" ; "DIRECTOR: Use that"
	line "dat om de schuif-" ; "to open the shut-"
	cont "deuren op 3V te" ; "ters on 3F."
	cont "openen." ;
	done

DirectorAfterText:
	text "Ik smeek om jouw" ; "I'm begging you to"
	line "hulp hulp." ; "help."

	para "Wie weet wat ze" ; "There's no telling"
	line "doen als ze de" ; "what they'll do if"

	para "macht hebben" ; "they control the"
	line "over de zender." ; "transmitter."

	para "Ze kunnen zelfs" ; "They may even be"
	line "#MON beheersen" ; "able to control"

	para "door een speciaal" ; "#MON using a"
	line "signaal te zenden!" ; "special signal!"

	para "Je bent de enige" ; "You're the only"
	line "die kan helpen." ; "one I can call on."

	para "Red de RADIOTOREN," ; "Please save the"
	line "alsjeblieft…" ; "RADIO TOWER…"

	para "En alle #MON" ; "And all the #-"
	line "in het land!" ; "MON nationwide!"
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
