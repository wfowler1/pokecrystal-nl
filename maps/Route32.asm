	object_const_def
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScripts:
	def_scene_scripts
	scene_script Route32Noop1Scene, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS
	scene_script Route32Noop2Scene, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script Route32Noop3Scene, SCENE_ROUTE32_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route32FriedaCallback

Route32Noop1Scene:
	end

Route32Noop2Scene:
	end

Route32Noop3Scene:
	end

Route32FriedaCallback:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.GoToSproutTower: ; unreferenced
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOOP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_QWILFISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
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
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd PokecenterSignScript

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Ho, wacht!" ; "Wait up!"
	line "Vanwaar die haast?" ; "What's the hurry?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, toch?" ; "<PLAYER>, right?"
	line "Een kerel met" ; "Some guy wearing"

	para "een bril op was" ; "glasses was look-"
	line "naar je op zoek." ; "ing for you."

	para "Kijk zelf maar." ; "See for yourself."
	line "Hij wacht op je" ; "He's waiting for"

	para "bij het #MON-" ; "you at the #MON"
	line "CENTRUM." ; "CENTER."
	done

Route32CooltrainerMText_UnusedSproutTower:
	text "Heb je SPROUT-" ; "Have you gone to"
	line "TOREN al bezocht?" ; "SPROUT TOWER?"

	para "Als je ooit VIOLET" ; "If you ever visit"
	line "CITY bezoekt," ; "VIOLET CITY, "

	para "verwachten ze dat" ; "they'll expect you"
	line "je daar traint." ; "to train there."

	para "Zo starten alle" ; "That's basic for"
	line "trainers. Ga naar" ; "trainers. Go to"
	cont "SPROUT-TOREN!" ; "SPROUT TOWER!"
	done

Route32CooltrainerMText_VioletGym:
	text "De #MON GYM" ; "Have you gone to"
	line "al bezocht?" ; "the #MON GYM?"

	para "Stel er je" ; "You can test your"
	line "#MON en jezelf" ; "#MON and your-"
	cont "op de proef." ; "self there."

	para "Het is een vuur-" ; "It's a rite of"
	line "doop voor de" ; "passage for all"
	cont "startende trainer!" ; "trainers!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "Je hebt een paar" ; "You have some good"
	line "sterke #MON." ; "#MON there."

	para "Dat is vast omdat" ; "It must be from"
	line "je veel hebt" ; "the training you"

	para "getraind rond" ; "gave them around"
	line "VIOLET CITY." ; "VIOLET CITY."

	para "Het trainen rond" ; "The training at"
	line "de GYM hielp vast" ; "the GYM must have"

	para "nog wel het" ; "been especially"
	line "meest." ; "helpful."

	para "Een souvenir" ; "As a souvenir of"
	line "uit VIOLET CITY," ; "VIOLET CITY, take"
	cont "voor jou." ; "this."

	para "Het versterkt de" ; "It increases the"
	line "kracht van gras-" ; "power of grass-"
	cont "aanvallen." ; "type moves."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Je ervaringen uit" ; "Your experiences"
	line "VIOLET CITY komen" ; "in VIOLET CITY"

	para "vast van pas op" ; "should be useful"
	line "je reis." ; "for your journey."
	done

Text_MillionDollarSlowpokeTail:
	text "Wil je deze" ; "How would you like"
	line "heerlijke voedzame" ; "to have this"

	para "SLOWPOKESTAART" ; "tasty, nutritious"
	line "van me kopen?" ; SLOWPOKETAIL?"

	para "Kost je maar" ; "For you right now,"
	line "¥1.000.000!" ; "just ¥1,000,000!"

	para "Echt een koopje!" ; "You'll want this!"
	done

Text_ThoughtKidsWereLoaded:
	text "Tch! Ik dacht dat" ; "Tch! I thought"
	line "kinderen van nu" ; "kids these days"
	cont "veel geld hadden…" ; "were loaded…"
	done

Text_RefusedToBuySlowpokeTail:
	text "Wil je 'm niet?" ; "You don't want it?"
	line "Ga weg dan. Ksst!" ; "Then scram. Shoo!"
	done

FisherJustinSeenText:
	text "Whoa!" ; "Whoa!"

	para "Door jou ben ik" ; "You made me lose"
	line "m'n vis verloren!" ; "that fish!"
	done

FisherJustinBeatenText:
	text "Plons!" ; "Sploosh!"
	done

FisherJustinAfterText:
	text "Kalm en helemaal" ; "Calm, collected…"
	line "zen… De essentie" ; "The essence of"

	para "van vissen en" ; "fishing and #-"
	line "#MON is gelijk." ; "MON is the same."
	done

FisherRalph1SeenText:
	text "Ik ben echt goed" ; "I'm really good at"
	line "in zowel vissen" ; "both fishing and"
	cont "als #MON." ; "#MON."

	para "Ik verlies echt" ; "I'm not about to"
	line "niet van een kind!" ; "lose to any kid!"
	done

