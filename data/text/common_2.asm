_NoPhotoText::
	text "Oh, geen foto?"
	line "Kom nog eens, OK?"
	done

_EggPhotoText::
	text "Een EI? M'n talent"
	line "is meer waard…"
	done

_NameRaterHelloText::
	text "Hallo, hallo! Ik"
	line "ben de NAAM-"
	cont "BEOORDELER."

	para "Ik beoordeel namen"
	line "van #MON."

	para "Moet ik mijn oor-"
	line "deel vellen?"
	done

_NameRaterWhichMonText::
	text "De naam van welke"
	line "#MON moet ik"
	cont "beoordelen"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "Dat is best een"
	cont "prima naam."

	para "Maar wat zeg je"
	line "van een iets"
	cont "betere bijnaam?"

	para "Wil je dat ik een"
	line "betere naam geef?"
	done

_NameRaterWhatNameText::
	text "Oke, wat voor naam"
	line "moeten we geven"
	cont "denk je?"
	prompt

_NameRaterFinishedText::
	text "Dat is beter dan"
	line "de vorige naam!"

	para "Goed gedaan!"
	done

_NameRaterComeAgainText::
	text "Tot snel. Je bent"
	line "altijd welkom."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "Goede naam!"
	cont "Echt perfect."

	para "@"
	text_ram wStringBuffer1
	text_start
	line "verdien je liefde."
	done

_NameRaterEggText::
	text "Wauw… Dat is maar"
	line "een EI."
	done

_NameRaterSameNameText::
	text "Van buiten is er"
	line "niks veranderd,"

	para "maar deze naam"
	line "is veel beter!"

	para "Goed gedaan!"
	done

_NameRaterNamedText::
	text "Oke. Deze"
	line "#MON heet nu"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " kreeg@"
	text_end

_BoostedExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "een extra"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " ERV. Punten!"
	prompt

_ExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " ERV. Punten!"
	prompt

_GoMonText::
	text "Ga! @"
	text_end

_DoItMonText::
	text "Doe het! @"
	text_end

_GoForItMonText::
	text "Ga ervoor,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Je vijand is zwak!"
	line "Pak'm, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " dat is"
	line "genoeg! Kom terug!@"
	text_end

_OKComeBackText::
	text " OK!"
	line "Kom terug!@"
	text_end

_GoodComeBackText::
	text " prima!"
	line "Kom terug!@"
	text_end

_ComeBackText::
	text " kom"
	line "terug!"
	done

_BootedTMText::
	text "Startte een TM op."
	prompt

_BootedHMText::
	text "Startte een HM op."
	prompt

_ContainedMoveText::
	text "Hij bevatte"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Leer @"
	text_ram wStringBuffer2
	text_start
	line "aan een #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " is"
	line "not compatibel"
	cont "met @"
	text_ram wStringBuffer1
	text "."

	para "Kan niet"
	line "@ leren"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "Je hebt geen plek"
	line "voor meer"
	cont "@"
	text_ram wStringBuffer1
	text "S."
	prompt

_ReceivedTMHMText::
	text "Je ontving"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "De link is"
	line "geannulleeerd."
	prompt

_MysteryGiftCommErrorText::
	text "Communicatie"
	line "fout."
	prompt

_RetrieveMysteryGiftText::
	text "Moet CADEAU halen"
	line "bij #MONCENTRUM."
	prompt

_YourFriendIsNotReadyText::
	text "Je vriend is niet"
	line "klaar."
	prompt

_MysteryGiftFiveADayText::
	text "Sorry--only five"
	line "GIFTS a day."
	prompt

_MysteryGiftOneADayText::
	text "Sorry. Een CADEAU"
	line "per dag."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " verzond"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " verzond"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "naar @"
	text_ram wMysteryGiftPlayerName
	text "'s thuis."
	prompt

_NameCardReceivedCardText::
	text "Ontving"
	line "@"
	text_ram wMysteryGiftCardHolderName
	text "'s KAART."
	prompt

_NameCardListedCardText::
	text_ram wMysteryGiftCardHolderName
	text "'s KAART was"
	line "vermeld als no.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "De KAART was niet"
	line "geregistreerd."
	prompt

_NameCardLinkCancelledText::
	text "De link is"
	line "geannuleerd."
	prompt

_NameCardLinkCommErrorText::
	text "Communicatie"
	line "fout."
	prompt

_BadgeRequiredText::
	text "Sorry! Een nieuwe"
	line "BADGE is vereist."
	prompt

_CantUseItemText::
	text "Kun je hier niet"
	line "gebruiken."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " gebruikte"
	line "SNIJD!"
	prompt

