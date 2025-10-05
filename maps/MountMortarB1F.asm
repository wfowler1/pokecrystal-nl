	object_const_def
	const MOUNTMORTARB1F_POKE_BALL1
	const MOUNTMORTARB1F_POKE_BALL2
	const MOUNTMORTARB1F_BOULDER
	const MOUNTMORTARB1F_KIYO
	const MOUNTMORTARB1F_POKE_BALL3
	const MOUNTMORTARB1F_POKE_BALL4
	const MOUNTMORTARB1F_POKE_BALL5

MountMortarB1F_MapScripts:
	def_scene_scripts

	def_callbacks

MountMortarB1FKiyoScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue .GotTyrogue
	checkevent EVENT_BEAT_BLACKBELT_KIYO
	iftrue .BeatKiyo
	writetext MountMortarB1FKiyoIntroText
	waitbutton
	closetext
	winlosstext MountMortarB1FKiyoWinText, 0
	loadtrainer BLACKBELT_T, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLACKBELT_KIYO
	opentext
.BeatKiyo:
	writetext MountMortarB1FTyrogueRewardText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext MountMortarB1FReceiveMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYROGUE, 10
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
.GotTyrogue:
	writetext MountMortarB1FKiyoGotTyrogueText
	waitbutton
	closetext
	end

.NoRoom:
	writetext MountMortarB1FKiyoFullPartyText
	waitbutton
	closetext
	end

MountMortarB1FBoulder:
	jumpstd StrengthBoulderScript

MountMortarB1FHyperPotion:
	itemball HYPER_POTION

MountMortarB1FCarbos:
	itemball CARBOS

MountMortarB1FFullRestore:
	itemball FULL_RESTORE

MountMortarB1FMaxEther:
	itemball MAX_ETHER

MountMortarB1FPPUp:
	itemball PP_UP

MountMortarB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

MountMortarB1FKiyoIntroText:
	text "He!" ; "Hey!"

	para "Ik ben de" ; "I am the KARATE"
	line "KARATEKONING!" ; "KING!"

	para "Ik train hier" ; "I train alone here"
	line "alleen in het" ; "in the dark!"
	cont "duister!"

	para "Jij!" ; "You!"
	line "Vecht met me!" ; "Battle with me!"

	para "Hwaaarggh!"
	done

MountMortarB1FKiyoWinText:
	text "Waaaarggh!"
	line "Ik ben verslagen!" ; "I'm beaten!"
	done

MountMortarB1FTyrogueRewardText:
	text "Ik… Ik ben" ; "I… I'm crushed…"
	cont "vermorzeld…"

	para "Mijn training is" ; "My training is"
	line "nog onvoldoende…" ; "still not enough…"

	para "Maar verloren is" ; "But a loss is a"
	line "verloren. Ik geef" ; "loss. I admit it."
	cont "het toe."

	para "Als bewijs dat je" ; "As proof that you"
	line "van me won, geef" ; "defeated me, I'll"

	para "ik je een zeldzame" ; "give you a rare"
	line "vecht-#MON." ; "fighting #MON."
	done

MountMortarB1FReceiveMonText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "TUUROST."
	done

MountMortarB1FKiyoGotTyrogueText:
	text "TUUROST is een" ; "TYROGUE is a"
	line "vecht-type." ; "fighting-type."

	para "Het evolueert in" ; "It evolves into a"
	line "een sterkere" ; "tougher #MON."
	cont "#MON."

	para "Blijf goed je best" ; "Keep up the hard"
	line "doen. Ik blijf" ; "work. I'll keep"
	cont "ook trainen." ; "training too."

	para "Vaarwel!" ; "Farewell!"
	done

MountMortarB1FKiyoFullPartyText:
	text "Je hebt geen plek" ; "You have no room"
	line "in je team!" ; "in your party!"
	done

MountMortarB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM, MountMortarB1FHiddenMaxRevive

	def_object_events
	object_event 29, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FHyperPotion, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	object_event  4, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FCarbos, EVENT_MOUNT_MORTAR_B1F_CARBOS
	object_event  9, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FBoulder, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	object_event 34, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FFullRestore, EVENT_MOUNT_MORTAR_B1F_FULL_RESTORE
	object_event 32,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FMaxEther, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	object_event 21, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FPPUp, EVENT_MOUNT_MORTAR_B1F_PP_UP
