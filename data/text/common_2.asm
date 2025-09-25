_NoPhotoText::
	text "Oh, geen foto?" ; "Oh, no picture?"
	line "Kom nog eens, OK?" ; "Come again, OK?"
	done

_EggPhotoText::
	text "Een EI? M'n talent" ; "An EGG? My talent"
	line "is meer waard…" ; "is worth more…"
	done

_NameRaterHelloText::
	text "Hallo, hallo! Ik" ; "Hello, hello! I'm"
	line "ben de NAAM-" ; "the NAME RATER."
	cont "BEOORDELER."

	para "Ik beoordeel namen" ; "I rate the names"
	line "van #MON." ; "of #MON."

	para "Moet ik mijn oor-" ; "Would you like me"
	line "deel vellen?" ; "to rate names?"
	done

_NameRaterWhichMonText::
	text "De naam van welke" ; "Which #MON's"
	line "#MON moet ik" ; "nickname should I"
	cont "beoordelen?" ; "rate for you?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "…"
	line "Dat is best een" ; "That's a fairly"
	cont "prima naam." ; "decent name."

	para "Maar wat zeg je" ; "But, how about a"
	line "van een iets" ; "slightly better"
	cont "betere bijnaam?" ; "nickname?"

	para "Wil je dat ik een" ; "Want me to give it"
	line "betere naam geef?" ; "a better name?"
	done

_NameRaterWhatNameText::
	text "Oke, wat voor naam" ; "All right. What"
	line "moeten we geven" ; "name should we"
	cont "denk je?" ; "give it, then?"
	prompt

_NameRaterFinishedText::
	text "Dat is beter dan" ; "That's a better"
	line "de vorige naam!" ; "name than before!"

	para "Goed gedaan!" ; "Well done!"
	done

_NameRaterComeAgainText::
	text "Tot snel. Je bent" ; "OK, then. Come"
	line "altijd welkom." ; "again sometime."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	line "Goede naam!" ; "What a great name!"
	cont "Echt perfect." ; "It's perfect."

	para "@" ; "Treat @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "verdien je liefde." ; "with loving care."
	done

_NameRaterEggText::
	text "Wauw… Dat is maar" ; "Whoa… That's just"
	line "een EI." ; "an EGG."
	done

_NameRaterSameNameText::
	text "Van buiten is er" ; "It might look the"
	line "niks veranderd," ; "same as before,"

	para "maar deze naam" ; "but this new name"
	line "is veel beter!" ; "is much better!"

	para "Goed gedaan!" ; "Well done!"
	done

_NameRaterNamedText::
	text "Oké. Deze" ; "All right. This"
	line "#MON heet nu" ; "#MON is now"
	cont "@" ; "named @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kreeg@" ; " gained@"
	text_end

_BoostedExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "een extra" ; "a boosted"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " ERV. Punten!" ; " EXP. Points!"
	prompt

_ExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " ERV. Punten!" ; " EXP. Points!"
	prompt

_GoMonText::
	text "Ga! @" ; "Go! @"
	text_end

_DoItMonText::
	text "Doe het!" ; "Do it! @"
	line "@"
	text_end

_GoForItMonText::
	text "Ga ervoor," ; "Go for it,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Je vijand is zwak!" ; "Your foe's weak!"
	line "Pak'm, @" ; "Get'm, @"
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
	text " dat is" ; " that's"
	line "genoeg! Kom terug!@" ; "enough! Come back!@"
	text_end

_OKComeBackText::
	text " Oké!" ; " OK!"
	line "Kom terug!@" ; "Come back!@"
	text_end

_GoodComeBackText::
	text " prima!" ; " good!"
	line "Kom terug!@" ; "Come back!@"
	text_end

_ComeBackText::
	text " kom" ; " come"
	line "terug!" ; "back!"
	done

_BootedTMText::
	text "Startte een TM op." ; "Booted up a TM."
	prompt

_BootedHMText::
	text "Startte een VM op." ; "Booted up an HM."
	prompt

_ContainedMoveText::
	text "Hij bevatte" ; "It contained"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "."

	para "Leer @" ; "Teach @"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text_start
	line "aan een #MON?" ; "to a #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text " is"
	line "not compatibel" ; "not compatible"
	cont "met @" ; "with @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."

	para "Kan niet leren" ; "It can't learn"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "."
	prompt