_CutNothingText::
	text "Er is niks om"
	line "SNIJD op te doen."
	prompt

_BlindingFlashText::
	text "Een felle FLITS"
	line "verlicht alles!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2
	text " gebruikte"
	line "SURF!"
	done

_CantSurfText::
	text "Hier kun je geen"
	line "SURF gebruiken."
	prompt

_AlreadySurfingText::
	text "Je bent al aan het"
	line "SURFEN."
	prompt

_AskSurfText::
	text "Het water is rus-"
	line "tig. SURFEN?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " gebruikte"
	line "WATERVAL!"
	done

_HugeWaterfallText::
	text "Wauw, een gigan-"
	line "tische waterval."
	done

_AskWaterfallText::
	text "Wil je WATERVAL"
	line "gebruiken?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " gebruikte"
	line "GRAAF!"
	done

_UseEscapeRopeText::
	text "<PLAYER> gebruikte"
	line "ONTSNAPTOUW."
	done

_CantUseDigText::
	text "Kun je hier niet"
	line "gebruiken."
	done

_TeleportReturnText::
	text "terug naar vorig"
	line "#MONCENTRUM."
	done

_CantUseTeleportText::
	text "Kun je hier niet"
	line "gebruiken."

	para ""
	done

_AlreadyUsingStrengthText::
	text "Een #MON ge-"
	line "bruikt al KRACHT."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " gebruikte"
	line "KRACHT!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " kan"
	line "rotsen schuiven."
	prompt

_AskStrengthText::
	text "Een #MON kan dit"
	line "verschuiven."

	para "Wil je"
	line "KRACHT gebruiken?"
	done

_BouldersMoveText::
	text "Rotsen kunnen nu"
	line "worden verschoven!"
	done

_BouldersMayMoveText::
	text "A #MON zou dit"
	line "kunnen bewegen."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " gebruikte"
	line "DRAAIKOLK!"
	prompt

_MayPassWhirlpoolText::
	text "Het is een heftige"
	line "draaikolk!"

	para "Een #MON kan er"
	line "wellicht langs."
	done

_AskWhirlpoolText::
	text "Een draaikolk zit"
	line "in de weg."

	para "Wil je DRAAIKOLK"
	line "gebruiken?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " deed een"
	line "KOPSTOOT!"
	prompt

_HeadbuttNothingText::
	text "Nope. Niks…"
	done

_AskHeadbuttText::
	text "Een #MON kan in"
	line "deze boom zitten."

	para "Wil je KOPSTOOT"
	line "gebruiken?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " gebruikte"
	line "ROTSBREKER!"
	prompt

_MaySmashText::
	text "Een #MON kan"
	line "dit breken."
	done

_AskRockSmashText::
	text "Deze rots lijkt"
	line "breekbaar."

	para "Wil je ROTSBREKER"
	line "gebruiken?"
	done

_RodBiteText::
	text "Oh!"
	line "beet!"
	prompt

_RodNothingText::
	text "Niet eens een hapje!"
	prompt

_UnusedNothingHereText::
	text "Zo te zien is hier"
	line "niks te vinden."
	prompt

_CantGetOffBikeText::
	text "Je kunt hier niet"
	line "afstappen!"
	done

_GotOnBikeText::
	text "<PLAYER> stapte op"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> stapte"
	line "van de @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "Deze boom kun je"
	line "SNIJDEN!"

	para "SNIJD gebruiken?"
	done

_CanCutText::
	text "Deze boom kun je"
	line "SNIJDEN!"
	done

_FoundItemText::
	text "<PLAYER> vond"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "Maar <PLAYER> kan"
	line "geen spullen meer"
	cont "dragen."
	done

_WhitedOutText::
	text "<PLAYER> heeft geen"
	line "bruikbare #MON!"

	para "<PLAYER> werd"
	line "uitgeschakeld!"
	done

_ItemfinderItemNearbyText::
	text "Ja! ITEMZOEKER"
	line "ziet een voorwerp"
	cont "in de buurt."
	prompt

_ItemfinderNopeText::
	text "Nope! ITEMZOEKER"
	line "reageert niet."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "viel flauw!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> heeft geen"
	line "bruikbare #MON!"

	para "<PLAYER> werd"
	line "uitgeschakeld!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text " gebruikte"
	line "ZOETE GEUR!"
	done

_SweetScentNothingText::
	text "Zo te zien is hier"
	line "niks…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> sprenkelde"
	line "water."

	para "Maar er gebeurde"
	line "niks…"
	done

