_OakText6::
	text "Oké, wat was ook" ; "Now, what did you"
	line "alweer je naam?" ; "say your name was?"
	prompt

_OakText7::
	text "<PLAYER>, ben je" ; " ; "<PLAYER>, are you"
	line "er klaar voor?" ; "ready?"

	para "Jouw #MON-" ; "Your very own"
	line "verhaal gaat" ; "#MON story is"
	cont "nu beginnen." ; "about to unfold."

	para "Er volgen leuke" ; "You'll face fun"
	line "dingen en lastige" ; "times and tough"
	cont "uitdagingen." ; "challenges."

	para "Een wereld vol" ; "A world of dreams"
	line "dromen en avontuur" ; "and adventures"

	para "met #MON" ; "with #MON"
	line "wacht op je! Kom!" ; "awaits! Let's go!"

	para "Ik zie je later" ; "I'll be seeing you"
	line "weer!" ; "later!"
	done

_ClockTimeMayBeWrongText::
	text "Wellicht staat de" ; "The clock's time"
	line "klok verkeerd." ; "may be wrong."

	para "Stel de tijd" ; "Please reset the"
	line "opnieuw in." ; "time."
	prompt

_ClockSetWithControlPadText::
	text "Stel in met de" ; "Set with the"
	line "richtingstoetsen." ; "Control Pad."

	para "Bevestig: A-knop" ; "Confirm: A Button"
	line "Annuleer:  B-knop" ; "Cancel:  B Button"
	done

_ClockIsThisOKText::
	text "Is dit OK?" ; "Is this OK?"
	done

_ClockHasResetText::
	text "De klok is" ; "The clock has been"
	line "gereset." ; "reset."
	done

_LinkTimeoutText::
	text "Er is teveel tijd" ; "Too much time has"
	line "gepasseerd. Pro-" ; "elapsed. Please"
	cont "beer nog eens." ; "try again."
	prompt

_LinkTradeCantBattleText::
	text "Als je die #MON" ; "If you trade that"
	line "ruilt, kun je niet" ; "#MON, you won't"
	cont "vechten." ; "be able to battle."
	prompt

_LinkAbnormalMonText::
	text "De @" ; "Your friend's"
	; line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "van je vriend" ; text " appears"
	cont "is abnormaal!" ; "to be abnormal!"
	prompt

_LinkAskTradeForText::
	text "Ruil @" ; "Trade @"
	text_ram wBufferTrademonNickname
	text_start
	line "voor @" ; "for @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "Voor een mobiel" ; "To enter a mobile"
	line "gevecht moet je" ; "battle, you must"

	para "een team van drie" ; "pick a team of"
	line "#MON kiezen." ; "three #MON."

	para "Is dat goed?" ; "Is that OK?"
	done

_MobileBattleMoreInfoText::
	text "Wil je meer info" ; "Need more info on"
	line "over gevechten?" ; "mobile battles?"
	done

_MobileBattleRulesText::
	text "Bij een gevecht" ; "For a mobile"
	line "selecteer je" ; "battle, choose"
	cont "drie #MON." ; "three #MON."

	para "De maximum speel-" ; "The maximum daily"
	line "tijd is tien" ; "play time is ten"

	para "minuten voor elke" ; "minutes for each"
	line "gelinkte speler." ; "linked player."

	para "Duurt een gevecht" ; "If a battle isn't"
	line "te lang, dan wint" ; "finished within"

	para "de speler met de" ; "the time limit,"
	line "meeste resterende" ; "the player with"

	para "#MON in" ; "the fewest fainted"
	line "het team." ; "#MON wins."

	para "Bij gelijkspel" ; "If tied, the team"
	line "wint het team dat" ; "that lost the"

	para "het minste schade" ; "least amount of HP"
	line "kreeg." ; "wins."
	done

_WouldYouLikeToMobileBattleText::
	text "De resterende tijd" ; "Today's remaining"
	line "vandaag is @" ; "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Wil je gaan" ; "Would you like to"
	line "vechten?" ; "battle?"
	done

_WantAQuickMobileBattleText::
	text "Er zijn nog @" ; "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. over vandaag." ; "min. left today."

	para "Wil je een snel" ; "Want a quick"
	line "gevecht?" ; "battle?"
	done

_WantToRushThroughAMobileBattleText::
	text "Er is vandaag nog" ; "There is only"
	line "1 minuut over!" ; "1 min. left today!"

	para "Wil je haastend" ; "Want to rush"
	line "de strijd aan?" ; "through a battle?"
	done

_PleaseTryAgainTomorrowText::
	text "Er is nog minder" ; "There is less than"
	line "dan een minuut!" ; "1 min. left today!"

	para "Probeer morgen" ; "Please try again"
	line "nog eens." ; "tomorrow."
	done

_TryAgainUsingSameSettingsText::
	text "Opnieuw met zelf-" ; "Try again using"
	line "de instellingen?" ; "the same settings?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "Minder dan 1 min." ; "There is less than"
	line "over vandaag!" ; "1 min. left today!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "Geen tijd om van-" ; "No time left for"
	line "daag te linken." ; "linking today."
	done

_PickThreeMonForMobileBattleText::
	text "Kies drie #MON" ; "Pick three #MON"
	line "voor gevecht." ; "for battle."
	done

_MobileBattleRemainingTimeText::
	text "Resterende tijd" ; "Today's remaining"
	line "vandaag is @" ; "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

_WouldYouLikeToSaveTheGameText::
	text "Wil je de game" ; "Would you like to"
	line "opslaan?" ; "save the game?"
	done

_SavingDontTurnOffThePowerText::
	text "OPSLAAN… NIET" ; "SAVING… DON'T TURN"
	line "UITSCHAKELEN." ; "OFF THE POWER."
	done

_SavedTheGameText::
	text "<PLAYER> sloeg het" ; "<PLAYER> saved"
	line "spel op." ; "the game."
	done

_AlreadyASaveFileText::
	text "Er is al een op-" ; "There is already a"
	line "slagbestand. OK om" ; "save file. Is it"
	cont "te overschrijven?" ; "OK to overwrite?"
	done

_AnotherSaveFileText::
	text "Er is nog een op-" ; "There is another"
	line "slagbestand. OK om" ; "save file. Is it"
	cont "te overschrijven?" ; "OK to overwrite?"
	done

_SaveFileCorruptedText::
	text "Het opslagbestand" ; "The save file is"
	line "is gecorrumpeerd!" ; "corrupted!"
	prompt

_ChangeBoxSaveText::
	text "Als je wisselt van" ; "When you change a"
	line "#MON-BOX wordt" ; "#MON BOX, data"
	cont "data bewaard. OK?" ; "will be saved. OK?"
	done

_MoveMonWOMailSaveText::
	text "Als je een #MON" ; "Each time you move"
	line "verplaatst, wordt" ; "a #MON, data"
	cont "opgeslagen. OK?" ; "will be saved. OK?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "'Window save area'" ; "The window save"
	line "overschreden." ; "area was exceeded."
	done

_WindowPoppingErrorText::
	text "Geen vensters meer" ; "No windows avail-"
	line "voor pops." ; "able for popping."
	done

_CorruptedEventText:: ; unreferenced
	text "Corrupt evenement!" ; "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object-evenement" ; "Object event"
	done

_BGEventText::
	text "BG-evenement" ; "BG event"
	done

_CoordinatesEventText::
	text "Coordineert event" ; "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxItemNameLength
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> stopte" ; "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text " in"
	cont "de @" ; "the @"
	text_ram wStringBuffer3 ; MaxLength MaxBagPocketNameLength
	text "."
	prompt

_PocketIsFullText::
	text "De @" ; "The @"
	text_ram wStringBuffer3 ; MaxLength MaxBagPocketNameLength
	text_start
	line "is vol…" ; "is full…"
	prompt

_SeerSeeAllText::
	text "Ik zie alles." ; "I see all."
	line "Ik weet alles…" ; "I know all…"

	para "Uiteraard weet ik" ; "Certainly, I know"
	line "van jouw #MON!" ; "of your #MON!"
	done

_SeerCantTellAThingText::
	text "Waaaaat? Ik kan" ; "Whaaaat? I can't"
	line "niks zeggen!" ; "tell a thing!"

	para "Hoe kan ik hier" ; "How could I not"
	line "niks van weten?" ; "know of this?"
	done

_SeerNameLocationText::
	text "Hm… Ik zie dat je" ; "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " hier" ; " here:"
	cont "zag:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "De tijd was" ; "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Het level was @" ; "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Ik ben goed he?" ; "Am I good or what?"
	prompt

_SeerTradeText::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "kwam van @" ; "came from @"
	text_ram wSeerOT
	text_start
	cont "bij een ruil?" ; "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was waar @" ; "was where @"
	text_ram wSeerOT
	text_start
	cont "@" ; "met @"
	text_ram wSeerNickname
	text " ont-" ; "!"
	cont "moette!"
	prompt

_SeerNoLocationText::
	text "Wat!? Bizar!" ; "What!? Incredible!"

	para "Ik snap niet hoe," ; "I don't understand"
	line "maar het is" ; "how, but it is"

	para "onvoorstelbaar!" ; "incredible!"
	line "Jij bent speciaal." ; "You are special."

	para "Ik weet niet waar" ; "I can't tell where"
	line "je het ontmoette," ; "you met it, but it"
	cont "maar het was" ; "was at level @"
	cont "level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Ik ben goed he?" ; "Am I good or what?"
	prompt

_SeerEggText::
	text "Hé!" ; "Hey!"

	para "Dat is een EGG!" ; "That's an EGG!"

	para "Strikt gezien heb" ; "You can't say that"
	line "die niet ontmoet…" ; "you've met it yet…"
	done

_SeerDoNothingText::
	text "Fufufu! Ik zag dat" ; "Fufufu! I saw that"
	line "je niks zou doen!" ; "you'd do nothing!"
	done

_SeerMoreCareText::
	text "Incidenteel…" ; "Incidentally…"

	para "Het zou wijs zijn" ; "It would be wise"
	line "je #MON met wat" ; "to raise your"

	para "meer zorg op te" ; "#MON with a"
	line "voeden." ; "little more care."
	done

_SeerMoreConfidentText::
	text "Incidenteel…" ; "Incidentally…"

	para "Het is een klein" ; "It seems to have"
	line "beetje geroeid." ; "grown a little."

	para "@"
	text_ram wSeerNickname
	text " lijkt" ; " seems"
	line "meer vertrouwen te" ; "to be becoming"
	cont "krijgen." ; "more confident."
	done

_SeerMuchStrengthText::
	text "Incidenteel…" ; "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " is" ; " has"
	line "gegroeid en nu" ; "grown. It's gained"
	cont "veel sterker." ; "much strength."
	done

_SeerMightyText::
	text "Incidenteel…" ; "Incidentally…"

	para "Het is een machtig" ; "It certainly has"
	line "wezen geworden!" ; "grown mighty!"

	para "Deze @" ; "This @"
	text_ram wSeerNickname
	text_start
	line "heeft vele ge-" ; "must have come"

	para "gevechten gestre-" ; "through numerous"
	line "den." ; "#MON battles."

	para "Het zelfvertrouwen" ; "It looks brimming"
	line "straalt er van af." ; "with confidence."
	done

_SeerImpressedText::
	text "Incidenteel…" ; "Incidentally…"

	para "Je toewijding is" ; "I'm impressed by"
	line "indrukwekkend." ; "your dedication."

	para "Het is lang sinds" ; "It's been a long"
	line "ik een #MON zag" ; "time since I've"

	para "die zo machtig" ; "seen a #MON as"
	line "was @" ; "mighty as this"
	; cont "@"
	text_ram wSeerNickname
	text "."

	para "Iedereen zou" ; "I'm sure that"
	line "@" ; "seeing @"
	text_ram wSeerNickname
	text_start

	para "graag in een ge-" ; "in battle would"
	line "vecht zien." ; "excite anyone."
	done

_CongratulationsYourPokemonText::
	text "Gefeliciteerd!" ; "Congratulations!"
	line "Je @" ; "Your @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "evolueerde in" ; "evolved into"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "!"
	done

_StoppedEvolvingText:: ; TODO: String too long
	text "Huh? @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text_start
	line "stopte de" ; "stopped evolving!"
	cont "evolutie!"
	prompt

_EvolvingText::
	text "Wat? @" ; "What? @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text_start
	line "evolueert!" ; "is evolving!"
	done

_MartHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start ; text "(S)"
	line "is dan ¥@" ; "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hallo, schat." ; "Hello, dear."

	para "Ik heb goedkope" ; "I sell inexpensive"
	line "kruidenmedicijnen." ; "herbal medicine."

	para "Ze werken goed," ; "They're good, but"
	line "maar zijn bitter." ; "a trifle bitter."

	para "Je #MON vindt" ; "Your #MON may"
	line "ze wellicht vies." ; "not like them."

	para "Hehehehe…"
	done

_HerbalLadyHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start ; text "(S)"
	line "is dan ¥@" ; "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Dankje, schat." ; "Thank you, dear."
	line "Hehehehe…"
	done

_HerbalLadyPackFullText::
	text "Oh? Je TAS is" ; "Oh? Your PACK is"
	line "vol, schat." ; "full, dear."
	done

_HerbalLadyNoMoneyText::
	text "Hehehe… Je hebt" ; "Hehehe… You don't"
	line "niet genoeg geld." ; "have the money."
	done

_HerbalLadyComeAgainText::
	text "Tot snel, schat." ; "Come again, dear."
	line "Hehehehe…"
	done

_BargainShopIntroText::
	text "Hoihoi! Wil je wat" ; "Hiya! Care to see"
	line "koopjes zien?" ; "some bargains?"

	para "Ik heb zeldzaam" ; "I sell rare items"
	line "spul dat je ner-" ; "that nobody else"

	para "gens vindt--maar" ; "carries--but only"
	line "eentje van elk." ; "one of each item."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " kost" ; " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Wil je" ; ". Want it?"
	cont "het?"
	done

_BargainShopThanksText::
	text "Bedankt." ; "Thanks."
	done

_BargainShopPackFullText::
	text "Uh-oh, je TAS" ; "Uh-oh, your PACK"
	line "zit tjokvol." ; "is chock-full."
	done

_BargainShopSoldOutText::
	text "Je hebt dat al" ; "You bought that"
	line "gekocht. Ik hebl" ; "already. I'm all"
	cont "niet meer." ; "sold out of it."
	done

_BargainShopNoFundsText::
	text "Uh-oh, je heb te" ; "Uh-oh, you're"
	line "weinig geld." ; "short on funds."
	done

_BargainShopComeAgainText::
	text "Kom nog eens" ; "Come by again"
	line "langs." ; "sometime."
	done

_PharmacyIntroText::
	text "Wat is er? Heb je" ; "What's up? Need"
	line "medicijnen nodig?" ; "some medicine?"
	done

_PharmacyHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start ; text "(S)"
	line "kost je ¥@" ; "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Veel dank!" ; "Thanks much!"
	done

_PharmacyPackFullText::
	text "Je hebt geen" ; "You don't have any"
	line "plek meer." ; "more space."
	done

_PharmacyNoMoneyText::
	text "Huh? Dat is te" ; "Huh? That's not"
	line "weinig geld." ; "enough money."
	done

_PharmacyComeAgainText::
	text "Oké." ; "All right."
	line "Tot later weer." ; "See you around."
	done

_NothingToSellText::
	text "Je hebt niks om te" ; "You don't have"
	line "verkopen." ; "anything to sell."
	prompt

_MartSellHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_MartSellPriceText::
	text "Ik kan je" ; "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text " betalen." ; "."

	para "Is dat OK?" ; "Is that OK?"
	done

_MartWelcomeText::
	text "Welkom! Hoe kan ik" ; "Welcome! How may I"
	line "je helpen?" ; "help you?"
	done

_MartThanksText::
	text "Hier is het." ; "Here you are."
	line "Dankjewel!" ; "Thank you!"
	done

_MartNoMoneyText::
	text "Je hebt te weinig" ; "You don't have"
	line "geld." ; "enough money."
	done

_MartPackFullText::
	text "Je kunt geen spul-" ; "You can't carry"
	line "len meer dragen." ; "any more items."
	done

_MartCantBuyText::
	text "Sorry, dat kan ik" ; "Sorry, I can't buy"
	line "niet van je kopen." ; "that from you."
	prompt

_MartComeAgainText::
	text "Kom snel weer!" ; "Please come again!"
	done

_MartAskMoreText::
	text "Kan ik nog iets" ; "Can I do anything"
	line "voor je doen?" ; "else for you?"
	done

_MartBoughtText::
	text "Heb ¥@" ; "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " voor" ; " for"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "." ; "(S)."
	done

_SlotsBetHowManyCoinsText::
	text "Hoeveel" ; "Bet how many"
	line "wedden?" ; "coins?"
	done

_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Te weinig" ; "Not enough"
	line "munten." ; "coins."
	prompt

_SlotsRanOutOfCoinsText::
	text "Verdorie… Geen" ; "Darn… Ran out of"
	line "munten meer…" ; "coins…"
	done

_SlotsPlayAgainText::
	text "Weer spelen?" ; "Play again?"
	done

_SlotsLinedUpText::
	text "op een rij!" ; "lined up!"
	line "Won @"
	text_ram wStringBuffer2 ; MaxLength 3
	text " munten!" ; " coins!"
	done

_SlotsDarnText::
	text "Verdorie!" ; "Darn!"
	done

_MobileStadiumEntryText::
	text "Data voor gebruik" ; "Data for use in"
	line "in MOBILE STADIUM" ; "the MOBILE STADIUM"

	para "van #MON" ; "of the N64 #MON"
	line "STADIUM 2 kan hier" ; "STADIUM 2 can be"
	cont "worden gelezen." ; "read here."

	para "Lees de data?" ; "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Dataverplaatsing" ; "Data transfer is"
	line "voltooid." ; "complete."

	para "Veel plezier met" ; "We hope you enjoy"
	line "MOBILE STADIUM"

	para "gevechten in" ; "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Kloktijd onbekend" ; "Clock time unknown"
	done

_DeleteSavedLoginPasswordText::
	text "Wis opgeslagen" ; "Delete the saved"
	line "LOG-IN WACHTWOORD?" ; "LOG-IN PASSWORD?"
	done

_DeletedTheLoginPasswordText::
	text "LOG-IN WACHTWOORD" ; "Deleted the LOG-IN"
	line "gewist." ; "PASSWORD."
	done

_MobilePickThreeMonForBattleText::
	text "Kies drie #MON" ; "Pick three #MON"
	line "voor gevecht." ; "for battle."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " en" ; " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Gebruik deze drie?" ; "Use these three?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Plek voor maar" ; "Only three #MON"
	line "drie #MON." ; "may enter."
	prompt

_MobileCardFolderIntro1Text::
	text "De KAARTMAP" ; "The CARD FOLDER"
	line "bewaart KAARTEN" ; "stores your and"

	para "afkomstig van je" ; "your friends'"
	line "vrienden." ; "CARDS."

	para "Een KAART bevat" ; "A CARD contains"
	line "informatie zoals" ; "information like"

	para "een naam, tele-," ; "the person's name,"
	line "foonnummer en" ; "phone number and"
	cont "profiel." ; "profile."

	para ""
	done

_MobileCardFolderIntro2Text::
	text "Dit is jouw KAART." ; "This is your CARD."

	para "Na het delen van" ; "Once you've"
	line "je telefoonnummer," ; "entered your phone"

	para "kun je KAARTEN" ; "number, you can"
	line "ruilen met je" ; "trade CARDS with"
	cont "vrienden." ; "your friends."

	para ""
	done

_MobileCardFolderIntro3Text::
	text "Als je de KAART" ; "If you have your"
	line "van een vriend" ; "friend's CARD, you"

	para "hebt, kun je el-" ; "can use it to make"
	line "kaar bellen op de" ; "a call from a"

	para "eerste verdieping" ; "mobile phone on"
	line "van een" ; "the 2nd floor of a"
	cont "#MONCENTRUM." ; "#MON CENTER."

	para ""
	done

_MobileCardFolderIntro4Text::
	text "Om je collectie" ; "To safely store"
	line "kaarten veilig te" ; "your collection of"

	para "bewaren moet je" ; "CARDS, you must"
	line "WACHTWOORD voor je" ; "set a PASSCODE for"
	cont "KAARTMAP kiezen." ; "your CARD FOLDER."

	para ""
	done

_MobileCardFolderAskDeleteText::
	text "Verwijder je de" ; "If the CARD FOLDER"
	line "KAARTMAP, dan raak" ; "is deleted, all"

	para "je de KAARTEN en" ; "its CARDS and the"
	line "je WACHTWOORD ook" ; "PASSCODE will also"
	cont "kwijt." ; "be deleted."

	para "Pas op-een gewiste" ; "Beware--a deleted"
	line "KAARTMAP is niet" ; "CARD FOLDER can't"
	cont "te herstellen." ; "be restored."

	para "Wil je jouw KAART-" ; "Want to delete"
	line "MAP verwijderen?" ; "your CARD FOLDER?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Weet je zeker dat" ; "Are you sure you"
	line "je hem wil wissen?" ; "want to delete it?"
	done

_MobileCardFolderDeletedText::
	text "De KAARTMAP" ; "The CARD FOLDER"
	line "is verwijderd." ; "has been deleted."

	para ""
	done

_MobileCardFolderAskOpenOldText::
	text "Er is een oudere" ; "There is an older"
	line "KAARTMAP van een" ; "CARD FOLDER from a"
	cont "eerdere reis." ; "previous journey."

	para "Wil je deze" ; "Do you want to"
	line "open maken?" ; "open it?"
	done

_MobileCardFolderAskDeleteOldText::
	text "Verwijder de oude" ; "Delete the old"
	line "KAARTMAP?" ; "CARD FOLDER?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Klaar met opslaan" ; "Finish registering"
	line "van KAARTEN?" ; "CARDS?"
	done

_PhoneWrongNumberText::
	text "Huh? Sorry, fout" ; "Huh? Sorry, wrong"
	line "nummer!" ; "number!"
	done

_PhoneClickText::
	text "Klik!" ; "Click!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Dat nummer is" ; "That number is out"
	line "buiten bereik." ; "of the area."
	done

_PhoneJustTalkToThemText::
	text "Ga gewoon met ze" ; "Just go talk to"
	line "praten!" ; "that person!"
	done

_PhoneThankYouText::
	text "Bedankt!" ; "Thank you!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Wachtwoord OK." ; "Password OK."
	line "Kies VERDER &" ; "Select CONTINUE &"
	cont "reset instellingen" ; "reset settings."
	prompt

_PasswordWrongText::
	text "Fout wachtwoord!" ; "Wrong password!"
	prompt

_PasswordAskResetClockText::
	text "Reset de klok?" ; "Reset the clock?"
	done

_PasswordAskEnterText::
	text "Voer het wacht-" ; "Please enter the"
	line "woord in." ; "password."
	done

_ClearAllSaveDataText::
	text "Wis alle opslag-" ; "Clear all save"
	line "data?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " leerde" ; " learned"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Welke aanval wordt" ; "Which move should"
	line "vergeten?" ; "be forgotten?"
	done

_StopLearningMoveText::
	text "Stop met leren van" ; "Stop learning"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_start
	line "leerde niet" ; "did not learn"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " " ; " is"
	line "probeert" ; "trying to learn"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text " te" ; "."
	cont "leren."

	para "Maar @" ; "But @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_start
	line "kan maximaal vier" ; "can't learn more"
	cont "aanvallen leren." ; "than four moves."

	para "Verwijder een oude" ; "Delete an older"
	line "aanval voor" ; "move to make room"
	cont "@" ; "for @"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 en…@" ; "1, 2 and…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " Poef!@" ; " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " vergat" ; " forgot"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text "."

	para "En…" ; "And…"
	prompt

_MoveCantForgetHMText::
	text "VM-aanvallen zijn" ; "HM moves can't be"
	line "niet te vergeten." ; "forgotten now."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Speel met drie" ; "Play with three"
	line "munten?" ; "coins?"
	done

_CardFlipNotEnoughCoinsText::
	text "Te weinig munten…" ; "Not enough coins…"
	prompt

_CardFlipChooseACardText::
	text "Kies een kaart." ; "Choose a card."
	done

_CardFlipPlaceYourBetText::
	text "Zet geld in." ; "Place your bet."
	done

_CardFlipPlayAgainText::
	text "Nog een keer" ; "Want to play"
	line "spelen?" ; "again?"
	done

_CardFlipShuffledText::
	text "De kaarten zijn" ; "The cards have"
	line "geschud." ; "been shuffled."
	prompt

_CardFlipYeahText::
	text "Jaaa!" ; "Yeah!"
	done

_CardFlipDarnText::
	text "Verdorie…" ; "Darn…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Je bent buiten het" ; "You're out of the"
	line "gebruiksgebied." ; "service area."
	prompt

_PokegearAskWhoCallText::
	text "Met wie wil" ; "Whom do you want"
	line "je bellen?" ; "to call?"
	done

_PokegearPressButtonText::
	text "Druk op een knop" ; "Press any button"
	line "om te sluiten." ; "to exit."
	done

_PokegearAskDeleteText::
	text "Verwijder dit" ; "Delete this stored"
	line "bewaarde nummer?" ; "phone number?"
	done

_BuenaAskWhichPrizeText::
	text "Welke prijs wil" ; "Which prize would"
	line "je hebben?" ; "you like?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "?"
	line "Is dat hem?" ; "Is that right?"
	done

_BuenaHereYouGoText::
	text "Alsjeblieft!" ; "Here you go!"

	para ""
	done

_BuenaNotEnoughPointsText::
	text "Je hebt te" ; "You don't have"
	line "weinig punten." ; "enough points."

	para ""
	done

_BuenaNoRoomText::
	text "Je hebt er geen" ; "You have no room"
	line "plek voor." ; "for it."

	para ""
	done

_BuenaComeAgainText::
	text "Oh. Kom alsje-" ; "Oh. Please come"
	line "blieft nog eens!" ; "back again!"
	done

_BTExcuseMeText::
	text "Pardon!" ; "Excuse me!"

	para ""
	done

_ExcuseMeYoureNotReadyText::
	text "Sorry. Je bent er" ; "Excuse me."
	line "niet klaar voor." ; "You're not ready."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Kom weer terug als" ; "Please return when"
	line "bent voorbereid." ; "you're ready."
	done

_NeedAtLeastThreeMonText::
	text "Neem minstens drie" ; "You need at least"
	line "#MON mee." ; "three #MON."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, een EI" ; "Sorry, an EGG"
	line "kwalificeert niet." ; "doesn't qualify."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Slechts drie" ; "Only three #MON"
	line "#MON mogen mee." ; "may be entered."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "De @" ; "The @"
	text_ram wStringBuffer2 ; MaxLength 1
	text " #MON"
	line "moeten elk andere" ; "must all be"
	cont "types hebben." ; "different kinds."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "De @" ; "The @"
	text_ram wStringBuffer2 ; MaxLength 1
	text " #MON"
	line "mogen geen iden-" ; "must not hold the"
	cont "tieke voorwerpen." ; "same items."

	para ""
	done

_YouCantTakeAnEggText::
	text "Een EI mag niet" ; "You can't take an"
	line "met je mee!" ; "EGG!"

	para ""
	done

_BallDodgedText::
	text "Hij ontweek de" ; "It dodged the"
	line "geworpen BAL!" ; "thrown BALL!"

	para "Deze #MON" ; "This #MON"
	line "is niet te vangen!" ; "can't be caught!"
	prompt

_BallMissedText::
	text "Je miste de" ; "You missed the"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "Oh nee! De #MON" ; "Oh no! The #MON"
	line "brak los!" ; "broke free!"
	prompt

_BallAppearedCaughtText::
	text "Aww! Het leek" ; "Aww! It appeared"
	line "te zijn gelukt!" ; "to be caught!"
	prompt

_BallAlmostHadItText::
	text "Aargh!"
	line "Bijna gelukt!" ; "Almost had it!"
	prompt

_BallSoCloseText::
	text "Verdraaid! Zo" ; "Shoot! It was so"
	line "dichtbij ook!" ; "close too!"
	prompt

Text_BallCaught::
	text "Hebbes! @" ; "Gotcha! @"
	text_ram wEnemyMonNickname
	text_start
	line "is gevangen!@" ; "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " ging" ; " was"
	line "naar BILL's PC." ; "sent to BILL's PC."
	prompt

_NewDexDataText::
	text_ram wEnemyMonNickname
	text "'s data"
	line "werd toegevoegd" ; "was newly added to"
	cont "aan de #DEX.@" ; "the #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Geef een naam aan" ; "Give a nickname to"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text " steeg." ; " rose."
	prompt

_ItemCantUseOnMonText::
	text "Niet te gebruiken" ; "That can't be used"
	line "op deze #MON." ; "on this #MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "De VERJAAG die je" ; "The REPEL used"
	line "eerder gebruikte" ; "earlier is still"
	cont "werkt nog." ; "in effect."
	prompt

_PlayedFluteText::
	text "Speelde de #" ; "Played the #"
	line "FLUTE."

	para "Nou, wat een leuk" ; "Now, that's a"
	line "leuk deuntje!" ; "catchy tune!"
	prompt

_FluteWakeUpText::
	text "Slapende #MON" ; "All sleeping"
	line "werden wakker." ; "#MON woke up."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> speelde" ; "<PLAYER> played the"
	line "de #FLUIT.@" ; "# FLUTE.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "Je hebt nu" ; "You now have"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " punten." ; " points."
	done

_CoinCaseCountText::
	text "Munten:" ; "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Verhoog AP van" ; "Raise the PP of"
	line "welke aanval?" ; "which move?"
	done

_RestoreThePPOfWhichMoveText::
	text "Herstel AP van" ; "Restore the PP of"
	line "welke aanval?" ; "which move?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "'s AP" ; "'s PP"
	line "is op zijn hoogst." ; "is maxed out."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "'s AP" ; "'s PP"
	line "is verhoogd." ; "increased."
	prompt

_PPRestoredText::
	text "AP was hersteld." ; "PP was restored."
	prompt

_SentTrophyHomeText::
	text "Er zat een" ; "There was a trophy"
	line "trofee in!@" ; "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " zond prijs" ; " sent the"
	line "naar huis." ; "trophy home."
	prompt

_ItemLooksBitterText::
	text "Lijkt best bitter…" ; "It looks bitter…"
	prompt

_ItemCantUseOnEggText::
	text "Dat werkt niet" ; "That can't be used"
	line "op een EI." ; "on an EGG."
	prompt

_ItemOakWarningText::
	text "OAK: <PLAYER>!"
	line "Dit is niet het" ; "This isn't the"
	cont "moment daarvoor!" ; "time to use that!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Dat is van iemand" ; "That belongs to"
	line "anders!" ; "someone else!"
	prompt

_ItemWontHaveEffectText::
	text "Het zal geen" ; "It won't have any"
	line "effect hebben." ; "effect."
	prompt

_BallBlockedText::
	text "De trainer" ; "The trainer"
	line "blokkeerde de BAL!" ; "blocked the BALL!"
	prompt

_BallDontBeAThiefText::
	text "Niet stelen!" ; "Don't be a thief!"
	prompt

_NoCyclingText::
	text "Fietsen is hier" ; "Cycling isn't"
	line "niet toegestaan." ; "allowed here."
	prompt

_ItemCantGetOnText::
	text "Kunt niet rijden" ; "Can't get on your"
	line "op @"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "." ; " now."
	prompt

_BallBoxFullText::
	text "De #MON BOX" ; "The #MON BOX"
	line "is vol. Dat kun je" ; "is full. That"
	cont "nu niet gebruiken." ; "can't be used now."
	prompt

_ItemUsedText::
	text "<PLAYER> gebruikte@" ; "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> ging op de@" ; "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> stapte van@" ; "<PLAYER> got off@"
	text_low
	text "de @" ; "the @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kent" ; " knows"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "."
	prompt

_MoveKnowsOneText::
	text "Die #MON kent" ; "That #MON knows"
	line "een enkele aanval." ; "only one move."
	done

_AskDeleteMoveText::
	text "Oh, wil je" ; "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text " ver-" ; "?"
	cont "geten?"
	done

_DeleterForgotMoveText::
	text "Klaar! Je #MON" ; "Done! Your #MON"
	line "vergat de aanval." ; "forgot the move."
	done

_DeleterEggText::
	text "Een EI kent geen" ; "An EGG doesn't"
	line "aanvallen!" ; "know any moves!"
	done

_DeleterNoComeAgainText::
	text "Nee? Bezoek me" ; "No? Come visit me"
	line "later weer." ; "again."
	done

_DeleterAskWhichMoveText::
	text "Welke aanval moet" ; "Which move should"
	line "worden vergeten?" ; "it forget, then?"
	prompt

_DeleterIntroText::
	text "Um… Oh, ja, Ik ben" ; "Um… Oh, yes, I'm"
	line "de AANVALWISSER." ; "the MOVE DELETER."

	para "Ik wis aanvallen" ; "I can make #MON"
	line "van je #MON." ; "forget moves."

	para "Moet ik helpen een" ; "Shall I make a"
	line "aanval te wissen?" ; "#MON forget?"
	done

_DeleterAskWhichMonText::
	text "Welke #MON?" ; "Which #MON?"
	prompt

_DSTIsThatOKText::
	text " ZMR," ; " DST,"
	line "is dat OK?" ; "is that OK?"
	done

_TimeAskOkayText::
	text ","
	line "is dat OK?" ; "is that OK?"
	done

_TimesetAskDSTText::
	text "Wil je wisselen" ; "Do you want to"
	line "naar de Zomer-" ; "switch to Daylight"
	cont "tijd?" ; "Saving Time?"
	done

_TimesetDSTText::
	text "Ik heb de klok één" ; "I set the clock"
	line "uur voor je" ; "forward by one"
	cont "vooruitgezet." ; "hour."
	prompt

_TimesetAskNotDSTText::
	text "Is de Wintertijd" ; "Is Daylight Saving"
	line "aangebroken?" ; "Time over?"
	done

_TimesetNotDSTText::
	text "De klok is één uur" ; "I put the clock"
	line "achteruitgezet." ; "back one hour."
	prompt

_TimesetAskAdjustDSTText::
	text "Wil je de klok" ; "Do you want to"
	line "aanpassen" ; "adjust your clock"

	para "voor de Zomer-" ; "for Daylight"
	line "tijd?" ; "Saving Time?"
	done

_MomLostGearBookletText::
	text "Ik ben de hand-" ; "I lost the in-"
	line "leiding van de" ; "struction booklet"
	cont "#GEAR kwijt." ; "for the #GEAR."

	para "Kom over een" ; "Come back again in"
	line "tijdje terug." ; "a while."
	prompt
