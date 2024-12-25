	object_const_def
	const KARENSROOM_KAREN

KarensRoom_MapScripts:
	def_scene_scripts
	scene_script KarensRoomLockDoorScene, SCENE_KARENSROOM_LOCK_DOOR
	scene_script KarensRoomNoopScene,     SCENE_KARENSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorsCallback

KarensRoomLockDoorScene:
	sdefer KarensRoomDoorLocksBehindYouScript
	end

KarensRoomNoopScene:
	end

KarensRoomDoorsCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KarensRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KarensRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KARENSROOM_NOOP
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	writetext KarenScript_KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	loadtrainer KAREN, KAREN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
	text "Ik ben KAREN van" ; "I am KAREN of the"
	line "de ELITE FOUR." ; "ELITE FOUR."

	para "Jij bent <PLAYER>?" ; "You're <PLAYER>?"
	line "Wat grappig." ; "How amusing."

	para "Ik ben dol op" ; "I love dark-type"
	line "duister-type #-" ; "#MON."
	cont "MON."

	para "Ik vind hun wilde," ; "I find their wild,"
	line "ruwe imago zo" ; "tough image to be"

	para "aanlokkelijk. En" ; "so appealing. And"
	line "ze zijn krachtig." ; "they're so strong."

	para "Denk je ze aan te" ; "Think you can take"
	line "kunnen? Probeer" ; "them? Just try to"
	cont "het maar." ; "entertain me."

	para "We beginnen." ; "Let's go."
	done

KarenScript_KarenBeatenText:
	text "Zo, je bent echt" ; "Well, aren't you"
	line "goed. Ik kan dat" ; "good. I like that"
	cont "waarderen." ; "in a trainer."
	done

KarenScript_KarenDefeatText:
	text "Sterke #MON." ; "Strong #MON."

	para "Zwakke #MON." ; "Weak #MON."

	para "Dat is slechts het" ; "That is only the"
	line "egoïstische beeld" ; "selfish perception"
	cont "van mensen." ; "of people."

	para "Echt vaardige" ; "Truly skilled"
	line "trainers horen te" ; "trainers should"

	para "winnen met hun" ; "try to win with"
	line "favorieten." ; "their favorites."

	para "Ik waardeer je" ; "I like your style."
	line "stijl. Jij snapt" ; "You understand"
	cont "wat belangrijk is." ; "what's important."

	para "Ga verder--de" ; "Go on--the CHAM-"
	line "KAMPIOEN wacht." ; "PION is waiting."
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
