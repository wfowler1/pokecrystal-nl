	object_const_def
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScripts:
	def_scene_scripts

	def_callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.SavedSlowpoke:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.GotCut:
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .YoureTheCoolest
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.Thanks:
	writetext CharcoalKilnApprenticeText2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	closetext
	end

.YoureTheCoolest:
	writetext CharcoalKilnApprenticeText3
	waitbutton
.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	faceplayer
	opentext
	writetext FarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd MagazineBookshelfScript

CharcoalKilnRadio:
	jumpstd Radio2Script

CharcoalKilnBossText1:
	text "Alle SLOWPOKE zijn" ; "All the SLOWPOKE"
	line "uit de stad ver-" ; "have disappeared"
	cont "dwenen." ; "from the town."

	para "De beschermer van" ; "The forest's pro-"
	line "het woud zal wel" ; "tector may be"
	cont "boos op ons zijn…" ; "angry with us…"

	para "Vast een slecht" ; "It may be a bad"
	line "voorteken. Laten" ; "omen. We should"
	cont "we binnen blijven." ; "stay in."
	done

CharcoalKilnBossText2:
	text "De SLOWPOKE zijn" ; "The SLOWPOKE have"
	line "teruggekeerd…" ; "returned…"

	para "Maar mijn LEERLING" ; "But my APPRENTICE"
	line "is nog niet terug" ; "hasn't come back"
	cont "uit het EIKENWOUD." ; "from ILEX FOREST."

	para "Waar is die lui-" ; "Where in the world"
	line "lak nu weer?" ; "is that lazy guy?"
	done

CharcoalKilnBossText3:
	text "TEAM ROCKET is" ; "You chased off"
	line "weggejaagd en je" ; "TEAM ROCKET and"

	para "bent zelf naar het" ; "went to ILEX"
	line "EIKENWOUD gegaan?" ; "FOREST alone?"

	para "Dat toont lef! Ik" ; "That takes guts!"
	line "hou daar van. Kom" ; "I like that. Come"
	cont "bij ons trainen." ; "train with us."
	done

CharcoalKilnApprenticeText1:
	text "Waar zijn alle" ; "Where have all the"
	line "SLOWPOKE naartoe?" ; "SLOWPOKE gone?"

	para "Zijn ze ergens aan" ; "Are they out play-"
	line "het spelen?" ; "ing somewhere?"
	done

CharcoalKilnApprenticeText2:
	text "Sorry, ik vergat" ; "I'm sorry--I for-"
	line "je te bedanken." ; "got to thank you."

	para "Deze HOUTSKOOL heb" ; "This is CHARCOAL"
	line "ik gemaakt." ; "that I made."

	para "Geef maar aan een" ; "Fire-type #MON"
	line "vuur-#MON, dat" ; "would be happy to"
	cont "maakt ze blij." ; "hold that."
	done

CharcoalKilnApprenticeText3:
	text "De SLOWPOKE zijn" ; "The SLOWPOKE came"
	line "terug en je vond" ; "back, and you even"
	cont "zelfs FARFETCH'D." ; "found FARFETCH'D."

	para "Jij bent echt" ; "You're the cool-"
	line "de allercoolste!" ; "est, man!"
	done

FarfetchdText:
	text "FARFETCH'D: Kwaa!" ; "FARFETCH'D: Kwaa!"
	done

CharcoalKiln_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 2
	warp_event  3,  7, AZALEA_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  7,  1, BGEVENT_READ, CharcoalKilnRadio

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  5,  6, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, EVENT_CHARCOAL_KILN_FARFETCH_D
