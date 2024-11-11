	object_const_def
	const ROUTE35_YOUNGSTER1
	const ROUTE35_YOUNGSTER2
	const ROUTE35_LASS1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_FISHER
	const ROUTE35_BUG_CATCHER
	const ROUTE35_SUPER_NERD
	const ROUTE35_OFFICER
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL

Route35_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_JUGGLER_IRWIN
	endifjustbattled
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue Route35NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

Route35AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route35AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route35RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route35NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route35NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route35PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route35RematchM:
	jumpstd RematchMScript
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerBrooke:
	trainer PICNICKER, BROOKE, EVENT_BEAT_PICNICKER_BROOKE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerBrookeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherArnie:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, BugCatcherArnieSeenText, BugCatcherArnieBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	endifjustbattled
	opentext
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_YANMA_SWARM
	iftrue .YanmaSwarming
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue Route35NumberAcceptedM
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BugCatcherArnieAfterBattleText
	promptbutton
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

.WantsBattle:
	scall Route35RematchM
	winlosstext BugCatcherArnieBeatenText, 0
	readmem wArnieFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 1
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 2
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 3
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 4
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.YanmaSwarming:
	writetext BugCatcherArnieYanmaText
	waitbutton
	closetext
	end

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

Route35Sign:
	jumptext Route35SignText

Route35TMRollout:
	itemball TM_ROLLOUT

Route35FruitTree:
	fruittree FRUITTREE_ROUTE_35

CamperIvanSeenText:
	text "Ik ontvang steeds" ; "I've been getting"
	line "#MON-data op" ; "#MON data off"

	para "mijn radio. Gaat" ; "my radio. I think"
	line "best prima zo." ; "I'm good."
	done

CamperIvanBeatenText:
	text "Jij wint!" ; "I give!"
	done

CamperIvanAfterBattleText:
	text "Muziek op de radio" ; "Music on the radio"
	line "bepaalt het humeur" ; "changes the moods"
	cont "van wilde #MON." ; "of wild #MON."
	done

CamperElliotSeenText:
	text "Ik ga m'n vriendin" ; "I'm gonna show my"
	line "laten zien dat ik" ; "girlfriend I'm hot"
	cont "het helemaal ben!" ; "stuff!"
	done

CamperElliotBeatenText:
	text "Ik wou dat je voor" ; "I wish you would"
	line "me had verloren…" ; "have lost for me…"
	done

CamperElliotAfterBattleText:
	text "Ik werd vernederd" ; "I was humiliated"
	line "recht voor mijn" ; "in front of my"
	cont "vriendin…" ; "girlfriend…"
	done

PicnickerBrookeSeenText:
	text "Mijn vriendje is" ; "My boyfriend's"
	line "zwak, daar kan ik" ; "weak, so I can't"
	cont "niet op rekenen." ; "rely on him."
	done

PicnickerBrookeBeatenText:
	text "Oh, jemig! Je bent" ; "Oh, my! You're so"
	line "echt sterk!" ; "strong!"
	done

PicnickerBrookeAfterBattleText:
	text "Ik kan meer op m'n" ; "I can count on my"
	line "#MON rekenen" ; "#MON more than"
	cont "dan mijn vriend." ; "my boyfriend."
	done

PicnickerKimSeenText:
	text "Ga je naar de GYM?" ; "Are you going to"
	line "Ik ook!" ; "the GYM? Me too!"
	done

PicnickerKimBeatenText:
	text "Oh. Ik kon niet" ; "Oh. I couldn't"
	line "winnen…" ; "win…"
	done

PicnickerKimAfterBattleText:
	text "De GYMBADGES zijn" ; "The GYM BADGES are"
	line "best mooi. Ik" ; "pretty. I collect"
	cont "verzamel zo." ; "them."
	done

BirdKeeperBryanSeenText:
	text "Wat voor BALLEN" ; "What kinds of"
	line "gebruik jij?" ; "BALLS do you use?"
	done

BirdKeeperBryanBeatenText:
	text "Jakkes! Niet snel" ; "Yikes! Not fast"
	line "genoeg!" ; "enough!"
	done

