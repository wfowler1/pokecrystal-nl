_OakText6::
	text "Oké, wat was ook"
	line "alweer je naam?"
	prompt

_OakText7::
	text "<PLAYER>, ben je"
	line "er klaar voor?"

	para "Jouw #MON-"
	line "verhaal gaat"
	cont "nu beginnen."

	para "Er volgen leuke"
	line "dingen en lastige"
	cont "uitdagingen."

	para "Een wereld vol"
	line "dromen en avontuur"

	para "met #MON"
	line "wacht op je! Kom!"

	para "Ik zie je later"
	line "weer!"
	done

_ClockTimeMayBeWrongText::
	text "Wellicht staat de"
	line "klok verkeerd."

	para "Stel de tijd"
	line "opnieuw in."
	prompt

_ClockSetWithControlPadText::
	text "Stel in met de"
	line "richtingstoetsen."

	para "Bevestig: A-knop"
	line "Annuleer:  B-knop"
	done

_ClockIsThisOKText::
	text "Is dit OK?"
	done

_ClockHasResetText::
	text "De klok is"
	line "gereset."
	done

_LinkTimeoutText::
	text "Er is teveel tijd"
	line "gepasseerd. Pro-"
	cont "beer nog eens."
	prompt

_LinkTradeCantBattleText::
	text "Als je die #MON"
	line "ruilt, kun je niet"
	cont "vechten."
	prompt

_LinkAbnormalMonText::
	text "De"
	line "@"
	text_ram wStringBuffer1
	text " van je vriend"
	cont "is abnormaal!"
	prompt

_LinkAskTradeForText::
	text "Ruil @"
	text_ram wBufferTrademonNickname
	text_start
	line "voor @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "Voor een mobiel"
	line "gevecht moet je"

	para "een team van drie"
	line "#MON kiezen."

	para "Is dat goed?"
	done

_MobileBattleMoreInfoText::
	text "Wil je meer info"
	line "over gevechten?"
	done

_MobileBattleRulesText::
	text "Bij een gevecht"
	line "selecteer je"
	cont "drie #MON."

	para "De maximum speel-"
	line "tijd is tien"

	para "minuten voor elke"
	line "gelinkte speler."

	para "Duurt een gevecht"
	line "te lang, dan wint"

	para "de speler met de"
	line "meeste resterende"

	para "#MON in "
	line "het team."

	para "Bij gelijkspel"
	line "wint het team dat"

	para "het minste schade"
	line "kreeg."
	done

_WouldYouLikeToMobileBattleText::
	text "De resterende tijd"
	line "vandaag is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Wil je gaan"
	line "vechten?"
	done

_WantAQuickMobileBattleText::
	text "Er zijn nog maar @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. over vandaag."

	para "Wil je een snel"
	line "gevecht?"
	done

_WantToRushThroughAMobileBattleText::
	text "Er is vandaag nog"
	line "1 minuut over!"

	para "Wil je haastend"
	line "de strijd aan?"
	done

_PleaseTryAgainTomorrowText::
	text "Er is nog minder"
	line "dan een minuut!"

	para "Probeer morgen"
	line "nog eens."
	done

_TryAgainUsingSameSettingsText::
	text "Opnieuw met zelf-"
	line "de instellingen?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "Minder dan 1 min."
	line "over vandaag!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "Geen tijd om van-"
	line "daag te linken."
	done

_PickThreeMonForMobileBattleText::
	text "Kies drie #MON"
	line "voor gevecht."
	done

_MobileBattleRemainingTimeText::
	text "Resterende tijd"
	line "vandaag is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

_WouldYouLikeToSaveTheGameText::
	text "Wil je de game"
	line "opslaan?"
	done

_SavingDontTurnOffThePowerText::
	text "OPSLAAN… NIET"
	line "UITSCHAKELEN."
	done

_SavedTheGameText::
	text "<PLAYER> sloeg"
	line "het spel op."
	done

_AlreadyASaveFileText::
	text "Er is al een op-"
	line "slagbestand. OK om"
	cont "te overschrijven?"
	done