_NoRoomTMHMText::
	text "Je hebt geen plek" ; "You have no room"
	line "voor meer" ; "for any more"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "S."
	prompt

_ReceivedTMHMText::
	text "Je ontving" ; "You received"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "De link is" ; "The link has been"
	line "geannuleerd." ; "cancelled."
	prompt

_MysteryGiftCommErrorText::
	text "Communicatie fout." ; "Communication"
	; line "error."
	prompt

_RetrieveMysteryGiftText::
	text "Haal cadeau op bij"; "Must retrieve GIFT"
	line "#MONCENTRUM." ; "at #MON CENTER."
	prompt

_YourFriendIsNotReadyText::
	text "Je vriend is niet" ; "Your friend isn't"
	line "klaar." ; "ready."
	prompt

_MysteryGiftFiveADayText::
	text "Sorry--alleen vijf" ; "Sorry--only five"
	line "CADEAUS per dag." ; "GIFTS a day."
	prompt

_MysteryGiftOneADayText::
	text "Sorry. Één CADEAU" ; "Sorry. One GIFT"
	line "per dag per mens." ; "a day per person."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " verzond" ; " sent"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " verzond" ; " sent"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxDecorationNameLength
	text_start
	cont "naar @" ; "to @"
	text_ram wMysteryGiftPlayerName
	text "'s" ; "'s home."
	cont "thuis."
	prompt

_NameCardReceivedCardText::
	text "Ontving" ; "Received"
	line "@"
	text_ram wMysteryGiftCardHolderName
	text "'s KAART." ; "'s CARD."
	prompt

_NameCardListedCardText::
	text_ram wMysteryGiftCardHolderName
	text "'s KAART was" ; "'s CARD was"
	line "vermeld als nr.@" ; "listed as no.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "De KAART was niet" ; "The CARD was not"
	line "geregistreerd." ; "registered."
	prompt

_NameCardLinkCancelledText::
	text "De link is" ; "The link has been"
	line "geannuleerd." ; "cancelled."
	prompt

_NameCardLinkCommErrorText::
	text "Communicatie fout." ; "Communication"
	; line "error."
	prompt

_BadgeRequiredText::
	text "Sorry! Een nieuwe" ; "Sorry! A new BADGE"
	line "BADGE is vereist." ; "is required."
	prompt

_CantUseItemText::
	text "Kun je hier niet" ; "Can't use that"
	line "gebruiken." ; "here."
	prompt

_UseCutText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " deed" ; " used"
	line "SNIJD!" ; "CUT!"
	prompt

_CutNothingText::
	text "Er is niks om" ; "There's nothing to"
	line "SNIJD op te doen." ; "CUT here."
	prompt

_BlindingFlashText::
	text "Een felle FLITS" ; "A blinding FLASH"
	line "verlicht alles!@" ; "lights the area!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	; text " used"
	text_start
	line "gebruikte SURF!" ; "SURF!"
	done

_CantSurfText::
	text "Hier kun je geen" ; "You can't SURF"
	line "SURF gebruiken." ; "here."
	prompt

_AlreadySurfingText::
	text "Je bent al aan het" ; "You're already"
	line "SURFEN." ; "SURFING."
	prompt

_AskSurfText::
	text "Het water is rus-" ; "The water is calm."
	line "tig. SURFEN?" ; "Want to SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte WATERVAL!" ; "WATERFALL!"
	done

_HugeWaterfallText::
	text "Wauw, een gigan-" ; "Wow, it's a huge"
	line "tische waterval." ; "waterfall."
	done

_AskWaterfallText::
	text "Wil je WATERVAL" ; "Do you want to use"
	line "gebruiken?" ; "WATERFALL?"
	done

_UseDigText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte GRAVEN!" ; "DIG!"
	done

_UseEscapeRopeText::
	text "<PLAYER> gebruikte" ; "<PLAYER> used an"
	line "ONTSNAPSTOUW." ; "ESCAPE ROPE."
	done

_CantUseDigText::
	text "Kun je hier niet" ; "Can't use that"
	line "gebruiken." ; "here."
	done

_TeleportReturnText::
	text "Terug naar vorig" ; "Return to the last"
	line "#MONCENTRUM." ; "#MON CENTER."
	done