BirdKeeperBryanAfterBattleText:
	text "Sommige #MON" ; "Some #MON flee"
	line "vluchten meteen." ; "right away."

	para "Probeer ze te" ; "Try catching them"
	line "vangen met KURT's" ; "with KURT's FAST"
	cont "SNELLE BAL." ; "BALL."

	para "Als ik een WT.-" ; "Whenever I find a"
	line "ABRIKHORN vind," ; "WHT APRICORN, I"
	cont "gaat ie naar KURT." ; "take it to KURT."

	para "Hij maakt er een" ; "He turns it into a"
	line "speciale bal van." ; "custom BALL."
	done

JugglerIrwin1SeenText:
	text "Aanschouw mijn" ; "Behold my graceful"
	line "gracieuze BAL-" ; "BALL dexterity!"
	cont "behendigheid!"
	done

JugglerIrwin1BeatenText:
	text "Pfiew! Dat was een" ; "Whew! That was a"
	line "schok!" ; "jolt!"
	done

JugglerIrwinAfterBattleText:
	text "Ik wilde je ver-" ; "I was going to"
	line "blinden met mijn" ; "dazzle you with my"
	cont "winnende #MON." ; "prize #MON."

	para "Maar je dapperheid" ; "But your prowess"
	line "heeft me geschokt!" ; "electrified me!"
	done

BugCatcherArnieSeenText:
	text "Ik ga overal heen" ; "I'll go anywhere"
	line "waar insect-" ; "if bug #MON"
	cont "#MON zijn." ; "appear there."
	done

BugCatcherArnieBeatenText:
	text "Huh? Ik had niet" ; "Huh? I shouldn't"
	line "moet verliezen…" ; "have lost that…"
	done

BugCatcherArnieAfterBattleText:
	text "Mijn VENONAT won" ; "My VENONAT won me"
	line "het KEVERTOERNOOI" ; "the Bug-Catching"

	para "in het NATIONAAL" ; "Contest at the"
	line "PARK." ; "NATIONAL PARK."
	done

BugCatcherArnieYanmaText:
	text "Wauw… Kijk naar al" ; "Wow… Look at all"
	line "die YANMA!" ; "those YANMA!"

	para "Ik ben overweldigd" ; "I'm so blown away,"
	line "en van mijn stuk." ; "I can't move."
	done

FirebreatherWaltSeenText:
	text "Ik oefen met mijn" ; "I'm practicing my"
	line "vuurspuwen." ; "fire breathing."
	done

FirebreatherWaltBeatenText:
	text "Auw! Ik verbrandde" ; "Ow! I scorched the"
	line "mijn neustip!" ; "tip of my nose!"
	done

FirebreatherWaltAfterBattleText:
	text "De #MON-MARS op" ; "The #MON March"
	line "de radio lokt" ; "on the radio lures"
	cont "wilde #MON." ; "wild #MON."
	done

OfficerDirkSeenText:
	text "Gevaar loert in" ; "Danger lurks in"
	line "in de nacht!" ; "the night!"
	done

OfficerDirkBeatenText:
	text "Woeps!" ; "Whoops!"
	done

OfficerDirkAfterBattleText:
	text "Weet je, de nacht" ; "You know, night-"
	line "is leuk op zijn" ; "time is fun in its"
	cont "eigen manieren." ; "own ways."

	para "Maar ga niet te" ; "But don't overdo"
	line "ver, OK?" ; "it, OK?"
	done

OfficerDirkPrettyToughText:
	text "Je #MON zien er" ; "Your #MON look"
	line "best sterk uit." ; "pretty tough."

	para "Jij kan overal" ; "You could go any-"
	line "veilig komen." ; "where safely."
	done

Route35SignText:
	text "ROUTE 35"
	done

Route35_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 10, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  3,  5, ROUTE_35_NATIONAL_PARK_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, Route35Sign
	bg_event 11, 31, BGEVENT_READ, Route35Sign

	def_object_events
	object_event  4, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperIvan, -1
	object_event  8, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperElliot, -1
	object_event  7, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerBrooke, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerKim, -1
	object_event 14, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBirdKeeperBryan, -1
	object_event  2, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherWalt, -1
	object_event 16,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherArnie, -1
	object_event  5, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  5,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event  2, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35FruitTree, -1
	object_event 13, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route35TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