_AnotherSaveFileText::
	text "Er is al een op-"
	line "slagbestand. OK om"
	cont "te overschrijven??"
	done

_SaveFileCorruptedText::
	text "Opslagbestand is"
	line "is gecorrumpeerd!"
	prompt

_ChangeBoxSaveText::
	text "Als je wisselt van"
	line "#MON-BOX wordt"
	cont "data bewaard. OK?"
	done

_MoveMonWOMailSaveText::
	text "Als je een #MON"
	line "verplaatst, wordt"
	cont "opgeslagen. OK?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "'Window save area'"
	line "overschreden."
	done

_WindowPoppingErrorText::
	text "Geen vensters be-"
	line "schikbaar voor pops"
	done

_CorruptedEventText:: ; unreferenced
	text "Corrupt evenement!"
	prompt

_ObjectEventText::
	text "Object-evenement"
	done

_BGEventText::
	text "BG-evenement"
	done

_CoordinatesEventText::
	text "Coordineert event"
	done

_ReceivedItemText::
	text "<PLAYER> ontving"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> stopt de"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "de @"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "De @"
	text_ram wStringBuffer3
	text_start
	line "is vol…"
	prompt

_SeerSeeAllText::
	text "Ik zie alles."
	line "Ik weet alles…"

	para "Uiteraard weet ik"
	line "van jouw #MON!"
	done

_SeerCantTellAThingText::
	text "Waaaaat? Ik kan"
	line "niks zeggen!"

	para "Hoe kan ik hier"
	line "niks van weten?"
	done

_SeerNameLocationText::
	text "Hm… Ik zie dat je"
	line "@"
	text_ram wSeerNickname
	text " hier zag:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "De tijd was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Het level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Ik ben goed he?"
	prompt

_SeerTradeText::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "kwam van @"
	text_ram wSeerOT
	text_start
	cont "bij een ruil?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was waar @"
	text_ram wSeerOT
	text_start
	text_ram wSeerNickname
	text "ontmoette !"
	prompt

_SeerNoLocationText::
	text "Wat!? Bizar!"

	para "Ik snap niet hoe"
	line "maar het is"

	para "onvoorstelbaar!"
	line "Jij bent speciaal."

	para "Ik weet niet waar"
	line "je het ontmoette,"
	cont "maar 't was level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Ik ben goed he?"
	prompt

_SeerEggText::
	text "He!"

	para "Dat is een EGG!"

	para "Strikt gezien heb"
	line "die niet ontmoet…"
	done

_SeerDoNothingText::
	text "Fufufu! Ik zag dat"
	line "je niks zou doen!"
	done

_SeerMoreCareText::
	text "Incidenteel…"

	para "Het zou wijs zijn"
	line "je #MON met wat"

	para "meer zorg op te"
	line "voeden."
	done

_SeerMoreConfidentText::
	text "Incidenteel…"

	para "Het is een klein"
	line "beetje geroeid."

	para "@"
	text_ram wSeerNickname
	text " lijkt"
	line "meer vertrouwen te"
	cont "krijgen."
	done

_SeerMuchStrengthText::
	text "Incidenteel…"

	para "@"
	text_ram wSeerNickname
	text " is"
	line "gegroeid en nu"
	cont "veel sterker."
	done

_SeerMightyText::
	text "Incidenteel…"

	para "Het is een machtig"
	line "wezen geworden!"

	para "Deze @"
	text_ram wSeerNickname
	text_start
	line "heeft vele ge-"

	para "gevechten gestre-"
	line "den."

	para "Het zelfvertrouwen"
	line "straalt er van af."
	done

_SeerImpressedText::
	text "Incidenteel…"

	para "Je toewijding is"
	line "indrukwekkend."

	para "Het is lang sinds"
	line "ik een #MON zag"

	para "die zo machtig"
	line "was"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "Iedereen zou"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "graag in een ge-"
	line "vecht zien."
	done