_CantUseTeleportText::
	text "Kun je hier niet" ; "Can't use that"
	line "gebruiken." ; "here."

	para ""
	done

_AlreadyUsingStrengthText::
	text "Een #MON ge-" ; "A #MON is using"
	line "bruikt al KRACHT." ; "STRENGTH already."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte KRACHT!" ; "STRENGTH!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kan" ; " can"
	line "rotsen schuiven." ; "move boulders."
	prompt

_AskStrengthText::
	text "Een #MON kan" ; "A #MON may be"
	line "dit verschuiven." ; "able to move this."

	para "Wil je" ; "Want to use"
	line "KRACHT gebruiken?" ; "STRENGTH?"
	done

_BouldersMoveText::
	text "Rotsen kunnen nu" ; "Boulders may now"
	line "worden verschoven!" ; "be moved!"
	done

_BouldersMayMoveText::
	text "A #MON zou dit" ; "A #MON may be"
	line "kunnen bewegen." ; "able to move this."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte DRAAIKOLK!" ; "WHIRLPOOL!"
	prompt

_MayPassWhirlpoolText::
	text "Het is een heftige" ; "It's a vicious"
	line "draaikolk!" ; "whirlpool!"

	para "Een #MON kan er" ; "A #MON may be"
	line "wellicht langs." ; "able to pass it."
	done

_AskWhirlpoolText::
	text "Een draaikolk zit" ; "A whirlpool is in"
	line "in de weg." ; "the way."

	para "Wil je DRAAIKOLK" ; "Want to use"
	line "gebruiken?" ; "WHIRLPOOL?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " deed" ; " did a"
	line "een KOPSTOOT!" ; "HEADBUTT!"
	prompt

_HeadbuttNothingText::
	text "Nope. Niks…" ; "Nope. Nothing…"
	done

_AskHeadbuttText::
	text "Een #MON kan in" ; "A #MON could be"
	line "deze boom zitten." ; "in this tree."

	para "Wil je KOPSTOOT" ; "Want to HEADBUTT"
	line "gebruiken?" ; "it?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte STEENKNAL!" ; "ROCK SMASH!"
	prompt

_MaySmashText::
	text "Een #MON kan" ; "Maybe a #MON"
	line "dit breken." ; "can break this."
	done

_AskRockSmashText::
	text "Deze rots lijkt" ; "This rock looks"
	line "breekbaar." ; "breakable."

	para "Wil je STEENKNAL" ; "Want to use ROCK"
	line "gebruiken?" ; "SMASH?"
	done

_RodBiteText::
	text "Oh!"
	line "Beet!" ; "A bite!"
	prompt

_RodNothingText::
	text "Niet eens" ; "Not even a nibble!"
	line "een hapje!"
	prompt

_UnusedNothingHereText::
	text "Zo te zien is hier" ; "Looks like there's"
	line "niks te vinden." ; "nothing here."
	prompt

_CantGetOffBikeText::
	text "Je kunt hier niet" ; "You can't get off"
	line "afstappen!" ; "here!"
	done

_GotOnBikeText::
	text "<PLAYER> stapte op" ; "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> stapte" ; "<PLAYER> got off"
	line "van @" ; "the @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	done

_AskCutText::
	text "Deze boom kun je" ; "This tree can be"
	line "SNIJDEN!" ; "CUT!"

	para "SNIJD gebruiken?" ; "Want to use CUT?"
	done

_CanCutText::
	text "Deze boom kun je" ; "This tree can be"
	line "SNIJDEN!" ; "CUT!"
	done

_FoundItemText::
	text "<PLAYER> vond" ; "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "!"
	done

_CantCarryItemText::
	text "Maar <PLAYER> kan" ; "But <PLAYER> can't"
	line "geen spullen meer" ; "carry any more"
	cont "dragen." ; "items."
	done

_WhitedOutText::
	text "<PLAYER> heeft geen" ; "<PLAYER> is out of"
	line "bruikbare #MON!" ; "useable #MON!"

	para "<PLAYER> werd" ; "<PLAYER> whited"
	line "uitgeschakeld!" ; "out!"
	done

_ItemfinderItemNearbyText::
	text "Ja! DETECTOR" ; "Yes! ITEMFINDER"
	line "ziet een voorwerp" ; "indicates there's"
	cont "in de buurt." ; "an item nearby."
	prompt

