	object_const_def
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2

SaffronCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlypointCallback

SaffronCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

SaffronCityLass1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityLass1Text
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityLass1Text_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityPokefanMText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityFisherText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	jumptextfaceplayer SaffronCityYoungster1Text

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd PokecenterSignScript

SaffronCityMartSign:
	jumpstd MartSignScript

SaffronCityLass1Text:
	text "Een meisje dat" ; "A little girl who"
	line "mensen heel goed" ; "is an expert at"

	para "na kan doen woont" ; "mimicking people"
	line "hier." ; "lives here."

	para "Ze doet zelfs ge-" ; "She even mimics"
	line "sprekspartners na." ; "the people she's"

	para "Erg verwarrend." ; "conversing with."
	;line "Erg verwarrend." ; "It's confusing."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "Het NA-AAP-meisje" ; "The COPYCAT girl"
	line "keek erg sip." ; "looked unhappy."

	para "Ze is haar favo-" ; "She said she lost"
	line "riete #POP van" ; "her favorite #"
	cont "CLEFEE kwijt." ; "DOLL--CLEFAIRY."
	done

SaffronCityPokefanMText:
	text "Kom je uit JOHTO?" ; "You came out from"
	;line "JOHTO?" ; "JOHTO?"

	para "Je kunt naar huis" ; "You can zip back"
	line "met de ZWEEFTREIN," ; "home if the MAGNET"
	cont "als hij rijdt." ; "TRAIN's running."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "Kom je uit" ; "You came out from"
	line "JOHTO?" ; "JOHTO?"

	para "Je kan snel naar" ; "You can zip back"
	line "huis met de" ; "home by hopping on"
	cont "ZWEEFTREIN." ; "the MAGNET TRAIN."
	done

SaffronCityCooltrainerMText:
	text "Ik ging naar de" ; "I went to the GYM,"
	line "GYM, op zoek naar" ; "raring for battles"
	cont "trainer-gevechten…" ; "against trainers…"

	para "Blijkt het dat ik" ; "It turns out, I"
	line "naar binnen liep" ; "stumbled into the"

	para "bij de ongebruikte" ; "unused GYM next"
	line "GYM hiernaast." ; "door."

	para "Man, wat was dat" ; "Boy, I was pretty"
	line "genant, zeg." ; "embarrassed."
	done

SaffronCityCooltrainerFText:
	text "Dit is SILPH B.V," ; "This is SILPH CO.,"
	line "bekend van hun" ; "famous for #MON"
	cont "#MON-producten." ; "merchandise."

	para "Daarom wilde TEAM" ; "In the past, TEAM"
	line "ROCKET vroeger het" ; "ROCKET wanted the"

	para "het bedrijf" ; "company because of"
	line "overnemen." ; "that."
	done

SaffronCityFisherText:
	text "Kauw… Kauw…" ; "Chew… Chew…"

	para "Volgens mij is de" ; "I hear there's big"
	line "ENERGIECENTRALE in" ; "trouble brewing at"
	cont "grote problemen." ; "the POWER PLANT."

	para "Kauw… Kauw…" ; "Chew… Chew…"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "Kauw… Kauw…" ; "Chew… Chew…"

	para "Volgens mij was de" ; "I hear there was"
	line "ENERGIECENTRALE in" ; "big trouble at the"
	cont "grote problemen." ; "POWER PLANT."

	para "Kauw… Kauw…" ; "Chew… Chew…"
	line "Haaah, ik zit vol!" ; "Haaah, I'm full!"
	done

SaffronCityYoungster1Text:
	text "Voor het eerst in" ; "Going into an"
	line "een steegje lopen" ; "alley for the"

	para "maakt me een" ; "first time makes"
	line "beetje nerveus." ; "me sorta anxious."
	done

SaffronCityYoungster2Text:
	text "Er is een plek" ; "There's a place"
	line "genaamd TRAINER-" ; "called TRAINER"

	para "HUIS in VIRIDIAN" ; "HOUSE in VIRIDIAN"
	line "waar trainers van" ; "where trainers"

	para "overal zich" ; "gather from all"
	line "verzamelen." ; "over the place."
	done

SaffronCityLass2Text:
	text "Onze stad werd" ; "Our city was"
	line "besproken in een" ; "featured on a"
	cont "radioprogramma." ; "radio program."

	para "Het is fijn om" ; "It's nice to hear"
	line "goede dingen over" ; "praise for your"

	para "je stad te horen," ; "city, but it's a"
	line "maar ook een" ; "bit embarrassing"
	cont "beetje genant." ; "too."
	done

SaffronCitySignText:
	text "SAFFRON CITY" ; "SAFFRON CITY"

	para "Glanzend, Gouden" ; "Shining, Golden"
	line "Land van de Handel" ; "Land of Commerce"
	done

SaffronGymSignText:
	text "SAFFRON CITY" ; "SAFFRON CITY"
	line "#MON-GYMLEIDER:" ; "#MON GYM"
	cont "SABRINA" ; "LEADER: SABRINA"

	para "De Psychische" ; "The Master of"
	line "#MON-Meesteres!" ; "Psychic #MON!"
	done

FightingDojoSignText:
	text "Iedereen welkom!" ; "Everyone Welcome!"
	line "VECHTDOJO" ; "FIGHTING DOJO"
	done

SilphCoSignText:
	text "SILPH B.V." ; "SILPH CO."
	line "KANTOOR" ; "OFFICE BUILDING"
	done

MrPsychicsHouseSignText:
	text "Huis van" ; "MR.PSYCHIC'S"
	line "MR. PSYCHISCH" ; "HOUSE"
	done

SaffronCityMagnetTrainStationSignText:
	text "SAFFRON CITY" ; "SAFFRON CITY"
	line "ZWEEFTREIN-STATION" ; "MAGNET TRAIN"
	;cont "STATION" ; "STATION"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	def_object_events
	object_event  7, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 19, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 20, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 27, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