_CongratulationsYourPokemonText::
	text "Gefeliciteerd!"
	line "Je @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "evolueerde in"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopte de evolutie!"
	prompt

_EvolvingText::
	text "Wat? @"
	text_ram wStringBuffer2
	text_start
	line "evolueert!"
	done

_MartHowManyText::
	text "Hoeveel?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "is dan ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hallo, schat."

	para "Ik heb goedkope"
	line "kruidenmedicijnen."

	para "Ze werken goed,"
	line "maar zijn bitter."

	para "Je #MON vindt ze"
	line "wellicht vies."

	para "Hehehehe…"
	done

_HerbalLadyHowManyText::
	text "Hoeveel?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "is dan ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Dankje, schat."
	line "Hehehehe…"
	done

_HerbalLadyPackFullText::
	text "Oh? Je TAS is"
	line "vol, schat."
	done

_HerbalLadyNoMoneyText::
	text "Hehehe… Je hebt"
	line "niet genoeg geld."
	done

_HerbalLadyComeAgainText::
	text "Tot snel, schat."
	line "Hehehehe…"
	done

_BargainShopIntroText::
	text "Hoihoi! Wil je wat"
	line "koopjes zien?"

	para "Ik heb zeldzaam"
	line "spul dat je ner-"

	para "gens vindt--maar"
	line "eentje van elk."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " kost"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Wil je het?"
	done

_BargainShopThanksText::
	text "Bedankt."
	done

_BargainShopPackFullText::
	text "Uh-oh, je TAS"
	line "zit tjokvol."
	done

_BargainShopSoldOutText::
	text "Je hebt dat al"
	line "gekocht. Ik hebl"
	cont "niet meer."
	done

_BargainShopNoFundsText::
	text "Uh-oh, je heb te"
	line "weinig geld."
	done

_BargainShopComeAgainText::
	text "Kom nog eens"
	line "langs."
	done

_PharmacyIntroText::
	text "Wat is er? Heb je"
	line "medicijnen nodig?"
	done

_PharmacyHowManyText::
	text "Hoeveel?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "kost je ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Veel dank!"
	done

_PharmacyPackFullText::
	text "Je hebt geen plek"
	line "meer."
	done

_PharmacyNoMoneyText::
	text "Huh? Dat is te"
	line "weinig geld."
	done

_PharmacyComeAgainText::
	text "Oke."
	line "Tot later weer."
	done

_NothingToSellText::
	text "Je hebt niks om te"
	line "verkopen."
	prompt

_MartSellHowManyText::
	text "Hoeveel?"
	done

_MartSellPriceText::
	text "Ik kan je"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text " betalen."

	para "Is dat OK?"
	done

_MartWelcomeText::
	text "Welkom! Hoe kan ik"
	line "je helpen?"
	done

_MartThanksText::
	text "Hier is het."
	line "Dankjewel!"
	done

_MartNoMoneyText::
	text "Je hebt te weinig"
	line "geld."
	done

_MartPackFullText::
	text "Je kunt geen spul-"
	line "len meer dragen."
	done

_MartCantBuyText::
	text "Sorry, dat kan ik"
	line "niet van je kopen."
	prompt

_MartComeAgainText::
	text "Kom snel weer!"
	done

_MartAskMoreText::
	text "Kan ik nog iets"
	line "voor je doen?"
	done

_MartBoughtText::
	text "Heb ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " voor"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	done

_SlotsBetHowManyCoinsText::
	text "Hoeveel munten"
	line "wedden?"
	done

_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Te weinig"
	line "munten."
	prompt

_SlotsRanOutOfCoinsText::
	text "Verdorie… Geen"
	line "munten meer…"
	done

_SlotsPlayAgainText::
	text "Weer spelen?"
	done

_SlotsLinedUpText::
	text "op een rij!"
	line "Won @"
	text_ram wStringBuffer2
	text " munten!"
	done

_SlotsDarnText::
	text "Verdorie!"
	done