_ItemfinderNopeText::
	text "Nope! DETECTOR" ; "Nope! ITEMFINDER"
	line "reageert niet." ; "isn't responding."
	prompt

_PoisonRecoveryText::
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text " over-" ; text_start
	line "leefde het gif!" ; "fainted!"
	prompt

; _PoisonWhiteoutText::
;	text "<PLAYER> heeft geen" ; "<PLAYER> is out of"
;	line "bruikbare #MON!" ; "useable #MON!"

;	para "<PLAYER> werd" ; "<PLAYER> whited"
;	line "uitgeschakeld!" ; "out!"
;	prompt

_UseSweetScentText::
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte ZOETE" ; "SWEET SCENT!"
	cont "GEUR!"
	done

_SweetScentNothingText::
	text "Zo te zien is hier" ; "Looks like there's"
	line "niks…" ; "nothing here…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> sprenkelde" ; "<PLAYER> sprinkled"
	line "water."

	para "Maar er gebeurde" ; "But nothing"
	line "niks…" ; "happened…"
	done

_UseSacredAshText::
	text "<PLAYER>'s #MON"
	line "zijn genezen!" ; "were all healed!"
	done

_AnEggCantHoldAnItemText::
	text "EI kan geen voor-" ; "An EGG can't hold"
	line "werp vasthouden." ; "an item."
	prompt

_PackNoItemText::
	text "Geen voorwerpen." ; "No items."
	done

_AskThrowAwayText::
	text "Hoeveel wil je" ; "Throw away how"
	line "weggooien?" ; "many?"
	done

_AskQuantityThrowAwayText::
	text "Gooi @" ; "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " weg?" ; "(S)?"
	done

_ThrewAwayText::
	text "Gooide" ; "Threw away"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " weg." ; "(S)."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "Dit is niet het" ; "This isn't the"
	cont "moment daarvoor!" ; "time to use that!"
	prompt

_YouDontHaveAMonText::
	text "Je hebt geen" ; "You don't have a"
	line "#MON!"
	prompt

_RegisteredItemText::
	text "Registreerde" ; "Registered the"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	prompt

_CantRegisterText::
	text "Kan niet met" ; "You can't register"
	line "dat voorwerp." ; "that item."
	prompt

_AskItemMoveText::
	text "Waar moet dit" ; "Where should this"
	line "naartoe?" ; "be moved to?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Niet te gebruiken" ; "You can't use it"
	line "in een gevecht." ; "in a battle."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Ben je een jongen?" ; "Are you a boy?"
	line "Of een meisje?" ; "Or are you a girl?"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>steeg fors!" ; "<SCROLL>went way up!"
	prompt

_BattleStatWentUpText::
	text " steeg!" ; " went up!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>daalde flink!" ; "<SCROLL>sharply fell!"
	prompt

_BattleStatFellText::
	text " daalde!" ; " fell!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "maakte wervelwind!" ; "made a whirlwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "nam zonlicht op!" ; "took in sunlight!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "boog het hoofd!" ; "lowered its head!"
	prompt

_BattleGlowingText::
	text_start
	line "gloeit!" ; "is glowing!"
	prompt

_BattleFlewText::
	text_start
	line "vloog omhoog!" ; "flew up high!"
	prompt

_BattleDugText::
	text_start
	line "groef een gat!" ; "dug a hole!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "deed @" ; "used @"
	text_end

_UsedMove2Text::
	text_start
	line "deed @" ; "used @"
	text_end

_UsedInsteadText::
	text "in plaats" ; "instead,"
	cont "van, @" ; "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
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
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kwam" ; " came"
	line "uit het EI!@" ; "out of its EGG!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Geef een naam aan" ; "Give a nickname to"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_LeftWithDayCareLadyText::
	text "Het is @" ; "It's @"
	text_ram wBreedMon2Nickname ; MaxLength MaxPokemonNameLength
	text_start
	line "die achtergelaten" ; "that was left with"
	cont "was bij OPVANG." ; "the DAY-CARE LADY."
	done

_LeftWithDayCareManText::
	text "Het is @" ; "It's @"
	text_ram wBreedMon1Nickname ; MaxLength MaxPokemonNameLength
	text_start
	line "die achtergelaten" ; "that was left with"
	cont "was bij OPVANG." ; "the DAY-CARE MAN."
	done

