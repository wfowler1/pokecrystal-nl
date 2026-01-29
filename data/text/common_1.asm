_FruitBearingTreeText::
	text "Het is een" ; "It's a fruit-"
	line "fruitboom." ; "bearing tree."
	done

_HeyItsFruitText::
	text "Hé! Het is een" ; "Hey! It's"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "!"
	done

_ObtainedFruitText::
	text "Bemachtigde" ; "Obtained"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "!"
	done

_FruitPackIsFullText::
	text "Maar de TAS zit" ; "But the PACK is"
	line "vol…" ; "full…"
	done

_NothingHereText::
	text "Er is hier niks…" ; "There's nothing"
	; line "here…" ; "here…"
	done

_WhichApricornText::
	text "Welke ABRIKHORN" ; "Which APRICORN"
	line "moet ik gebruiken?" ; "should I use?"
	done

_HowManyShouldIMakeText::
	text "Hoeveel moet ik" ; "How many should I"
	line "er maken?" ; "make?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "herstelde @" ; "recovered @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "LP!" ; "HP!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start ; text "'s"
	line "herstelde van gif." ; "cured of poison."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " raakte" ; "'s"
	line "verlamming kwijt." ; "rid of paralysis."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "'s" ; "'s"
	line "brandwond genas." ; "burn was healed."
	done

_WasDefrostedText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "ontdooide." ; "was defrosted."
	done

_WokeUpText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "werd wakker." ; "woke up."
	done

_HealthReturnedText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "'s" ; "'s"
	line "leven kwam terug." ; "health returned."
	done

_RevitalizedText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "is hersteld." ; "is revitalized."
	done

_GrewToLevelText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " is nu" ; " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unreferenced

_CameToItsSensesText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kwam" ; " came"
	line "weer bij zinnen." ; "to its senses."
	done

_EnterNewPasscodeText::
	text "Voer viercijferig" ; "Please enter any"
	line "nummer in." ; "four-digit number."
	done

_ConfirmPasscodeText::
	text "Voer zelfde nummer" ; "Enter the same"
	line "in en bevestig." ; "number to confirm."
	done

_PasscodesNotSameText::
	text "Dat is niet het-" ; "That's not the"
	line "zelfde nummer." ; "same number."
	done

_PasscodeSetText::
	text "Je CIJFERCODE is" ; "Your PASSCODE has"
	line "ingesteld." ; "been set."

	para "Voer dit nummer in" ; "Enter this number"
	line "om de KAARTMAP te" ; "next time to open"
	cont "openen." ; "the CARD FOLDER."

	para ""
	done

_FourZerosInvalidText::
	text "0000 is ongeldig!" ; "0000 is invalid!"

	para ""
	done

_EnterPasscodeText::
	text "Voer de CIJFERCODE" ; "Enter the CARD"
	line "in van KAARTMAP." ; "FOLDER PASSCODE."
	done

_IncorrectPasscodeText::
	text "Onjuiste" ; "Incorrect"
	line "CIJFERCODE!" ; "PASSCODE!"

	para ""
	done

_CardFolderOpenText::
	text "KAARTMAP is open.@" ; "CARD FOLDER open.@"
	text_end

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Wat…? Je" ; "Zzz… Hm? Wha…?"
	line "maakte me wakker!" ; "You woke me up!"

	para "Kun jij me" ; "Will you check the"
	line "zeggen hoe laat" ; "clock for me?"
	cont "het is?"
	prompt

_OakTimeWhatTimeIsItText::
	text "Hoe laat is het?" ; "What time is it?"
	done

_OakTimeWhatHoursText::
	text "Wat?@" ; "What?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "Hoeveel minuten?" ; "How many minutes?"
	done

_OakTimeWhoaMinutesText::
	text "Wauw!@" ; "Whoa!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "!"
	line "Ik heb me" ; "I overslept!"
	cont "verslapen!"
	done

_OakTimeYikesText::
	text "!"
	line "Yikes! Ik heb me" ; "Yikes! I over-"
	cont "verslapen!" ; "slept!"
	done

_OakTimeSoDarkText::
	text "!"
	line "Geen wonder dat" ; "No wonder it's so"
	cont "het zo donker is!" ; "dark!"
	done

_OakTimeWhatDayIsItText::
	text "Welke dag is het?" ; "What day is it?"
	done

_OakTimeIsItText::
	text ", dus?" ; ", is it?"
	done

; Mobile Adapter

_ThereIsNothingConnectedText:: ; unreferenced
	text "Er is niks" ; "There is nothing"
	line "verbonden." ; "connected."
	done

_CheckCellPhoneAdapterText:: ; unreferenced
	text "Check telefoon-" ; "Check cell phone"
	line "adapter."
	done

_CheckCDMAAdapterText:: ; unreferenced
	text "Check CDMA-" ; "Check CDMA"
	line "adapter."
	done