FisherRalph1BeatenText:
	text "Tch! Ik wilde" ; "Tch! I tried to"
	line "weer te snel…" ; "rush things…"
	done

FisherRalphAfterText:
	text "Vissen? Een passie" ; "Fishing is a life-"
	line "voor het leven." ; "long passion."

	para "#MON? Vrienden" ; "#MON are life-"
	line "voor het leven!" ; "long friends!"
	done

FisherRalphSwarmText:
	text "Een, twee, drie…" ; "One, two, three…"
	line "Muahahaha, een" ; "Muahahaha, what a"

	para "flinke vangst! Ik" ; "great haul!"
	line "ben er klaar mee!" ; "I'm done! Go ahead"

	para "Vang zoveel als" ; "and catch as many"
	line "je kan, kind!" ; "as you can, kid!"
	done

Route32UnusedFisher1SeenText: ; unreferenced
	text "Ik vang telkens" ; "I keep catching"
	line "dezelfde #MON…" ; "the same #MON…"

	para "Misschien dat het" ; "Maybe a battle"
	line "na een gevecht" ; "will turn things"
	cont "beter gaat." ; "around for me."
	done

Route32UnusedFisher1BeatenText: ; unreferenced
	text "Ik heb ook" ; "Nothing ever goes"
	line "altijd pech…" ; "right for me now…"
	done

Route32UnusedFisher1AfterText: ; unreferenced
	text "Waarom vangt die" ; "How come the guy"
	line "kerel naast me wel" ; "next to me catches"
	cont "goede #MON?" ; "good #MON?"
	done

Route32UnusedFisher2SeenText: ; unreferenced
	text "Heh, ik ben lekker" ; "Heh, I'm on a roll"
	line "bezig vandaag." ; "today. How about a"
	cont "Vechten dan maar?" ; "battle, kid?"
	done

Route32UnusedFisher2BeatenText: ; unreferenced
	text "Oef. Deze keer" ; "Oof. I wasn't"
	line "had ik geen geluk." ; "lucky that time."
	done

Route32UnusedFisher2AfterText: ; unreferenced
	text "Je hebt een goede" ; "You have to have a"
	line "HENGEL nodig als" ; "good ROD if you"

	para "je goede #MON" ; "want to catch good"
	line "wil vangen." ; "#MON."
	done

FisherHenrySeenText:
	text "Mijn #MON?" ; "My #MON?"
	line "Vers gevangen!" ; "Freshly caught!"
	done

FisherHenryBeatenText:
	text "SPETTER?" ; "SPLASH?"
	done

FisherHenryAfterText:
	text "Vers gevangen" ; "Freshly caught"
	line "#MON zijn geen" ; "#MON are no"

	para "match voor goed" ; "match for properly"
	line "getrainde." ; "raised ones."
	done

YoungsterAlbertSeenText:
	text "Jou heb ik niet" ; "I haven't seen you"
	line "eerder gezien." ; "around before."

	para "Je vindt jezelf" ; "So you think you"
	line "wel stoer, zeker?" ; "are pretty tough?"
	done

YoungsterAlbertBeatenText:
	text "Jij bent sterk!" ; "You're strong!"
	done

YoungsterAlbertAfterText:
	text "Ik wil de beste" ; "I'm going to try"
	line "worden met mijn" ; "to be the best"
	cont "favorieten." ; "with my favorites."

	para "Niet met dezelfde" ; "I'm not using the"
	line "sterke #MON die" ; "same tough #MON"
	cont "iedereen heeft." ; "as everyone else."
	done

YoungsterGordonSeenText:
	text "In het gras vond" ; "I found some good"
	line "ik een paar" ; "#MON in the"
	cont "goede #MON!" ; "grass!"

	para "Daar red ik" ; "I think they'll do"
	line "het wel mee!" ; "it for me!"
	done

YoungsterGordonBeatenText:
	text "Verdorie. Ik dacht" ; "Darn. I thought I"
	line "dat ik kon winnen." ; "could win."
	done

YoungsterGordonAfterText:
	text "In het gras blijft" ; "The grass is full"
	line "vanalles plakken." ; "of clingy things."
	done

CamperRolandSeenText:
	text "Die blik…" ; "That glance…"
	line "Intrigeert me." ; "It's intriguing."
	done

CamperRolandBeatenText:
	text "Hmmm. Dit stelt" ; "Hmmm. This is"
	line "me teleur." ; "disappointing."
	done

CamperRolandAfterText:
	text "Vermijd oogcontact" ; "If you don't want"
	line "als je geen zin" ; "to battle, just"
	cont "hebt in vechten." ; "avoid eye contact."
	done

