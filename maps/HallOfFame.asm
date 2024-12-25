	object_const_def
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	def_scene_scripts
	scene_script HallOfFameEnterScene, SCENE_HALLOFFAME_ENTER
	scene_script HallOfFameNoopScene,  SCENE_HALLOFFAME_NOOP

	def_callbacks

HallOfFameEnterScene:
	sdefer HallOfFameEnterScript
	end

HallOfFameNoopScene:
	end

HallOfFameEnterScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_HALLOFFAME_NOOP
	pause 15
	setval HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_TELEPORT_GUY
	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setmapscene SPROUT_TOWER_3F, SCENE_SPROUTTOWER3F_NOOP
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "LANCE: Het is lang" ; "LANCE: It's been a"
	line "geleden sinds ik" ; "long time since I"
	cont "hier was." ; "last came here."

	para "Hier eren wij de" ; "This is where we"
	line "KAMPIOENEN van de" ; "honor the LEAGUE"

	para "LEAGUE tot in de" ; "CHAMPIONS for all"
	line "eeuwigheid." ; "eternity."

	para "Hun heldhaftige" ; "Their courageous"
	line "#MON worden ook" ; "#MON are also"
	cont "ingeleid." ; "inducted."

	para "We zijn vandaag" ; "Here today, we"
	line "getuige van de" ; "witnessed the rise"

	para "opkomst van een" ; "of a new LEAGUE"
	line "nieuwe KAMPIOEN--" ; "CHAMPION--a"

	para "een trainer die" ; "trainer who feels"
	line "compassie voor" ; "compassion for,"

	para "en vertrouwen in" ; "and trust toward,"
	line "alle #MON" ; "all #MON."
	cont "heeft."

	para "Een trainer die" ; "A trainer who"
	line "slaagde dankzij" ; "succeeded through"

	para "volharding en" ; "perseverance and"
	line "vastberadenheid." ; "determination."

	para "De nieuwe LEAGUE-" ; "The new LEAGUE"
	line "KAMPIOEN die alles" ; "CHAMPION who has"

	para "heeft om groots" ; "all the makings"
	line "te zijn!" ; "of greatness!"

	para "<PLAY_G>, laat mij" ; "<PLAY_G>, allow me"
	line "jou en je partners" ; "to register you"

	para "registreren als" ; "and your partners"
	line "KAMPIOENEN!" ; "as CHAMPIONS!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