_CheckDOCOMOPHSAdapterText:: ; unreferenced
	text "Check DOCOMO PHS-" ; "Check DOCOMO PHS"
	line "adapter."
	done

_CheckDDIPHSAdapterText:: ; unreferenced
	text "Check DDI PHS-" ; "Check DDI PHS"
	line "adapter."
	done

_CheckMobileAdapterText:: ; unreferenced
	text "Check unlimited"
	line "battle mobile-" ; "battle mobile"
	cont "adapter."
	done

; Mobile Adapter End

_ThePasswordIsText:: ; unreferenced
	text "Het wachtwoord is:" ; "The password is:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "Is dit oké?" ; "Is this OK?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Vul het" ; "Enter the"
	line "ID-nummer in." ; "ID no."
	done

_EnterTheAmountText:: ; unreferenced
	text "Vul de hoeveelheid" ; "Enter the"
	line "in." ; "amount."
	done

_NothingToChooseText::
	text "Er is niks om te" ; "There's nothing to"
	line "kiezen." ; "choose."
	prompt

_WhichSidePutOnText::
	text "Aan welke kant wil" ; "Which side do you"
	line "je het zetten?" ; "want to put it on?"
	done

_WhichSidePutAwayText::
	text "Welke kant wil" ; "Which side do you"
	line "je wegstoppen?" ; "want to put away?"
	done

_PutAwayTheDecoText::
	text "Verwijdert" ; "Put away the"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxDecorationNameLength
	text "."
	prompt

_NothingToPutAwayText::
	text "Er is niks om weg" ; "There's nothing to"
	line "te stoppen." ; "put away."
	prompt

_SetUpTheDecoText::
	text "Plaats de" ; "Set up the"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxDecorationNameLength
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Verwijder de" ; "Put away the"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxDecorationNameLength
	text_start

	para "en plaats de" ; "and set up the"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxDecorationNameLength
	text "."
	prompt

_AlreadySetUpText::
	text "Dat is al ge-" ; "That's already set"
	line "plaatst." ; "up."
	prompt

_LookTownMapText::
	text "Het is een" ; "It's the TOWN MAP."
	line "REGIOKAART."
	done

_LookPikachuPosterText::
	text "Een poster van een" ; "It's a poster of a"
	line "lieve PIKACHU." ; "cute PIKACHU."
	done

_LookClefairyPosterText::
	text "Een poster van een" ; "It's a poster of a"
	line "lieve CLEFAIRY." ; "cute CLEFAIRY."
	done

_LookJigglypuffPosterText::
	text "Een poster van een" ; "It's a poster of a"
	line "lieve JIGGLYPUFF." ; "cute JIGGLYPUFF."
	done

_LookAdorableDecoText::
	text "Het is een" ; "It's an adorable"
	line "aandoenlijke"
	cont "@"
	text_ram wStringBuffer3 ; MaxLength MaxDecorationNameLength
	text "."
	done

_LookGiantDecoText::
	text "Een reuzenpop! Het" ; "A giant doll! It's"
	line "is zacht en warm." ; "fluffy and cuddly."
	done

_MomHiHowAreYouText::
	text "Hoi, <PLAYER>!" ; "Hi, <PLAYER>!"
	line "Hoe gaat het?" ; "How are you?"
	prompt

_MomFoundAnItemText::
	text "De winkel had iets" ; "I found a useful"
	line "handigs, dus ik" ; "item shopping, so"
	prompt

_MomBoughtWithYourMoneyText::
	text "heb 't met je geld" ;  "I bought it with"
	line "gekocht. Sorry!" ; "your money. Sorry!"
	prompt

_MomItsInPCText::
	text "Het zit in je PC." ; "It's in your PC."
	line "Geniet er van!" ; "You'll like it!"
	done

_MomFoundADollText::
	text "Tijdens 't shoppen" ; "While shopping"
	line "zag ik deze lieve" ; "today, I saw this"
	cont "knuffel, dus hij" ; "adorable doll, so"
	prompt

_MomItsInYourRoomText::
	text "Staat in je kamer." ; "It's in your room."
	line "Vind je vast leuk!" ; "You'll love it!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " ging" ; " was"
	line "naar @" ; "sent to @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " zegt" ; " bids"
	line "vaarwel tegen" ; "farewell to"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Pas goed op" ; "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "Voor @" ; "For @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " stuurt" ; " sends"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " ruilt" ; " will"
	line "graag @" ; "trade @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "voor @" ; "for @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " ruilt" ; " will"
	line "graag @" ; "trade @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

_MobileForPartnersMonText::
	text "voor @" ; "for @"
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
	text " ruilen…" ; " trade…"
	done

_MobileTakeGoodCareOfMonText::
	text "Pas goed op" ; "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTrade2Text::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " ruilen…" ; " trade…"
	done

_MobileTakeGoodCareOfText::
	text "Pas goed op" ; "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text " kwam" ; " came"
	line "terug!" ; "back!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARY: PROF.OAK'S"
	done

