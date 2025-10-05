	object_const_def
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER

CeruleanCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlypointCallback

CeruleanCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd PokecenterSignScript

CeruleanCityMartSign:
	jumpstd MartSignScript

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "KANTO's ENERGIE-" ; "KANTO's POWER"
	line "CENTRALE?" ; "PLANT?"

	para "Die vind je" ; "It's near the end"
	line "achteraan ROUTE 9," ; "of ROUTE 9, the"

	para "het pad ten oosten" ; "road that heads"
	line "van hier." ; "east from here."

	para "Volgens mij is" ; "I think there was"
	line "daar een soort" ; "an accident of"
	cont "ongeluk gebeurd." ; "some sort there."
	done

CeruleanCityCooltrainerMText2:
	text "Verzamel je elke" ; "You're collecting"
	line "soort #MON" ; "every single kind"
	cont "die er bestaat?" ; "of #MON?"

	para "Dat klinkt als" ; "That must be quite"
	line "een uitdaging," ; "a challenge, but"
	cont "maar ook leuk." ; "it sounds fun too."
	done

CeruleanCitySuperNerdText:
	text "De KAAP in het" ; "The CAPE in the"
	line "noorden is perfect" ; "north is a good"

	para "om meisjes mee" ; "place for dates."
	line "naartoe te nemen!" ; "Girls like it!"
	done

CeruleanCitySlowbroText:
	text "LANGSAMEN: Yara?" ; "SLOWBRO: Yarah?"
	done

CeruleanCityCooltrainerFText1:
	text "Mijn LANGSAMEN en" ; "My SLOWBRO and I"
	line "ik zijn een gewel-" ; "make an awesome"
	cont "dige combinatie!" ; "combination!"
	done

CeruleanCityCooltrainerFText2:
	text "LANGSAMEN, doe je" ; "SLOWBRO, show me"
	line "VERWARRING!" ; "your CONFUSION!"
	done

CeruleanCityCooltrainerFText3:
	text "…" ; "…"
	done

CeruleanCityFisherText:
	text "Ik ben enorm fan" ; "I'm a huge fan of"
	line "van CERULEAN's" ; "CERULEAN GYM's"
	cont "gymleider MISTY." ; "MISTY."
	done

CeruleanCityFisherRocketTipText:
	text "Een verdachte man" ; "I saw this shady"
	line "was onderweg naar" ; "guy go off toward"
	cont "CERLUAN's KAAP." ; "CERULEAN's CAPE."
	done

CeruleanCityYoungsterText1:
	text "Ooit was hier" ; "There used to be a"
	line "een grot met" ; "cave here that had"

	para "vreselijk sterke" ; "horribly powerful"
	line "#MON er in." ; "#MON in it."
	done

CeruleanCityYoungsterText2:
	text "Huh?" ; "Ayuh?"

	para "Mijn DETECTOR" ; "My ITEMFINDER is"
	line "reageert op iets…" ; "responding…"
	done

CeruleanCitySignText:
	text "CERULEAN CITY" ; "CERULEAN CITY"

	para "Omringd door een" ; "A Mysterious Blue"
	line "mysterieus aura" ; "Aura Surrounds It"
	done

CeruleanGymSignText:
	text "CERULEAN CITY" ; "CERULEAN CITY"
	line "#MON-GYMLEIDER:" ; "#MON GYM"
	cont "MISTY" ; "LEADER: MISTY"

	para "De Mondige" ; "The Tomboyish"
	line "Zeemeermin" ; "Mermaid"
	done

CeruleanBikeShopSignText:
	text "Er hangt hier" ; "There's a notice"
	line "een briefje…" ; "here…"

	para "De FIETSENWINKEL" ; "The BIKE SHOP has"
	line "is nu in GOLDENROD" ; "moved to GOLDENROD"
	cont "CITY in JOHTO…" ; "CITY in JOHTO…"
	done

CeruleanPoliceSignText:
	text "Er hangt hier" ; "There's a notice"
	line "een briefje…" ; "here…"

	para "Pak criminelen aan" ; "Stamp out thievery"
	line "om de stad vrien-" ; "and make the city"

	para "delijker en vro-" ; "a friendlier, more"
	line "lijker te maken!" ; "cheerful place!"

	para "CERULEAN POLITIE" ; "CERULEAN POLICE"
	done

CeruleanCapeSignText:
	text "KAAP VAN CERULEAN" ; "CERULEAN CAPE"
	line "NABIJ" ; "AHEAD"
	done

CeruleanLockedDoorText:
	text "Zit op slot…" ; "It's locked…"
	done

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 28, 17, CERULEAN_POLICE_STATION, 1
	warp_event 13, 19, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 23, CERULEAN_GYM, 1
	warp_event 25, 29, CERULEAN_MART, 2

	def_coord_events

	def_bg_events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 25, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 14, 29, BGEVENT_READ, CeruleanLockedDoor
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event  2, 12, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene

	def_object_events
	object_event 15, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 20, 24, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 21, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
