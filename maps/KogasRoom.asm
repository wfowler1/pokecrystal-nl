	object_const_def
	const KOGASROOM_KOGA

KogasRoom_MapScripts:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_script KogasRoomNoopScene,     SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorsCallback

KogasRoomLockDoorScene:
	sdefer KogasRoomDoorLocksBehindYouScript
	end

KogasRoomNoopScene:
	end

KogasRoomDoorsCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KogasRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KogasRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaScript_AfterBattle
	writetext KogaScript_KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_KogaBeatenText, 0
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

KogaScript_AfterBattle:
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaScript_KogaBeforeText:
	text "Fwahahahaha!"

	para "Ik ben KOGA van de" ; "I am KOGA of the"
	line "ELITE FOUR."

	para "Ik leef in de" ; "I live in shadows,"
	line "schaduw als ninja!" ; "a ninja!"

	para "M'n complexe stijl" ; "My intricate style"
	line "zal je verbazen" ; "will confound and"
	cont "en verwoesten!" ; "destroy you!"

	para "Verwarring, slaap," ; "Confusion, sleep,"
	line "gif…" ; "poison…"

	para "Bereid voor om" ; "Prepare to be the"
	line "slachtoffer te" ; "victim of my sin-"
	cont "worden van mijn" ; "ister technique!"
	cont "techniek!"

	para "Fwahahahaha!"

	para "#MON gaat om" ; "#MON is not"
	line "meer dan brute" ; "merely about brute"

	para "kracht--dat zul je" ; "force--you shall"
	line "snel zien!" ; "see soon enough!"
	done

KogaScript_KogaBeatenText:
	text "Ah!" ; "Ah!"
	line "Je hebt je" ; "You have proven"
	cont "bewezen!" ; "your worth!"
	done

KogaScript_KogaDefeatText:
	text "Ik heb alles" ; "I subjected you to"
	line "gegeven dat ik in" ; "everything I could"
	cont "mij had." ; "muster."

	para "Maar het was niet" ; "But my efforts"
	line "genoeg. Ik moet" ; "failed. I must"
	cont "mezelf verbeteren." ; "hone my skills."

	para "Ga voort en stel" ; "Go on to the next"
	line "jezelf op de" ; "room, and put your"
	cont "proef!" ; "abilities to test!"
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KogaScript_Battle, -1