_OPT_IntroText2::
	text_start
	line "#MON-PRAAT!" ; "#MON TALK!"
	done

_OPT_IntroText3::
	text_start
	line "Met mij, MARY!" ; "With me, MARY!"
	done

_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "wordt gezien rond" ; "may be seen around"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxLandmarkLength
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARY: @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "…"
	done

_OPT_SweetAdorablyText::
	text_start
	line "lief en schattig" ; "sweet and adorably"
	done

_OPT_WigglySlicklyText::
	text_start
	line "wiebelig en glad" ; "wiggly and slickly"
	done

_OPT_AptlyNamedText::
	text_start
	line "passend genaamd en" ; "aptly named and"
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "duidelijk best wel" ; "undeniably kind of"
	done

_OPT_UnbearablyText::
	text_start
	line "zo onweerstaanbaar" ; "so, so unbearably"
	done

_OPT_WowImpressivelyText::
	text_start
	line "wauw, imposant" ; "wow, impressively"
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "bijna giftig" ; "almost poisonously"
	done

_OPT_SensuallyText::
	text_start
	line "ooh, zo sensueel" ; "ooh, so sensually"
	done

_OPT_MischievouslyText::
	text_start
	line "zo ondeugend" ; "so mischievously"
	done

_OPT_TopicallyText::
	text_start
	line "zo zeer actueel" ; "so very topically"
	done

_OPT_AddictivelyText::
	text_start
	line "vast verslavend" ; "sure addictively"
	done

_OPT_LooksInWaterText::
	text_start
	line "kijkt in water" ; "looks in water is"
	done

_OPT_EvolutionMustBeText::
	text_start
	line "evolutie is vast" ; "evolution must be"
	done

_OPT_ProvocativelyText::
	text_start
	line "proactief" ; "provocatively"
	done

_OPT_FlippedOutText::
	text_start
	line "dus ik flipte en" ; "so flipped out and"
	done

_OPT_HeartMeltinglyText::
	text_start
	line "hartvertederend" ; "heart-meltingly"
	done

_OPT_CuteText::
	text_start
	line "schattig." ; "cute."
	done

_OPT_WeirdText::
	text_start
	line "raar." ; "weird."
	done

_OPT_PleasantText::
	text_start
	line "plezant." ; "pleasant."
	done

_OPT_BoldSortOfText::
	text_start
	line "stoutmoedig." ; "bold, sort of."
	done

_OPT_FrighteningText::
	text_start
	line "beangstigend." ; "frightening."
	done

_OPT_SuaveDebonairText::
	text_start
	line "zacht en lief!" ; "suave & debonair!"
	done

_OPT_PowerfulText::
	text_start
	line "krachtig." ; "powerful."
	done

_OPT_ExcitingText::
	text_start
	line "opwindend." ; "exciting."
	done

_OPT_GroovyText::
	text_start
	line "groovy!"
	done

_OPT_InspiringText::
	text_start
	line "inspirerend." ; '"inspiring.'
	done

_OPT_FriendlyText::
	text_start
	line "vriendelijk." ; "friendly."
	done

_OPT_HotHotHotText::
	text_start
	line "heet, heet, heet!" ; "hot, hot, hot!"
	done

_OPT_StimulatingText::
	text_start
	line "stimulerend." ; "stimulating."
	done

_OPT_GuardedText::
	text_start
	line "waakzaam." ; "guarded."
	done

_OPT_LovelyText::
	text_start
	line "lief." ; "lovely."
	done

_OPT_SpeedyText::
	text_start
	line "snel." ; "speedy."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_end

	text_end ; unreferenced

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: #MONMUZIEK" ; "BEN: #MON MUSIC"
	done

_BenIntroText2::
	text_start
	line "KANAAL!" ; "CHANNEL!"
	done

_BenIntroText3::
	text_start
	line "Met mij, DJ BEN!" ; "It's me, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FERN: #MUZIEK!" ; "FERN: #MUSIC!"
	done

_FernIntroText2::
	text_start
	line "Met DJ FERN!" ; "With DJ FERN!"
	done

_BenFernText1::
	text_start
	line "Het is @" ; "Today's @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "dus we draaien" ; "so let us jam to"
	done

_BenFernText2B::
	text_start
	line "chill maar met" ; "so chill out to"
	done

_BenFernText3A::
	text_start
	line "#MON-Mars!" ; "#MON March!"
	done

_BenFernText3B::
	text_start
	line "#MON-Slaaplied!" ; "#MON Lullaby!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "REED: Yeehaw! Hoe" ; "REED: Yeehaw! How"
	done

_LC_Text2::
	text_start
	line "issie?" ; "y'all doin' now?"
	done

_LC_Text3::
	text_start
	line "Of je nou boven" ; "Whether you're up"
	done

_LC_Text4::
	text_start
	line "of onder bent," ; "or way down low,"
	done

