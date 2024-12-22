	object_const_def
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2

BlackthornCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BlackthornCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, BlackthornCitySantosCallback

BlackthornCityFlypointCallback:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

BlackthornCitySantosCallback:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext BlackBeltText_WeirdRadio
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext BlackBeltText_VoicesInMyHead
	waitbutton
	closetext
	end

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd PokecenterSignScript

BlackthornCityMartSign:
	jumpstd MartSignScript

Text_ClairIsOut:
	text "Het spijt me." ; "I am sorry."

	para "CLAIR, onze GYM-" ; "CLAIR, our GYM"
	line "LEIDER, ging naar" ; "LEADER, entered"

	para "de DRAKENGROT" ; "the DRAGON'S DEN"
	line "achter de GYM." ; "behind the GYM."

	para "Ik heb geen idee" ; "I have no idea"
	line "wanneer de LEIDER" ; "when our LEADER"
	cont "terugkeert." ; "will return."
	done

Text_ClairIsIn:
	text "CLAIR, onze GYM-" ; "CLAIR, our GYM"
	line "leider, wacht op" ; "LEADER, is waiting"
	cont "je." ; "for you."

	para "Het is voor de" ; "However, it would"
	line "gemiddelde trainer" ; "be impossible for"

	para "echter onmogelijk" ; "a run-of-the-mill"
	line "om te winnen." ; "trainer to win."
	done

Text_ClairIsBeaten:
	text "Heb je CLAIR" ; "You defeated"
	line "verslagen?" ; "CLAIR?"

	para "Dat is geweldig!" ; "That's amazing!"

	para "Ik heb haar nooit" ; "I've never heard"
	line "zien verliezen van" ; "of her losing to"

	para "iemand anders dan" ; "anyone other than"
	line "LANCE."
	done

BlackthornGrampsRefusesEntryText:
	text "Nee. Alleen verko-" ; "No. Only chosen"
	line "zen trainers mogen" ; "trainers may train"

	para "hier trainen. Ga" ; "here."
	line "alsjeblieft weg." ; "Please leave."
	done

BlackthornGrampsGrantsEntryText:
	text "Als CLAIR het toe-" ; "If CLAIR allows"
	line "laat, zal haar opa" ; "it, her grand-"
	cont "--onze MEESTER--" ; "father--our MASTER"
	cont "dat ook doen." ; "--will also."

	para "Je bent welkom." ; "You may enter."
	done

BlackBeltText_WeirdRadio:
	text "M'n radio is stuk?" ; "My radio's busted?"
	line "Ik hoor alleen dit" ; "Lately, I only get"
	cont "vreemde signaal." ; "this weird signal."
	done

BlackBeltText_VoicesInMyHead:
	text "Arooo! Stemmen in" ; "Arooo! Voices in"
	line "mijn hoofd!" ; "my head!"

	para "Huh? Ik luister" ; "Huh? I'm listening"
	line "naar mijn radio!" ; "to my radio!"
	done

BlackthornCooltrainerF1Text:
	text "Ga je jouw #MON" ; "Are you going to"
	line "wat aanvallen" ; "make your #MON"
	cont "laten vergeten?" ; "forget some moves?"
	done

BlackthornYoungsterText:
	text "Drakenmeesters" ; "Dragon masters all"
	line "komen allemaal uit" ; "come from the city"
	cont "BLACKTHORN." ; "of BLACKTHORN."
	done

MeetSantosText:
	text "SANTOS: …"

	para "Het is zaterdag…" ; "It's Saturday…"

	para "Ik ben zaterdagse" ; "I'm SANTOS of"
	line "SANTOS…" ; "Saturday…"
	done

SantosGivesGiftText:
	text "Je mag dit hebben…" ; "You can have this…"
	done

SantosGaveGiftText:
	text "SANTOS: …"

	para "GEESTPAPIER…" ; "SPELL TAG…"

	para "Spook-aanvallen" ; "Ghost-type moves"
	line "worden sterker…" ; "get stronger…"

	para "Je zal er van" ; "It will frighten"
	line "huiveren…" ; "you…"
	done

SantosSaturdayText:
	text "SANTOS: …"

	para "Zie je weer op een" ; "See you again on"
	line "andere zaterdag…" ; "another Saturday…"

	para "Ik heb geen" ; "I won't have any"
	line "cadeaus meer…" ; "more gifts…"
	done

SantosNotSaturdayText:
	text "SANTOS: Het is" ; "SANTOS: Today's"
	line "nu geen zaterdag…" ; "not Saturday…"
	done

BlackthornCooltrainerF2Text:
	text "Wauw, ging je" ; "Wow, you came"
	line "helemaal door het" ; "through the ICE"
	cont "IJSPAD?" ; "PATH?"

	para "Je moet een echt" ; "You must be a real"
	line "blitse trainer" ; "hotshot trainer!"
	cont "zijn!"
	done

BlackthornCitySignText:
	text "BLACKTHORN CITY"

	para "Stil toevluchts-" ; "A Quiet Mountain"
	line "oord in de bergen." ; "Retreat"
	done

BlackthornGymSignText:
	text "BLACKTHORN CITY"
	line "#MON-GYMLEIDER:" ; "#MON GYM"
	cont "CLAIR" ; "LEADER: CLAIR"

	para "Gezegend gebruiker" ; "The Blessed User"
	line "van Draak-#MON" ; "of Dragon #MON"
	done

MoveDeletersHouseSignText:
	text "AANVALWISSER'S" ; "MOVE DELETER'S"
	line "HUIS" ; "HOUSE"
	done

DragonDensSignText:
	text "DRAKENGROT" ; "DRAGON'S DEN"
	line "NABIJ" ; "AHEAD"
	done

BlackthornCityTrainerTipsText:
	text "TRAINERTIPS"

	para "Een #MON met" ; "A #MON holding"
	line "een WONDERBES" ; "a MIRACLEBERRY"

	para "geneest zichzelf" ; "will cure itself"
	line "van ieder status-" ; "of any status"
	cont "probleem." ; "problem."
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 31, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event 34, 24, BGEVENT_READ, BlackthornCitySign
	bg_event 17, 13, BGEVENT_READ, BlackthornGymSign
	bg_event  7, 31, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 21,  3, BGEVENT_READ, DragonDensSign
	bg_event  5, 25, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign

	def_object_events
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
