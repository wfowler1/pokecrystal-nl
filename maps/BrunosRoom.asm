	object_const_def
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScripts:
	def_scene_scripts
	scene_script BrunosRoomLockDoorScene, SCENE_BRUNOSROOM_LOCK_DOOR
	scene_script BrunosRoomNoopScene,     SCENE_BRUNOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorsCallback

BrunosRoomLockDoorScene:
	sdefer BrunosRoomDoorLocksBehindYouScript
	end

BrunosRoomNoopScene:
	end

BrunosRoomDoorsCallback:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

BrunosRoomDoorLocksBehindYouScript:
	applymovement PLAYER, BrunosRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_BRUNOSROOM_NOOP
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "Ik ben BRUNO van" ; "I am BRUNO of the"
	line "de ELITE FOUR." ; "ELITE FOUR."

	para "Ik train altijd" ; "I always train to"
	line "extreem hard omdat" ; "the extreme be-"
	cont "ik geloof in onze" ; "cause I believe in"
	cont "potentie." ; "our potential."

	para "Dat is hoe ik" ; "That is how we"
	line "sterk werd." ; "became strong."

	para "Kun jij onze" ; "Can you withstand"
	line "kracht weerstaan?" ; "our power?"

	para "Hm? Ik zie geen" ; "Hm? I see no fear"
	line "angst in je. Je" ; "in you. You look"

	para "bent zeker van je" ; "determined. Per-"
	line "zaak. Perfect voor" ; "fect for battle!"

	para "een gevecht! Ben" ; "Ready, <PLAYER>?"
	line "je klaar <PLAYER>?" ; "You will bow down"

	para "Buig voor onze" ; "to our overwhelm-"
	line "overweldigende" ; "ing power!"
	cont "kracht!"

	para "Hoo hah!"
	done

BrunoScript_BrunoBeatenText:
	text "Waarom? Hoe konden" ; "Why? How could we"
	line "we verliezen?" ; "lose?"
	done

BrunoScript_BrunoDefeatText:
	text "Na mijn verlies" ; "Having lost, I"
	line "heb ik geen recht" ; "have no right to"
	cont "om iets te zeggen…" ; "say anything…"

	para "Neem het op tegen" ; "Go face your next"
	line "de volgende uit-" ; "challenge!"
	cont "daging!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