_LC_Text5::
	text_start
	line "mis niet de" ; "don't you miss the"
	done

_LC_Text6::
	text_start
	line "LOTTOSHOW!" ; "LUCKY NUMBER SHOW!"
	done

_LC_Text7::
	text_start
	line "Het nummer deze" ; "This week's Lucky"
	done

_LC_Text8::
	text_start
	line "week is @" ; "Number is @"
	text_pause
	text_ram wStringBuffer1 ; MaxLength 5
	text "!"
	done

_LC_Text9::
	text_start
	line "Ik herhaal het!" ; "I'll repeat that!"
	done

_LC_Text10::
	text_start
	line "Check en ga naar" ; "Match it and go to"
	done

_LC_Text11::
	text_start
	line "de RADIOTOREN!" ; "the RADIO TOWER!"
	done

_LC_DragText1::
	text_start
	line "…Mijzelf herhalen" ; "…Repeating myself"
	done

_LC_DragText2::
	text_start
	line "wordt vervelend…" ; "gets to be a drag…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "PLEKKEN EN MENSEN!" ; "PLACES AND PEOPLE!"
	done

_PnP_Text2::
	text_start
	line "Gepresenteerd door" ; "Brought to you by"
	done

_PnP_Text3::
	text_start
	line "mij, DJ LILY!" ; "me, DJ LILY!"
	done

_PnP_Text4:: ; This string is technically potentially too long, even in English. Suppress warnings.
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength 0
	text " @"
	text_ram wStringBuffer1 ; MaxLength 0
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "is schattig." ; "is cute."
	done

_PnP_LazyText::
	text_start
	line "is wat lui." ; "is sort of lazy."
	done

_PnP_HappyText::
	text_start
	line "is altijd blij." ; "is always happy."
	done

_PnP_NoisyText::
	text_start
	line "is een aagje." ; "is quite noisy."
	done

_PnP_PrecociousText::
	text_start
	line "is voorlijk." ; "is precocious."
	done

_PnP_BoldText::
	text_start
	line "is stoutmoedig." ; "is somewhat bold."
	done

_PnP_PickyText::
	text_start
	line "is kieskeurig!" ; "is too picky!"
	done

_PnP_SortOfOKText::
	text_start
	line "is best oké." ; "is sort of OK."
	done

_PnP_SoSoText::
	text_start
	line "is maar matig." ; "is just so-so."
	done

_PnP_GreatText::
	text_start
	line "is eigenlijk top." ; "is actually great."
	done

_PnP_MyTypeText::
	text_start
	line "is echt mijn type." ; "is just my type."
	done

_PnP_CoolText::
	text_start
	line "is echt cool, he?" ; "is so cool, no?"
	done

_PnP_InspiringText::
	text_start
	line "is inspirerend!" ; "is inspiring!"
	done

_PnP_WeirdText::
	text_start
	line "is best raar." ; "is kind of weird."
	done

_PnP_RightForMeText::
	text_start
	line "past bij me?" ; "is right for me?"
	done

_PnP_OddText::
	text_start
	line "is echt apart!" ; "is definitely odd!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxLandmarkLength
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… …Ahem, wij zijn" ; "… …Ahem, we are"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Na drie jaar aan" ; "After three years"
	done

_RocketRadioText4::
	text_start
	line "voorbereiding zijn" ; "of preparation, we"
	done

_RocketRadioText5::
	text_start
	line "we teruggekeerd" ; "have risen again"
	done

_RocketRadioText6::
	text_start
	line "na onze val!" ; "from the ashes!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Hoor je" ; "Can you"
	done

_RocketRadioText8::
	text_start
	line "ons?@" ; "hear?@"
	text_pause
	text " Ja, gelukt!" ; " We did it!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Waar is onze baas?" ; "Where is our boss?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Luistert hij?" ; "Is he listening?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: BUENA hier!" ; "BUENA: BUENA here!"
	done

_BuenaRadioText2::
	text_start
	line "Het wachtwoord!" ; "Today's password!"
	done

_BuenaRadioText3::
	text_start
	line "Vandaag, uhm… Is" ; "Let me think… It's"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxLandmarkLength
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Vergeet het niet!" ; "Don't forget it!"
	done

_BuenaRadioText6::
	text_start
	line "Ik zit in GOLDEN-" ; "I'm in GOLDENROD's"
	done

_BuenaRadioText7::
	text_start
	line "ROD's RADIOTOREN!" ; "RADIO TOWER!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh jee…" ; "BUENA: Oh my…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Middernacht! Ik" ; "It's midnight! I"
	done

_BuenaRadioMidnightText3::
	text_start
	line "moet afsluiten!" ; "have to shut down!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Bedankt dat je" ; "Thanks for tuning"
	done

_BuenaRadioMidnightText5::
	text_start
	line "luisterde! Maar" ; "in to the end! But"
	done

