_FruitBearingTreeText::
	text "Het is een fruit-"
	line "boom."
	done

_HeyItsFruitText::
	text "He! Het is"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Bemachtigde"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Maar de RUGZAK zit"
	line "vol…"
	done

_NothingHereText::
	text "Er is hier niks…"
	done

_WhichApricornText::
	text "Welke APRICORN"
	line "moet ik gebruiken?"
	done

_HowManyShouldIMakeText::
	text "Hoeveel moet ik er"
	line "maken?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "herstelde @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text "herstelde"
	line "van gif."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text "raakte"
	line "verlamming kwijt."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text "is"
	line "niet meer"
	cont "verbrand"
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "ontdooide."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "werd wakker."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text "kreeg"
	line "leven terug."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "is hersteld."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " groeide naar"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unreferenced

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " kwam"
	line "weer bij zinnen."
	done

_EnterNewPasscodeText::
	text "Voer viercijfer-"
	line "ig nummer in."
	done

_ConfirmPasscodeText::
	text "Voer zelfde nummer"
	line "in en bevestig."
	done

_PasscodesNotSameText::
	text "Dat is niet het-"
	line "zelfde nummer."
	done

_PasscodeSetText::
	text "Je PASCODE is"
	line "ingesteld."

	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."

	para ""
	done

_FourZerosInvalidText::
	text "0000 is invalid!"

	para ""
	done

_EnterPasscodeText::
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

_IncorrectPasscodeText::
	text "Incorrect"
	line "PASSCODE!"

	para ""
	done

_CardFolderOpenText::
	text "CARD FOLDER open.@"
	text_end

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Wha…? Je"
	line "maakte me wakker!"

	para "Kun jij de"
	line "klok controleren?"
	prompt

_OakTimeWhatTimeIsItText::
	text "Hoe laat is het?"
	done

_OakTimeWhatHoursText::
	text "Wat?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "Hoeveel minuten?"
	done

_OakTimeWhoaMinutesText::
	text "Wauw!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "!"
	line "Ik versliep me!"
	done

_OakTimeYikesText::
	text "!"
	line "Yikes!"
	cont "Ik versliep me!"
	done

_OakTimeSoDarkText::
	text "!"
	line "Geen wonder dat"
	cont "het zo donker is!"
	done

_OakTimeWhatDayIsItText::
	text "Welke dag is het?"
	done

_OakTimeIsItText::
	text ", dus?"
	done

; Mobile Adapter

_ThereIsNothingConnectedText:: ; unreferenced
	text "Er is niks"
	line "verbonden."
	done

_CheckCellPhoneAdapterText:: ; unreferenced
	text "Check telefoon-"
	line "adapter."
	done

_CheckCDMAAdapterText:: ; unreferenced
	text "Check CDMA-"
	line "adapter."
	done

_CheckDOCOMOPHSAdapterText:: ; unreferenced
	text "Check DOCOMO PHS-"
	line "adapter."
	done

_CheckDDIPHSAdapterText:: ; unreferenced
	text "Check DDI PHS0"
	line "adapter."
	done

_CheckMobileAdapterText:: ; unreferenced
	text "Check unlimited"
	line "battle mobile-"
	cont "adapter."
	done

; Mobile Adapter End

_ThePasswordIsText:: ; unreferenced
	text "Het wachtwoord is:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "Is dit oké?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Vul het"
	line "ID-nummer in."
	done

_EnterTheAmountText:: ; unreferenced
	text "Vul de hoeveelheid"
	line "in."
	done

_NothingToChooseText::
	text "Er is niks om te"
	line "kiezen."
	prompt

_WhichSidePutOnText::
	text "Aan welke kant wil"
	line "je het zetten?"
	done

_WhichSidePutAwayText::
	text "Welke kant wil"
	line "je wegstoppen?"
	done

_PutAwayTheDecoText::
	text "Verwijdert de"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "Er is niks om weg"
	line "te stoppen."
	prompt

_SetUpTheDecoText::
	text "Plaatst de"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Verwijdert de"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "en plaatst de"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "Dat is al ge-"
	line "plaatst."
	prompt

_LookTownMapText::
	text "Het is de KAART."
	done

_LookPikachuPosterText::
	text "It's a poster of a"
	line "cute PIKACHU."
	done

_LookClefairyPosterText::
	text "Een poster van een"
	line "lieve CLEFAIRY."
	done

