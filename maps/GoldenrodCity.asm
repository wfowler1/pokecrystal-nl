	object_const_def
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR

GoldenrodCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodCityFlypointAndFloriaCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodCityMoveTutorCallback

GoldenrodCityFlypointAndFloriaCallback:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	endcallback

GoldenrodCityMoveTutorCallback:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	endcallback

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	endcallback

MoveTutorScript:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	sjump .Incompatible

.Flamethrower:
	setval MOVETUTOR_FLAMETHROWER
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Thunderbolt:
	setval MOVETUTOR_THUNDERBOLT
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IceBeam:
	setval MOVETUTOR_ICE_BEAM
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "VLAMMENWERPER@"
	db "BLIKSEMSTRAAL@"
	db "IJSSTRAAL@"
	db "ANNULEER@"

.Refused:
	writetext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	waitbutton
	closetext
	end

.Refused2:
	writetext GoldenrodCityMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText
	promptbutton
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorFarewellKidText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorEnterGameCornerMovement
	sjump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext GoldenrodCityMoveTutorBButText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocket4Script:
	jumptextfaceplayer GoldenrodCityRocket4Text

GoldenrodCityRocket5Script:
	jumptextfaceplayer GoldenrodCityRocket5Text

GoldenrodCityRocket6Script:
	jumptextfaceplayer GoldenrodCityRocket6Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumpstd PokecenterSignScript

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

GoldenrodCityMoveTutorEnterGameCornerMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end

GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

GoldenrodCityPokefanMText:
	text "Ze hebben de" ; "They built the new"
	line "nieuwe RADIOTOREN" ; "RADIO TOWER to"

	para "gebouwd om de oude" ; "replace the old,"
	line "krakkebak te" ; "creaky one."
	cont "vervangen." ; 
	done

GoldenrodCityYoungster1Text:
	text "Ik weet dat er een" ; "I know there's a"
	line "nieuwe FIETSWINKEL" ; "new BIKE SHOP, but"

	para "is, maar ik kan 'm" ; "I can't find it"
	line "nergens vinden." ; "anywhere."
	done

GoldenrodCityCooltrainerF1Text:
	text "Is die man in het" ; "Is that man in"
	line "zwart gekleed als" ; "black dressed up"

	para "een lid van TEAM" ; "like a TEAM ROCKET"
	line "ROCKET? Wat maf!" ; "member? How silly!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "Was die man in het" ; "Was that man in"
	line "zwart echt deel" ; "black really part"

	para "van TEAM ROCKET?" ; "of TEAM ROCKET? I"
	line "Niet te geloven!" ; "can't believe it!"
	done

GoldenrodCityCooltrainerF2Text:
	text "De RADIOTOREN in" ; "The RADIO TOWER in"
	line "GOLDENROD CITY is" ; "GOLDENROD CITY is"
	cont "'n oriëntatiepunt." ; "a landmark."

	para "Ze voeren een" ; "They're running a"
	line "promotiecampagne" ; "promotional cam- "
	cont "op dit moment." ; "paign right now."

	para "Ze passen je" ; "They'll modify"
	line "#GEAR aan," ; "your #GEAR,"

	para "zodat ie ook" ; "so it can also"
	line "als radio werkt." ; "serve as a radio."
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "Oh, je #GEAR" ; "Oh, your #GEAR"
	line "werkt als radio!" ; "works as a radio!"
	done

GoldenrodCityYoungster2Text:
	text "E-he-he-he…"

	para "Ik kreeg op de kop" ; "I got in trouble"
	line "omdat ik speelde" ; "for playing in the"

	para "in de kelder van" ; "basement of the"
	line "het WARENHUIS." ; "DEPT.STORE."
	done

GoldenrodCityLassText:
	text "De man in dat huis" ; "The man at that"
	line "beoordeelt namen" ; "house rates your"
	cont "van je #MON." ; "#MON names."

	para "Hij kan zelfs" ; "He can even rename"
	line "nieuwe namen" ; "your #MON."
	cont "geven." ;
	done

GoldenrodCityGrampsText:
	text "Pfoe! Dit is een" ; "Whew! This is one"
	line "grote stad. Ik" ; "big town. I don't"

	para "weet niet waar" ; "know where any-"
	line "alles is." ; "thing is."
	done

GoldenrodCityRocketScoutText1:
	text "Dus dit is de" ; "So this is the"
	line "RADIOTOREN…" ; "RADIO TOWER…"
	done

GoldenrodCityRocketScoutText2:
	text "Wat wil je," ; "What do you want,"
	line "ettertje? Rot op!" ; "you pest? Scram!"
	done

GoldenrodCityRocket1Text:
	text "Uit de weg!" ; "Stay out of the"
	line "Wegwezen!" ; "way! Beat it!"
	done

GoldenrodCityRocket2Text:
	text "De RADIOTOREN" ; "Take over the"
	line "overnemen…" ; "RADIO TOWER…"

	para "Wat? Bemoei je met" ; "What? It's none of"
	line "je eigen zaken!" ; "your business!"
	done

GoldenrodCityRocket3Text:
	text "#MON? Niets" ; "#MON? They're"
	line "meer dan dingen" ; "nothing more than"

	para "om geld mee te" ; "tools for making"
	line "verdienen!" ; "money!"
	done