_BuenaRadioMidnightText6::
	text_start
	line "blijf niet te lang" ; "don't stay up too"
	done

_BuenaRadioMidnightText7::
	text_start
	line "wakker! Ik was" ; "late! Presented to"
	done

_BuenaRadioMidnightText8::
	text_start
	line "DJ BUENA!" ; "you by DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text "Ik ga weer!" ; "I'm outta here!"
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
	line "riep" ; "withdrew"
	cont "@"
	text_ram wEnemyMonNickname
	text " terug!" ; "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "deed @" ; "used @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxItemNameLength
	text_start
	cont "op @" ; "on @"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "Dat kun je nu niet" ; "That can't be used"
	line "gebruiken." ; "right now."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "Dit voorwerp kan" ; "That item can't be"
	line "niet in je TAS." ; "put in the PACK."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text "De @" ; "The @"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text_start
	line "is weggestopt in" ; "was put in the"
	cont "je TAS." ; "PACK."
	done

_RemainingTimeText:: ; unreferenced
	text "Resterende tijd" ; "Remaining Time"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "Je #MON is" ; "Your #MON's HP"
	line "genezen." ; "was healed."
	prompt

_WarpingText:: ; unreferenced
	text "Teleporteren…" ; "Warping…"
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Welk nummer" ; "Which number"
	line "moet veranderd?" ; "should be changed?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Wil je spelen met" ; "Will you play with"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "twee #MON ver-" ; "You need two #-"
	line "eist voor fokken." ; "MON for breeding."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Fokken is niet" ; "Breeding is not"
	line "mogelijk." ; "possible."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "Compatibiliteit is" ; "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Moeten ze fokken?" ; "Should they breed?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "Er is geen EI." ; "There is no EGG."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "Het ei gaat" ; "It's going to"
	line "uitkomen!" ; "hatch!"
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
	text "Einde!" ; "End!"
	done

_ForABoyText:: ; unreferenced
	text "Voor een jongen!" ; "For a boy!"
	done

_ForAGirlText:: ; unreferenced
	text "Voor een meisje!" ; "For a girl!"
	done

_DoesntConcernABoyText:: ; unreferenced
	text "Dit is niet voor" ; "This doesn't"
	line "een jongen!" ; "concern a boy!"
	done

_TheBoxIsFullText:: ; unreferenced
	text "De BOX is vol!" ; "The BOX is full!"
	done

; Mobile Adapter

_NewCardArrivedText::
	text "Een nieuwe KAART" ; "A new CARD arrived"
	line "kwam van @" ; "from @"
	text_ram wStringBuffer2 ; MaxLength MaxPlayerNameLength
	text "."
	done

_PutCardInCardFolderText::
	text "Stop de KAART in" ; "Put this CARD in"
	line "de KAARTMAP?" ; "the CARD FOLDER?"
	done

_CardWasListedText::
	text_ram wStringBuffer2 ; MaxLength MaxPlayerNameLength
	text "'s KAART is" ; "'s CARD was"
	line "toegevoegd als" ; "listed as no.@"
	cont "nr.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

_StartingLinkText::
	text "Start met link." ; "Starting link."
	done

_LinkTerminatedText::
	text "Link beëindigd." ; "Link terminated."
	done

_ClosingLinkText::
	text "Link sluiten." ; "Closing link."
	done

_ClearTimeLimitText:: ; unreferenced
	text "Haal tijdslimiet" ; "Clear the time"
	line "weg?" ; "limit?"
	done

_TimeLimitWasClearedText:: ; unreferenced
	text "Tijdslimiet is" ; "The time limit was"
	line "weggehaald." ; "cleared."
	done

_PickErrorPacketText:: ; unreferenced
	text "Kies welk pakket" ; "Pick which packet"
	line "als fout?" ; "as an error?"
	done

_TradingMonForOTMonText::
	text "Ruil @" ; "Trading @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text_start
	line "voor @" ; "for @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "…"
	done

; Mobile Adapter End

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "kreeg the" ; "Obtained the"
	line "VOLTORBBADGE!"
	done

_AskFloorElevatorText::
	text "Welke verdieping?" ; "Which floor?"
	done

_BugCatchingContestTimeUpText::
	text "AANKONDIGER: PIEP!" ; "ANNOUNCER: BEEEP!"

	para "Tijd is om!" ; "Time's up!"
	done

_BugCatchingContestIsOverText::
	text "AANKONDIGER: Wed-" ; "ANNOUNCER: The"
	line "strijd is voorbij!" ; "Contest is over!"
	done

_RepelWoreOffText::
	text "Effect VERDRIJF is" ; "REPEL's effect"
	line "uitgewerkt." ; "wore off."
	done

_PlayerFoundItemText::
	text "<PLAYER> vond" ; "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "!"
	done

_ButNoSpaceText::
	text "Maar <PLAYER>" ; "But <PLAYER> has"
	line "heeft geen plek…" ; "no space left…"
	done