_LookJigglypuffPosterText::
	text "Een poster van een"
	line "lieve JIGGLYPUFF."
	done

_LookAdorableDecoText::
	text "Het is een"
	line "aandoenlijke@"
	text_ram wStringBuffer3
	text "."
	done

_LookGiantDecoText::
	text "Een reuzenpop! Hij"
	line "is zacht en warm."
	done

_MomHiHowAreYouText::
	text "Ha, <PLAYER>!"
	line "Hoe gaat het?"
	prompt

_MomFoundAnItemText::
	text "De winkel had iets"
	line "handigs, dus ik"
	prompt

_MomBoughtWithYourMoneyText::
	text "heb 't met je geld"
	line "gekocht. Sorry!"
	prompt

_MomItsInPCText::
	text "Het zit in je PC."
	line "Geniet er van!"
	done

_MomFoundADollText::
	text "Tijdens 't shoppen"
	line "zag ik deze lieve"
	cont "knuffel, dus hij"
	prompt

_MomItsInYourRoomText::
	text "staat in je kamer."
	line "Vind je vast leuk!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " werd"
	line "gestuurd naar @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " zegt"
	line "vaarwel tegen"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Pas goed op"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "Voor @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " stuurt"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " wil"
	line "ruilen @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "voor @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " wil"
	line "ruilen @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

_MobileForPartnersMonText::
	text "voor @"
	text_ram wOTTrademonSenderName
	text "'s"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTradeText::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " ruilen…"
	done

_MobileTakeGoodCareOfMonText::
	text "Pas goed op"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTrade2Text::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " ruilen…"
	done

_MobileTakeGoodCareOfText::
	text "Pas goed op"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text " kwam"
	line "terug!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARY: PROF.OAK'S"
	done

_OPT_IntroText2::
	text_start
	line "#MON PRAAT!"
	done

_OPT_IntroText3::
	text_start
	line "Met mij, MARY!"
	done

_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "wordt gezien rond"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARY: @"
	text_ram wStringBuffer1
	text "'s"
	done

_OPT_SweetAdorablyText::
	text_start
	line "lief en schattig"
	done

_OPT_WigglySlicklyText::
	text_start
	line "wiebelig en glad"
	done

_OPT_AptlyNamedText::
	text_start
	line "passend genaamd en"
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "duidelijk best wel"
	done

_OPT_UnbearablyText::
	text_start
	line "Zo onweerstaanbaar"
	done

_OPT_WowImpressivelyText::
	text_start
	line "wauw, imposant"
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "bijja giftig"
	done

_OPT_SensuallyText::
	text_start
	line "ooh, zo sensueel"
	done

_OPT_MischievouslyText::
	text_start
	line "zo ondeugend"
	done

_OPT_TopicallyText::
	text_start
	line "zo zeer actueel"
	done

_OPT_AddictivelyText::
	text_start
	line "vast verslavend"
	done

_OPT_LooksInWaterText::
	text_start
	line "kijkt in water"
	done

_OPT_EvolutionMustBeText::
	text_start
	line "evolutie is vast"
	done

_OPT_ProvocativelyText::
	text_start
	line "proactief"
	done

_OPT_FlippedOutText::
	text_start
	line "dus ik flipte en"
	done

_OPT_HeartMeltinglyText::
	text_start
	line "hartvertederend"
	done

_OPT_CuteText::
	text_start
	line "schattig."
	done

_OPT_WeirdText::
	text_start
	line "raar."
	done

_OPT_PleasantText::
	text_start
	line "plezant."
	done

_OPT_BoldSortOfText::
	text_start
	line "stoutmoedig."
	done

_OPT_FrighteningText::
	text_start
	line "beangstigend."
	done

_OPT_SuaveDebonairText::
	text_start
	line "zacht en lief!"
	done

_OPT_PowerfulText::
	text_start
	line "krachtig."
	done

_OPT_ExcitingText::
	text_start
	line "opwindend."
	done

_OPT_GroovyText::
	text_start
	line "groovy!"
	done

_OPT_InspiringText::
	text_start
	line "inspirerend."
	done

_OPT_FriendlyText::
	text_start
	line "vriendelijk."
	done

_OPT_HotHotHotText::
	text_start
	line "heet, heet, heet!"
	done

