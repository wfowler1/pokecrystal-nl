	object_const_def
	const CIANWOODPHARMACY_PHARMACIST

CianwoodPharmacy_MapScripts:
	def_scene_scripts
	scene_script CianwoodPharmacyNoopScene ; unusable

	def_callbacks

CianwoodPharmacyNoopScene:
	end

CianwoodPharmacist:
	faceplayer
	opentext
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	writetext PharmacistGiveSecretpotionText
	promptbutton
	giveitem SECRETPOTION
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	end

.Mart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyBookshelf:
	jumpstd DifficultBookshelfScript

PharmacistGiveSecretpotionText:
	text "Je #MON lijken" ; "Your #MON ap-"
	line "gezond." ; "pear to be fine."

	para "Maak je je ergens" ; "Is something wor- "
	line "zorgen om?" ; "rying you?"

	para "…"

	para "De VUURTOREN-" ; "The LIGHTHOUSE"
	line "#MON is in" ; "#MON is in"
	cont "nood?" ; "trouble?"

	para "Ik heb het!" ; "I got it!"

	para "Dit zal" ; "This ought to do"
	line "helpen." ; "the trick."
	done

ReceivedSecretpotionText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "GEHEIMEDRANK." ; "SECRETPOTION."
	done

PharmacistDescribeSecretpotionText:
	text "Mijn GEHEIMEDRANK" ; "My SECRETPOTION is"
	line "is vrij sterk. Ik" ; "a tad too strong."

	para "gebruik het alleen" ; "I only offer it in"
	line "in noodgevallen." ; "an emergency."
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 4
	warp_event  3,  7, CIANWOOD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodPharmacyBookshelf

	def_object_events
	object_event  2,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