_JustSawSomeRareMonText::
	text "Ik zag zeldzame" ; "I just saw some"
	line "@" ; "rare @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " in"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxLandmarkLength
	text "."

	para "Ik bel als ik nog" ; "I'll call you if I"
	line "een zeldzame #-" ; "see another rare"
	cont "MON zie, oke?" ; "#MON, OK?"
	prompt

_SavingRecordText::
	text "GAME OPSLAAN…" ; "SAVING RECORD…"
	line "NIET UITZETTEN!" ; "DON'T TURN OFF!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " ontving" ; " received"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "Munten zijn op." ; "You have no coins."
	prompt

_NoCoinCaseText::
	text "Je hebt geen" ; "You don't have a"
	line "GELDKISTJE." ; "COIN CASE."
	prompt

_NPCTradeCableText::
	text "OK, verbind het" ; "OK, connect the"
	line "Game Link-snoer." ; "Game Link Cable."
	prompt

Text_NPCTraded::
	text "<PLAYER> ruilde" ; "<PLAYER> traded"
	line "@"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " voor" ; " for"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "Ik verzamel #-" ; "I collect #MON."
	line "MON. Heb jij" ; "Do you have"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"

	para "Wil je ruilen voor" ; "Want to trade it"
	line "mijn @" ; "for my @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_NPCTradeCancelText1::
	text "Wil je niet" ; "You don't want to"
	line "ruilen? Aww…" ; "trade? Aww…"
	done

_NPCTradeWrongText1::
	text "Huh? Dat is geen" ; "Huh? That's not"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	cont "Teleurstellend…" ; "What a letdown…"
	done

_NPCTradeCompleteText1::
	text "Hoera! Ik heb een" ; "Yay! I got myself"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "!"
	cont "Bedankt!" ; "Thanks!"
	done

_NPCTradeAfterText1::
	text "Hoe gaat ie met" ; "Hi, how's my old"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " nu?" ; " doing?"
	done

_NPCTradeIntroText2::
	text "Hoi, ik zoek naar" ; "Hi, I'm looking"
	line "deze #MON." ; "for this #MON."

	para "Als je een" ; "If you have"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " hebt," ; ", would"

	para "wil je ruilen voor" ; "you trade it for"
	line "mijn @" ; "my @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_NPCTradeCancelText2::
	text "Heb je ook niet" ; "You don't have"
	line "eentje?" ; "one either?"

	para "Joh, dat is erg" ; "Gee, that's really"
	line "teleurstellend…" ; "disappointing…"
	done

_NPCTradeWrongText2::
	text "Je hebt geen" ; "You don't have"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "? Jammer" ; "? That's"
	cont "maar helaas." ; "too bad, then."
	done

_NPCTradeCompleteText2::
	text "Goed! Bedankt!" ; "Great! Thank you!"

	para "Ik heb eindelijk" ; "I finally got"
	line "een @" ; "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	done

_NPCTradeAfterText2::
	text "Hoi! De @" ; "Hi! The @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_start
	line "die je ruilde" ; "you traded me is"
	cont "doet het goed!" ; "doing great!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " is" ; "'s cute,"
	line "schattig, maar ik" ; "but I don't have"

	para "heb er geen. Heb" ; "it. Do you have"
	line "jij @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"

	para "Wil je ruilen voor" ; "Want to trade it"
	line "mijn @" ; "for my @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_NPCTradeCancelText3::
	text "Wil je niet" ; "You don't want to"
	line "ruilen? Oh, balen…" ; "trade? Oh, darn…"
	done

_NPCTradeWrongText3::
	text "Dat is niet" ; "That's not"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."

	para "Ruil alsjeblieft" ; "Please trade with"
	line "als je een vindt." ; "me if you get one."
	done

_NPCTradeCompleteText3::
	text "Wauw! Dankje!" ; "Wow! Thank you!"
	line "Ik wilde altijd al" ; "I always wanted"
	cont "een @" ; "@"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text "!"
	done

_NPCTradeAfterText3::
	text "Hoe is het met de" ; "How is that"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " die ik" ; " I"
	cont "met je ruilde?" ; "traded you doing?"

	para "Je @" ; "Your @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " is" ; "'s"
	line "zo schattig!" ; "so cute!"
	done

_NPCTradeCompleteText4::
	text "Uh? Wat is er" ; "Uh? What happened?"
	line "gebeurd?"
	done

_NPCTradeAfterText4::
	text "Ruilen is zo gek…" ; "Trading is so odd…"

	para "Ik moet er nog" ; "I still have a lot"
	line "veel over leren." ; "to learn about it."
	done

