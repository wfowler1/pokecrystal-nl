BethAnswerPhoneText:
	text "Hallo, met" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Oh, <PLAY_G>."
	line "Goedemorgen." ; "Good morning."

	para ""
	done

BethAnswerPhoneDayText:
	text "Hallo, met" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Oh. Hoi, <PLAY_G>." ; "Oh. Hi, <PLAY_G>."
	done

BethAnswerPhoneNiteText:
	text "Hallo, met" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Oh, <PLAY_G>."
	line "Goedenavond." ; "Good evening."
	done

BethGreetText:
	text "Goedemorgen," ; "Good morning,"
	line "<PLAY_G>!"

	para "Met @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Sliep je?" ; "Were you sleeping?"
	done

BethGreetDayText:
	text "<PLAY_G>, hi!"
	line "Met @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Heb je eventjes" ; "Do you have some"
	line "tijd?" ; "time?"
	done

BethGreetNiteText:
	text "Hoi, <PLAY_G>." ; "Hi, <PLAY_G>."
	line "Goedenavond." ; "Good evening."

	para "Met @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Hopelijk was je" ; "I hope you were"
	line "wakker." ; "awake."
	done

BethGenericText:
	text "Ben jij het type" ; "Are you the kind"
	line "persoon dat vaak" ; "of person who goes"

	para "naar #MONCENTRA" ; "to #MON CENTERS"
	line "gaat?" ; "often?"

	para "Ik ga iedere dag." ; "I go every day."
	line "Een goede trainer" ; "Watching out for"

	para "let op de gezond-" ; "the health of your"
	line "heid van diens" ; "#MON is a basic"

	para "#MON, dat is" ; "part of being a"
	line "de basis." ; "#MON trainer."
	done
