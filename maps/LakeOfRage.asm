	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeOfRage_MapScripts:
	def_scene_scripts
	scene_script LakeOfRageNoop1Scene ; unusable
	scene_script LakeOfRageNoop2Scene ; unusable

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlypointCallback
	callback MAPCALLBACK_OBJECTS, LakeOfRageWesleyCallback

LakeOfRageNoop1Scene:
	end

LakeOfRageNoop2Scene:
	end

LakeOfRageFlypointCallback:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageWesleyCallback:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext LakeOfRageLanceForcedToEvolveText
	promptbutton
	faceplayer
	writetext LakeOfRageLanceIntroText
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext LakeOfRageLanceRadioSignalText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, LakeOfRageLanceTeleportIntoSkyMovement
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.RefusedToHelp:
	writetext LakeOfRageLanceRefusedText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext LakeOfRageLanceAskHelpText
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
	opentext
	writetext LakeOfRageGyaradosCryText
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LAKEOFRAGE_GYARADOS
.NotBeaten:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext LakeOfRageGotRedScaleText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
	appear LAKEOFRAGE_LANCE
	end

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	promptbutton
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	promptbutton
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_DETECT

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

LakeOfRageLanceTeleportIntoSkyMovement:
	teleport_from
	step_end

LakeOfRageLanceForcedToEvolveText:
	text "Dit meer zit vol" ; "This lake is full"
	line "met alleen maar" ; "of GYARADOS but"
	cont "GYARADOS…" ; "nothing else…"

	para "De MAGIKARP worden" ; "So the MAGIKARP"
	line "dus gedwongen te" ; "are being forced"
	cont "evolueren…" ; "to evolve…"
	done

LakeOfRageLanceIntroText:
	text "Kwam je hier omdat" ; "Did you come here"
	line "je de geruchten" ; "because of the"
	cont "hebt gehoord?" ; "rumors?"

	para "Jij bent <PLAYER>?" ; "You're <PLAYER>?"
	line "Ik ben LANCE, een" ; "I'm LANCE, a"
	cont "trainer als jij." ; "trainer like you."

	para "Ik hoorde wat" ; "I heard some ru-"
	line "geruchten, dus" ; "mors, so I came to"
	cont "kwam onderzoeken…" ; "investigate…"

	para "Ik zag hoe je" ; "I saw the way you"
	line "eerder vocht," ; "battled earlier,"
	cont "<PLAY_G>."

	para "Ik kan zien dat je" ; "I can tell that"
	line "een trainer bent" ; "you're a trainer"

	para "met bijzonder veel" ; "with considerable"
	line "kunde." ; "skill."

	para "Als je tijd hebt," ; "If you don't mind,"
	line "kun je me helpen" ; "could you help me"
	cont "met m'n onderzoek?" ; "investigate?"
	done

LakeOfRageLanceRadioSignalText:
	text "LANCE: Uitstekend!" ; "LANCE: Excellent!"

	para "Het lijkt dat de" ; "It seems that the"
	line "MAGIKARP worden" ; "LAKE's MAGIKARP"

	para "gedwongen om te" ; "are being forced"
	line "evolueren." ; "to evolve."

	para "Een mysterieuze" ; "A mysterious radio"
	line "radio-uitzending" ; "broadcast coming"

	para "uit MAHOGANY is de" ; "from MAHOGANY is"
	line "oorzaak." ; "the cause."

	para "Ik zal op je" ; "I'll be waiting"
	line "wachten, <PLAY_G>." ; "for you, <PLAY_G>."
	done

LakeOfRageLanceRefusedText:
	text "Oh… Nou, als je" ; "Oh… Well, if you"
	line "van gedachten ver-" ; "change your mind,"
	cont "anders, help me" ; "please help me."
	cont "alsjeblieft."
	done

LakeOfRageLanceAskHelpText:
	text "LANCE: Hm? Ga je" ; "LANCE: Hm? Are you"
	line "me helpen?" ; "going to help me?"
	done

LakeOfRageGyaradosCryText:
	text "GYARADOS: Gyashaa!"
	done

LakeOfRageGotRedScaleText:
	text "<PLAYER> ontving" ; "<PLAYER> obtained a"
	line "een RODE SCHAAL." ; "RED SCALE."
	done

LakeOfRageGrampsText:
	text "De GYARADOS zijn" ; "The GYARADOS are"
	line "boos!" ; "angry!"

	para "Een slecht teken!" ; "It's a bad omen!"
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "Hahah! De MAGI-" ; "Hahah! The MAGI-"
	line "KARP bijten!" ; "KARP are biting!"
	done

LakeOfRageSuperNerdText:
	text "Ik hoorde dat dit" ; "I heard this lake"
	line "meer is gemaakt" ; "was made by ram-"
	cont "door GYARADOS." ; "paging GYARADOS."

	para "Zou er een" ; "I wonder if there"
	line "connectie zijn met" ; "is any connection"

	para "de massa-uitbraak" ; "to their mass out-"
	line "van nu?" ; "break now?"
	done

