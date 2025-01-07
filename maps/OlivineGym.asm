	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "…Bedankt voor je" ; "…Thank you for"
	line "hulp in de" ; "your help at the"
	cont "VUURTOREN…" ; "LIGHTHOUSE…"

	para "Maar dit is" ; "But this is dif-"
	line "anders. Sta me" ; "ferent. Please"

	para "toe om mezelf" ; "allow me to intro-"
	line "te introduceren." ; "duce myself."

	para "Ik ben JASMINE," ; "I am JASMINE, a"
	line "een GYMLEIDER. Ik" ; "GYM LEADER. I use"
	cont "gebruik het" ; "the steel-type."
	cont "staal-type." ;

	para "…Ken je het" ; "…Do you know about"
	line "staal-type?" ; "the steel-type?"

	para "Het is een type" ; "It's a type that"
	line "dat nog maar pas" ; "was only recently"
	cont "is ontdekt." ; "discovered."

	para "…Um… Kan ik" ; "…Um… May I begin?"
	line "beginnen?" ;
	done

Jasmine_BetterTrainer:
	text "…Je bent een" ; "…You are a better"
	line "betere trainer" ; "trainer than me,"

	para "dan ik, in zowel" ; "in both skill and"
	line "vaardigheid als" ; "kindness."
	cont "vriendelijkheid." ;

	para "In overeenstemming" ; "In accordance with"
	line "met de LEAGUE-" ; "LEAGUE rules, I"

	para "regels, overhandig" ; "confer upon you"
	line "ik je deze BADGE." ; "this BADGE."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "MINERAALBADGE." ; "MINERALBADGE."
	done

Jasmine_BadgeSpeech:
	text "MINERAALBADGE" ; "MINERALBADGE"
	line "verhoogt #MON-" ; "raises #MON's"
	cont "AFWEER." ; "DEFENSE."

	para "…Um… Neem" ; "…Um… Please take"
	line "dit ook…" ; "this too…"
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "TM09."
	done

Jasmine_IronTailSpeech:
	text "…Met die TM" ; "…You could use"
	line "kun je IJZER-" ; "that TM to teach"
	cont "STAART leren." ; "IRON TAIL."
	done

Jasmine_GoodLuck:
	text "Um… Ik weet niet" ; "Um… I don't know"
	line "hoe ik dit moet" ; "how to say this,"
	cont "zeggen, maar" ; "but good luck…"
	cont "veel geluk…" ;
	done

OlivineGymGuideText:
	text "JASMINE gebruikt" ; "JASMINE uses the"
	line "het nieuwe" ; "newly discovered"
	cont "staal-type." ; "steel-type."

	para "Ik weet er" ; "I don't know very"
	line "niet veel vanaf." ; "much about it."
	done

OlivineGymGuideWinText:
	text "Dat was geweldig." ; "That was awesome."

	para "Het staal-type," ; "The steel-type,"
	line "hè?" ; "huh?"

	para "Dat was een" ; "That was a close"
	line "zeldzaam" ; "encounter of an"
	cont "goed gevecht!" ; "unknown kind!"
	done

OlivineGymGuidePreText:
	text "JASMINE, de GYM-" ; "JASMINE, the GYM"
	line "LEIDER, is in" ; "LEADER, is at the"
	cont "de VUURTOREN." ; "LIGHTHOUSE."

	para "Ze zorgt voor" ; "She's been tending"
	line "een zieke #MON." ; "to a sick #MON."

	para "Een sterke" ; "A strong trainer"
	line "trainer moet" ; "has to be compas-"
	cont "medeleven tonen." ; "sionate."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
