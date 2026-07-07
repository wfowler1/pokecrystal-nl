TiffanyAnswerPhoneText:
	text "Ja? Met" ; "Yes? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Oh, <PLAY_G>."
	line "Goedemorgen." ; "Good morning."
	done

TiffanyAnswerPhoneDayText:
	text "Ja? Met" ; "Yes? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Oh, <PLAY_G>."
	line "Hallo." ; "Hello."
	done

TiffanyAnswerPhoneNiteText:
	text "Ja? Met" ; "Yes? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Oh, <PLAY_G>," ; "Oh, <PLAY_G>, good"
	line "goedenavond." ; "evening."
	done

TiffanyGreetText:
	text "Is dit <PLAY_G>?" ; "Is this <PLAY_G>?"

	para "Goedemorgen. Dit" ; "Good morning. This"
	line "is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."
	done

TiffanyGreetDayText:
	text "Is dit <PLAY_G>?" ; "Is this <PLAY_G>?"

	para "Hoi, met @" ; "Hi, it's @"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."
	done

TiffanyGreetNiteText:
	text "Is dit <PLAY_G>?" ; "Is this <PLAY_G>?"

	para "Goedenavond. Dit" ; "Good evening. This"
	line "is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."
	done

TiffanyGenericText:
	text "Gaat het goed met" ; "Are your #MON"
	line "je #MON?" ; "doing well?"

	para "Hopelijk breng je" ; "I hope you take"
	line "ze elke dag naar 't" ; "them to a #MON"
	cont "#MONCENTRUM." ; "CENTER every day."

	para "Drijf ze niet tot" ; "Don't push them"
	line "het uiterste." ; "too hard."

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is"
	line "lief en levendig," ; "cute and lively"

	para "juist omdat we" ; "precisely because"
	line "elke dag naar een" ; "I take it to a"

	para "#MONCENTRUM" ; "#MON CENTER"
	line "gaan." ; "every day."
	done