_MomLeavingText1::
	text "Wauw, wat een" ; "Wow, that's a cute"
	line "schattige #MON." ; "#MON."

	para "Hoe kom je" ; "Where did you get"
	line "er aan?" ; "it?"

	para "…"

	para "Dus, je gaat op" ; "So, you're leaving"
	line "avontuur…" ; "on an adventure…"

	para "Oké!" ; "OK!"
	line "Ik ga ook helpen." ; "I'll help too."

	para "Maar wat kan ik" ; "But what can I do"
	line "voor je doen?" ; "for you?"

	para "Ik weet het! Ik" ; "I know! I'll save"
	line "spaar voor je." ; "money for you."

	para "Geld is heel" ; "On a long journey,"
	line "belangrijk!" ; "money's important."

	para "Wil je dat ik geld" ; "Do you want me to"
	line "spaar?" ; "save your money?"
	done

_MomLeavingText2::
	text "Oke, ik let op je" ; "OK, I'll take care"
	line "geld." ; "of your money."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Wees voorzichtig." ; "Be careful."

	para "#MON zijn je" ; "#MON are your"
	line "vrienden. Werk als" ; "friends. You need"
	cont "een team samen." ; "to work as a team."

	para "Ga nu maar!" ; "Now, go on!"
	done

_MomIsThisAboutYourMoneyText::
	text "Hoi! Welkom thuis!" ; "Hi! Welcome home!"
	line "Je doet hard je" ; "You're trying very"
	cont "best, merk ik." ; "hard, I see."

	para "Ik heb je kamer" ; "I've kept your"
	line "voor je opgeruimd." ; "room tidy."

	para "Of gaat dit over" ; "Or is this about"
	line "je geld?" ; "your money?"
	done

_MomBankWhatDoYouWantToDoText::
	text "Wat wil je doen" ; "What do you want"
	line "ermee?" ; "to do?"
	done

_MomStoreMoneyText::
	text "Hoeveel wil je" ; "How much do you"
	line "sparen?" ; "want to save?"
	done

_MomTakeMoneyText::
	text "Hoeveel wil je" ; "How much do you"
	line "meenemen?" ; "want to take?"
	done

_MomSaveMoneyText::
	text "Wil je wat geld" ; "Do you want to"
	line "sparen?" ; "save some money?"
	done

_MomHaventSavedThatMuchText::
	text "Je hebt nog niet" ; "You haven't saved"
	line "zoveel gespaard." ; "that much."
	prompt

_MomNotEnoughRoomInWalletText::
	text "Zoveel kun je niet" ; "You can't take"
	line "meenemen." ; "that much."
	prompt

_MomInsufficientFundsInWalletText::
	text "Zoveel heb je" ; "You don't have"
	line "niet." ; "that much."
	prompt

_MomNotEnoughRoomInBankText::
	text "Zoveel kun je niet" ; "You can't save"
	line "sparen." ; "that much."
	prompt

_MomStartSavingMoneyText::
	text "Oké, ik bewaar je" ; "OK, I'll save your"
	line "geld. Komt goed!" ; "money. Trust me!"

	para "<PLAYER>, ga zo" ; "<PLAYER>, stick"
	line "door!" ; "with it!"
	done

_MomStoredMoneyText::
	text "Je geld is hier" ; "Your money's safe"
	line "veilig! Ga maar!" ; "here! Get going!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, geef" ; "<PLAYER>, don't"
	line "niet op!" ; "give up!"
	done

_MomJustDoWhatYouCanText::
	text "Doe gewoon je" ; "Just do what"
	line "best." ; "you can."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Ik ben de OPVANG-" ; "I'm the DAY-CARE"
	line "MAN. Zal ik je" ; "MAN. Want me to"
	cont "#MON opvoeden?" ; "raise a #MON?"
	done

_DayCareManIntroEggText::
	text "Ik ben de OPVANG-" ; "I'm the DAY-CARE"
	line "MAN. Weet je al" ; "MAN. Do you know"
	cont "over EIEREN?" ; "about EGGS?"

	para "Ik was een #MON" ; "I was raising"
	line "met mijn vrouw aan" ; "#MON with my"
	cont "het opvoeden." ; "wife, you see."

	para "En ineens lag er" ; "We were shocked to"
	line "een EI bij!" ; "find an EGG!"

	para "Hoe bizar is" ; "How incredible is"
	line "dat?" ; "that?"

	para "Wil je dat ik een" ; "So, want me to"
	line "#MON opvoed?" ; "raise a #MON?"
	done

_DayCareLadyIntroText::
	text "Ik ben de OPVANG-" ; "I'm the DAY-CARE"
	line "VROUW." ; "LADY."

	para "Moet ik een #-" ; "Should I raise a"
	line "MON opvoeden?" ; "#MON for you?"
	done

