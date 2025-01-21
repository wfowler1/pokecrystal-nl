	object_const_def
	const AZALEATOWN_AZALEA_ROCKET1
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER
	const AZALEATOWN_SLOWPOKE1
	const AZALEATOWN_SLOWPOKE2
	const AZALEATOWN_SLOWPOKE3
	const AZALEATOWN_SLOWPOKE4
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_RIVAL
	const AZALEATOWN_AZALEA_ROCKET3
	const AZALEATOWN_KURT_OUTSIDE

AzaleaTown_MapScripts:
	def_scene_scripts
	scene_script AzaleaTownNoop1Scene, SCENE_AZALEATOWN_NOOP
	scene_script AzaleaTownNoop2Scene, SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_script AzaleaTownNoop3Scene, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AzaleaTownFlypointCallback

AzaleaTownNoop1Scene:
	end

AzaleaTownNoop2Scene:
	end

AzaleaTownNoop3Scene:
	end

AzaleaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

AzaleaTownRivalBattleScene1:
	moveobject AZALEATOWN_RIVAL, 11, 11
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleApproachMovement1
	turnobject PLAYER, DOWN
	sjump AzaleaTownRivalBattleScript

AzaleaTownRivalBattleScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleApproachMovement2
	turnobject PLAYER, UP
AzaleaTownRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.Totodile:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.Chikorita:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AzaleaTownRivalAfterText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_RIVAL
	setscene SCENE_AZALEATOWN_NOOP
	waitsfx
	playmapmusic
	end

AzaleaTownRocket1Script:
	jumptextfaceplayer AzaleaTownRocket1Text

AzaleaTownRocket2Script:
	jumptextfaceplayer AzaleaTownRocket2Text

AzaleaTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedWell
	writetext AzaleaTownGrampsTextBefore
	waitbutton
	closetext
	end

.ClearedWell:
	writetext AzaleaTownGrampsTextAfter
	waitbutton
	closetext
	end

AzaleaTownTeacherScript:
	jumptextfaceplayer AzaleaTownTeacherText

AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownSlowpokeScript:
	opentext
	writetext AzaleaTownSlowpokeText1
	pause 60
	writetext AzaleaTownSlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end

UnusedWoosterScript: ; unreferenced
	faceplayer
	opentext
	writetext WoosterText
	cry QUAGSIRE
	waitbutton
	closetext
	end

AzaleaTownCelebiScene:
	applymovement PLAYER, AzaleaTownPlayerLeavesKurtsHouseMovement
	opentext
	writetext AzaleaTownKurtText1
	promptbutton
	turnobject AZALEATOWN_KURT_OUTSIDE, RIGHT
	writetext AzaleaTownKurtText2
	promptbutton
	writetext AzaleaTownKurtText3
	waitbutton
	verbosegiveitem GS_BALL
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	setflag ENGINE_FOREST_IS_RESTLESS
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOOP
	closetext
	end

AzaleaTownKurtScript:
	faceplayer
	opentext
	writetext AzaleaTownKurtText3
	waitbutton
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	closetext
	end

AzaleaTownSign:
	jumptext AzaleaTownSignText

KurtsHouseSign:
	jumptext KurtsHouseSignText

AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText

CharcoalKilnSign:
	jumptext CharcoalKilnSignText

AzaleaTownIlextForestSign:
	jumptext AzaleaTownIlexForestSignText

AzaleaTownPokecenterSign:
	jumpstd PokecenterSignScript

AzaleaTownMartSign:
	jumpstd MartSignScript

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

AzaleaTownRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

AzaleaTownRivalBattleApproachMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AzaleaTownRivalBattleExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step_end

AzaleaTownPlayerLeavesKurtsHouseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head LEFT
	step_end

AzaleaTownRivalBeforeText:
	text "…Vertel mij eens" ; "…Tell me some-"
	line "of het zo is." ; "thing."

	para "Klopt het dat" ; "Is it true that"
	line "TEAM ROCKET is" ; "TEAM ROCKET has"
	cont "teruggekeerd?" ; "returned?"

	para "Wat? Je hebt ze" ; "What? You beat"
	line "verslagen? Hah!" ;  "them? Hah! Quit"
	cont "Lieg niet." ; "lying."

	para "Geen grap? Laat" ; "You're not joking?"
	line "dan maar eens zien" ; "Then let's see how"
	cont "hoe goed je bent." ; "good you are."
	done

