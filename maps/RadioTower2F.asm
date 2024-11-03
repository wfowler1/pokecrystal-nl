DEF BLUE_CARD_POINT_CAP EQU 30

	object_const_def
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower2FNoopScene: ; unreferenced
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless NITE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	promptbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd MagazineBookshelfScript

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "Je kan overal" ; "You can listen to"
	line "naar de radio" ; "the radio any-"
	cont "luisteren." ; "where. Tune in!"
	done

RadioTower2FTeacherText:
	text "Slaapliedjes op" ; "Lullabies on the"
	line "de radio kunnen" ; "radio may make"
	cont "#MON laten slapen." ; "#MON sleep."
	done

RadioTower2FTeacherText_Rockets:
	text "Waarom zouden ze" ; "Why would they"
	line "de RADIOTOREN" ; "want to take over"
	cont "willen overnemen?" ; "the RADIO TOWER?"
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "Sorry. Alleen ge-" ; "Sorry. Authorized"
	line "authoriseerd per-" ; "personnel only"
	cont "soneel hier." ; "beyond this point."

	para "Dat was eerst" ; "It wasn't that way"
	line "anders." ; "before."

	para "Er is iets mis" ; "There's something"
	line "met de" ; "wrong with the"
	cont "DIRECTEUR…" ; "DIRECTOR…"
	done

RadioTower2FBlackBelt2Text:
	text "Kijk gerust" ; "Feel free to look"
	line "overal rond." ; "around anywhere."

	para "De DIRECTEUR is" ; "The DIRECTOR is"
	line "weer aardig, net" ; "nice again, just"
	cont "als eerst." ; "as he was before."
	done

GruntM4SeenText:
	text "Drie jaar geleden" ; "Three years ago,"
	line "moest TEAM ROCKET" ; "TEAM ROCKET was"
	cont "ontbinden." ; "forced to disband."

	para "Maar we maken hier" ; "But we're making a"
	line "een terugkeer!" ; "comeback here!"
	done

GruntM4BeatenText:
	text "Hè gèt!" ; "Gwah! Don't get"
	line "Kappen nou!" ; "cute!"
	done

GruntM4AfterBattleText:
	text "We laten je niet" ; "We won't let you"
	line "onze terugkeer" ; "ruin our plans"
	cont "dwarsbomen!" ; "for our comeback!"
	done

GruntM5SeenText:
	text "Wij zijn TEAM" ; "We're TEAM ROCKET,"
	line "ROCKET, de uit-" ; "the exploiters of"
	cont "buiters van #MON!"

	para "We zijn graag" ; "We love being"
	line "kwaadaardig! Bang?" ; "evil! Scared?"
	done

GruntM5BeatenText:
	text "Denk je dat je" ; "You think you're a"
	line "een held bent?" ; "hero?"
	done

GruntM5AfterBattleText:
	text "We zijn niet altijd" ; "We're not always"
	line "slecht. We doen" ; "evil. We just do"
	cont "gewoon wat we" ; "whatever we like."
	cont "willen." ;
	done

GruntM6SeenText:
	text "Hé, hé!" ; "Hey, hey! Keep out"
	line "Uit de weg!" ; "of our way!"
	done

GruntM6BeatenText:
	text "Arggh. Ik geef op." ; "Arggh. I give up."
	done

GruntM6AfterBattleText:
	text "Onze MANAGERS pro-" ; "Our EXECUTIVES are"
	line "beren deze plek" ; "trying to take"
	cont "over te nemen." ; "this place over."

	para "Ze hebben een of" ; "They have some big"
	line "ander groot plan." ; "plan. I wonder"
	cont "Wat zou 't zijn?" ; "what that is?"
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Saai." ; "How boring."
	line "Het was veel te" ; "It was far too"

	para "makkelijk om deze" ; "easy to take over"
	line "plek over te nemen!" ; "this place!"

	para "Kom, vermaak" ; "Come on, keep me"
	line "me een beetje!" ; "amused!"
	done

GruntF2BeatenText:
	text "W-wie ben je?" ; "Wh-who are you?"
	done

