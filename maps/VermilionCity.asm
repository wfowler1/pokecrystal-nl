	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "VERMILIONHAVEN is" ; "VERMILION PORT is"
	line "de kustpoort van" ; "KANTO's seaside"
	cont "de KANTO-regio." ; "gateway."

	para "Cruiseschepen van" ; "Luxury liners from"
	line "overal ter wereld" ; "around the world"
	cont "meren hier aan." ; "dock here."
	done

VermilionMachopOwnerText:
	text "Mijn #MON" ; "My #MON is"
	line "bereidt hier de" ; "preparing the land"
	cont "de bouwgrond voor." ; "for construction."

	para "Ik heb alleen geen" ; "But I have no"
	line "geld om te starten" ; "money to start the"
	cont "met het project…" ; "project…"
	done

VermilionMachopText1:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "Een MACHOP gromt" ; "A MACHOP is growl-"
	line "terwijl het de" ; "ing while stomping"
	cont "grond platstampt." ; "the ground flat."
	done

VermilionCitySuperNerdText:
	text "Er zijn acht GYMS" ; "There are eight"
	line "in KANTO." ; "GYMS in KANTO."

	para "Dat grote gebouw" ; "That big building"
	line "is de #MONGYM" ; "is VERMILION's"
	cont "van VERMILION." ; "#MON GYM."
	done

VermilionCitySnorlaxSleepingText:
	text "SNORLAX is vredig" ; "SNORLAX is snoring"
	line "aan het snurken…" ; "peacefully…"
	done

VermilionCityRadioNearSnorlaxText:
	text "De #GEAR werd" ; "The #GEAR was"
	line "naast de slapende" ; "placed near the"
	cont "SNORLAX geplaatst…" ; "sleeping SNORLAX…"

	para "…"

	para "SNORLAX werd" ; "SNORLAX woke up!"
	line "wakker!
	done

VermilionCityBadgeGuyTrainerText:
	text "Goede trainers" ; "Skilled trainers"
	line "vind je in KANTO." ; "gather in KANTO."

	para "Vooral GYMLEIDERS" ; "GYM LEADERS are"
	line "zijn sterk." ; "especially strong."

	para "Hen verslaan wordt" ; "They won't be easy"
	line "geen makkie." ; "to defeat."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "Ben je KANTO GYM" ; "You've started to"
	line "BADGES aan het" ; "collect KANTO GYM"
	cont "verzamelen?" ; "BADGES?"

	para "De trainers hier" ; "Don't you agree"
	line "zijn taai, vind" ; "that the trainers"
	cont "je niet?" ; "here are tough?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "Ik denk dat je" ; "I guess you'll be"
	line "snel alle KANTO" ; "finished with your"

	para "GYMS veroverd" ; "conquest of KANTO"
	line "hebt." ; "GYMS soon."

	para "Laat het me weten" ; "Let me know if"
	line "als je alle acht" ; "you get all eight"
	cont "BADGES hebt." ; "BADGES."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Gefeliciteerd!" ; "Congratulations!"

	para "Je hebt alle" ; "You got all the"
	line "KANTO GYM BADGES."

	para "Hier, een beloning" ; "I've got a reward"
	line "voor de moeite." ; "for your efforts."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Met gevarieerde" ; "Having a variety"
	line "#MON types heb" ; "of #MON types"

	para "je een voordeel" ; "should give you an"
	line "in gevechten." ; "edge in battle."

	para "De KANTO GYM" ; "I'm sure the KANTO"
	line "BADGES gaan je" ; "GYM BADGES will"
	cont "zeker helpen." ; "help you."
	done

VermilionCitySignText:
	text "WELKOM IN" ; "WELCOME TO"
	line "VERMILION CITY,"

	para "De Haven van" ; "The Port of"
	line "Schitterende" ; "Exquisite Sunsets"
	cont "Zonsondergangen."
	done

VermilionGymSignText:
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEIDER: LT.SURGE" ; "LEADER: LT.SURGE"

	para "De Flitsende" ; "The Lightning"
	line "Amerikaan" ; "American"
	done

PokemonFanClubSignText:
	text "#MON FANCLUB" ; "#MON FAN CLUB"

	para "Alle #MON Fans" ; "All #MON Fans"
	line "Welkom!" ; "Welcome!"
	done

VermilionCityDiglettsCaveSignText:
	text "DIGLETT-GROT"  ; "DIGLETT'S CAVE"
	done

VermilionCityPortSignText:
	text "INGANG" ; "VERMILION PORT"
	line "VERMILION HAVEN" ; "ENTRANCE"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