_MobileStadiumEntryText::
	text "Data voor gebruik"
	line "in MOBILE STADIUM"

	para "van #MON"
	line "STADIUM 2 kan hier"
	cont "worden gelezen."

	para "Lees de data?"
	done

_MobileStadiumSuccessText::
	text "Dataverplaatsing"
	line "voltooid."

	para "Veel plezier met"
	line "MOBILE STADIUM"

	para "gevechten in"
	line "#MON STADIUM 2."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Kloktijd onbekend"
	done

_DeleteSavedLoginPasswordText::
	text "Wis opgeslagen"
	line "LOG-IN WACHTWOORD?"
	done

_DeletedTheLoginPasswordText::
	text "LOG-IN WACHTWOORD"
	line "gewist."
	done

_MobilePickThreeMonForBattleText::
	text "Kies drie #MON"
	line "voor gevecht."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " en"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Gebruik deze drie?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Plek voor maar"
	line "drie #MON."
	prompt

_MobileCardFolderIntro1Text::
	text "De KAARTMAP"
	line "bewaart KAARTEN"

	para "afkomstig van je"
	line "vrienden."

	para "Een KAART bevat"
	line "informatie zoals"

	para "een naam, tele-,"
	line "foonnummer en"
	cont "profiel."

	para ""
	done

_MobileCardFolderIntro2Text::
	text "Dit is jouw KAART."

	para "Na het delen van"
	line "je telefoonnummer,"

	para "kun je KAARTEN"
	line "ruilen met je"
	cont "vrienden."

	para ""
	done

_MobileCardFolderIntro3Text::
	text "Als je de KAART"
	line "van een vriend"

	para "hebt, kun je el-"
	line "kaar bellen op de"

	para "eerste verdieping"
	line "van een"
	cont "#MONCENTRUM."

	para ""
	done

_MobileCardFolderIntro4Text::
	text "Om je collectie"
	line "kaarten veilig te"

	para "bewaren moet je"
	line "WACHTWOORD voor je"
	cont "KAARTMAP kiezen."

	para ""
	done

_MobileCardFolderAskDeleteText::
	text "Verwijder je de"
	line "KAARTMAP, dan raak"

	para "je de KAARTEN en"
	line "je WACHTWOORD ook"
	cont "kwijt."

	para "Pas op-een gewiste"
	line "KAARTMAP is niet"
	cont "te herstellen."

	para "Wil je jouw KAART-"
	line "MAP verwijderen?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Weet je zeker dat"
	line "je hem wil wissen?"
	done

_MobileCardFolderDeletedText::
	text "De KAARTMAP"
	line "is verwijderd."

	para ""
	done

_MobileCardFolderAskOpenOldText::
	text "Er is een oudere"
	line "KAARTMAP van een"
	cont "eerdere reis."

	para "Wil je deze"
	line "open maken?"
	done

_MobileCardFolderAskDeleteOldText::
	text "Verwijder de oude"
	line "KAARTMAP?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Klaar met opslaan"
	line "van KAARTEN?"
	done

_PhoneWrongNumberText::
	text "Huh? Sorry, fout"
	line "nummer!"
	done

_PhoneClickText::
	text "Klik!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Dat nummer is"
	line "buiten bereik."
	done

_PhoneJustTalkToThemText::
	text "Ga gewoon met ze"
	line "praten!"
	done

_PhoneThankYouText::
	text "Bedankt!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Wachtwoord OK."
	line "Kies VERDER &"
	cont "reset instellingen"
	prompt

_PasswordWrongText::
	text "Fout wachtwoord!"
	prompt

_PasswordAskResetClockText::
	text "Reset de klok?"
	done

_PasswordAskEnterText::
	text "Voer het wacht-"
	line "woord in."
	done

_ClearAllSaveDataText::
	text "Wis alle opslag-"
	line "data?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " leerde"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Welke aanval wordt"
	next "vergeten?"
	done

