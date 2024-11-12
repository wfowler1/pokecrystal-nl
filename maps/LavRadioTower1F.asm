	object_const_def
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "UITBRD KAART@" ; "EXPN CARD@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary: ; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "Welkom!" ; "Welcome!"
	line "Kijk rustig" ; "Feel free to look"

	para "rond op deze" ; "around anywhere on"
	line "verdieping." ; "this floor."
	done

LavRadioTower1FOfficerText:
	text "Sorry, maar je kan" ; "Sorry, but you can"
	line "alleen op de be-" ; "only tour the"
	cont "gane grond komen." ; "ground floor."

	para "Toen JOHTO's" ; "Ever since JOHTO's"
	line "RADIOTOREN werd" ; "RADIO TOWER was"

	para "overgenomen door" ; "taken over by a"
	line "een criminele" ; "criminal gang, we"

	para "bende, moesten we" ; "have had to step"
	line "onze beveiliging" ; "up our security."
	cont "aanscherpen." ;
	done

LavRadioTower1FSuperNerd1Text:
	text "Veel mensen zijn" ; "Many people are"
	line "hard aan het werk" ; "hard at work here"

	para "hier in de" ; "in the RADIO"
	line "RADIOTOREN." ; "TOWER."

	para "Ze doen hun best" ; "They must be doing"
	line "om goede shows" ; "their best to put"
	cont "te maken." ; "on good shows."
	done

LavRadioTower1FGentlemanText:
	text "Oh nee, nee, nee!" ; "Oh, no, no, no!"

	para "We zijn uit de" ; "We've been off the"
	line "lucht sinds de" ; "air ever since the"

	para "ENERGIECENTRALE" ; "POWER PLANT shut"
	line "is uitgeschakeld." ; "down."

	para "Al mijn moeite om" ; "All my efforts to"
	line "dit station op te" ; "start this station"

	para "zetten is voor niks" ; "would be wasted if"
	line "als ik niet kan" ; "I can't broadcast."
	cont "uitzenden." ;

	para "Dat wordt m'n" ; "I'll be ruined!"
	link "einde!" ;
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "Ah! Dus jij bent" ; "Ah! So you're the"
	line "de <PLAY_G> die" ; "<PLAY_G> who solved"

	para "het probleem met" ; "the POWER PLANT's"
	line "de ENERGIECENTRALE" ; "problem?"
	cont "heeft opgelost?" ;

	para "Dankzij jou ben" ; "Thanks to you, I"
	line "ik mijn baan niet" ; "never lost my job."
	cont "verloren." ;

	para "Ik zeg je, je bent" ; "I tell you, you're"
	line "een redder in nood!" ; "a real lifesaver!"

	para "Neem dit als" ; "Please take this"
	line "mijn dank." ; "as my thanks."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "Met dat ding kun" ; "With that thing,"
	line "je de radiopro-" ; "you can tune into"

	para "gramma's hier in" ; "the radio programs"
	line "KANTO luisteren." ; "here in KANTO."

	para "Gahahahaha!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Hé daar!" ; "Hey there!"

	para "Ik ben de super" ; "I am the super"
	line "MUZIEKDIRECTEUR!" ; "MUSIC DIRECTOR!"

	para "Huh? Je #GEAR" ; "Huh? Your #GEAR"
	line "kan mijn muziek-" ; "can't tune into my"

	para "programma's niet" ; "music programs."
	line "ontvangen. Jammer!" ; "How unfortunate!"

	para "Als je een EXPN-" ; "If you get an EXPN"
	line "KAART-upgrade hebt," ; "CARD upgrade, you"

	para "kun je luisteren." ; "can tune in. You'd"
	line "Haal er een!" ; "better get one!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Hé daar!" ; "Hey there!"

	para "Ik ben de super" ; "I am the super"
	line "MUZIEKDIRECTEUR!" ; "MUSIC DIRECTOR!"

	para "Ik ben verant-" ; "I'm responsible"
	line "woordelijk voor de" ; "for the gorgeous"

	para "mooie melodieën" ; "melodies that go"
	line "die worden uit-" ; "out over the air."
	cont "gezonden." ;

	para "Wees niet saai." ; "Don't be square."
	line "Muziek uit de" ; "Grab your music"
	cont "lucht, altijd" ; "off the air!"
	cont "fraai!" ;
	done

LavRadioTower1FDirectoryText:
	text "1V RECEPTIE" ; "1F RECEPTION"
	line "2V SALES" ; "2F SALES"

	para "3V PERSONEEL" ; "3F PERSONNEL"
	line "4V PRODUCTIE" ; "4F PRODUCTION"

	para "5V KANTOOR VAN" ; "5F DIRECTOR'S"
	line "DIRECTEUR" ; "   OFFICE"
	done

LavRadioTower1FPokeFluteSignText:
	text "Vrolijk #MON Op" ; "Perk Up #MON"
	line "met Kalme Geluiden" ; "with Mellow Sounds"

	para "van de #FLUIT" ; "of the # FLUTE"
	line "op KANAAL 20" ; "on CHANNEL 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "Wow! Een vol rek" ; "Wow! A full rack"
	line "met #MON CDs en" ; "of #MON CDs and"
	cont "videos." ; "videos."

	para "Dit moet de refer-" ; "This must be the"
	line "entie bibliotheek" ; "reference library."
	cont "zijn." ;
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