_BreedBrimmingWithEnergyText::
	text "Het glittert van" ; "It's brimming with"
	line "de energie." ; "energy."
	prompt

_BreedNoInterestText::
	text "Het heeft geen" ; "It has no interest"
	line "interesse in" ; "in @"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Het lijkt te geven" ; "It appears to care"
	line "om @" ; "for @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_BreedFriendlyText::
	text "Het is vriendelijk" ; "It's friendly with"
	line "met @" ; "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_BreedShowsInterestText::
	text "Toont interesse" ; "It shows interest"
	line "in @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_EmptyMailboxText::
	text "Er is hier geen" ; "There's no MAIL"
	line "POST." ; "here."
	prompt

_MailClearedPutAwayText::
	text "De afgevinkte POST" ; "The cleared MAIL"
	line "werd weggestopt." ; "was put away."
	prompt

_MailPackFullText::
	text "De TAS is vol." ; "The PACK is full."
	prompt

_MailMessageLostText::
	text "Bericht in de POST" ; "The MAIL's message"
	line "verdwijnt. OK?" ; "will be lost. OK?"
	done

_MailAlreadyHoldingItemText::
	text "Houdt al een voor-" ; "It's already hold-"
	line "werp vast." ; "ing an item."
	prompt

_MailEggText::
	text "Een EI kan geen" ; "An EGG can't hold"
	line "POST vasthouden." ; "any MAIL."
	prompt

_MailMovedFromBoxText::
	text "De POST is ver-" ; "The MAIL was moved"
	line "huisd uit INBOX." ; "from the MAILBOX."
	prompt

_YesPromptText:: ; unreferenced
	text "Ja" ; "Yes"
	prompt

_NoPromptText:: ; unreferenced
	text "Nee" ; "No"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1 ; MaxLength 14
	text_start
	line "Animation type @"
	text_ram wStringBuffer2 ; MaxLength 3
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "#MON nummer?" ; "#MON number?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " gaat" ; " was"
	line "naar BILL's PC." ; "sent to BILL's PC."
	prompt

_PCGottaHavePokemonText::
	text "Je moet #MON" ; "You gotta have"
	line "hebben voor dat!" ; "#MON to call!"
	prompt

_PCWhatText::
	text "Wat?" ; "What?"
	done

_PCMonHoldingMailText::
	text "Er is een #MON" ; "There is a #MON"
	line "met POST." ; "holding MAIL."

	para "Verwijder a.u.b." ; "Please remove the"
	line "de POST." ; "MAIL."
	prompt

_PCNoSingleMonText::
	text "Je hebt geen" ; "You don't have a"
	line "enkele #MON!" ; "single #MON!"
	prompt

_PCCantDepositLastMonText::
	text "Je laatste #MON" ; "You can't deposit"
	line "is niet te" ; "your last #MON!"
	cont "plaatsen!";
	prompt

_PCCantTakeText::
	text "Je kunt niet meer" ; "You can't take any"
	line "#MON nemen." ; "more #MON."
	prompt

_ContestCaughtMonText::
	text "Ving @" ; "Caught @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "!"
	prompt

_ContestAskSwitchText::
	text "Wissel #MON?" ; "Switch #MON?"
	done

_ContestAlreadyCaughtText::
	text "Je ving al" ; "You already caught"
	line "een @" ; "a @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "De winnaar van de" ; "This Bug-Catching"
	line "Wedstrijd is@" ; "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "wie een" ; "who caught a"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " ving!@" ; "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "De winnende score" ; "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " punten!" ; " points!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Op de tweede plek" ; "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "wie een" ; "who caught a"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " ving!@" ; "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "De score was" ; "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " punten!" ; " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "De derde plek was" ; "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "wie een" ; "who caught a"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " ving!@" ; "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "De score was" ; "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " punten!" ; " points!"
	prompt

_MagikarpGuruMeasureText::
	text "Laat me die" ; "Let me measure"
	line "MAGIKARP meten." ; "that MAGIKARP."

	para "…Hm, hij is" ; "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1 ; MaxLength 6
	text " cm groot." ; "."
	prompt

_KarpGuruRecordText::
	text "HUIDIG RECORD" ; "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1 ; MaxLength 6
	text " cm gevangen" ; " caught by"
	line "door @" ; "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Gefeliciteerd!" ; "Congratulations!"

	para "Er is een match" ; "We have a match"
	line "met het ID-nummer" ; "with the ID number"

	para "van @" ; "of @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " in"
	line "je team." ; "your party."
	prompt