LakeOfRageCooltrainerFText:
	text "Zag ik het echt?" ; "Did my eyes de-"
	line "Ik spotte een rode" ; "ceive me? I saw a"

	para "GYARADOS middenin" ; "red GYARADOS in"
	line "het MEER…" ; "the LAKE…"

	para "Maar GYARADOS zijn" ; "But I thought"
	line "normaal toch juist" ; "GYARADOS were"
	cont "blauw?" ; "usually blue?"
	done

FisherAndreSeenText:
	text "Laat me tegen je" ; "Let me battle with"
	line "vechten met mijn" ; "the #MON I just"
	cont "gevangen #MON!" ; "caught!"
	done

FisherAndreBeatenText:
	text "Ik ben een goede" ; "I might be an ex-"
	line "hengelaar, maar" ; "pert angler, but"

	para "vechten kan ik" ; "I stink as a #-"
	line "niet…" ; "MON trainer…"
	done

FisherAndreAfterBattleText:
	text "Ik verlies niet als" ; "I won't lose as an"
	line "hengelaar! Elke dag" ; "angler! I catch"
	cont "vang ik #MON." ; "#MON all day."
	done

FisherRaymondSeenText:
	text "Wat ik ook doe," ; "No matter what I"
	line "altijd vang ik" ; "do, all I catch"

	para "weer dezelfde" ; "are the same #-"
	line "#MON…" ; "MON…"
	done

FisherRaymondBeatenText:
	text "Mijn vislijn zit" ; "My line's all"
	line "in de knoop…" ; "tangled up…"
	done

FisherRaymondAfterBattleText:
	text "Hoezo vang ik geen" ; "Why can't I catch"
	line "goede #MON?" ; "any good #MON?"
	done

CooltrainermAaronSeenText:
	text "Als 'n trainer een" ; "If a trainer spots"
	line "andere trainer" ; "another trainer,"

	para "spot, moet je el-" ; "he has to make a"
	line "kaar uitdagen." ; "challenge."

	para "Dat is onze" ; "That is our"
	line "lotsbestemming." ; "destiny."
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Goed gevecht." ; "Good battle."
	done

CooltrainermAaronAfterBattleText:
	text "#MON en hun" ; "#MON and their"
	line "trainer worden" ; "trainer become"

	para "sterker door con-" ; "powerful through"
	line "tinu te vechten." ; "constant battling."
	done

CooltrainerfLoisSeenText:
	text "Wat gebeurde met" ; "What happened to"
	line "de rode GYARADOS?" ; "the red GYARADOS?"

	para "Weg?" ; "It's gone?"

	para "Oh, verdraaid." ; "Oh, darn. I came"
	line "Kwam ik voor niks?" ; "here for nothing?"

	para "Ik weet het--laten" ; "I know--let's"
	line "we vechten!" ; "battle!"
	done

CooltrainerfLoisBeatenText:
	text "Goed bezig!" ; "Good going!"
	done

CooltrainerfLoisAfterBattleText:
	text "Nu ik er over denk," ; "Come to think of"
	line "ooit zag ik een" ; "it, I've seen a"
	cont "roze BUTTERFREE." ; "pink BUTTERFREE."
	done

MeetWesleyText:
	text "WESLEY: Nou, hoe" ; "WESLEY: Well, how"
	line "gaat het?" ; "do you do?"

	para "Gezien het vandaag" ; "Seeing as how it's"
	line "woensdag is," ; "Wednesday today,"

	para "Ik ben woensdagse" ; "I'm WESLEY of"
	line "Wesley." ; "Wednesday."
	done

WesleyGivesGiftText:
	text "Fijn je te ont-" ; "Pleased to meet"
	line "moeten. Neem deze" ; "you. Please take a"
	cont "souvenir." ; "souvenir."
	done

WesleyGaveGiftText:
	text "WESLEY: ZWARTE" ; "WESLEY: BLACKBELT"
	line "BAND versterkt je" ; "beefs up the power"
	cont "vecht-aanvallen." ; "of fighting moves."
	done

WesleyWednesdayText:
	text "WESLEY: Gezien je" ; "WESLEY: Since you"
	line "mij vond, moet je" ; "found me, you must"

	para "mijn broers en" ; "have met my broth-"
	line "zussen hebben" ; "ers and sisters."

	para "ontmoet. Of had je" ; "Or did you just"
	line "gewoon geluk?" ; "get lucky?"
	done

WesleyNotWednesdayText:
	text "WESLEY: Vandaag is" ; "WESLEY: Today's"
	line "het niet woensdag." ; "not Wednesday."
	cont "Wat jammer nou." ; "That's too bad."
	done

LakeOfRageSignText:
	text "MEER VAN RAZERNIJ," ; "LAKE OF RAGE,"
	line "ook bekend als" ; "also known as"
	cont "GYARADOS-MEER." ; "GYARADOS LAKE."
	done

FishingGurusHouseSignText:
	text "VISGOEROE'S HUIS" ; "FISHING GURU'S"
	line "" ; "HOUSE"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