GoldenrodCityRocket4Text:
	text "Onze droom zal" ; "Our dream will"
	line "snel uitkomen…" ; "soon come true…"

	para "Het was zo'n" ; "It was such a long"
	line "lange strijd…" ; "struggle…"
	done

GoldenrodCityRocket5Text:
	text "Hé, ettertje! Je" ; "Hey, brat! You"
	line "hoort hier niet!" ; "don't belong here!"
	cont "Wegwezen!" ; "Get lost!"
	done

GoldenrodCityRocket6Text:
	text "Kom de echte" ; "Come taste the"
	line "terreur van TEAM" ; "true terror of"
	cont "ROCKET ervaren!" ; "TEAM ROCKET!"
	done

GoldenrodCityStationSignText:
	text "GOLDENROD CITY" ; "GOLDENROD CITY"
	line "STATION" ; "STATION"
	done

GoldenrodCityRadioTowerSignText:
	text "GOLDENROD CITY" ; "GOLDENROD CITY"
	line "RADIOTOREN" ; "RADIO TOWER"
	done

GoldenrodDeptStoreSignText:
	text "Grote selectie aan" ; "Full Selection of"
	line "#MON-goederen!" ; "#MON Goods!"

	para "GOLDENROD CITY" 
	line "WARENHUIS" ; "DEPT.STORE"
	done

GoldenrodGymSignText:
	text "GOLDENROD CITY" ; "GOLDENROD CITY"
	line "#MON-GYMLEIDER:"
	cont "WHITNEY" ; "LEADER: WHITNEY"

	para "De Wonderbaarlijk" ; "The Incredibly"
	line "Knappe Meid!" ; "Pretty Girl!"
	done

GoldenrodCitySignText:
	text "GOLDENROD CITY" ; "GOLDENROD CITY"

	para "De Feestelijke" ; "The Festive City"
	line "Stad van Weelde" ; "of Opulent Charm"
	cont "en Charme" ;
	done

GoldenrodCityBikeShopSignText:
	text "De wereld is" ; "The World is a"
	line "een fietspad!" ; "Cycle Path!"
	cont "FIETSWINKEL" ; "BIKE SHOP"
	done

GoldenrodCityGameCornerSignText:
	text "Jouw speeltuin!" ; "Your Playground!"

	para "GOLDENROD CITY"
	line "SPELHOEK" ; "GAME CORNER"
	done

GoldenrodCityNameRaterSignText:
	text "NAMENKENNER" ; "NAME RATER"

	para "Laat je #MON-" ; "Get Your #MON"
	line "namen beoordelen!" ; "Nicknames Rated"
	done

GoldenrodCityUndergroundSignNorthText:
	text "INGANG" ; "UNDERGROUND"
	line "KELDER" ; "ENTRANCE"
	done

GoldenrodCityUndergroundSignSouthText:
	text "INGANG" ; "UNDERGROUND"
	line "KELDER" ; "ENTRANCE"
	done

GoldenrodCityPokeComCenterSignText: ; unreferenced
	text "" ; "For Mobile Tips!"
	line "" ; "#COM CENTER"
	done

GoldenrodCityFlowerShopSignText:
	text "Prachtig bloeiende" ; "Blooming Beautiful"
	line "BLOEMENWINKEL" ; "FLOWER SHOP"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "Ik kan je #MON" ; "I can teach your"
	line "geweldige aanval-" ; "#MON amazing"

	para "len leren als" ; "moves if you'd"
	line "je wil." ; "like."

	para "Zal ik een nieuwe" ; "Should I teach a"
	line "aanval leren?" ; "new move?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "Het kost 4000" ; "It will cost you"
	line "munten. Oké?" ; "4000 coins. Okay?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Aww… Maar ze" ; "Aww… But they're"
	line "zijn geweldig…" ; "amazing…"
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "Wahah! Je zal geen" ; "Wahahah! You won't"
	line "spijt krijgen!" ; "regret it!"

	para "Welke aanval zal" ; "Which move should"
	line "ik leren?" ; "I teach?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Hm, helaas. Ik" ; "Hm, too bad. I'll"
	line "moet wat geld van" ; "have to get some"
	cont "huis halen…" ; "cash from home…"
	done

GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText:
	text "Als je snapt wat" ; "If you understand"
	line "zo geweldig is aan" ; "what's so amazing"

	para "deze aanval, heb" ; "about this move,"
	line "je het gemaakt" ; "you've made it as"
	cont "als trainer." ; "a trainer."
	done

GoldenrodCityMoveTutorFarewellKidText:
	text "Wahahah!"
	line "Vaarwel, koter!" ; "Farewell, kid!"
	done

GoldenrodCityMoveTutorBButText:
	text "M-maar…" ; "B-but…"
	done

GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText:
	text "…Je hebt niet" ; "…You don't have"
	line "genoeg munten…" ; "enough coins here…"
	done

GoldenrodCityMoveTutorMoveText:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event  9,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event 11, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 15, 27, GOLDENROD_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 16, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	def_object_events
	object_event  7, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 30, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 11, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  4, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 28, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 16, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 31, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