_StopLearningMoveText::
	text "Stop met leren van"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "leerde niet"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "probeert"
	cont "@"
	text_ram wStringBuffer2
	text "te leren."

	para "Maar @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "kan maximaal vier"
	cont "aanvallen leren."

	para "Verwijder een oude"
	line "aanval voor"
	cont "voor @"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 en…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " Poef!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " vergat"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "En…"
	prompt

_MoveCantForgetHMText::
	text "HM-aanvallen zijn"
	line "niet te vergeten."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Speel met drie"
	line "munten?"
	done

_CardFlipNotEnoughCoinsText::
	text "Te weinig munten…"
	prompt

_CardFlipChooseACardText::
	text "Kies een kaart."
	done

_CardFlipPlaceYourBetText::
	text "Zet geld in."
	done

_CardFlipPlayAgainText::
	text "Nog een keer"
	line "spelen?"
	done

_CardFlipShuffledText::
	text "De kaarten zijn"
	line "geschud."
	prompt

_CardFlipYeahText::
	text "Jaaa!"
	done

_CardFlipDarnText::
	text "Verdorie…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Je bent buiten het"
	line "gebruiksgebied."
	prompt

_PokegearAskWhoCallText::
	text "Met wie wil je"
	line "bellen?"
	done

_PokegearPressButtonText::
	text "Druk op een knop"
	line "om te sluiten."
	done

_PokegearAskDeleteText::
	text "Verwijder dit"
	line "bewaarde nummer?"
	done

_BuenaAskWhichPrizeText::
	text "Welke prijs wil"
	line "je hebben?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Is dat hem?"
	done

_BuenaHereYouGoText::
	text "Alsjeblieft!"

	para ""
	done

_BuenaNotEnoughPointsText::
	text "Je hebt te weinig"
	line "punten."

	para ""
	done

_BuenaNoRoomText::
	text "Je hebt er geen"
	line "plek voor."

	para ""
	done

_BuenaComeAgainText::
	text "Oh. Kom alsje-"
	line "blieft nog eens!"
	done

_BTExcuseMeText::
	text "Pardon!"

	para ""
	done

_ExcuseMeYoureNotReadyText::
	text "Sorry. Je bent er"
	line "niet klaar voor."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Kom weer terug als"
	line "bent voorbereid."
	done

_NeedAtLeastThreeMonText::
	text "Neem minstens drie"
	line "#MON mee."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, een EI"
	line "kwalificeert niet."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Slechts drie"
	line "#MON mogen mee."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "De @"
	text_ram wStringBuffer2
	text " #MON"
	line "moeten elk andere"
	cont "types hebben."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "De @"
	text_ram wStringBuffer2
	text " #MON"
	line "mogen geen iden-"
	cont "tieke voorwerpen."

	para ""
	done

_YouCantTakeAnEggText::
	text "Een EI mag niet"
	line "met je mee!"

	para ""
	done

_BallDodgedText::
	text "Hij ontweek de"
	line "geworpen BAL!"

	para "Deze #MON"
	line "is niet te vangen!"
	prompt

_BallMissedText::
	text "Je mistte de"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "Oh nee! De #MON"
	line "brak los!"
	prompt

_BallAppearedCaughtText::
	text "Aww! Het leek"
	line "te zijn gelukt!"
	prompt

_BallAlmostHadItText::
	text "Aargh!"
	line "Bijna gelukt!"
	prompt

_BallSoCloseText::
	text "Verdraaid! Zo"
	line "dichtbij ook!"
	prompt

Text_BallCaught::
	text "Hebbes! @"
	text_ram wEnemyMonNickname
	text_start
	line "was gevangen!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " ging"
	line "naar BILL's PC."
	prompt

_NewDexDataText::
	text_ram wEnemyMonNickname
	text "'s data"
	line "werd toegevoegd"
	cont "aan de #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Geef een naam aan"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " steeg."
	prompt

_ItemCantUseOnMonText::
	text "Niet te gebruiken"
	line "op deze #MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "De VERJAAG die je"
	line "eerder gebruikte"
	cont "werkt nog."
	prompt

_PlayedFluteText::
	text "Speelde de #"
	line "FLUTE."

	para "Nou, wat een leuk"
	line "leuk deuntje!"
	prompt