_OPT_StimulatingText::
	text_start
	line "stimulerend."
	done

_OPT_GuardedText::
	text_start
	line "waakzaam."
	done

_OPT_LovelyText::
	text_start
	line "lief."
	done

_OPT_SpeedyText::
	text_start
	line "snel."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: #MON MUSIC"
	done

_BenIntroText2::
	text_start
	line "KANAAL!"
	done

_BenIntroText3::
	text_start
	line "Met mij, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FERN: #MUZIEK!"
	done

_FernIntroText2::
	text_start
	line "Met DJ FERN!"
	done

_BenFernText1::
	text_start
	line "Het is @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "dus we draaien"
	done

_BenFernText2B::
	text_start
	line "chill maar met"
	done

_BenFernText3A::
	text_start
	line "#MON Mars!"
	done

_BenFernText3B::
	text_start
	line "#MON Slaaplied!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "REED: Yeehaw! Hoe"
	done

_LC_Text2::
	text_start
	line "hoe istie?"
	done

_LC_Text3::
	text_start
	line "Of je nou boven"
	done

_LC_Text4::
	text_start
	line "of onder bent,"
	done

_LC_Text5::
	text_start
	line "mis niet de"
	done

_LC_Text6::
	text_start
	line "LOTTOSHOW!"
	done

_LC_Text7::
	text_start
	line "Het nummer deze"
	done

_LC_Text8::
	text_start
	line "week is @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Ik herhaal het!"
	done

_LC_Text10::
	text_start
	line "Check en ga naar"
	done

_LC_Text11::
	text_start
	line "de RADIOTOREN!"
	done

_LC_DragText1::
	text_start
	line "…Herhaal mezelf"
	done

_LC_DragText2::
	text_start
	line "wordt vervelend…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "PLEKKEN EN MENSEN!"
	done

_PnP_Text2::
	text_start
	line "Gepresenteerd door"
	done

_PnP_Text3::
	text_start
	line "mij, DJ LILY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "is schattig."
	done

_PnP_LazyText::
	text_start
	line "is wat lui."
	done

_PnP_HappyText::
	text_start
	line "is altijd blij."
	done

_PnP_NoisyText::
	text_start
	line "is een aagje."
	done

_PnP_PrecociousText::
	text_start
	line "is voorlijk."
	done

_PnP_BoldText::
	text_start
	line "is stoutmoedig."
	done

_PnP_PickyText::
	text_start
	line "is kieskeurig!"
	done

_PnP_SortOfOKText::
	text_start
	line "is best oké."
	done

_PnP_SoSoText::
	text_start
	line "is maar matig."
	done

_PnP_GreatText::
	text_start
	line "is eigenlijk top."
	done

_PnP_MyTypeText::
	text_start
	line "is echt mijn type."
	done

_PnP_CoolText::
	text_start
	line "is echt cool, he?"
	done

_PnP_InspiringText::
	text_start
	line "is inspirerend!"
	done

_PnP_WeirdText::
	text_start
	line "is best raar."
	done

_PnP_RightForMeText::
	text_start
	line "past bij me?"
	done

_PnP_OddText::
	text_start
	line "is echt apart!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… …Ahem, wij zijn"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Na drie jaar aan"
	done

_RocketRadioText4::
	text_start
	line "voorbereiding zijn"
	done

_RocketRadioText5::
	text_start
	line "we teruggekeerd"
	done

_RocketRadioText6::
	text_start
	line "na onze val!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Kun je"
	done

_RocketRadioText8::
	text_start
	line "het horen?@"
	text_pause
	text " Het is gelukt!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Waar is onze baas?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Luistert hij?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: BUENA hier!"
	done

_BuenaRadioText2::
	text_start
	line "Het wachtwoord!"
	done

_BuenaRadioText3::
	text_start
	line "vandaag, uhm… Is"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Don't forget it!"
	done

_BuenaRadioText6::
	text_start
	line "Ik zit in GOLDEN-"
	done

_BuenaRadioText7::
	text_start
	line "ROD's RADIOTOREN!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh jee…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Middernacht! Ik"
	done

_BuenaRadioMidnightText3::
	text_start
	line "moet afsluiten!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Bedankt dat je"
	done

_BuenaRadioMidnightText5::
	text_start
	line "luisterde! Maar"
	done

_BuenaRadioMidnightText6::
	text_start
	line "blijf niet te lang"
	done