_UseSacredAshText::
	text "<PLAYER>'s #MON"
	line "zijn genezen!"
	done

_AnEggCantHoldAnItemText::
	text "EI kan geen voor-"
	line "werp vasthouden."
	prompt

_PackNoItemText::
	text "Geen voorwerpen."
	done

_AskThrowAwayText::
	text "Hoeveel wil je"
	line "weggooien?"
	done

_AskQuantityThrowAwayText::
	text "Gooi @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S) weg?"
	done

_ThrewAwayText::
	text "Gooide"
	line "@"
	text_ram wStringBuffer2
	text "(S) weg."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "Dit is niet het"
	cont "moment daarvoor!"
	prompt

_YouDontHaveAMonText::
	text "Je hebt geen"
	line "#MON!"
	prompt

_RegisteredItemText::
	text "Registreerde"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "Kan niet met dat"
	line "voorwerp."
	prompt

_AskItemMoveText::
	text "Waar moet dit"
	line "naartoe?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Niet te gebruiken"
	line "in een gevecht."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Ben je een jongen?"
	line "Of een meisje?"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>steeg fors!"
	prompt

_BattleStatWentUpText::
	text " steeg!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>zakte flink!"
	prompt

_BattleStatFellText::
	text " zakte"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "maakte wervelwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "nam zonlicht op!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "boog het hoofd!"
	prompt

_BattleGlowingText::
	text_start
	line "gloeit!"
	prompt

_BattleFlewText::
	text_start
	line "vloog omhoog!"
	prompt

_BattleDugText::
	text_start
	line "groef een gat!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "deed @"
	text_end

_UsedMove2Text::
	text_start
	line "deed @"
	text_end

_UsedInsteadText::
	text "in plaats daarvan,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "Huh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " kwam"
	line "uit het EI!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Geef een naam aan"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "Het is @"
	text_ram wBreedMon2Nickname
	text_start
	line "die achtergelaten"
	cont "was bij OPVANG."
	done

_LeftWithDayCareManText::
	text "Het is @"
	text_ram wBreedMon1Nickname
	text_start
	line "die achtergelaten"
	cont "was bij OPVANG."
	done

_BreedBrimmingWithEnergyText::
	text "Het glittert van"
	line "de energie."
	prompt

_BreedNoInterestText::
	text "Het heeft geen"
	line "interesse in @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Het lijkt te geven"
	line "om @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "Het is vriendelijk"
	line "met @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Toont interesse"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Er is hier geen"
	line "POST."
	prompt

_MailClearedPutAwayText::
	text "De afgevinkte POST"
	line "werd weggestopt."
	prompt

_MailPackFullText::
	text "De TAS is vol."
	prompt

_MailMessageLostText::
	text "Bericht in de POST"
	line "verdwijnt. OK?"
	done

_MailAlreadyHoldingItemText::
	text "Houdt al een voor-"
	line "werp vast."
	prompt

_MailEggText::
	text "Een EI kan geen"
	line "POST vasthouden."
	prompt

_MailMovedFromBoxText::
	text "De POST is ver-"
	line "huisd uit INBOX."
	prompt

_YesPromptText:: ; unreferenced
	text "Ja"
	prompt

_NoPromptText:: ; unreferenced
	text "Nee"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "#MON nummer?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " gaat"
	line "naar BILL's PC."
	prompt

_PCGottaHavePokemonText::
	text "Je moet #MON"
	line "hebben voor dat!"
	prompt

_PCWhatText::
	text "Wat?"
	done

_PCMonHoldingMailText::
	text "Er is een #MON"
	line "met POST."

	para "Verwijder a.u.b."
	line "de POST."
	prompt

_PCNoSingleMonText::
	text "Je hebt geen"
	line "enkele #MON!"
	prompt

_PCCantDepositLastMonText::
	text "Je laatste #MON"
	line "is niet te plaatsen!"
	prompt

_PCCantTakeText::
	text "Je kunt niet meer"
	line "#MON nemen."
	prompt

_ContestCaughtMonText::
	text "Ving @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Wissel #MON?"
	done

_ContestAlreadyCaughtText::
	text "Je ving al"
	line "een @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "De winnaar van de"
	line "wedstrijd is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "wie een a"
	cont "@"
	text_ram wStringBuffer1
	text "ving!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "De winnende score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " punten!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Op de tweede plek"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "Wie een"
	line "@"
	text_ram wStringBuffer1
	text "ving!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "De score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " punten!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "De derde plek was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "wie een"
	line "@"
	text_ram wStringBuffer1
	text "ving!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "De score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " punten!"
	prompt