GruntF2AfterBattleText:
	text "Je hebt me ver-" ; "You beat me, and"
	line "slagen, dat ver-" ; "I won't forget it!"
	cont "geet ik niet!" ;
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Hoi! Ik ben" ; "BUENA: Hi! I'm"
	line "BUENA!"

	para "Ken je het" ; "Do you know about"
	line "radioprogramma" ; "a radio program"
	cont "WACHTWOORD?" ; "called PASSWORD?"

	para "Als je een" ; "If you can tell me"
	line "wachtwoord uit 't" ; "the password from"

	para "programma kan" ; "the program, you"
	line "noemen, krijg je" ; "will earn points."

	para "punten. Spaar die" ; "Save up those"
	line "punten en ruil ze" ; "points and trade"

	para "met die lieve dame" ; "them to that sweet"
	line "daar ginds" ; "young lady over"

	para "voor een" ; "there for some"
	line "aantal prijzen!" ; "choice prizes!"

	para "Alsjeblieft!" ; "Here you go!"

	para "Het is je eigen" ; "It's your very own"
	line "puntenkaart!" ; "point card!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: Luister" ; "BUENA: Tune in to"
	line "de WACHTWOORDSHOW!" ; "my PASSWORD SHOW!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Hoi! Heb" ; "BUENA: Hi!"
	line "je naar mijn radio-" ; "Did you tune in to"
	cont "show geluisterd?" ; "my radio show?"

	para "Weet je het wacht-" ; "Do you remember"
	line "woord van vandaag?" ; "today's password?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Oh, wauw!" ; "BUENA: Oh, wow!"
	line "Dank je!" ; "Thank you!"

	para "Wat was je naam" ; "What was your name"
	line "ook alweer?" ; "again?"

	para "…<PLAY_G>, oké!" ; "…<PLAY_G>, OK!"

	para "Kom, <PLAY_G>." ; "Come on, <PLAY_G>."
	line "Doe mee." ; "Join the show."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Iedereen" ; "BUENA: Everyone"
	line "klaar?" ; "ready?"

	para "Ik wil van jullie" ; "I want to hear you"
	line "het wachtwoord van" ; "shout out today's"

	para "vandaag horen voor" ; "password for"
	line "<PLAY_G>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Kom terug" ; "BUENA: Come back"
	line "als je naar m'n" ; "after you listen"

	para "show hebt geluis-" ; "to my show, OK?"
	line "terd, oké? Tot" ; "Catch ya later!"
	cont "later!" ;
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Sorry…"

	para "Je krijgt maar" ; "You get just one"
	line "één kans per dag." ; "chance each day."

	para "Kom morgen terug" ; "Come back tomorrow"
	line "voor nog 'n keer!" ; "for another try!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: JIPPIE!" ; "BUENA: YIPPEE!"
	line "Dat klopt!" ; "That's right!"

	para "Je luisterde!" ; "You did tune in!"
	line "Ik ben zo blij!" ; "I'm so happy!"

	para "Je hebt één punt" ; "You earned one"
	line "verdiend! Bravo!" ; "point! Congrats!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Aww…"
	line "Dat is 'm niet…" ; "That's not it…"

	para "Ben je het wacht-" ; "Did you forget the"
	line "woord vergeten?" ; "password?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Ja! Onze" ; "BUENA: Yup! Our"
	line "deelnemer was" ; "contestant was"

	para "<PLAY_G>."
	line "Bedankt voor je" ; "Thanks for coming!"

	para "komst! Ik hoop" ; "I hope all you"
	line "dat alle luister-" ; "listeners will"

	para "aars ook komen!" ; "come too!"
	line "Ik wacht erop!" ; "I'll be waiting!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: Huh?" ; "BUENA: Huh?"
	line "Het wachtwoord" ; "Today's password?"
	cont "van vandaag?" ;

	para "HELP, natuurlijk!" ; "HELP, of course!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: Je BLAUWE" ; "BUENA: Your BLUE"
	line "KAART is vol." ; "CARD's full."

	para "Ruil het in voor" ; "Trade it in for a"
	line "een mooie prijs!" ; "fabulous prize!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Luister" ; "BUENA: Tune in to"
	line "naar WACHTWOORD" ; "PASSWORD every"

	para "elke avond van" ; "night from six to"
	line "zes tot twaalf!" ; "midnight!"

	para "Luister, en kom" ; "Tune in, then drop"
	line "dan langs!" ; "in for a visit!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Oh? Je" ; "BUENA: Oh? You"
	line "bent je BLAUWE" ; "forgot to bring"
	cont "KAART vergeten?" ; "your BLUE CARD?"

	para "Ik kan je geen" ; "I can't give you"
	line "punten geven als" ; "points if you"
	cont "je 't niet hebt." ; "don't have it."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Oh! Je" ; "BUENA: Oh! Your"
	line "BLAUWE KAART heeft" ; "BLUE CARD reached"

	para "{d:BLUE_CARD_POINT_CAP} punten" ; "{d:BLUE_CARD_POINT_CAP} points today!"
	line "vandaag! Waanzinnig!" ; "That's so wild!"

	para "Hmm… Er is geen" ; "Hmm… There isn't a"
	line "prijs voor" ; "prize for hitting"
	cont "{d:BLUE_CARD_POINT_CAP} punten, maar…" ; "{d:BLUE_CARD_POINT_CAP} points, but…"

	para "Je kwam zo vaak" ; "You came by so"
	line "langs, <PLAY_G>." ; "often, <PLAY_G>."

	para "Ik geef je een" ; "I'll make you a"
	line "speciale deal!" ; "special deal!"

	para "Wil je mijn" ; "How would you like"
	line "telefoonnummer?" ; "my phone number?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "wil je mijn" ; "do you want to"

	para "telefoonnummer" ; "register my phone"
	line "registreren?" ; "number?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> regis-" ; "<PLAYER> registered"
	line "treerde BUENA's" ; "BUENA's number."
	cont "nummer." ;
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: Ik kijk" ; "BUENA: I look"
	line "ernaar uit om" ; "forward to hearing"
	cont "van je te horen!" ; "from you!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA: Aww… Het is" ; "BUENA: Aww… It's a"
	line "'n speciale prijs…" ; "special prize…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>,"
	line "je telefoonlijst" ; "your phone list"

	para "heeft geen ruimte" ; "has no room left"
	line "over voor me…" ; "for me…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "Je kan je ge-" ; "You can cash in"
	line "spaarde punten" ; "your saved points"

	para "inzetten voor" ; "for a lovely prize"
	line "een leuke prijs" ; "of your choice!"
	cont "naar keuze!" ;
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "Je kan geen punt-" ; "You can't trade in"
	line "en inruilen zon-" ; "points without"
	cont "der je BLAUWE" ; "your BLUE CARD."
	cont "KAART." ;

	para "Vergeet je BLAUWE" ; "Don't forget your"
	line "KAART niet!" ; "BLUE CARD!"
	done

RadioTower2FSalesSignText:
	text "2V SALES" ; "2F SALES"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF.OAK'S" ; "PROF.OAK'S #MON"
	line "#MONPRAAT" ; "TALK"

	para "De meest spraak-" ; "The Hottest Show"
	line "makende show" ; "on the Air!"
	cont "in de ether!" ;
	done

RadioTower2FPokemonRadioSignText:
	text "Overal, Altijd" ; "Anywhere, Anytime"
	line "#MON-Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	def_object_events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