_BuenaRadioMidnightText7::
	text_start
	line "wakker! Gepresenteerd"
	done

_BuenaRadioMidnightText8::
	text_start
	line "door DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text "Ik ga weer!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

_EnemyWithdrewText::
	text "<ENEMY>"
	line "riep"
	cont "@"
	text_ram wEnemyMonNickname
	text "terug!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "gebruikt @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "op @"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "Dat kun je nu niet"
	line "gebruiken."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "Dit voorwerp kan"
	line "niet in je TAS."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text "The @"
	text_ram wStringBuffer1
	text_start
	line "is weggestopt in"
	cont "je TAS."
	done

_RemainingTimeText:: ; unreferenced
	text "Resterende tijd"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "Je #MON is"
	line "genezen."
	prompt

_WarpingText:: ; unreferenced
	text "Teleporteren…"
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Welk nummer"
	line "moet veranderd?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Wil je spelen met"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "twee #MON ver-"
	line "eist voor fokken."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Fokken is niet"
	line "mogelijk."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "Compatibiliteit is"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Moeten ze fokken?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "Er is geen EI."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "Het ei gaat"
	line "uitkomen!"
	prompt

_TestEventText:: ; unreferenced
	text "Test event"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

_StartText:: ; unreferenced
	text "Start!"
	done

_EndText:: ; unreferenced
	text "Einde!"
	done

_ForABoyText:: ; unreferenced
	text "Voor een jongen!"
	done

_ForAGirlText:: ; unreferenced
	text "Voor een meisje!"
	done

_DoesntConcernABoyText:: ; unreferenced
	text "Dit is niet voor"
	line "een jongen!"
	done

_TheBoxIsFullText:: ; unreferenced
	text "De BOX is vol!"
	done

; Mobile Adapter

_NewCardArrivedText::
	text "Een nieuwe KAART"
	line "kwam van @"
	text_ram wStringBuffer2
	text "."
	done

_PutCardInCardFolderText::
	text "Stop de KAART in"
	line "de KAARTMAP?"
	done

_CardWasListedText::
	text_ram wStringBuffer2
	text "'s KAART is toe-"
	line "gevoegd als no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

_StartingLinkText::
	text "Start met link."
	done

_LinkTerminatedText::
	text "Link beendigd."
	done

_ClosingLinkText::
	text "Link sluiten."
	done

_ClearTimeLimitText:: ; unreferenced
	text "Haal tijdslimiet"
	line "weg?"
	done

_TimeLimitWasClearedText:: ; unreferenced
	text "Tijdslimiet is"
	line "weggehaald."
	done

_PickErrorPacketText:: ; unreferenced
	text "Kies welk pakket"
	line "als fout?"
	done

_TradingMonForOTMonText::
	text "Ruil @"
	text_ram wStringBuffer2
	text_start
	line "voor @"
	text_ram wStringBuffer1
	text "…"
	done

; Mobile Adapter End

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "kreeg the"
	line "VOLTORBBADGE!"
	done

_AskFloorElevatorText::
	text "Welke verdieping?"
	done

_BugCatchingContestTimeUpText::
	text "AANKONDIGER: PIEP!"

	para "Tijd is om!"
	done

_BugCatchingContestIsOverText::
	text "AANKONDIGER: Wed-"
	line "strijd is voorbij!"
	done

_RepelWoreOffText::
	text "Effect van VERJAAG"
	line "is voorbij."
	done

_PlayerFoundItemText::
	text "<PLAYER> vond"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "Maar <PLAYER>"
	line "heeft geen plek…"
	done

_JustSawSomeRareMonText::
	text "Ik zag zeldzame"
	line "rare @"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Ik bel als ik nog"
	line "een zeldzame #-"
	cont "MON zie, oke?"
	prompt

_SavingRecordText::
	text "GAME OPSLAAN…"
	line "NIET UITZETTEN!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " ontving"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "Je hebt geen munten"
	prompt

_NoCoinCaseText::
	text "Je hebt geen"
	line "MUNTENZAK."
	prompt

_NPCTradeCableText::
	text "OK, verbind de"
	line "Game Link Cable."
	prompt

Text_NPCTraded::
	text "<PLAYER> ruilde"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " voor"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "Ik verzamel #-"
	line "MON. Heb jij"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Wil je ruilen voor"
	line "mijn @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "Wil je niet"
	line "ruilen? Aww…"
	done