_LuckyNumberMatchPCText::
	text "Gefeliciteerd!" ; "Congratulations!"

	para "Er is een match" ; "We have a match"
	line "met het ID-nummer" ; "with the ID number"

	para "van @" ; "of @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " in"
	line "je PC BOX." ; "your PC BOX."
	prompt

_CaughtAskNicknameText::
	text "Geef een naam aan" ; "Give a nickname to"
	line "de @" ; "the @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " die" ; " you"
	cont "je kreeg?" ; "received?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! Je moet" ; "Bzzzzt! You must"
	line "een #MON hebben" ; "have a #MON to"
	cont "om dit te doen!" ; "use this!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> zette de" ; "<PLAYER> turned on"
	line "PC aan." ; "the PC."
	prompt

_PlayersPCAskWhatDoText::
	text "Wat wil je" ; "What do you want"
	line "doen?" ; "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "Hoeveel wil je" ; "How many do you"
	line "er uit halen?" ; "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Trok @" ; "Withdrew @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	cont "terug." ; text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Er is geen plek" ; "There's no room"
	line "voor voorwerpen." ; "for more items."
	prompt

_PlayersPCNoItemsText::
	text "Geen voorwerpen!" ; "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "Hoeveel wil je er" ; "How many do you"
	line "storten?" ; "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Stortte @" ; "Deposited @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "." ; "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "Er is geen plek om" ; "There's no room to"
	line "iets te storten." ; "store items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> zette de" ; "<PLAYER> turned on"
	line "PC aan." ; "the PC."
	prompt

_PokecenterPCWhoseText::
	text "Wiens PC openen?" ; "Access whose PC?"
	done

_PokecenterBillsPCText::
	text "BILL's PC"
	line "geopend." ; "accessed."

	para "#MON Opslag-" ; "#MON Storage"
	line "systeem geopend." ; "System opened."
	prompt

_PokecenterPlayersPCText::
	text "Opende eigen PC." ; "Accessed own PC."

	para "Voorwerpen opslag-" ; "Item Storage"
	line "systeem geopend." ; "System opened."
	prompt

_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "geopend." ; "accessed."

	para "#DEX Beoordeel-" ; "#DEX Rating"
	line "systeem geopend." ; "System opened."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link gesloten…" ; "Link closed…"
	done

_OakPCText1::
	text "Moet je #DEX" ; "Want to get your"
	line "worden beoordeeld?" ; "#DEX rated?"
	done

_OakPCText2::
	text "Huidige voltooi-" ; "Current #DEX"
	line "niveau #DEX:" ; "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3 ; MaxLength 3
	text " #MON gezien" ; " #MON seen"
	line "@"
	text_ram wStringBuffer4 ; MaxLength 3
	text " #MON bezit" ; " #MON owned"

	para "PROF.OAK's"
	line "Oordeel:" ; "Rating:"
	done

_OakRating01::
	text "Zoek naar #MON" ; "Look for #MON"
	line "in begrasd gebied!" ; "in grassy areas!"
	done

_OakRating02::
	text "Goed. Ik zie dat" ; "Good. I see you"
	line "je snapt hoe #-" ; "understand how to"
	cont "BALLEN werken." ; "use # BALLS."
	done

_OakRating03::
	text "Je begint hier" ; "You're getting"
	line "goed in te worden." ; "good at this."

	para "Maar je hebt een" ; "But you have a"
	line "lange weg te gaan." ; "long way to go."
	done

_OakRating04::
	text "Je moet je #DEX" ; "You need to fill"
	line "vullen." ; "up the #DEX."

	para "Vang allerlei" ; "Catch different"
	line "soorten #MON!" ; "kinds of #MON!"
	done

_OakRating05::
	text "Je doet duidelijk" ; "You're trying--I"
	line "je best." ; "can see that."

	para "Je #DEX vult" ; "Your #DEX is"
	line "al aardig." ; "coming together."
	done

_OakRating06::
	text "Om te evolueren" ; "To evolve, some"
	line "groeien #MON," ; "#MON grow,"

	para "anderen gebruiken" ; "others use the"
	line "er STENEN voor." ; "effects of STONES."
	done

