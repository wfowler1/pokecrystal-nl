	object_const_def
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN

RadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	promptbutton
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManThisWeeksIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	promptbutton
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	promptbutton
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	promptbutton
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	promptbutton
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	end

.RadioCardText:
	db "RADIOKAART@" ; "RADIO CARD@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

RadioTower1FLuckyNumberManGoToPCMovement:
	step RIGHT
	turn_head UP
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step LEFT
	turn_head UP
	step_end

RadioTower1FReceptionistWelcomeText:
	text "Welkom!" ; "Welcome!"
	done

RadioTower1FReceptionistNoToursText:
	text "Hallo. Sorry," ; "Hello. I'm sorry,"
	line "maar we bieden" ; "but we're not"
	cont "vandaag geen" ; "offering any tours"
	cont "tours aan." ; "today."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Hoi, ben je hier" ; "Hi, are you here"
	line "voor de GELUKS-" ; "for the LUCKY NUM-"
	cont "NUMMER SHOW?" ; "BER SHOW?"

	para "Zal ik de ID-" ; "Want me to check"
	line "nummers van je" ; "the ID numbers of"
	cont "#MON checken?" ; "your #MON?"

	para "Als je geluk hebt," ; "If you get lucky,"
	line "win je een prijs." ; "you win a prize."
	done

RadioTower1FLuckyNumberManThisWeeksIdIsText:
	text "Het ID-nummer van" ; "This week's ID"
	line "deze week" ; "number is @"
	cont "is @" ;
	text_ram wStringBuffer3 ; MaxLength 5
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Eens zien of je" ; "Let's see if you"
	line "een match hebt." ; "have a match."
	done

RadioTower1FLuckyNumberManDotDotDotText:
	text "<……>"
	line "<……>"
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "Kom volgende" ; "Please come back"
	line "week terug voor" ; "next week for the"
	cont "het volgende" ; "next LUCKY NUMBER."
	cont "GELUKSNUMMER." ; 
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "Wow! Je hebt een" ; "Wow! You have a"
	line "perfecte match" ; "perfect match of"
	cont "met alle vijf" ; "all five numbers!"
	cont "nummers!" ; 

	para "We hebben een" ; "We have a grand"
	line "hoofdprijswinnaar!" ; "prize winner!"

	para "Je hebt een" ; "You have won a"
	line "MEESTERBAL" ; "MASTER BALL!"
	cont "gewonnen!" ; 
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "Hé! Je hebt een" ; "Hey! You've"
	line "match met de laat-" ; "matched the last"
	cont "ste drie nummers!" ; "three numbers!"

	para "Je hebt de tweede" ; "You've won second"
	line "prijs, een EP-" ; "prize, an EXP."
	cont "DELER, gewonnen!" ; "SHARE!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "Ooh, je hebt een" ; "Ooh, you've"
	line "match met de laat-" ; "matched the last"
	cont "ste twee nummers." ; "two numbers."

	para "Je hebt de derde" ; "You've won third"
	line "prijs, een AP-" ; "prize, a PP UP."
	cont "PLUS, gewonnen!" ; 
	done

RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "Helaas, geen van" ; "Nope, none of your"
	line "je ID-nummers" ; "ID numbers match."
	cont "matchen." ; 
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "Je hebt geen" ; "You've got no room"
	line "plek voor je" ; "for your prize."

	para "prijs. Maak plek" ; "Make room and come"
	line "snel plek en kom" ; "back right away."
	cont "terug." ;
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "We hebben een" ; "We have a special"
	line "speciale quiz-" ; "quiz campaign on"
	cont "campagne nu." ; "right now."

	para "Beantwoord vijf" ; "Answer five ques-"
	line "vragen juist en" ; "tions correctly to"
	cont "win 'n RADIOKAART." ; "win a RADIO CARD."

	para "Schuif het in je" ; "Slide it into your"
	line "#GEAR om overal" ; "#GEAR to play"

	para "radio te" ; "the radio anytime,"
	line "luisteren." ; "anywhere."

	para "Wil je de" ; "Would you like to"
	line "quiz doen?" ; "take the quiz?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Vraag 1:" ; "Question 1:"

	para "Is er een #MON" ; "Is there a #MON"
	line "die alleen 's" ; "that appears only"
	cont "ochtends te" ; "in the morning?"
	cont "vinden is?" ;
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "Correct!" ; "Correct!"
	line "Vraag 2:" ; "Question 2:"

	para "Klopt deze" ; "Is this statement"
	line "zin?" ; "correct?"

	para "Je kan geen BES" ; "You can't buy a"
	line "in de MARKT kopen." ; "BERRY at a MART."
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "Klopt!" ; "Bull's-eye!"
	line "Vraag 3:" ; "Question 3:"

	para "Bevat VM01 de" ; "Does HM01 contain"
	line "aanval FLITS?" ; "the move FLASH?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "Goed op weg!" ; "So far so good!"
	line "Vraag 4:" ; "Question 4:"

	para "Is FALKNER de" ; "Is FALKNER the"
	line "VIOLET-GYMLEIDER" ; "VIOLET GYM LEADER"

	para "die vogel-" ; "who uses bird"
	line "#MON gebruikt?" ; "#MON?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "Wow! Weer goed!" ; "Wow! Right again!"
	line "Hier is de" ; "Here's the final"
	cont "laatste vraag:" ; "question:"

	para "Hebben de spel-" ; "Do GOLDENROD GAME"
	line "automaten van GOL-" ; "CORNER's slots"

	para "DENROD-SPELHOEK" ; "have CHARMANDER"
	line "CHARMANDER op" ; "on their reels?"
	cont "de rollen?" ; 
	done

