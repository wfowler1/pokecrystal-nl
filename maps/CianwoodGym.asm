	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd StrengthBoulderScript

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd GymStatue2Script

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "WAHAHAH!"

	para "Dus je bent zo" ; "So you've come"
	line "ver gekomen!" ; "this far!"

	para "Ik zeg je," ; "Let me tell you,"
	line "ik ben sterk!" ; "I'm tough!"

	para "Mijn #MON ver-" ; "My #MON will"
	line "pletteren stenen" ; "crush stones and"
	cont "en versplinteren" ; "shatter bones!"
	cont "botten!" ;

	para "Let op!" ; "Watch this!"
	done

ChuckIntroText2:
	text "CHUCK: Urggh!"
	line "…"

	para "Oooarrgh!"
	done

ChuckIntroText3:
	text "Zo! Ben je" ; "There! Scared now,"
	line "nu bang?" ; "are you?"

	para "Wat?" ; "What?"
	line "Dat heeft niets" ; "It has nothing to"

	para "met #MON te maken?" ; "do with #MON?"
	line "Dat klopt!" ; "That's true!"

	para "Kom. We zullen" ; "Come on. We shall"
	line "vechten!" ; "do battle!"
	done

ChuckLossText:
	text "Wha? Huh?"
	line "Ik heb verloren?" ; "I lost?"

	para "Warempel!" ; "How about that!"
	line "Je bent de" ; "You're worthy of"
	cont "STORMBADGE waard!" ; "STORMBADGE!"
	done

GetStormBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "STORMBADGE."
	done

ChuckExplainBadgeText:
	text "STORMBADGE laat" ; "STORMBADGE makes"
	line "alle #MON tot" ; "all #MON up to"

	para "L70 gehoorzamen," ; "L70 obey, even"
	line "zelfs geruilde." ; "traded ones."

	para "Het laat je #MON" ; "It also lets your"
	line "ook VLIEGEN als" ; "#MON use FLY"

	para "je niet in een" ; "when you're not in"
	line "gevecht bent." ; "a battle."

	para "Hier, neem ook" ; "Here, take this"
	line "dit!" ; "too!"
	done

ChuckExplainTMText:
	text "Dat is DYNAMISCHE" ; "That is DYNAMIC-"
	line "SLAG." ; "PUNCH."

	para "Het raakt niet" ; "It doesn't always"
	line "altijd, maar als" ; "hit, but when it"

	para "je raakt, dan ver-" ; "does, it causes"
	line "oorzaakt het" ; "confusion!"
	cont "verwarring!" ;
	done

ChuckAfterText:
	text "WAHAHAH! Ik genoot" ; "WAHAHAH! I enjoyed"
	line "van ons gevecht!" ; "battling you!"

	para "Maar verlies is" ; "But a loss is a"
	line "verlies!" ; "loss!"

	para "Vanaf nu ga ik" ; "From now on, I'm"
	line "24 uur per dag" ; "going to train 24"
	cont "trainen!" ; "hours a day!"
	done

BlackbeltYoshiSeenText:
	text "Mijn #MON en ik" ; "My #MON and I"
	line "zijn verbonden" ; "are bound togeth-"
	cont "door vriendschap." ; "er by friendship."

	para "Onze band zal" ; "Our bond will"
	line "nooit breken!" ; "never be broken!"
	done

BlackbeltYoshiBeatenText:
	text "Dit is niet echt!" ; "This isn't real!"
	done

BlackbeltYoshiAfterText:
	text "Je lijkt ook" ; "You seem to have a"
	line "een sterke band" ; "strong bond with"
	cont "met je #MON" ; "your #MON too!"
	cont "te hebben." ;
	done

BlackbeltLaoSeenText:
	text "Wij vechtsporters" ; "We martial artists"
	line "zijn nergens bang" ; "fear nothing!"
	cont "voor!" ;
	done

BlackbeltLaoBeatenText:
	text "Schokkend!" ; "That's shocking!"
	done

BlackbeltLaoAfterText:
	text "Vecht-#MON" ; "Fighting #MON"
	line "zijn bang voor" ; "are afraid of psy-"
	cont "helderzienden…" ; "chics…"
	done

BlackbeltNobSeenText:
	text "Woorden zijn nut-" ; "Words are useless."
	line "teloos. Laat je" ; "Let your fists do"
	cont "vuisten spreken!" ; "the talking!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "Ik heb verloren!" ; "I lost! "
	line "Ik ben sprakeloos!" ; "I'm speechless!"
	done

BlackbeltLungSeenText:
	text "Mijn razende" ; "My raging fists"
	line "vuisten zullen je" ; "will shatter your"
	cont "#MON vermorzelen!" ; "#MON!"
	done

BlackbeltLungBeatenText:
	text "Ik ben vermorzeld!" ; "I got shattered!"
	done

BlackbeltLungAfterText:
	text "Mijn #MON verloren…" ; "My #MON lost…"
	line "Mijn… mijn trots" ; "My… my pride is"
	cont "is vermorzeld…" ; "shattered…"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