_OakRating07::
	text "Heb je al een" ; "Have you gotten a"
	line "VISHENGEL? Je kunt" ; "fishing ROD? You"

	para "#MON vangen" ; "can catch #MON"
	line "door te vissen." ; "by fishing."
	done

_OakRating08::
	text "Uitstekend! Je" ; "Excellent! You"
	line "lijkt verzamelen" ; "seem to like col-"
	cont "leuk te vinden!" ; "lecting things!"
	done

_OakRating09::
	text "Sommige #MON" ; "Some #MON only"
	line "zie je alleen op" ; "appear during"

	para "bepaalde momenten" ; "certain times of"
	line "van de dag." ; "the day."
	done

_OakRating10::
	text "Je #DEX begint" ; "Your #DEX is"
	line "voller te raken." ; "filling up. Keep"
	cont "Ga zo door!" ; "up the good work!"
	done

_OakRating11::
	text "Ik vind het knap." ; "I'm impressed."
	line "Je evolueert nu" ; "You're evolving"

	para "ook je #MON, en" ; "#MON, not just"
	line "vangt niet alleen." ; "catching them."
	done

_OakRating12::
	text "Ken je KURT al?" ; "Have you met KURT?"
	line "Zijn BALLEN kunnen" ; "His custom BALLS"
	cont "je helpen." ; "should help."
	done

_OakRating13::
	text "Wauw. Je hebt meer" ; "Wow. You've found"
	line "#MON gevangen" ; "more #MON than"

	para "dan het laatste" ; "the last #DEX"
	line "#DEX-project." ; "research project."
	done

_OakRating14::
	text "Ruil je jouw" ; "Are you trading"
	line "#MON?" ; "your #MON?"

	para "Het is moeilijk" ; "It's tough to do"
	line "alleen te doen!" ; "this alone!"
	done

_OakRating15::
	text "Wauw! Je zit op" ; "Wow! You've hit"
	line "200! Je #DEX" ; "200! Your #DEX"
	cont "ziet er goed uit!" ; "is looking great!"
	done

_OakRating16::
	text "Je hebt zoveel" ; "You've found so"
	line "#MON gevonden!" ; "many #MON!"

	para "Je helpt mijn" ; "You've really"
	line "studie ontzettend!" ; "helped my studies!"
	done

_OakRating17::
	text "Verbluffend! Je" ; "Magnificent! You"
	line "kan inmiddels zelf" ; "could become a"

	para "een #MON-" ; "#MON professor"
	line "professor worden!" ; "right now!"
	done

_OakRating18::
	text "Je #DEX is" ; "Your #DEX is"
	line "fenomenaal! Je" ; "amazing! You're"

	para "kunt dit pro-" ; "ready to turn"
	line "fessioneel doen!" ; "professional!"
	done

_OakRating19::
	text "Wauw! Een perfecte" ; "Whoa! A perfect"
	line "#DEX! Dit" ; "#DEX! I've"

	para "was mijn droom!" ; "dreamt about this!"
	line "Gefeliciteerd!" ; "Congratulations!"
	done

_OakPCText4::
	text "Connectie PROF." ; "The link to PROF."
	line "OAK's PC gesloten." ; "OAK's PC closed."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text "Driedubbel" ; "Triple-theme"
	line "trainer-oordeel!" ; "trainer ranking!"

	para "Het OPSLAG-bestand" ; "The SAVE file you"
	line "dat je stuurde kan" ; "just sent might"
	cont "de lijst halen!" ; "make the rankings!"

	para ""
	done

_TrainerRankingNoDataText:: ; unreferenced
	text "Het is geen" ; "There is no"
	line "ranglijstdata." ; "ranking data."

	para "Link om ranglijst-" ; "Link to obtain"
	line "data te ontvangen." ; "ranking data."

	para ""
	done

_MemoryGameYeahText::
	text " , ja!" ; " , yeah!"
	done

_MemoryGameDarnText::
	text "Verdorie…" ; "Darn…"
	done

_StartMenuContestEndText::
	text "Wil je de Wed-" ; "Would you like to"
	line "strijd stoppen?" ; "end the Contest?"
	done

_ItemsTossOutHowManyText::
	text "Hoeveel" ; "Toss out how many"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	cont "weggooien?" ; text "(S)?"
	done

