	object_const_def
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3

Route37_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route37SunnyCallback

Route37SunnyCallback:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGregAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	promptbutton
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	promptbutton
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37FruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

Route37FruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

Route37FruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

TwinsAnnandanne1SeenText:
	text "ANN: ANNE en ik" ; "ANN: ANNE and I"
	line "doen dit helemaal" ; "are in this to-"
	cont "samen!" ; "gether!"
	done

TwinsAnnandanne1BeatenText:
	text "ANN & ANNE: Nnn…" ; "ANN & ANNE: Nnn… A"
	line "Iets te sterk." ; "little too strong."
	done

TwinsAnnandanne1AfterBattleText:
	text "ANN: Ik weet wat" ; "ANN: I can tell"
	line "mijn zus en mijn" ; "what my sister and"

	para "#MON allemaal" ; "my #MON are"
	line "denken." ; "thinking."
	done

TwinsAnnandanne2SeenText:
	text "ANNE: ANN en ik" ; "ANNE: ANN and I"
	line "doen dit helemaal" ; "are in this to-"
	cont "samen!" ; "gether!"
	done

TwinsAnnandanne2BeatenText:
	text "ANN & ANNE: Nnn…" ; "ANN & ANNE: Nnn… A"
	line "Iets te sterk." ; "little too strong."
	done

TwinsAnnandanne2AfterBattleText:
	text "ANNE: Wij delen de" ; "ANNE: We share the"
	line "gevoelens van onze" ; "same feelings as"
	cont "#MON." ; "our #MON."
	done

PsychicGregSeenText:
	text "#MON kunnen" ; "#MON can't do a"
	line "niks doen als ze" ; "thing if they are"
	cont "slapen." ; "asleep."

	para "Ik laat je zien" ; "I'll show you how"
	line "hoe eng dat is!" ; "scary that is!"
	done

PsychicGregBeatenText:
	text "Ik heb verloren." ; "I lost. That's"
	line "Wat droevig…" ; "pretty sad…"
	done

PsychicGregAfterBattleText:
	text "#MON in slaap" ; "Putting #MON to"
	line "brengen of verlam-" ; "sleep or paralyz-"
	cont "men zijn goede" ; "ing them are good"
	cont "strijdtechnieken." ; "battle techniques."
	done

MeetSunnyText:
	text "SUNNY: Hoi!" ; "SUNNY: Hi!"

	para "Ik ben zondagse" ; "I'm SUNNY of Sun-"
	line "Sunny, vandaag is" ; "day, meaning it's"
	cont "het dus zondag!" ; "Sunday today!"
	done

SunnyGivesGiftText1:
	text "Ik moest je dit" ; "I was told to give"
	line "geven als ik je" ; "you this if I saw"
	cont "zou zien!" ; "you!"
	done

SunnyGivesGiftText2:
	text "Ik moest je dit" ; "I was told to give"
	line "geven als ik je" ; "you this if I saw"
	cont "zou zien!" ; "you!"
	done

SunnyGaveGiftText:
	text "SUNNY: Dat ding…" ; "SUNNY: That thing…"

	para "Um…"

	para "… Wat was het nou…" ; "… What was it now…"

	para "…"

	para "Oh! Ik weet het" ; "Oh! I remember"
	line "weer!" ; "now!"

	para "Een #MON met" ; "A #MON that"
	line "elektrische aan-" ; "knows electric"

	para "vallen moet het" ; "moves should hold"
	line "vasthouden Mijn." ; "it."

	para "zus MONICA zegt" ; "My sis MONICA said"
	line "dat het hun aan-" ; "it powers up"
	cont "vallen versterkt!" ; "electric moves!"
	done

SunnySundayText:
	text "SUNNY: Mijn zussen" ; "SUNNY: My sisters"
	line "en broers zijn" ; "and brothers are"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA en SANTOS." ; "FRIEDA and SANTOS."

	para "Ze zijn allemaal" ; "They're all older"
	line "ouder dan ik!" ; "than me!"
	done

SunnyNotSundayText:
	text "Is het vandaag" ; "SUNNY: Isn't today"
	line "zondag?" ; "Sunday?"
	cont "Um… Vergeten!" ; "Um… I forgot!"
	done

Route37SignText:
	text "ROUTE 37"
	done

Route37_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, Route37Sign
	bg_event  4,  2, BGEVENT_ITEM, Route37HiddenEther

	def_object_events
	object_event  6, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event  7, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 13,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree1, -1
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 16,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree2, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree3, -1