_NPCTradeWrongText1::
	text "Huh? Dat is geen"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "Teleurstellend…"
	done

_NPCTradeCompleteText1::
	text "Hoera! ik heb een"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Bedankt!"
	done

_NPCTradeAfterText1::
	text "Hoe gaat ie met"
	line "@"
	text_ram wStringBuffer2
	done

_NPCTradeIntroText2::
	text "Hoi, ik zoek naar"
	line "deze #MON."

	para "Als je een"
	line "@"
	text_ram wStringBuffer1
	text "hebt, wil"

	para "dan ruilen voor"
	line "mijn @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "Heb je ook niet"
	line "eentje?"

	para "Joh, dat is erg"
	line "teleurstellend…"
	done

_NPCTradeWrongText2::
	text "Je hebt geen"
	line "@"
	text_ram wStringBuffer1
	text "? Jammer"
	cont "maar helaas."
	done

_NPCTradeCompleteText2::
	text "Great! Thank you!"

	para "Ik heb eindelijk"
	line "een @"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Hoi! De @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "die je ruilde"
	cont "doet het goed!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text "is schattig,"
	line "maar die hebt ik"

	para "niet. Heb jij"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Wil je ruilen voor"
	line "mijn @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "Wil je niet"
	line "ruilen? Oh, balen…"
	done

_NPCTradeWrongText3::
	text "Dat is niet"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Ruil alsjeblieft"
	line "als je een vindt."
	done

_NPCTradeCompleteText3::
	text "Wauw! Dankje!"
	line "Ik wilde altijd al"
	cont "een @"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Hoe is het met de"
	line "@"
	text_ram wStringBuffer2
	text " die ik"
	cont "met je ruilde?"

	para "Je @"
	text_ram wMonOrItemNameBuffer
	text "is"
	line "zo schattig!"
	done

_NPCTradeCompleteText4::
	text "Uh? Wat is er"
	line "gebeurd?"
	done

_NPCTradeAfterText4::
	text "Ruilen is zo gek…"

	para "Ik moet er nog"
	line "veel over leren."
	done

_MomLeavingText1::
	text "Wauw, wat een"
	line "schattige #MON."

	para "Hoe kom je"
	line "er aan?"

	para "…"

	para "Dus, je gaat op"
	line "avontuur…"

	para "Oke!"
	line "Ik ga ook helpen."

	para "Maar wat kan ik"
	line "voor je doen?"

	para "Ik weet het! Ik"
	line "spaar voor je."

	para "On a long journey,"
	line "money's important."

	para "Wil je dat ik geld"
	line "spaar?"
	done

_MomLeavingText2::
	text "Oke, ik let op je"
	line "geld."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Wees voorzichtig."

	para "#MON zijn je"
	line "vrienden. Werk als"
	cont "een team samen."

	para "Ga nu maar!"
	done

_MomIsThisAboutYourMoneyText::
	text "Hoi! Welkom thuis!"
	line "Je doet hard je"
	cont "best, merk ik."

	para "Ik heb je kamer"
	line "voor je opgeruimd."

	para "Of gaat dit over"
	line "je geld?"
	done

_MomBankWhatDoYouWantToDoText::
	text "Wat wil je doen"
	line "ermee?"
	done

_MomStoreMoneyText::
	text "Hoeveel wil je"
	line "sparen?"
	done

_MomTakeMoneyText::
	text "Hoeveel wil je"
	line "meenemen?"
	done

_MomSaveMoneyText::
	text "Wil je wat geld"
	line "sparen?"
	done

_MomHaventSavedThatMuchText::
	text "Je hebt nog niet"
	line "zoveel gespaard."
	prompt

_MomNotEnoughRoomInWalletText::
	text "Zoveel kun je niet"
	line "meenemen."
	prompt

_MomInsufficientFundsInWalletText::
	text "Zoveel heb je"
	line "niet."
	prompt

_MomNotEnoughRoomInBankText::
	text "Zoveel kun je niet"
	line "sparen."
	prompt

_MomStartSavingMoneyText::
	text "Oke, ik bewaar je"
	line "geld. Komt goed!"

	para "<PLAYER>, ga zo"
	line "door!"
	done

