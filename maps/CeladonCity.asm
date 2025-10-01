	object_const_def
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlypointCallback

CeladonCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "Deze POLIWRATH is" ; "This POLIWRATH is"
	line "mijn partner." ; "my partner."

	para "Zou die ooit" ; "I wonder if it'll"
	line "evolueren in een" ; "ever evolve into a"
	cont "kikker-#MON?" ; "frog #MON."
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: Kwaak!" ; "POLIWRATH: Croak!"
	done

CeladonCityTeacher1Text:
if DEF(_CRYSTAL_AU)
	text "I lost at the"
	line "machines."
	done
else
	text "Weer verloren bij" ; "I lost at the slot"
	line "de speelautomaten…" ; "machines again…"

	para "Meisjes spelen nu" ; "We girls also play"
	line "ook met automaten." ; "the slots now."

	para "Probeer ze ook" ; "You should check"
	line "eens een keertje." ; "them out too."
	done
endc

CeladonCityGramps1Text:
	text "GRIMER verschijnt" ; "GRIMER have been"
	line "hier sinds kort." ; "appearing lately."

	para "Zie je die vijver" ; "See that pond out"
	line "voor het huis?" ; "in front of the"

	para "Daar wonen nu" ; "house? GRIMER live"
	line "GRIMER." ; "there now."

	para "Waar komen ze van-" ; "Where did they"
	line "daan? Dit is echt" ; "come from? This is"
	cont "een probleem…" ; "a serious problem…"
	done

CeladonCityGramps2Text:
	text "Nihihi! Deze GYM" ; "Nihihi! This GYM"
	line "is geweldig!" ; "is great! Only"

	para "Alleen meiden zijn" ; "girls are allowed"
	line "hier welkom!" ; "here!"
	done

CeladonCityYoungster1Text:
	text "Wil je een geheim" ; "Want to know a"
	line "weten?" ; "secret?"

	para "CELADON-FLAT heeft" ; "CELADON MANSION"
	line "een verstopte" ; "has a hidden back"
	cont "achterdeur." ; "door."
	done

CeladonCityYoungster2Text:
	text "Ze houden een" ; "They're holding an"
	line "eetwedstrijd bij" ; "eating contest at"
	cont "het restaurant." ; "the restaurant."

	para "Ik zit al vol" ; "Just watching them"
	line "als ik er alleen" ; "go at it makes me"
	cont "al naar kijk…" ; "feel bloated…"
	done

CeladonCityTeacher2Text:
	text "CELADON-WARENHUIS" ; "CELADON DEPT.STORE"
	line "heeft de grootste" ; "has the biggest"

	para "en beste selectie" ; "and best selection"
	line "aan goederen." ; "of merchandise."

	para "Als je het daar" ; "If you can't get"
	line "niet kan krijgen," ; "it there, you"

	para "dan vind je het" ; "can't get it any-"
	line "nergens." ; "where."

	para "Tjee… Ik klink als" ; "Gee… I sound like"
	line "een ware verkoper." ; "a sales clerk."
	done

CeladonCityLassText_Mobile: ; unreferenced
	text "Heerlijk om door" ; "I love being"
	line "hoge gebouwen om-" ; "surrounded by tall"
	cont "ringd te zijn!" ; "buildings!"

	para "Klopt het dat het" ; "Isn't it true that"
	line "#MONCENTRUM" ; "GOLDENROD #MON"

	para "van GOLDENROD nu" ; "CENTER was made"
	line "veel groter is?" ; "much, much bigger?"

	para "Dat is zo gaaf!" ; "That is so neat!"
	line "Hadden we ook" ; "I wish we had a"

	para "maar zo'n plek" ; "place like that in"
	line "in KANTO…" ; "KANTO…"
	done

CeladonCityLassText:
	text "Omlaag kijken" ; "Looking at the"
	line "tijdens het lopen," ; "ground while I was"

	para "ik word er dui-" ; "walking made me"
	line "zelig van." ; "dizzy."
	done

CeladonCitySignText:
	text "CELADON CITY" ; "CELADON CITY"

	para "De stad van" ; "The City of"
	line "Regenboogdromen" ; "Rainbow Dreams"
	done

CeladonGymSignText:
	text "CELADON CITY" ; "CELADON CITY"
	line "#MON-GYMLEIDER:" ; "#MON GYM"
	cont "ERIKA" ; "LEADER: ERIKA"

	para "De Natuurlief-" ; "The Nature-Loving"
	line "hebbende Prinses" ; "Princess"
	done

CeladonCityDeptStoreSignText:
	text "Vind wat je zoekt" ; "Find What You"
	line "bij het CELADON-" ; "Need at CELADON"
	cont "WARENHUIS!" ; "DEPT.STORE!"
	done

CeladonCityMansionSignText:
	text "CELADON-FLAT" ; "CELADON MANSION"
	done

CeladonCityGameCornerSignText:
if DEF(_CRYSTAL_AU)
	text "The Game Area for"
	line "Grown-ups--CELADON"
	cont "GAME CORNER"
	done
else
	text "De Speeltuin voor" ; "The Playground for"
	line "Iedereen--CELADON" ; "Everybody--CELADON"
	cont "SPELHOEK" ; "GAME CORNER"
	done
endc

CeladonCityTrainerTipsText:
	text "TRAINERTIPS" ; "TRAINER TIPS"

	para "STATWACHT" ; "GUARD SPEC."
	line "beschermt #MON" ; "protects #MON"

	para "tegen SPECIALE" ; "against SPECIAL"
	line "aanvallen zoals" ; "attacks such as"
	cont "vuur en water." ; "fire and water."

	para "Koop je voorwerpen" ; "Get your items at"
	line "bij het CELADON-" ; "CELADON DEPT."
	cont "WARENHUIS!" ; "STORE!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	def_coord_events

	def_bg_events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
