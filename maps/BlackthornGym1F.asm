	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBouldersCallback

BlackthornGym1FBouldersCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script

ClairIntroText:
	text "Ik ben CLAIR." ; "I am CLAIR."

	para "De beste draken-" ; "The world's best"
	line "meester op aarde." ; "dragon master."

	para "Ik kan me zelfs" ; "I can hold my own"
	line "meten met de ELITE" ; "against even the"

	para "FOUR van de" ; "#MON LEAGUE's"
	line "#MON-LEAGUE." ; "ELITE FOUR."

	para "Wil je nog steeds" ; "Do you still want"
	line "met me vechten?" ; "to take me on?"

	para "…Prima." ; "…Fine."
	line "We doen het!" ; "Let's do it!"

	para "Als GYMLEADER zal" ; "As a GYM LEADER,"
	line "ik al mijn kracht" ; "I will use my full"

	para "tegen elke tegen-" ; "power against any"
	line "stander gebruiken!" ; "opponent!"
	done

ClairWinText:
	text "Ik heb verloren?" ; "I lost?"

	para "Niet te geloven." ; "I don't believe"
	line "Het moet een" ; "it. There must be"
	cont "vergissing zijn." ; "some mistake…"
	done

ClairText_GoToDragonsDen:
	text "Ik weiger dit te" ; "I won't admit"
	line "erkennen." ; "this."

	para "Wellicht verloor" ; "I may have lost,"
	line "ik, maar je bent" ; "but you're still"

	para "nog niet klaar" ; "not ready for the"
	line "voor de LEAGUE." ; "#MON LEAGUE."

	para "Ik weet het. Je" ; "I know. You should"
	line "moet de draken-" ; "take the dragon"
	cont "test doen" ; "user challenge."

	para "Achter deze GYM is" ; "Behind this GYM is"
	line "een plek genaamd" ; "a place called"
	cont "de DRAKENGROT." ; "DRAGON'S DEN."

	para "In het midden" ; "There is a small"
	line "staat een klein" ; "shrine at its"

	para "altaar." ; "center."
	line "Ga daarheen." ; "Go there."

	para "Als je bewijst dat" ; "If you can prove"
	line "je jouw luie" ; "that you've lost"

	para "idealen kwijt" ; "your lazy ideals,"
	line "bent, erken ik je" ; "I will recognize"

	para "als een trainer" ; "you as a trainer"
	line "die de GYMBADGE" ; "worthy of a GYM"
	cont "waardig is!" ; "BADGE!"
	done

ClairText_TooMuchToExpect:
	text "Wat is er mis?" ; "What's the matter?"

	para "Is dat soms teveel" ; "Is it too much to"
	line "gevraagd?" ; "expect of you?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "Je liet me lang" ; "You've kept me"
	line "wachten!" ; "waiting!"

	para "Hier! Neem dit!" ; "Here! Take this!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "TM24."
	done

BlackthornGymClairText_DescribeTM24:
	text "Dat bevat" ; "That contains"
	line "DRAKENADEM" ; "DRAGONBREATH."

	para "Nee, het heeft" ; "No, it doesn't"
	line "niks met mijn" ; "have anything to"
	cont "adem te maken." ; "do with my breath."

	para "Als je het niet" ; "If you don't want"
	line "wil, dan neem je" ; "it, you don't have"
	cont "het niet." ; "to take it."
	done

BlackthornGymClairText_BagFull:
	text "Wat nu? Heb je" ; "What is this? You"
	line "geen plek?" ; "don't have room?"
	done

BlackthornGymClairText_League:
	text "Wat is er loos?" ; "What's the matter?"

	para "Ben je niet op weg" ; "Aren't you headed"
	line "naar de #MON-" ; "to the #MON"
	cont "LEAGUE?"

	para "Weet je niet waar" ; "Don't you know"
	line "het is?" ; "where it is?"

	para "Ga van hier naar" ; "From here, go to"
	line "NEW BARK TOWN."

	para "SURF dan naar het" ; "Then SURF east."
	line "oosten. De weg" ; "The route there is"
	cont "erheen is pittig." ; "very tough."

	para "Waag het niet te" ; "Don't you dare"
	line "verliezen bij de" ; "lose at the #-"
	cont "#MON-LEAGUE!" ; "MON LEAGUE!"

	para "Als je dat doet," ; "If you do, I'll"
	line "baal ik nog meer" ; "feel even worse"

	para "van mijn verlies" ; "about having lost"
	line "tegen jou!" ; "to you!"

	para "Geef het alles dat" ; "Give it every-"
	line "je in je hebt." ; "thing you've got."
	done

CooltrainermPaulSeenText:
	text "Je eerste gevecht" ; "Your first battle"
	line "tegen draken?" ; "against dragons?"

	para "Ik laat zien hoe" ; "I'll show you how"
	line "sterk ze zijn!" ; "tough they are!"
	done

CooltrainermPaulBeatenText:
	text "Mijn draak-#MON" ; "My dragon #MON"
	line "verloor?" ; "lost?"
	done

CooltrainermPaulAfterBattleText:
	text "LANCE zei dat hij" ; "LANCE told you"
	line "je weer wilde" ; "that he'd like to"

	para "zien? Ja hoor," ; "see you again?"
	line "echt niet!" ; "Not a chance!"
	done

CooltrainermMikeSeenText:
	text "De kans dat ik" ; "My chance of"
	line "verlies? Minder" ; "losing? Not even"
	cont "dan een procent!" ; "one percent!"
	done

CooltrainermMikeBeatenText:
	text "Wat vreemd." ; "That's odd."
	done

CooltrainermMikeAfterBattleText:
	text "Ik weet nu wat ik" ; "I know my short-"
	line "tekortkwam." ; "comings now."

	para "Bedankt dat je mij" ; "Thanks for showing"
	line "dat liet zien!" ; "me!"
	done

CooltrainerfLolaSeenText:
	text "Draken zijn" ; "Dragons are sacred"
	line "heilige #MON." ; "#MON."

	para "Ze zitten vol" ; "They are full of"
	line "levensenergie." ; "life energy."

	para "Als je niet" ; "If you're not"
	line "serieus bent, kun" ; "serious, you won't"

	para "je ze niet" ; "be able to beat"
	line "verslaan." ; "them."
	done

CooltrainerfLolaBeatenText:
	text "Goed gedaan!" ; "Way to go!"
	done

CooltrainerfLolaAfterBattleText:
	text "Draken zijn zwwak" ; "Dragons are weak"
	line "tegen draak-type" ; "against dragon-"
	cont "aanvallen." ; "type moves."
	done

BlackthornGymGuideText:
	text "Yo! Kampioen in" ; "Yo! CHAMP in"
	line "het verschiet!" ; "making!"

	para "Het was een lange" ; "It's been a long"
	line "reis, maar we zijn" ; "journey, but we"

	para "bijna klaar! Reken" ; "are almost done!"
	line "maar op mij!" ; "Count on me!"

	para "CLAIR gebruikt" ; "CLAIR uses the"
	line "mythische en" ; "mythical and sac-"
	cont "heilige draak-type" ; "red dragon-type"
	cont "#MON."

	para "Je kunt ze niet" ; "You can't damage"
	line "zomaar verwonden." ; "them very easily."

	para "Maar weet je, het" ; "But you know,"
	line "schijnt dat ze" ; "they're supposed"

	para "zwak zijn tegen" ; "to be weak against"
	line "ijs-aanvallen." ; "ice-type moves."
	done

BlackthornGymGuideWinText:
	text "Je was geweldig" ; "You were great to"
	line "tegen CLAIR!" ; "beat CLAIR!"

	para "Nu volgt alleen" ; "All that's left is"
	line "nog de #MON-" ; "the #MON LEAGUE"
	cont "LEAGUE-uitdaging." ; "challenge."

	para "Je bent op weg om" ; "You're on the way"
	line "#MON-KAMPIOEN" ; "to becoming the"
	cont "te worden!" ; "#MON CHAMPION!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