_DayCareLadyIntroEggText::
	text "Ik ben de OPVANG-" ; "I'm the DAY-CARE"
	line "VROUW. Weet je al" ;  "LADY. Do you know"
	cont "over EIEREN?" ; "about EGGS?"

	para "Ik was een #MON" ; "My husband and I"
	line "met mijn man aan" ; "were raising some"
	cont "het opvoeden." ; "#MON, you see."

	para "En ineens lag er" ; "We were shocked to"
	line "een EI bij!" ; "find an EGG!"

	para "Hoe bizar is" ; "How incredible"
	line "dat?" ; "could that be?"

	para "Wil je dat ik een" ; "Should I raise a"
	line "#MON opvoed?" ; "#MON for you?"
	done

_WhatShouldIRaiseText::
	text "Wat moet ik voor" ; "What should I"
	line "je opvoeden?" ; "raise for you?"
	prompt

_OnlyOneMonText::
	text "Oh? Je hebt maar" ; "Oh? But you have"
	line "één #MON." ; "just one #MON."
	prompt

_CantAcceptEggText::
	text "Sorry, maar ik kan" ; "Sorry, but I can't"
	line "geen EI aannemen." ; "accept an EGG."
	prompt

_RemoveMailText::
	text "Verwijder POST" ; "Remove MAIL before"
	line "voor je langskomt." ; "you come see me."
	prompt

_LastHealthyMonText::
	text "Als je dat geeft," ; "If you give me"
	line "waar vecht jij" ; "that, what will"
	cont "dan mee?" ; "you battle with?"
	prompt

_IllRaiseYourMonText::
	text "Oke, ik voed je" ; "OK. I'll raise"
	line "@" ; "your @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " op."
	prompt

_ComeBackLaterText::
	text "Kom er later voor" ; "Come back for it"
	line "terug." ; "later."
	done

_AreWeGeniusesText::
	text "Zijn we briljant" ; "Are we geniuses or"
	line "of niet? Check" ; "what? Want to see"
	cont "je @" ; "your @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_YourMonHasGrownText::
	text "Je @" ; "Your @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "is veel gegroeid." ; "has grown a lot."

	para "Qua level is ie" ; "By level, it's"
	line "gegroeid met @" ; "grown by @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Als je de #MON" ; "If you want your"
	line "terug wil, kost je" ; "#MON back, it"
	cont "dat ¥@" ; "will cost ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfect! Hier is" ; "Perfect! Here's"
	line "je #MON." ; "your #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> kreeg" ; "<PLAYER> got back"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " terug." ; "."
	prompt

_BackAlreadyText::
	text "Huh? Alweer terug?" ; "Huh? Back already?"
	line "Je @" ; "Your @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	para "heeft wat meer" ; "needs a little"
	line "tijd nodig." ; "more time with us."

	para "Als je de #MON" ; "If you want your"
	line "terug wil, kost" ; "#MON back, it"
	cont "dat je ¥100." ; "will cost ¥100."
	done

_HaveNoRoomText::
	text "Je hebt er geen" ; "You have no room"
	line "plek voor." ; "for it."
	prompt

_NotEnoughMoneyText::
	text "Je hebt niet" ; "You don't have"
	line "genoeg geld." ; "enough money."
	prompt

_OhFineThenText::
	text "Oh, prima dan." ; "Oh, fine then."
	prompt

_ComeAgainText::
	text "Tot snel." ; "Come again."
	done

_NotYetText::
	text "Nog niet…" ; "Not yet…"
	done

_FoundAnEggText::
	text "Ah, jij bent het!" ; "Ah, it's you!"

	para "We waren op je" ; "We were raising"
	line "#MON aan het" ; "your #MON, and"

	para "letten, en jeetje" ; "my goodness, were"
	line "wat verrassend!" ; "we surprised!"

	para "Je #MON had" ; "Your #MON had"
	line "een EI!" ; "an EGG!"

	para "We weten niet waar" ; "We don't know how"
	line "die weg kwam, maar" ; "it got there, but"

	para "je #MON had" ; "your #MON had"
	line "hem. Wil je hem?" ; "it. You want it?"
	done

_ReceivedEggText::
	text "<PLAYER> kreeg" ; "<PLAYER> received"
	line "het EI!" ; "the EGG!"
	done

_TakeGoodCareOfEggText::
	text "Pas er goed" ; "Take good care of"
	line "op." ; "it."
	done

_IllKeepItThanksText::
	text "Nou dan, dan houd" ; "Well then, I'll"
	line "ik hem. Bedankt!" ; "keep it. Thanks!"
	done

_NoRoomForEggText::
	text "Je hebt geen plek" ; "You have no room"
	line "in je team." ; "in your party."
	cont "Kom later terug." ; "Come back later."
	done

_WhichMonPhotoText::
	text "Welke #MON" ; "Which #MON"
	line "moet op de foto?" ; "should I photo-"
	; cont "graph?"
	prompt

_HoldStillText::
	text "Okiedokie, sta" ; "All righty. Hold"
	line "even stil." ; "still for a bit."
	prompt

_PrestoAllDoneText::
	text "Presto! Klaar." ; "Presto! All done."
	line "Kom nog eens, OK?" ; "Come again, OK?"
	done
