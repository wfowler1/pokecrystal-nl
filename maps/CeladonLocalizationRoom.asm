	object_const_def
	const CELADONLOCALIZATIONROOM_GYM_GUIDE1
	const CELADONLOCALIZATIONROOM_GYM_GUIDE2
	const CELADONLOCALIZATIONROOM_SUPER_NERD1
	const CELADONLOCALIZATIONROOM_SUPER_NERD
	const CELADONLOCALIZATIONROOM_FISHER1
	const CELADONLOCALIZATIONROOM_FISHER2
	const CELADONLOCALIZATIONROOM_LASS
	const CELADONLOCALIZATIONROOM_POKEFAN_M
	const CELADONLOCALIZATIONROOM_BOARDER

CeladonLocalizationRoom_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmBas:
	trainer POKEFANM, BAS1, EVENT_BEAT_POKEFANM_BAS1, PokefanmBasSeenText, PokefanmBasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBasAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerRandolf:
	trainer JUGGLER, RANDOLF, EVENT_BEAT_JUGGLER_RANDOLF, JugglerRandolfSeenText, JugglerRandolfBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerRandolfAfterBattleText
	waitbutton
	closetext
	end

	
TrainerBoarderCalvin:
	trainer BOARDER, CALVIN2, EVENT_BEAT_BOARDER_CALVIN, BoarderCalvinSeenText, BoarderCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderCalvinAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEline:
	trainer LASS, ELINE, EVENT_BEAT_LASS_ELINE, LassElineSeenText, LassElineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassElineAfterBattleText
	waitbutton
	closetext
	end
	
TrainerWilliam:
	trainer COOLTRAINERM, BAS1, EVENT_BEAT_POKEFANM_BAS1, WilliamSeenText, WilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext WilliamAfterBattleText
	waitbutton
	closetext
	end
	
CeladonLocalizationRoomBookcaseA:
	jumptext CeladonLocalizationRoomBookcaseAText

CeladonLocalizationRoomBookcaseB:
	jumptext CeladonLocalizationRoomBookcaseBText
	
CeladonLocalizationRoomBookcaseC:
	jumptext CeladonLocalizationRoomBookcaseCText
	
CeladonLocalizationRoomStatue:
	jumptext CeladonLocalizationRoomStatueText
	
CeladonLocalizationComputerBas:
	jumptext CeladonLocalizationComputerBasText

CeladonLocalizationComputerRandolf:
	jumptext CeladonLocalizationComputerRandolfText
	
CeladonLocalizationComputerCalvin:
	jumptext CeladonLocalizationComputerCalvinText
	
CeladonLocalizationComputerEline:
	jumptext CeladonLocalizationComputerElineText

CeladonLocalizationComputerWilliam:
	jumptext CeladonLocalizationComputerWilliamText
	
CeladonLocalizationPlant:
	jumptext CeladonLocalizationPlantText
	
PokefanmBasSeenText:
	text "BAS: Hier vertalen"
	line "wij de game naar"
	cont "het Nederlands."
	done
	
PokefanmBasBeatenText:
	text "Helaas!"
	done

PokefanmBasAfterBattleText:
	text "BAS: We zitten"
	line "te zwoegen, de"
	cont "game heeft 24.000"
	cont "regels tekst!"
	done	
	
JugglerRandolfSeenText:
	text "RANDOLF: Kun je"
	line "mijn favoriete"
	cont "#MON verslaan?"
	done

JugglerRandolfBeatenText:
	text "Wow, knap gedaan!"
	done

JugglerRandolfAfterBattleText:
	text "RANDOLF: Ik was 13"
	line "toen dit spel"
	cont "uitkwam."
	done
	
BoarderCalvinSeenText:
	text "CALVIN: Hey,"
	line "probeer jij eens"
	cont "deze VIRTUAL BOY!"
	done
	
BoarderCalvinBeatenText:
	text "Dit ding geeft me"
	line "hoofdpijn…"
	done
	
BoarderCalvinAfterBattleText:
	text "CALVIN: #MON-"
	line "gevechten zijn"
	
	para "een stuk lastiger"
	line "in het zwart-rood."
	done
	
LassElineSeenText:
	text "Ik schreef vroeger"
	line "mijn eigen"
	
	para "#MON-verhalen."
	line "Nu maak ik mijn"
	cont "eigen videogames!"
	done

LassElineBeatenText:
	text "In m'n verhaal was"
	line "ik onverslaanbaar…"
	done

LassElineAfterBattleText:
	text "Wat voor game zou"
	line "jij willen maken?"
	cont "Probeer het eens!"
	done

WilliamSeenText:
	text "PLACEHOLDER"
	done
	
WilliamBeatenText:
	text "PLACEHOLDER"
	done
	
WilliamAfterBattleText:
	text "PLACEHOLDER"
	done
	done
	
CeladonLocalizationRoomBookcaseAText:
	text "Een woordenboek en"
	line "Het Groene Boekje!"
	done
	
CeladonLocalizationRoomBookcaseBText:
	text "Een kast vol met"
	line "Nederlandstalige"
	cont "strips."
	done
	
CeladonLocalizationRoomBookcaseCText:
	text "…Strategy Guide?"
	line "Valsspelerij!"
	done
	
CeladonLocalizationRoomStatueText:
	text "Een kast vol oude"
	line "Game Boys…"
	done
	
CeladonLocalizationComputerBasText:
	text "De screensaver"
	line "staat aan! Zijn"
	cont "dat kinderfoto's?"
	done
	
CeladonLocalizationComputerRandolfText:
	text "Een ranglijst van"
	line "favoriete #MON…"
	done
	
CeladonLocalizationComputerCalvinText:
	text "Op 't scherm staan"
	line "plaatjes van een"
	cont "oude VR-bril…"
	done
	
CeladonLocalizationComputerElineText:
	text "De trailer voor"
	line "On Your Tail!"
	done
	
CeladonLocalizationComputerWilliamText:
	text "Een webbrowser met"
	line "de website van"
	cont "Duolingo…"
	done
	
CeladonLocalizationPlantText:
	text "Tulpen!"
	done
	
CeladonLocalizationRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_3F, 5
	warp_event  3,  7, CELADON_MANSION_3F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_UP, CeladonLocalizationRoomBookcaseA
	bg_event  6,  1, BGEVENT_UP, CeladonLocalizationRoomBookcaseB
	bg_event  8,  1, BGEVENT_UP, CeladonLocalizationRoomBookcaseC
	bg_event  3,  1, BGEVENT_UP, CeladonLocalizationRoomStatue
	bg_event  5,  1, BGEVENT_UP, CeladonLocalizationComputerBas
	bg_event 10,  1, BGEVENT_UP, CeladonLocalizationComputerRandolf
	bg_event  5,  4, BGEVENT_UP, CeladonLocalizationComputerCalvin
	bg_event  9,  4, BGEVENT_UP, CeladonLocalizationComputerEline
	bg_event  1,  2, BGEVENT_UP, CeladonLocalizationComputerWilliam
	bg_event  7,  1, BGEVENT_UP, CeladonLocalizationPlant


	def_object_events
	object_event  4,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmBas, -1
	object_event  9,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerJugglerRandolf, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBoarderCalvin, -1
	object_event  8,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerLassEline, -1
	object_event  0,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerWilliam, -1