_MagikarpGuruMeasureText::
	text "Laat me die"
	line "MAGIKARP meten."

	para "…Hm, hij is"
	line "@"
	text_ram wStringBuffer1
	text "groot."
	prompt

_KarpGuruRecordText::
	text "HUIDIG RECORD"

	para "@"
	text_ram wStringBuffer1
	text " gevangen door"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Gefeliciteerd!"

	para "Er is een match"
	line "met het ID-nummer"

	para "van @"
	text_ram wStringBuffer1
	text " in"
	line "je team."
	prompt

_LuckyNumberMatchPCText::
	text "Congratulations!"

	para "Er is een match"
	line "met het ID-nummer"

	para "van @"
	text_ram wStringBuffer1
	text " in"
	line "je PC BOX."
	prompt

_CaughtAskNicknameText::
	text "Geef een naam aan"
	line "de @"
	text_ram wStringBuffer1
	text " die je"
	cont "kreeg?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! Je moet"
	line "een #MON hebben"
	cont "om dit te doen!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> zette de"
	line "PC aan."
	prompt

_PlayersPCAskWhatDoText::
	text "Wat wil je"
	line "doen?"
	done

_PlayersPCHowManyWithdrawText::
	text "Hoeveel wil je"
	line "er uit halen??"
	done

_PlayersPCWithdrewItemsText::
	text "Trok @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S) terug."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Er is geen plek"
	line "voor voorwerpen."
	prompt

_PlayersPCNoItemsText::
	text "Geen voorwerpen!"
	prompt

_PlayersPCHowManyDepositText::
	text "Hoeveel wil je er"
	line "storten?"
	done

_PlayersPCDepositItemsText::
	text "Stortte @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "Er is geen plek om"
	line "iets te storten."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> zette de"
	line "PC aan."
	prompt

_PokecenterPCWhoseText::
	text "Wiens PC openen?"
	done

_PokecenterBillsPCText::
	text "BILL's PC"
	line "geopend."

	para "#MON Opslag-"
	line "systeem geopend."
	prompt

_PokecenterPlayersPCText::
	text "Opende eigen PC."

	para "Voorwerpen opslag-"
	line "systeem geopend."
	prompt

_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "geopend."

	para "#DEX Beoordeel-"
	line "systeem geopend."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link gesloten…"
	done

_OakPCText1::
	text "Moet je #DEX"
	line "worden beoordeeld?"
	done

_OakPCText2::
	text "Huidige voltooi-"
	line "niveau #DEX::"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON gezien"
	line "@"
	text_ram wStringBuffer4
	text " #MON in bezit"

	para "PROF.OAK's"
	line "Oordeel:"
	done

_OakRating01::
	text "Zoek naar #MON"
	line "in begrasd gebied!"
	done

_OakRating02::
	text "Goed. Ik zie dat"
	line "je snapt hoe #-"
	cont "BALLEN werken."
	done

_OakRating03::
	text "Je begint hier"
	line "goed in te worden."

	para "Maar je hebt een"
	line "lange weg te gaan."
	done

_OakRating04::
	text "Je moet je #DEX"
	line "vullen."

	para "Vang allerlei"
	line "soorten #MON!"
	done

_OakRating05::
	text "Je doet duidelijk"
	line "je best."

	para "Je #DEX vult"
	line "al aardig."
	done

_OakRating06::
	text "Om te evolueren"
	line "groeien je #MON,"

	para "anderen gebruiken"
	line "er STENEN voor."
	done

_OakRating07::
	text "Heb je al een"
	line "VISHENGEL? Je kunt"

	para "#MON vangen"
	line "door te vissen."
	done

_OakRating08::
	text "Uitstekend! Je"
	line "lijkt verzamelen"
	cont "leuk te vinden!"
	done

_OakRating09::
	text "Sommige #MON"
	line "zie je alleen op"

	para "bepaalde momenten"
	line "van de dag."
	done

_OakRating10::
	text "Je #DEX begint"
	line "voller te raken."
	cont "Ga zo door!"
	done

_OakRating11::
	text "Ik vind het knap."
	line "Je evolueert nu"

	para "ook je #MON, en"
	line "vangt niet alleen."
	done

_OakRating12::
	text "Ken je KURT al?"
	line "Zijn BALLEN kunnen"
	cont "je helpen."
	done

_OakRating13::
	text "Wauw. Je hebt meer"
	line "#MON gevangen"

	para "dan het laatste"
	line "#DEX-project."
	done

_OakRating14::
	text "Ruil je jouw"
	line "#MON?"

	para "Het is moeilijk"
	line "alleen te doen!"
	done

