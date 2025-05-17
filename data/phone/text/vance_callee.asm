VanceAnswerPhoneText:
	text "Ja, hallo?" ; "Yes, hello?"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier!" ; " here!"

	para "Mogge, <PLAY_G>!" ; "Morning, <PLAY_G>!"

	para "Gebruik je vogel-" ; "Are you using bird"
	line "#MON?"
	done

VanceAnswerPhoneDayText:
	text "Ja, hallo?" ; "Yes, hello?"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier!" ; " here!"

	para "Hoi, <PLAY_G>!" ; "Hi, <PLAY_G>!"

	para "Vliegen je vogel-" ; "Are your bird"
	line "#MON?" ; "#MON flying?"
	done

VanceAnswerPhoneNiteText:
	text "Ja, hallo?" ; "Yes, hello?"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier!" ; " here!"

	para "Goedenavond," ; "Evening, <PLAY_G>!"
	line "<PLAY_G>! Vergeet" ; "Are you letting"

	para "niet je vogel-" ; "your bird #MON"
	line "#MON wat actie" ; "see some action?"
	cont "te bieden!"
	done

VanceGreetText:
	text "Goedemorgen," ; "Good morning,"
	line "<PLAY_G>!"

	para "Dit is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	line "Goedemorgen!" ; "Good morning!"
	done

VanceGreetDayText:
	text "Hoi, <PLAY_G>!" ; "Hi, <PLAY_G>!"

	para "Dit is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	line "Ken je me nog?" ; "Remember me?"
	done

VanceGreetNiteText:
	text "Goedenavond," ; "Good evening,"
	line "<PLAY_G>!"

	para "Dit is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	line "Heb je even tijd?" ; "Are you free now?"
	done

VanceGenericText:
	text "Gaat het goed met" ; "Are you and your"
	line "jou en je #MON?" ; "#MON fine?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start
	line "begint sterk ge-" ; "looks like it will"

	para "noeg te worden om" ; "get tough enough"
	line "de legendarische" ; "to face and beat"

	para "vogel-#MON te" ; "the legendary bird"
	line "verslaan!" ; "#MON!"
	done
