	object_const_def
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlypointCallback

ViridianCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityMartSign:
	jumpstd MartSignScript

ViridianCityCoffeeGrampsQuestionText:
	text "He, koter! Ik had" ; "Hey, kid! I just"
	line "net een dubbele" ; "had a double shot"

	para "espresso, en nu" ; "of espresso, and"
	line "barst ik van de" ; "I am wired!"

	para "energie! Ik moet" ; "I need to talk to"
	line "met iemand praten," ; "someone, so you'll"
	cont "dus jij bent de" ; "have to do!"

	para "pineut. Ik zie er" ; "I might not look"
	line "wellicht zwak uit," ; "like much now, but"

	para "maar ik was expert" ; "I was an expert at"
	line "in het vangen" ; "catching #MON."
	cont "van #MON." ;

	para "Geloof je me?" ; "Do you believe me?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Goed, goed. Ja," ; "Good, good. Yes, I"
	line "ik was echt iets" ; "was something out"

	para "bijzonders," ; "of the ordinary,"
	line "weet je!" ; "let me tell you!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "Wat? Jij kleine" ; "What? You little"
	line "snotneus!" ; "whelp!"

	para "Als ik een beetje" ; "If I were just a"
	line "jonger was, zou ik" ; "bit younger, I'd"

	para "je wel wat laten" ; "show you a thing"
	line "zien. Pff!" ; "or two. Humph!"
	done

ViridianCityGrampsNearGymText:
	text "Deze GYM had tot" ; "This GYM didn't"
	line "voor kort geen" ; "have a LEADER"
	cont "LEIDER." ; "until recently."

	para "Een jongeman uit" ; "A young man from"
	line "PALLET werd de" ; "PALLET became the"

	para "LEIDER, maar hij" ; "LEADER, but he's"
	line "is vaak weg." ; "often away."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Ga je met de" ; "Are you going to"
	line "LEIDER vechten?" ; "battle the LEADER?"

	para "Veel geluk. Je zal" ; "Good luck to you."
	line "het nodig hebben." ; "You'll need it."
	done

ViridianCityDreamEaterFisherText:
	text "Gaap!" ; "Yawn!"

	para "Ik ben ingedut" ; "I must have dozed"
	line "in de zon." ; "off in the sun."

	para "…Ik had een droom" ; "…I had this dream"
	line "over een SLUIMER" ; "about a DROWZEE"

	para "die mijn droom" ; "eating my dream."
	line "opat. Raar, hè?" ; "Weird, huh?"

	para "Huh?"
	line "Wat is dit?" ; "What's this?"

	para "Waar komt deze" ; "Where did this TM"
	line "TM vandaan?" ; "come from?"

	para "Dit is griezelig!" ; "This is spooky!"
	line "Hier, jij mag" ; "Here, you can have"
	cont "deze TM hebben." ; "this TM."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 bevat" ; "TM42 contains"
	line "DROOMETER…" ; "DREAM EATER…"

	para "…Zzzzz…"
	done

ViridianCityYoungsterText:
	text "Ik hoorde dat er" ; "I heard that there"
	line "veel voorwerpen" ; "are many items on"

	para "op de grond liggen" ; "the ground in"
	line "in VIRIDIANWOUD." ; "VIRIDIAN FOREST."
	done

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "Het Eeuwig" ; "The Eternally"
	line "Groene Paradijs" ; "Green Paradise"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON-GYMLEIDER:"
	cont "…" ; "LEADER: …"

	para "De rest van de" ; "The rest of the"
	line "tekst is" ; "text is illegible…"
	cont "onleesbaar…" ;
	done

ViridianCityWelcomeSignText:
	text "WELKOM IN" ; "WELCOME TO"
	line "VIRIDIAN CITY,"

	para "DE POORT NAAR" ; "THE GATEWAY TO"
	line "INDIGO-PLATEAU" ; "INDIGO PLATEAU"
	done

TrainerHouseSignText:
	text "TRAINERHUIS" ; "TRAINER HOUSE"

	para "De Club voor Toppe" ; "The Club for Top"
	line "Trainergevechten" ; "Trainer Battles"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