_OakRating15::
	text "Wauw! Je zit op"
	line "200! Je #DEX"
	cont "ziet er goed uit!"
	done

_OakRating16::
	text "Je hebt zoveel"
	line "#MON gevonden!"

	para "Je helpt mijn"
	line "studie ontzettend!"
	done

_OakRating17::
	text "Verbluffend! Je"
	line "kan inmiddels zelf"

	para "een #MON-professor"
	line "worden!"
	done

_OakRating18::
	text "Je #DEX is"
	line "fenomenaal! Je"

	para "kunt dit pro-"
	line "fessioneel doen!"
	done

_OakRating19::
	text "Wauw! Een perfecte"
	line "#DEX! Dit"

	para "was mijn droom!"
	line "Gefeliciteerd!"
	done

_OakPCText4::
	text "Connectie PROF."
	line "OAK's PC gesloten."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text "Driedubbel"
	line "trainer-oordeel!"

	para "Het OPSLAG-bestand"
	line "dat je stuurde kan"
	cont "de lijst halen!"

	para ""
	done

_TrainerRankingNoDataText:: ; unreferenced
	text "Het is geen"
	line "ranglijstdata."

	para "Link om ranglijst-"
	line "data te ontvangen."

	para ""
	done

_MemoryGameYeahText::
	text " , ja!"
	done

_MemoryGameDarnText::
	text "Verdorie…"
	done

_StartMenuContestEndText::
	text "Wil je de Wed-"
	line "strijd stoppen?"
	done

_ItemsTossOutHowManyText::
	text "Hoeveel"
	line "@"
	text_ram wStringBuffer2
	text "(S) weggooien?"
	done

_ItemsThrowAwayText::
	text "Gooi @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S) weg?"
	done

_ItemsDiscardedText::
	text "Weggegooid"
	line "@"
	text_ram wStringBuffer1
	text "(S)."
	prompt

_ItemsTooImportantText::
	text "Dat is te belang-"
	line "rijk!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "Dit is daar niet"
	cont "het moment voor!"
	done

_PokemonSwapItemText::
	text "Nam @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " en"

	para "liet"
	line "@"
	text_ram wStringBuffer2
	text "vasthouden."
	prompt

_PokemonHoldItemText::
	text "Liet @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "een @"
	text_ram wStringBuffer2
	text "vasthouden."
	prompt

_PokemonRemoveMailText::
	text "Verwijder eerst"
	line "de POST."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " houdt"
	line "niets vast."
	prompt

_ItemStorageFullText::
	text "Opslagplek is"
	line "vol."
	prompt

_PokemonTookItemText::
	text "Nam @"
	text_ram wStringBuffer1
	text_start
	line "van @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " heeft al"

	para "@"
	text_ram wStringBuffer1
	text "vast ."
	line "Wissel voorwerp?"
	done

_ItemCantHeldText::
	text "Voorwerp kun je"
	line "niet vasthouden."
	prompt

_MailLoseMessageText::
	text "POST raakt bericht"
	line "kwijt. OK?"
	done

_MailDetachedText::
	text "MAIL losgemaakt"
	line "van@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "Geen plek om POST"
	line "te verwijderen."
	prompt

_MailAskSendToPCText::
	text "Stuur verwijderde"
	line "POST naar je PC?"
	done

_MailboxFullText::
	text "MAILBOX van je PC"
	line "zit vol."
	prompt

_MailSentToPCText::
	text "De POST werd ver-"
	line "stuurd naar je PC."
	prompt

_PokemonNotEnoughHPText::
	text "Niet genoeg HP!"
	prompt

_MayRegisterItemText::
	text "Voorwerp in je TAS"
	line "kan worden gere-"

	para "gistreerd op de"
	line "SELECT-knop."
	done

_OakText1::
	text "Hallo! Sorry dat"
	line "je moest wachten!"

	para "Welkom in de we-"
	line "reld van #MON!"

	para "Ik ben OAK."

	para "Ze noemen mij de"
	line "#MON PROF."
	prompt

_OakText2::
	text "In deze wereld"
	line "vind je wezens"
	cont "die we #MON"
	cont "noemen.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "Mensen en #MON"
	line "leven samen door"

	para "elkaar te onder-"
	line "steunen."

	para "Sommigen spelen"
	line "samen, anderen"
	cont "vechten ermee."
	prompt

_OakText5::
	text "Maar we weten nog"
	line "niet alles over"
	cont "#MON."

	para "Er zijn nog veel"
	line "mysteries om te"
	cont "ontrafelen."

	para "Daarom bestudeer"
	line "ik #MON."
	prompt