_MomStoredMoneyText::
	text "Je geld is hier"
	line "veilig! Ga maar!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, geef"
	line "niet op!"
	done

_MomJustDoWhatYouCanText::
	text "Doe gewoon wat"
	line "je kunt."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Ik ben de OPVANG-"
	line "MAN. Moet ik een"
	cont "#MON opvoeden?"
	done

_DayCareManIntroEggText::
	text "Ik ben de OPVANG-"
	line "MAN. Weet je al"
	cont "over EIEREN?"

	para "Ik was een #MON"
	line "met mijn vrouw aan"
	cont "het opvoeden."

	para "En ineens lag er"
	line "een EI bij!"

	para "Hoe bizar is"
	line "dat?"

	para "Wil je dat ik een"
	line "#MON opvoed?"
	done

_DayCareLadyIntroText::
	text "Ik ben de OPVANG-"
	line "VROUW."

	para "Moet ik een #-"
	line "MON opvoeden?"
	done

_DayCareLadyIntroEggText::
	text "Ik ben de OPVANG-"
	line "VROUW. Weet je al"
	cont "over EIEREN?"

	para "Ik was een #MON"
	line "met mijn man aan"
	cont "het opvoeden."

	para "En ineens lag er"
	line "een EI bij!"

	para "Hoe bizar is"
	line "dat?"

	para "Wil je dat ik een"
	line "#MON opvoed?"
	done

_WhatShouldIRaiseText::
	text "Wat moet ik voor"
	line "je opvoeden?"
	prompt

_OnlyOneMonText::
	text "Oh? Je hebt maar een"
	line "enkele #MON."
	prompt

_CantAcceptEggText::
	text "Sorry, maar ik kan"
	line "geen EI aannemen."
	prompt

_RemoveMailText::
	text "Verwijder POST"
	line "voor je langskomt."
	prompt

_LastHealthyMonText::
	text "Als je dat geeft"
	line "waar vecht jij"
	cont "dan mee?"
	prompt

_IllRaiseYourMonText::
	text "Oke, ik voed je"
	line "@ op"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Kom er later voor"
	line "terug."
	done

_AreWeGeniusesText::
	text "Zijn we briljant"
	line "of niet? Wil je"
	cont "@ zien"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Je @"
	text_ram wStringBuffer1
	text_start
	line "is veel gegroeid."

	para "Qua level is ie"
	line "gegroeid met @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Als je de #MON"
	line "terug wil, kost je"
	cont "dat ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfect! Hier is"
	line "je #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> kreeg"
	line "@"
	text_ram wStringBuffer1
	text "terug."
	prompt

_BackAlreadyText::
	text "Huh? Alweer terug?"
	line "Je @"
	text_ram wStringBuffer1
	text_start
	para "heeft wat meer"
	line "tijd nodig."

	para "Als je de #MON"
	line "terug wil, kost"
	cont "dat je ¥100."
	done

_HaveNoRoomText::
	text "Je hebt er geen"
	line "plek voor."
	prompt

_NotEnoughMoneyText::
	text "Je hebt niet"
	line "genoeg geld."
	prompt

_OhFineThenText::
	text "Oh, prima dan."
	prompt

_ComeAgainText::
	text "Tot snel."
	done

_NotYetText::
	text "Nog niet…"
	done

_FoundAnEggText::
	text "Ah, jij bent het!"

	para "We waren op je"
	line "#MON aan het"

	para "letten, en jeetje"
	line "wat verrassend!"

	para "Je #MON had"
	line "een EI!"

	para "We weten niet waar"
	line "vandaan kwam, maar"

	para "je #MON had"
	line "hem. Wil je hem?"
	done

_ReceivedEggText::
	text "<PLAYER> kreeg"
	line "het EI!"
	done

_TakeGoodCareOfEggText::
	text "Pas er goed"
	line "op."
	done

_IllKeepItThanksText::
	text "Nou dan, dan houd"
	line "ik hem. Bedankt!"
	done

_NoRoomForEggText::
	text "Je hebt geen plek"
	line "in je team."
	cont "Kom later terug."
	done

_WhichMonPhotoText::
	text "Welke #MON"
	line "moet op de foto?"
	prompt

_HoldStillText::
	text "Okiedokie, sta "
	line "even stil."
	prompt

_PrestoAllDoneText::
	text "Presto! Klaar."
	line "Kom nog eens, OK?"
	done