_ItemsThrowAwayText::
	text "Gooi @" ; "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " weg?" ; "(S)?"
	done

_ItemsDiscardedText::
	text "Weggegooid" ; "Discarded"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "." ; "(S)."
	prompt

_ItemsTooImportantText::
	text "Dat is te belang-" ; "That's too impor-"
	line "rijk!" ; "tant to toss out!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "Dit is daar niet" ; "This isn't the"
	cont "het moment voor!" ; "time to use that!"
	done

_PokemonSwapItemText::
	text "Nam @" ; "Took @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text "'s"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text " en" ; " and"

	para "liet @" ; "made it hold"
	; line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	line "vasthouden." ; text "."
	prompt

_PokemonHoldItemText::
	text "Liet @" ; "Made @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_start
	line "een @" ; "hold @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	cont "vasthouden." ; text "."
	prompt

_PokemonRemoveMailText::
	text "Verwijder eerst" ; "Please remove the"
	line "de POST." ; "MAIL first."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " houdt" ; " isn't"
	line "niets vast." ; "holding anything."
	prompt

_ItemStorageFullText::
	text "Opslagplek is" ; "Item storage space"
	line "vol." ; "full."
	prompt

_PokemonTookItemText::
	text "Nam @" ; "Took @"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text_start
	line "van @" ; "from @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	; text " is"
	text_start
	line "heeft al" ; "already holding"

	para "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text " vast." ; "."
	line "Wissel voorwerp?" ; "Switch items?"
	done

_ItemCantHeldText::
	text "Voorwerp kun je" ; "This item can't be"
	line "niet vasthouden." ; "held."
	prompt

_MailLoseMessageText::
	text "POST raakt bericht" ; "The MAIL will lose"
	line "kwijt. OK?" ; "its message. OK?"
	done

_MailDetachedText::
	text "MAIL losgemaakt" ; "MAIL detached from"
	line "van @" ; "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_MailNoSpaceText::
	text "Geen plek om POST" ; "There's no space"
	line "te verwijderen." ; "for removing MAIL."
	prompt

_MailAskSendToPCText::
	text "Stuur verwijderde" ; "Send the removed"
	line "POST naar je PC?" ; "MAIL to your PC?"
	done

_MailboxFullText::
	text "MAILBOX van je PC" ; "Your PC's MAILBOX"
	line "zit vol." ; "is full."
	prompt

_MailSentToPCText::
	text "De POST werd ver-" ; "The MAIL was sent"
	line "stuurd naar je PC." ; "to your PC."
	prompt

_PokemonNotEnoughHPText::
	text "Niet genoeg LP!" ; "Not enough HP!"
	prompt

_MayRegisterItemText::
	text "Voorwerp in je TAS" ; "An item in your"
	line "kan worden gere-" ; "PACK may be"

	para "gistreerd op de" ; "registered for use"
	line "SELECT-knop." ; "on SELECT Button."
	done

_OakText1::
	text "Hallo! Sorry dat" ; "Hello! Sorry to"
	line "je moest wachten!" ; "keep you waiting!"

	para "Welkom in de we-" ; "Welcome to the"
	line "reld van #MON!" ; "world of #MON!"

	para "Ik ben OAK." ; "My name is OAK."

	para "Ze noemen mij de" ; "People call me the"
	line "#MON PROF." ; "#MON PROF."
	prompt

_OakText2::
	text "In deze wereld" ; "This world is in-"
	line "vind je wezens" ; "habited by crea-"
	cont "die we #MON" ; "tures that we call"
	cont "noemen.@" ; "#MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "Mensen en #MON" ; "People and #MON"
	line "leven samen door" ; "live together by"

	para "elkaar te onder-" ; "supporting each"
	line "steunen." ; "other."

	para "Sommigen spelen" ; "Some people play"
	line "samen, anderen" ; "with #MON, some"
	cont "vechten ermee." ; "battle with them."
	prompt

_OakText5::
	text "Maar we weten nog" ; "But we don't know"
	line "niet alles over" ; "everything about"
	cont "#MON." ; "#MON yet."

	para "Er zijn nog veel" ; "There are still"
	line "mysteries om te" ; "many mysteries to"
	cont "ontrafelen." ; "solve."

	para "Daarom bestudeer" ; "That's why I study"
	line "ik #MON." ; "#MON every day."
	prompt
