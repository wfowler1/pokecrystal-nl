DEF MAHOGANYTOWN_RAGECANDYBAR_PRICE EQU 300

	object_const_def
	const MAHOGANYTOWN_POKEFAN_M
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS

MahoganyTown_MapScripts:
	def_scene_scripts
	scene_script MahoganyTownNoop1Scene, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR
	scene_script MahoganyTownNoop2Scene, SCENE_MAHOGANYTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MahoganyTownFlypointCallback

MahoganyTownNoop1Scene:
	end

MahoganyTownNoop2Scene:
	end

MahoganyTownFlypointCallback:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantBlocksYouMovement
	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
	applymovement PLAYER, MahoganyTownPlayerStepLeftMovement
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantReturnsMovement
	end

MahoganyTownPokefanMScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	scall .SellRageCandyBars
	end

.ClearedRocketHideout:
	opentext
	writetext RageCandyBarMerchantSoldOutText
	waitbutton
	closetext
	end

.SellRageCandyBars:
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	special PlaceMoneyTopRight
	writetext RageCandyBarMerchantSavorItText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext RageCandyBarMerchantNotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext RageCandyBarMerchantRefusedText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RageCandyBarMerchantNoRoomText
	waitbutton
	closetext
	end

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd PokecenterSignScript

MahoganyTownCollideDownFaceLeftMovement: ; unreferenced
	step DOWN
	big_step UP
	turn_head DOWN
MahoganyTownPlayerStepLeftMovement:
	step LEFT
	step_end

MahoganyTownRageCandyBarMerchantBlocksYouMovement:
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

MahoganyTownRageCandyBarMerchantReturnsMovement:
	step UP
	turn_head DOWN
	step_end

RageCandyBarMerchantTryOneText:
	text "Hoihoi, koter!" ; "Hiya, kid!"

	para "Ik zie dat je" ; "I see you're new"
	line "nieuw bent in" ; "in MAHOGANY TOWN."
	cont "MAHOGANY TOWN." ;

	para "Omdat je nieuw" ; "Since you're new,"
	line "bent, probeer" ; "you should try a"

	para "eens 'n heerlijke" ; "yummy RAGECANDY-"
	line "WOEDEREEP!" ; "BAR!"

	para "Hij is nu voor" ; "Right now, it can"
	line "jou, voor slechts" ; "be yours for just"
	cont "¥300! Wil je?" ; "¥300! Want one?"
	done

RageCandyBarMerchantSavorItText:
	text "Top! Geniet ervan!" ; "Good! Savor it!"
	done

RageCandyBarMerchantNotEnoughMoneyText:
	text "Je hebt niet" ; "You don't have"
	line "genoeg geld." ; "enough money."
	done

RageCandyBarMerchantRefusedText:
	text "Oh, oké dan…" ; "Oh, fine then…"
	done

RageCandyBarMerchantNoRoomText:
	text "Je hebt er" ; "You don't have"
	line "geen plek voor." ; "room for this."
	done

RageCandyBarMerchantSoldOutText:
	text "WOEDEREEP is" ; "RAGECANDYBAR's"
	line "uitverkocht." ; "sold out."

	para "Ik pak m'n spul-" ; "I'm packing up."
	line "len. Leid me niet" ; "Don't bother me,"
	cont "af, kleintje." ; "kiddo."
	done

MahoganyTownGrampsText:
	text "Ga je de GYARADOS-" ; "Are you off to see"
	line "stampij bekijken" ; "the GYARADOS ram-"
	cont "bij het MEER?" ; "page at the LAKE?"
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "MAGIKARPER zijn" ; "MAGIKARP have"
	line "teruggekeerd in" ; "returned to LAKE"
	cont "het MEER VAN" ; "OF RAGE."
	cont "RAZERNIJ." ;

	para "Dat is goed" ; "That should be"
	line "nieuws voor de" ; "good news for the"
	cont "vissers daar." ; "anglers there."
	done

MahoganyTownFisherText:
	text "Als je zo ver" ; "Since you came"
	line "bent gekomen," ; "this far, take the"

	para "neem de tijd om" ; "time to do some"
	line "rond te kijken." ; "sightseeing."

	para "Ga naar het noord-" ; "You should head"
	line "en en bekijk het" ; "north and check"

	para "MEER VAN RAZERNIJ." ; "out LAKE OF RAGE"
	;line "nu." ; "right now."
	done

MahoganyTownLassText:
	text "Bezoek Oma's" ; "Visit Grandma's"
	line "winkel. Ze ver-" ; "shop. She sells"

	para "koopt spul dat je" ; "stuff that nobody"
	line "niet snel vindt." ; "else has."
	done

MahoganyTownSignText:
	text "MAHOGANY TOWN"

	para "Welkom bij het" ; "Welcome to the"
	line "Huis van de Ninja" ; "Home of the Ninja"
	done

MahoganyTownRagecandybarSignText:
	text "Probeer de WOEDE-" ; "While visiting"
	line "REEP tijdens je" ; "MAHOGANY TOWN, try"
	cont "bezoek aan" ; "a RAGECANDYBAR!"
	cont "MAHOGANY TOWN!" ;
	done

MahoganyGymSignText:
	text "MAHOGANY TOWN"
	line "#MON-GYMLEIDER:"
	cont "PRYCE" ; "LEADER: PRYCE"

	para "De Leermeester van" ; "The Teacher of"
	line "Winterse Hardheid" ; "Winter's Harshness"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events
	coord_event 19,  8, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript

	def_bg_events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  9,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  3, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	def_object_events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownPokefanMScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, EVENT_MAHOGANY_MART_OWNERS