_FluteWakeUpText::
	text "Slapende #MON"
	line "werden wakker."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> speelde"
	line "de #FLUIT.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "Je hebt nu"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " punten."
	done

_CoinCaseCountText::
	text "Munten:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Verhoog PP van"
	line "welke aanval?"
	done

_RestoreThePPOfWhichMoveText::
	text "Herstel PP van"
	line "welke aanval?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2
	text "'s PP"
	line "is op zijn hoogst."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2
	text "'s PP"
	line "is verhoogd."
	prompt

_PPRestoredText::
	text "PP was hersteld."
	prompt

_SentTrophyHomeText::
	text "Er zat een trofee"
	line "in!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " zond de trofee"
	line "naar huis."
	prompt

_ItemLooksBitterText::
	text "Lijkt best bitter…"
	prompt

_ItemCantUseOnEggText::
	text "Dat werkt niet"
	line "op een EI."
	prompt

_ItemOakWarningText::
	text "OAK: <PLAYER>!"
	line "Dit is niet het"
	cont "moment daarvoor!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Dat is van iemand"
	line "anders!"
	prompt

_ItemWontHaveEffectText::
	text "Het zal geen"
	line "effect hebben."
	prompt

_BallBlockedText::
	text "TDe trainer"
	line "blokkeerde de BAL!"
	prompt

_BallDontBeAThiefText::
	text "Niet stelen!"
	prompt

_NoCyclingText::
	text "Fietsen is hier"
	line "niet toegestaan."
	prompt

_ItemCantGetOnText::
	text "Kunt nu niet op je"
	line "@"
	text_ram wStringBuffer1
	text " stappen."
	prompt

_BallBoxFullText::
	text "De #MON BOX"
	line "is vol. Dat kun je"
	cont "nu niet gebruiken."
	prompt

_ItemUsedText::
	text "<PLAYER> gebruikte@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> ging op de@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> stapte van@"
	text_low
	text "de @"
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " kent"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Die #MON kent"
	line "een enkele aanval."
	done

_AskDeleteMoveText::
	text "Oh, wil je"
	line "@"
	text_ram wStringBuffer1
	text "vergeten?"
	done

_DeleterForgotMoveText::
	text "Klaar! Je #MON"
	line "vergat de aanval."
	done

_DeleterEggText::
	text "Een EI kent geen"
	line "aanvallen!"
	done

_DeleterNoComeAgainText::
	text "Nee? Bezoek me"
	line "later weer."
	done

_DeleterAskWhichMoveText::
	text "Welke aanval moet"
	line "worden vergeten?"
	prompt

_DeleterIntroText::
	text "Um… Oh, ja, Ik ben"
	line "de AANVALWISSER."

	para "Ik wis aanvallen"
	line "van je #MON."

	para "Moet ik helpen een"
	line "aanval te wissen?"
	done

_DeleterAskWhichMonText::
	text "Welke #MON?"
	prompt

_DSTIsThatOKText::
	text " ZMR,"
	line "is dat OK?"
	done

_TimeAskOkayText::
	text ","
	line "is dat OK?"
	done

_TimesetAskDSTText::
	text "Wil je wisselen"
	line "naar de Zomer-"
	cont "tijd?"
	done

_TimesetDSTText::
	text "Ik heb de klok een"
	line "uur voor je"
	cont "vooruitgezet."
	prompt

_TimesetAskNotDSTText::
	text "Is de Wintertijd"
	line "aangebroken?"
	done

_TimesetNotDSTText::
	text "De klok is een uur"
	line "achteruitgezet."
	prompt

_TimesetAskAdjustDSTText::
	text "Wil je de klok"
	line "aanpassen"

	para "voor de Zomer-"
	line "tijd?"
	done

_MomLostGearBookletText::
	text "Ik ben de hand-"
	line "leiding van de"
	cont "#GEAR kwijt."

	para "Kom over een"
	line "tijdje terug."
	prompt