AzaleaTownRivalWinText:
	text "…Pffft. Waardeloze" ; "… Humph! Useless"
	line "#MON!" ; "#MON!"

	para "Luister, jij. Je" ; "Listen, you. You"
	line "won alleen omdat" ; "only won because"

	para "mijn #MON" ; "my #MON were"
	line "zwak waren." ; "weak."
	done

AzaleaTownRivalAfterText:
	text "Ik haat zwakheid." ; "I hate the weak."

	para "#MON, trainers." ; "#MON, trainers."
	line "Het maakt me niet" ; "It doesn't matter"
	cont "uit wie of wat." ; "who or what."

	para "Ik word sterk en" ; "I'm going to be"
	line "veeg alle zwak-" ; "strong and wipe"
	cont "kelingen weg." ; "out the weak."

	para "Dat geldt ook voor" ; "That goes for TEAM"
	line "TEAM ROCKET." ; "ROCKET too."

	para "In een groep doen" ; "They act big and"
	line "ze heel stoer," ; "tough in a group."

	para "maar tref je ze" ; "But get them"
	line "alleen, dan zijn" ; "alone, and they're"
	cont "ze zwak." ; "weak."

	para "Ik haat ze." ; "I hate them all."

	para "Blijf uit mijn" ; "You stay out of my"
	line "buurt. Een watje" ; "way. A weakling"

	para "als jij leidt me" ; "like you is only a"
	line "alleen maar af." ; "distraction."
	done

AzaleaTownRivalLossText:
	text "…Humph! Ik wist" ; "…Humph! I knew"
	line "wel dat je loog." ; "you were lying."
	done

AzaleaTownRocket1Text:
	text "Het is daarbinnen" ; "It's unsafe to go"
	line "onveilig, dus ik" ; "in there, so I'm"
	cont "houd de wacht." ; "standing guard."

	para "Ben ik niet" ; "Aren't I a good"
	line "een goedzak?" ; "Samaritan?"
	done

AzaleaTownRocket2Text:
	text "Ken je SLOWPOKE-" ; "Do you know about"
	line "STAART? Schijnt" ; "SLOWPOKETAIL? I"
	cont "lekker te zijn!" ; "heard it's tasty!"

	para "Fijn dat ik je dat" ; "Aren't you glad I"
	line "vertelde, toch?" ; "told you that?"
	done

AzaleaTownGrampsTextBefore:
	text "De SLOWPOKE zijn" ; "The SLOWPOKE have"
	line "uit de stad ver-" ; "disappeared from"
	cont "dwenen…" ; "town…"

	para "Hun staarten" ; "I heard their"
	line "worden ergens ver-" ; "TAILS are being"
	cont "kocht, hoorde ik." ; "sold somewhere."
	done

AzaleaTownGrampsTextAfter:
	text "De SLOWPOKE zijn" ; "The SLOWPOKE have"
	line "weer terug." ; "returned."

	para "Hen kennende," ; "Knowing them, they"
	line "waren ze vast" ; "could've just been"

	para "ergens aan het" ; "goofing off some-"
	line "lanterfanten." ; "where."
	done

AzaleaTownTeacherText:
	text "Ben je hier zodat" ; "Did you come to"
	line "KURT wat BALLEN" ; "get KURT to make"
	cont "voor je kan maken?" ; "some BALLS?"

	para "Je bent zeker" ; "A lot of people do"
	line "niet de enige." ; "just that."
	done

AzaleaTownYoungsterText:
	text "Snij door" ; "Cut through AZALEA"
	line "AZALEA en je bent" ; "and you'll be in"
	cont "in het EIKENWOUD." ; "ILEX FOREST."

	para "Maar door deze" ; "But these skinny"
	line "magere boompjes" ; "trees make it"

	para "kom je onmoge-" ; "impossible to get"
	line "lijk doorheen." ; "through."

	para "De HOUTSKOOLMAN's" ; "The CHARCOAL MAN's"
	line "#MON kunnen" ; "#MON can CUT"
	cont "bomen SNIJDEN." ; "down trees."
	done

