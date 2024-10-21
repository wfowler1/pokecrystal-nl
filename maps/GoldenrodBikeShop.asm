	object_const_def
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodBikeShopNoopScene: ; unreferenced
	end

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	promptbutton
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext GoldenrodBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext GoldenrodBikeShopClerkRefusedText
	waitbutton
	closetext
	end

GoldenrodBikeShopJustReleasedCompactBike: ; unreferenced
	jumptext GoldenrodBikeShopJustReleasedCompactBikeText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "…zucht… Ik ben" ; "…sigh… I moved"
	line "hierheen verhuisd," ; "here, but I can't"

	para "maar kan mijn" ; "sell my BICYCLES."
	line "FIETSEN niet" ; "Why is that?"
	
	para "verkopen…" ; 
	line "Waarom niet?";

	para "Zou je kunnen" ; "Could you ride a"
	line "FIETSEN en voor" ; "BICYCLE and adver-"
	cont "me reclame maken?" ; "tise for me?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "Echt? Fijn!" ; "Really? Great!"

	para "Geef me je naam" ; "Give me your name"
	line "en telefoonnummer" ; "and phone number,"

	para "en ik leen je" ; "and I'll loan you"
	line "een FIETS." ; "a BICYCLE."
	done

BorrowedABicycleText:
	text "<PLAYER> leent" ; "<PLAYER> borrowed a"
	line "een FIETS." ; "BICYCLE."
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "Mijn FIETSEN zijn" ; "My BICYCLES are"
	line "topkwaliteit!" ; "first-rate! You"

	para "Je kan ze" ; "can ride them"
	line "overal gebruiken." ; "anywhere."
	done

GoldenrodBikeShopClerkRefusedText:
	text "…zucht… Oh," ; "…sigh… Oh, for"
	line "medeleven voor" ; "the kindness of"
	cont "je medemens…" ; "people…"
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "Nieuw binnen!" ; "Just released!"

	para "Hoge kwaliteit" ; "First-rate compact"
	line "compacte FIETSEN!" ; "BICYCLES!"
	done

GoldenrodBikeShopBicycleText:
	text "Een glimmende" ; "It's a shiny new"
	line "nieuwe FIETS!" ; "BICYCLE!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	def_object_events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
