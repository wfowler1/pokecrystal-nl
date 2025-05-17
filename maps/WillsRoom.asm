	object_const_def
	const WILLSROOM_WILL

WillsRoom_MapScripts:
	def_scene_scripts
	scene_script WillsRoomLockDoorScene, SCENE_WILLSROOM_LOCK_DOOR
	scene_script WillsRoomNoopScene,     SCENE_WILLSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorsCallback

WillsRoomLockDoorScene:
	sdefer WillsRoomDoorLocksBehindYouScript
	end

WillsRoomNoopScene:
	end

WillsRoomDoorsCallback:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

WillsRoomDoorLocksBehindYouScript:
	applymovement PLAYER, WillsRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_WILLSROOM_NOOP
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue WillScript_AfterBattle
	writetext WillScript_WillBeforeText
	waitbutton
	closetext
	winlosstext WillScript_WillBeatenText, 0
	loadtrainer WILL, WILL1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opentext
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	end

WillScript_AfterBattle:
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	end

WillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

WillScript_WillBeforeText:
	text "Welkom bij de" ; "Welcome to #MON"
	line "#MON-LEAGUE," ; "LEAGUE, <PLAYER>."
	cont "<PLAYER>."

	para "Laat mij mezelf" ; "Allow me to intro-"
	line "introduceren." ; "duce myself. I am"
	cont "Ik ben WILL." ; "WILL."

	para "Overal ter wereld" ; "I have trained all"
	line "heb ik mijn psy-" ; "around the world,"

	para "chische #MON" ; "making my psychic"
	line "getraind." ; "#MON powerful."

	para "En nu hoor ik" ; "And, at last, I've"
	line "eindelijk bij de" ; "been accepted into"
	cont "ELITE FOUR." ; "the ELITE FOUR."

	para "Ik kan alleen maar" ; "I can only keep"
	line "beter worden!" ; "getting better!"

	para "Verliezen is" ; "Losing is not an"
	line "geen optie!" ; "option!"
	done

WillScript_WillBeatenText:
	text "N… Niet te…" ; "I… I can't…"
	line "geloven…" ; "believe it…"
	done

WillScript_WillDefeatText:
	text "Ik verander mijn" ; "Even though I was"
	line "koers niet, ook al" ; "defeated, I won't"
	cont "ben ik verslagen." ; "change my course."

	para "Ik blijf vechten" ; "I will continue"
	line "totdat ik boven" ; "battling until I"

	para "alle andere" ; "stand above all"
	line "trainers sta!" ; "trainers!"

	para "Goed, <PLAYER>, ga" ; "Now, <PLAYER>, move"
	line "verder en ontdek" ; "on and experience"

	para "de ware felheid" ; the true ferocity"
	line "van de ELITE FOUR." ; "of the ELITE FOUR."
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WillScript_Battle, -1