AzaleaTownSlowpokeText1:
	text "SLOWPOKE: …" ; "SLOWPOKE: …"

	para "<……> <……> <……>" ; "<……> <……> <……>"
	done

AzaleaTownSlowpokeText2:
	text "<……> <……>Gaap?" ; "<……> <……>Yawn?"
	done

WoosterText:
	text "WOOSTER: Gugyoo…" ; "WOOSTER: Gugyoo…"
	done

AzaleaTownKurtText1:
	text "Het EIKENWOUD is" ; "ILEX FOREST is"
	line "rusteloos!" ; "restless!"

	para "Wat is er loos?" ; "What is going on?"
	done

AzaleaTownKurtText2:
	text "<PLAYER>, hier is"  ;"<PLAYER>, here's"
	line "je GZ-BAL terug!" ; "your GS BALL back!"
	done

AzaleaTownKurtText3:
	text "Wil je kijken wat" ; '"Could you go see"
	line "er aan de hand is" ; "why ILEX FOREST is"
	cont "met het EIKENWOUD?" ; "so restless?"
	done

AzaleaTownSignText:
	text "AZALEA TOWN" ; "AZALEA TOWN"
	line "Waar Mensen en" ; "Where People and"

	para "#MON in Blije" ; "#MON Live in"
	line "Harmonie Leven." ; "Happy Harmony"
	done

KurtsHouseSignText:
	text "KURT'S HUIS" ; "KURT'S HOUSE"
	done

AzaleaGymSignText:
	text "AZALEA TOWN" ; "AZALEA TOWN"
	line "#MON-GYMLEIDER:" ; "#MON GYM"
	cont "BUGSY" ; "LEADER: BUGSY"

	para "De lopende" ; "The Walking"
	line "Insect-#MON-" ; "Bug #MON"
	cont "encyclopedie" ; "Encyclopedia"
	done

SlowpokeWellSignText:
	text "SLOWPOKE-PUT" ; "SLOWPOKE WELL"

	para "Ook bekend als" ; "Also known as the"
	line "REGENMAKERPUT." ; "RAINMAKER WELL."

	para "De geeuw van SLOW-" ; "Locals believe"
	line "POKES roept regen" ; "that a SLOWPOKE's"
	cont "op, zegt men." ; g"yawn summons rain."

	para "Een SLOWPOKE-gaap" ; "Records show that"
	line "stopte 400 jaar" ; "a SLOWPOKE's yawn"

	para "terug een droogte," ; "ended a drought"
	line "aldus archieven." ; "400 years ago."
	done

CharcoalKilnSignText:
	text "HOUTSKOOLOVEN" ; "CHARCOAL KILN"
	done

AzaleaTownIlexForestSignText:
	text "EIKENWOUD" ; "ILEX FOREST"

	para "Treed binnen door" ; "Enter through the"
	line "de poort" ; "gate."
	done

AzaleaTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_B1F, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	def_coord_events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene2
	coord_event  9,  6, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL, AzaleaTownCelebiScene

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, AzaleaTownSign
	bg_event 10,  9, BGEVENT_READ, KurtsHouseSign
	bg_event 14, 15, BGEVENT_READ, AzaleaGymSign
	bg_event 29,  7, BGEVENT_READ, SlowpokeWellSign
	bg_event 19, 13, BGEVENT_READ, CharcoalKilnSign
	bg_event 16,  9, BGEVENT_READ, AzaleaTownPokecenterSign
	bg_event 22,  5, BGEVENT_READ, AzaleaTownMartSign
	bg_event  3,  9, BGEVENT_READ, AzaleaTownIlextForestSign
	bg_event 31,  6, BGEVENT_ITEM, AzaleaTownHiddenFullHeal

	def_object_events
	object_event 31,  9, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket1Script, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	object_event  8, 17, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 29,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 15, 15, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event  8,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
	object_event 11, 10, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event 10, 16, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket2Script, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6,  5, SPRITE_KURT_OUTSIDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