PicnickerLiz1SeenText:
	text "Uh-huh. Ja, en" ; "Uh-huh. Yeah, and"
	line "weet je…" ; "you know…"

	para "Pardon? Vechten?" ; "Pardon? Battle?"
	line "Ik ben aan de" ; "I'm on the phone."

	para "telefoon. Nou," ; "Oh, all right. But"
	line "vooruit dan, snel." ; "make it fast."
	done

PicnickerLiz1BeatenText:
	text "Oh! Ik moet van" ; "Oh! I've got to"
	line "mijn boosheid af!" ; "relieve my anger!"
	done

PicnickerLiz1AfterText:
	text "Het was net zo'n" ; "I was having a"
	line "leuk gesprek." ; "nice chat too."
	done

BirdKeeperPeterSeenText:
	text "Die BADGE! Die is" ; "That BADGE! It's"
	line "van VIOLET CITY!" ; "from VIOLET CITY!"

	para "Heb je FALKNER" ; "You beat FALKNER?"
	line "verslagen?"
	done

BirdKeeperPeterBeatenText:
	text "Ik ken mijn" ; "I know what my"
	line "zwakke plekken." ; "weaknesses are."
	done

BirdKeeperPeterAfterText:
	text "Ik zou weer moeten" ; "I should train"
	line "trainen in de GYM" ; again at the GYM"
	cont "in VIOLET CITY." ; "in VIOLET CITY."
	done

Route32UnusedText: ; unreferenced
	text "De vissers" ; "The fishermen"
	line "werden boos omdat" ; "yelled at me for"
	cont "ik ze stoorde…" ; "bugging them…"
	done

Text_RoarIntro:
	text "WROOOOAR!" ; "WROOOOAR!"
	line "ALS IK BRUL, RENT" ; "PEOPLE RUN WHEN I"

	para "IEDEREEN WEG. MAAR" ; "ROAR! BUT YOU"
	line "JIJ KWAM KIJKEN!" ; "CAME LOOKING!"

	para "WORD IK BLIJ VAN!" ; "THAT PLEASES ME!"
	line "HIER, HOU VAST!" ; "NOW TAKE THIS!"
	done

Text_RoarOutro:
	text "WROOOAR!" ; "WROOOAR!"
	line "HET IS BRUL!" ; "IT'S ROAR!"

	para "ZELFS #MON" ; "EVEN #MON RUN"
	line "VLUCHTEN ERVOOR!" ; "FROM A GOOD ROAR!"
	done

MeetFriedaText:
	text "FRIEDA: Jahoe!" ; "FRIEDA: Yahoo!"
	line "Het is vrijdag!" ; "It's Friday!"

	para "Ik ben Vrijdagse" ; "I'm FRIEDA of"
	line "FRIEDA!" ; "Friday!"

	para "Leuke ontmoeting!" ; "Nice to meet you!"
	done

FriedaGivesGiftText:
	text "GIFSTEKEL, mag je" ; "Here's a POISON"
	line "van me hebben!" ; "BARB for you!"
	done

FriedaGaveGiftText:
	text "FRIEDA: Geef het" ; "FRIEDA: Give it to"
	line "aan een #MON" ; "a #MON that has"
	cont "met gif-aanvallen." ; "poison-type moves."

	para "Oh!" ; "Oh!"

	para "Echt heel gemeen!" ; "It's wicked!"

	para "Het zal je ver-" ; "You'll be shocked"
	line "bazen hoe sterk" ; how good it makes"
	cont "gif er van wordt!" ; "poison moves!"
	done

FriedaFridayText:
	text "FRIEDA: Hoi! Welke" ; "FRIEDA: Hiya! What"
	line "dag vind je leuk?" ; "day do you like?"

	para "Vrijdag is zeker" ; "I love Friday. No"
	line "mijn favoriet!" ; "doubt about it!"

	para "Hou jij er ook" ; "Don't you think"
	line "zoveel van?" ; "it's great too?"
	done

FriedaNotFridayText:
	text "FRIEDA: Is vandaag" ; "FRIEDA: Isn't it"
	line "niet vrijdag?" ; "Friday today?"

	para "Echt saai als" ; "It's so boring"
	line "dat het niet is!" ; "when it's not!"
	done

Route32SignText:
	text "ROUTE 32" ; "ROUTE 32"

	para "VIOLET CITY -" ; "VIOLET CITY -"
	line "AZALEA TOWN" ; "AZALEA TOWN"
	done

Route32RuinsSignText:
	text "RUÏNES VAN ALF" ; "RUINS OF ALPH"
	line "OOSTELIJKE INGANG" ; "EAST ENTRANCE"
	done

Route32UnionCaveSignText:
	text "EENHEIDSTUNNEL" ; "UNION CAVE"
	line "NABIJ" ; "AHEAD"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	def_coord_events
	coord_event 18,  8, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	def_bg_events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	def_object_events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
