	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	def_scene_scripts
	scene_script LancesRoomLockDoorScene, SCENE_LANCESROOM_LOCK_DOOR
	scene_script LancesRoomNoopScene,     SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorsCallback

LancesRoomLockDoorScene:
	sdefer LancesRoomDoorLocksBehindYouScript
	end

LancesRoomNoopScene:
	end

LancesRoomDoorsCallback:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	endcallback

LancesRoomDoorLocksBehindYouScript:
	applymovement PLAYER, LancesRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	refreshmap
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	sjump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	refreshmap
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRushesIn
	opentext
	writetext LancesRoomMaryOhNoOakText
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryYieldsToOak
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LancesRoomOakCongratulationsText
	waitbutton
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryInterviewChampion
	turnobject PLAYER, LEFT
	opentext
	writetext LancesRoomMaryInterviewText
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LancesRoomNoisyText
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryTriesToFollow
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext LancesRoomMaryNoInterviewText
	pause 30
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRunsBackAndForth
	special FadeOutToWhite
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

LanceBattleIntroText:
	text "LANCE: Ik heb" ; "LANCE: I've been"
	line "op je gewacht." ; "waiting for you."

	para "<PLAY_G>!"

	para "Ik wist dat je," ; "I knew that you,"
	line "met jouw vaardig-" ; "with your skills,"

	para "heden, me uitein-" ; "would eventually"
	line "delijk hier zou" ; "reach me here."

	para "bereiken. Geen" ; "There's no need"
	line "woorden nu." ; "for words now."

	para "We zullen vechten" ; "We will battle to"
	line "om te beslissen" ; "determine who is"

	para "wie de sterkere" ; "the stronger of"
	line "van ons twee is." ; "the two of us."

	para "Als de machtigste" ; "As the most power-"
	line "trainer en als de" ; "ful trainer and as"

	para "#MON-LEAGUE" ; "the #MON LEAGUE"
	line "KAMPIOEN…" ; "CHAMPION…"

	para "Ik, LANCE de" ; "I, LANCE the drag-"
	line "drakenmeester," ; "on master, accept"
	cont "accepteer je" ; "your challenge!"
	cont "uitdaging!" ;
	done

LanceBattleWinText:
	text "…Het is voorbij." ; "…It's over."

	para "Maar het is een" ; "But it's an odd"
	line "vreemd gevoel." ; "feeling."

	para "Ik ben niet boos" ; "I'm not angry that"
	line "dat ik heb ver-" ; "I lost. In fact, I"
	cont "loren. Sterker" ; "feel happy."
	cont "nog, ik ben blij." ;

	para "Blij dat ik ge-" ; "Happy that I"
	line "tuige ben van de" ; "witnessed the rise"

	para "opkomst van een" ; "of a great new"
	line "geweldige nieuwe" ; "CHAMPION!"
	cont "KAMPIOEN!" ;
	done

LanceBattleAfterText:
	text "…Pfoe." ; "…Whew."

	para "Je bent echt" ; "You have become"
	line "sterk geworden," ; "truly powerful,"
	cont "<PLAY_G>."

	para "Je #MON hebben" ; "Your #MON have"
	line "je sterke en op-" ; "responded to your"

	para "rechte aard" ; "strong and up-"
	line "aangevoeld." ; "standing nature."

	para "Als een trainer" ; "As a trainer, you"
	line "zul je blijven" ; "will continue to"

	para "groeien met je" ; "grow strong with"
	line "#MON." ; "your #MON."
	done

LancesRoomMaryOhNoOakText:
	text "MARY: Oh nee!" ; "MARY: Oh, no!"
	line "Het is al voorbij!" ; "It's all over!"

	para "PROF.OAK, als je" ; "PROF.OAK, if you"
	line "nou niet zo" ; "weren't so slow…"
	cont "langzaam was…" ;
	done

LancesRoomOakCongratulationsText:
	text "PROF.OAK: Ah,"
	line "<PLAY_G>!"

	para "Het is een tijd" ; "It's been a long"
	line "geleden." ; "while."

	para "Je ziet er zeker" ; "You certainly look"
	line "indrukwekkender" ; "more impressive."
	cont "uit." ;

	para "Je verovering van" ; "Your conquest of"
	line "de LEAGUE is ge-" ; "the LEAGUE is just"
	cont "woon fantastisch!" ; "fantastic!"

	para "Je toewijding," ; "Your dedication,"
	line "vertrouwen en" ; "trust and love for"

	para "liefde voor je" ; "your #MON made"
	line "#MON zorgden" ; "this happen."
	cont "hiervoor." ;

	para "Je #MON waren" ; "Your #MON were"
	line "ook waanzinnig." ; "outstanding too."

	para "Omdat ze in jou" ; "Because they be-"
	line "als een trainer" ; "lieved in you as a"

	para "geloven, vol-" ; "trainer, they per-"
	line "hardden ze." ; "severed."

	para "Gefeliciteerd," ; "Congratulations,"
	line "<PLAY_G>!"
	done

LancesRoomMaryInterviewText:
	text "MARY: Laten we" ; "MARY: Let's inter-"
	line "de gloednieuwe" ; "view the brand new"
	cont "KAMPIOEN" ; "CHAMPION!"
	cont "interviewen!" ;
	done

LancesRoomNoisyText:
	text "LANCE: Het wordt" ; "LANCE: This is"
	line "een beetje druk" ; "getting to be a"
	cont "hier…" ; "bit too noisy…"

	para "<PLAY_G>, kan je" ; "<PLAY_G>, could you"
	line "met me mee komen?" ; "come with me?"
	done

LancesRoomMaryNoInterviewText:
	text "MARY: Oh, wacht!" ; "MARY: Oh, wait!"
	line "We hebben nog" ; "We haven't done"
	cont "geen interview!" ; "the interview!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  4,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
