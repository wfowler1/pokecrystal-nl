	object_const_def
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUIDE
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER
	const CELADONMANSION3F_LASS
	const CELADONMANSION3F_POKEFAN_M

CeladonMansion3F_MapScripts:
	def_scene_scripts

	def_callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	readvar VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 2 - 1, .CompletedPokedex ; ignore Mew and Celebi
	waitbutton
	closetext
	end

.CompletedPokedex:
	promptbutton
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	promptbutton
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting: ; unreferenced
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText
	
BasScript:
	trainer POKEFANM, BAS1, EVENT_BEAT_POKEFANM_BAS1, BasBeforeBattleText, BasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BasAfterBattleText
	waitbutton
	closetext

RandolfScript:
	jumptextfaceplayer RandolfBeforeBattleText
	
CalvinScript:
	jumptextfaceplayer CalvinBeforeBattleText

ElineScript:
	jumptextfaceplayer ElineBeforeBattleText
	
WilliamScript:
	jumptextfaceplayer WilliamBeforeBattleText

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "Is dat zo?" ; "Is that right?"

	para "Ik ben de GAME-" ; "I'm the GAME"
	line "DESIGNER!"

	para "Je #DEX vullen" ; "Filling up your"
	line "is lastig, maar" ; "#DEX is tough,"
	cont "geef niet op!" ; "but don't give up!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "Wauw! Geweldig!" ; "Wow! Excellent!"
	line "Je hebt een" ; "You completed your"
	cont "complete #DEX!" ; "#DEX!"

	para "Gefeliciteerd!" ; "Congratulations!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "De GRAFISCH ONT-" ; "The GRAPHIC ARTIST"
	line "WERPER zal een" ; "will print out a"
	cont "DIPLOMA voor je" ; "DIPLOMA for you."
	cont "printen." ;

	para "Je zou ermee" ; "You should go show"
	line "moeten pronken!" ; "it off."
	done

GameFreakGraphicArtistText:
	text "Ik ben de GRAFISCH" ; "I'm the GRAPHIC"
	line "ONTWERPER." ; "ARTIST."

	para "Ik heb jou" ; "I drew you!"
	line "getekend!" ;
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "Ik ben de GRAFISCH" ; "I'm the GRAPHIC"
	line "ONTWERPER." ; "ARTIST."

	para "Oh, je hebt je" ; "Oh, you completed"
	line "#DEX voltooid?" ; "your #DEX?"

	para "Wil je dat ik" ; "Want me to print"
	line "je DIPLOMA print?" ; "out your DIPLOMA?"
	done

GameFreakGraphicArtistRefusedText:
	text "Laat me weten" ; "Give me a shout if"
	line "als je het DIPLOMA" ; "you want your"
	cont "wil printen." ; "DIPLOMA printed."
	done

GameFreakGraphicArtistErrorText:
	text "Er is iets mis." ; "Something's wrong."
	line "Ik moet het print-" ; "I'll have to can-"
	cont "en annuleren." ; "cel printing."
	done

GameFreakProgrammerText:
	text "Wie, ik? Ik ben de" ; "Who, me? I'm the"
	line "PROGRAMMEUR." ; "PROGRAMMER."

	para "Speel op de" ; "Play the slot"
	line "spelautomaten!" ; "machines!"
	done

GameFreakCharacterDesignerText:
	text "Zijn de TWEELINGEN" ; "Aren't the TWINS"
	line "niet schattig?" ; "adorable?"

	para "JASMINE is ook" ; "JASMINE's pretty"
	line "leuk." ; "too."

	para "Oh, ik hou van ze!" ; "Oh, I love them!"
	done
	
BasBeforeBattleText:
	text "BAS: Hier vertalen"
	line "wij de game naar"
	cont "het Nederlands."
	done
	
BasBeatenText:
	text "Helaas!"
	done

BasAfterBattleText:
	text "BAS: We zitten"
	line "te zwoegen, de"
	cont "game heeft 24.000"
	cont "regels tekst!"
	done	
	
RandolfBeforeBattleText:
	text "RANDOLF: Kun je"
	line "mijn favoriete"
	cont "#MON verslaan?"
	done

RandolfBeatenText:
	text "Wow, knap gedaan!"
	done

RandolfAfterBattleText:
	text "RANDOLF: Ik was 13"
	line "toen dit spel"
	cont "uitkwam."
	done
	
CalvinBeforeBattleText:
	text "CALVIN: Hey,"
	line "probeer jij eens"
	cont "deze VIRTUAL BOY!"
	done
	
CalvinBeatenText:
	text "Dit ding geeft me"
	line "hoofdpijn…"
	done
	
CalvinAfterBattleText:
	text "CALVIN: #MON-"
	line "gevechten zijn"
	
	para "een stuk lastiger"
	line "in het zwart-rood."
	done
	
ElineBeforeBattleText:
	text "PLACEHOLDER"
	done

ElineBeatenText:
	text "PLACEHOLDER"
	done

ElineAfterBattleText:
	text "PLACEHOLDER"
	done
	
WilliamBeforeBattleText:
	text "PLACEHOLDER"
	done
	
WilliamBeatenText:
	text "PLACEHOLDER"
	done
	
WilliamAfterBattleText:
	text "PLACEHOLDER"
	done
	
CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "ONTWIKKELINGS-" ; "DEVELOPMENT ROOM"
	cont "RUIMTE" ;
	
	para "LOKALISATIE-"
	line "TEAM aan linker-"
	cont "zijde."
	done

CeladonMansion3FDrawingText:
	text "Het is een" ; "It's a detailed"
	line "tekening van een" ; "drawing of a"
	cont "knappe meid." ; "pretty girl."
	done

CeladonMansion3FGameProgramText:
	text "Het is het game-" ; "It's the game"
	line "programma. Ermee" ; "program. Messing"

	para "rommelen kan zorg-" ; "with it could put"
	line "en voor een bug" ; "a bug in the game!"
	cont "in de game!" ;
	done

CeladonMansion3FReferenceMaterialText:
	text "Het zit vol met" ; "It's crammed with"
	line "referentiemate-" ; "reference materi-"
	cont "riaal. Er is zelfs" ; "als. There's even"
	cont "een #POP." ; "a # DOLL."
	done

CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, CELADON_MANSION_ROOF, 1
	warp_event 13,  0, CELADON_MANSION_2F, 2
	warp_event 18,  0, CELADON_MANSION_2F, 3
	warp_event 19,  0, CELADON_MANSION_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event 17,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event 16,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event 13,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event 13,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	def_object_events
	object_event 15,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event 15,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event 12,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event 12,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
	object_event  4,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BasScript, -1
	object_event  8,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandolfScript, -1
	object_event  4,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CalvinScript, -1
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ElineScript, -1
	object_event  0,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WilliamScript, -1