RadioTower1FRadioCardWomanYouWinText:
	text "Bingo! Je hebt" ; "Bingo! You got it!"
	line "'t! Gefeliciteerd!" ; "Congratulations!"

	para "Hier is je prijs," ; "Here's your prize,"
	line "een RADIOKAART!" ; "a RADIO CARD!"
	done

RadioTower1FPokegearIsARadioText:
	text "<PLAYER>'s #GEAR" ; "<PLAYER>'s #GEAR"
	line "kan nu als radio" ; "can now double as"
	cont "functioneren!" ; "a radio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Luister naar onze" ; "Please tune in to"
	line "radioprogramma's!" ; "our radio shows."
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "Oh, jeetje." ; "Oh, dear."
	line "Sorry, maar je" ; "Sorry, but you"

	para "hebt het mis." ; "got it wrong."
	line "Probeer 't" ; "Please try again!"
	cont "nog eens!" ;
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Oh, oké. Kom terug" ; "Oh. I see. Please"
	line "als je van ge-" ; "see me if you"
	cont "dachten verandert." ; "change your mind."
	done

RadioTower1FLassText:
	text "BEN is een" ; "BEN is a fabulous"
	line "geweldige DJ." ; "DJ."

	para "Zijn zwoele stem" ; "His sweet voice"
	line "doet me smelten!" ; "makes me melt!"
	done

RadioTower1FYoungsterText:
	text "Ik hou van MARY," ; "I love MARY, from"
	line "van #MONPRAAT." ; "#MON TALK."

	para "Maar ik weet" ; "I only know what"
	line "alleen hoe ze" ; "she sounds like,"
	cont "klinkt." ; "though."
	done

GruntM3SeenText:
	text "We hebben ein-" ; "We've finally"
	line "delijk de RADIO-" ; "taken over the"
	cont "TOREN overgenomen!" ; "RADIO TOWER!"

	para "Nu zal iedereen" ; "Now everyone will"
	line "de echte terreur" ; "get to experience"

	para "van TEAM ROCKET" ; "the true terror of"
	line "leren kennen!" ; "TEAM ROCKET!"

	para "We laten je zien" ; "We'll show you"
	line "hoe eng we zijn!" ; "how scary we are!"
	done

GruntM3BeatenText:
	text "Te sterk! We hou-" ; "Too strong! We"
	line "den je in de" ; "must watch you…"
	cont "gaten…" ;
	done

GruntM3AfterBattleText:
	text "Je bent te sterk." ; "You're too strong."

	para "Ons plan kan in" ; "Our plan could be"
	line "duigen vallen. Ik" ; "ruined. I must"
	cont "moet de anderen" ; "warn the others…"
	cont "waarschuwen…" ;
	done

RadioTower1FDirectoryText:
	text "1V RECEPTIE" ; "1F RECEPTION"
	line "2V SALES" ; "2F SALES"

	para "3V PERSONEEL" ; "3F PERSONNEL"
	line "4V PRODUCTIE" ; "4F PRODUCTION"

	para "5V KANTOOR" ; "5F DIRECTOR'S"
	line "VAN DIRECTEUR" ; "   OFFICE"
	done

RadioTower1FLuckyChannelSignText:
	text "GELUKSZENDER!" ; "LUCKY CHANNEL!"

	para "Win met #MON" ; "Win with #MON"
	line "ID-nummers!" ; "ID numbers!"

	para "Ruil je #MON" ; "Trade your #MON"
	line "om verschillende" ; "to collect differ-"
	cont "ID-nummers te" ; "ent ID numbers!"
	cont "verzamelen!" ;
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	def_object_events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS
