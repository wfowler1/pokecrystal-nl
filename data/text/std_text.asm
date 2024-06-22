NurseMornText:
	text "Goedemorgen!"
	line "Welkom bij ons"
	cont "#MONCENTRUM."
	done

NurseDayText:
	text "Hallo!"
	line "Welkom bij ons"
	cont "#MONCENTRUM."
	done

NurseNiteText:
	text "Goedenavond!"
	line "Het is al laat."

	para "Welkom bij ons"
	line "#MONCENTRUM."
	done

PokeComNurseMornText:
	text "Goedemorgen!"

	para "Dit is het #-"
	line "MON COMMUNICATIE"

	para "CENTRUM--of het"
	line "#COMCENTRUM."
	done

PokeComNurseDayText:
	text "Hallo!"

	para "Dit is het #-"
	line "MON COMMUNICATIE"

	para "CENTRUM--of het"
	line "#COMCENTRUM."
	done

PokeComNurseNiteText:
	text "Goed je te zien"
	line "Laat bezig nog."

	para "Dit is het #-"
	line "MON COMMUNICATIE"

	para "CENTRUM--of het"
	line "#COMCENTRUM."
	done

NurseAskHealText:
	text "We kunnen je #-"
	line "MON weer helemaal"
	cont "genezen."

	para "Zal ik je"
	line "#MON genezen?"
	done

NurseTakePokemonText:
	text "OK, mag ik je"
	line "#MON zien?"
	done

NurseReturnPokemonText:
	text "Bedankt voor het"
	line "wachten."

	para "Je #MON zijn"
	line "helemaal genezen."
	done

NurseGoodbyeText:
	text "We hopen je weer"
	line "te zien."
	done

; not used
	text "We hopen je weer"
	line "te zien."
	done

NursePokerusText:
	text "Je #MON"
	line "lijken te zijn"

	para "besmet met kleine"
	line "levensvormen."

	para "Je #MON zijn"
	line "gezond en lijken"
	cont "prima in orde."

	para "Maar meer kunnen"
	line "we niet zeggen in"

	para "een #MON-"
	line "CENTRUM."
	done

PokeComNursePokerusText:
	text "Je #MON"
	line "lijken te zijn"

	para "besmet met kleine"
	line "levensvormen."

	para "Je #MON zijn"
	line "gezond en lijken"
	cont "prima in orde."

	para "Maar meer kunnen"
	line "we niet zeggen."
	done

DifficultBookshelfText:
	text "Hij staat vol met"
	line "moeilijke boeken."
	done

PictureBookshelfText:
	text "Een verzameling"
	line "#MON kinder-"
	cont "boeken!"
	done

MagazineBookshelfText:
	text "#MON-tijdschriften…"
	line "#MON PAL,"

	para "#MON-HANBOEK,"
	line "#MON GRAPH…"
	done

TeamRocketOathText:
	text "TEAM ROCKET-EED"

	para "Steel #MON"
	line "voor geld!"

	para "Misbruik #MON"
	line "voor geld!"

	para "#MON bestaan"
	line "voor de glorie van"
	cont "TEAM ROCKET!"
	done

IncenseBurnerText:
	text "Wat is dit?"

	para "Oh, het is een"
	line "wierrookhouder!"
	done

MerchandiseShelfText:
	text "Heel veel #MON"
	line "merchandise!"
	done

LookTownMapText:
	text "Het is de KAART."
	done

WindowText:
	text "Mijn spiegelbeeld!"
	line "Ziet er goed uit!"
	done

TVText:
	text "Het is een TV."
	done

HomepageText:
	text "#MON DAGBOEK"
	line "INHOUD…"

	para "Het is niet"
	line "bijgewerkt…"
	done

; not used
	text "#MON RADIO!"

	para "Bel nu met je"
	line "verzoekjes!"
	done

TrashCanText:
	text "Er staat niks"
	line "in…"
	done

; not used
	text "Een #MON kan"
	line "dit wellicht duwen."
	done

; not used
	text "Kan een #MON"
	line "dit breken?"
	done

PokecenterSignText:
	text "Genees je #MON!"
	line "#MONCENTRUM"
	done

MartSignText:
	text "Voor al je"
	line "#MON-spullen"

	para "#MON MART"
	done

ContestResults_ReadyToJudgeText:
	text "We beoordelen de"
	line "#MON die je"
	cont "hebt gevangen."

	para "<……>"
	line "<……>"

	para "We hebben de win-"
	line "naars gekozen!"

	para "Ben je hier klaar"
	line "voor?"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER>, de No.@"
	text_ram wStringBuffer3
	text_start
	line "finisher, wint"
	cont "@"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> ontvangt"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "Graag tot de vol-"
	line "gende wedstrijd!"
	done

ContestResults_ConsolationPrizeText:
	text "De rest krijgt een"
	line "BES als troost-"
	cont "prijs!"
	done

ContestResults_DidNotWinText:
	text "Hopelijk volgende"
	line "keer beter."
	done

ContestResults_ReturnPartyText:
	text "We geven jouw weer"
	line "#MON terug"

	para "aan jou."
	line "Alsjeblieft!"
	done

ContestResults_PartyFullText:
	text "Your team zit vol,"
	line "Dus de #MON is"

	para "gestuurd naar je"
	line "BOX in BILL's PC."
	done

GymStatue_CityGymText:
	text_ram wStringBuffer3
	text_start
	line "#MON GYM"
	done

GymStatue_WinningTrainersText:
	text "LEIDER: @"
	text_ram wStringBuffer4
	text_start
	para "WINNENDE TRAINERS:"
	line "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Welkom in de"
	line "SPEELHOEK."
	done

CoinVendor_NoCoinCaseText:
	text "Heb je speelmunten"
	line "nodig?"

	para "Oh, je hebt geen"
	line "MUNTENZAK voor"
	cont "je munten."
	done

CoinVendor_IntroText:
	text "Heb je speelmunten"
	line "nodig?"

	para "Het is ¥1000 voor"
	line "50 munten. Wil je"
	cont "een paar?"
	done

CoinVendor_Buy50CoinsText:
	text "Dankje!"
	line "Hier, 50 munten."
	done

CoinVendor_Buy500CoinsText:
	text "Dankje! Hier"
	line "heb je 500 munten."
	done

CoinVendor_NotEnoughMoneyText:
	text "Je hebt niet"
	line "genoeg geld."
	done

CoinVendor_CoinCaseFullText:
	text "Oeps! Je MUNTEN-"
	line "ZAK zit vol."
	done

CoinVendor_CancelText:
	text "Geen munten dus?"
	line "Tot ziens!"
	done

BugContestPrizeNoRoomText:
	text "Oh? Je RUGZAK zit"
	line "vol."

	para "We bewaren dit"
	line "vandaag voor je,"

	para "kom maar als je"
	line "plek hebt gemaakt."
	done

HappinessText3:
	text "Wauw! Jij en je"
	line "#MON zijn heel"
	cont "hecht!"
	done

HappinessText2:
	text "#MON worden"
	line "vriendelijker als"

	para "samen tijd"
	line "spendeert."
	done

HappinessText1:
	text "Je hebt je #MON"
	line "niet getemd."

	para "Als je niet aardig"
	line "doet, zeurt ie."
	done

RegisteredNumber1Text:
	text "<PLAYER> registreert"
	line "@"
	text_ram wStringBuffer3
	text "'s nummer."
	done

RegisteredNumber2Text:
	text "<PLAYER> registreert"
	line "@"
	text_ram wStringBuffer3
	text "'s nummer."
	done
