AlanAnswerPhoneText:
	text "Yup, met @" ; "Yup, it's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"

	para "Is dit <PLAY_G>?" ; "Is this <PLAY_G>?"
	line "Goedemorgen!" ; "Good morning!"
	done

AlanAnswerPhoneDayText:
	text "Yup, met @" ; "Yup, it's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"

	para "Is dit <PLAY_G>?" ; "Is that <PLAY_G>?"
	done

AlanAnswerPhoneNiteText:
	text "Yup, met @" ; "Yup, it's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"

	para "Is dit <PLAY_G>?" ; "Is that <PLAY_G>?"
	line "Goedenavond!" ; "Good evening!"
	done

AlanGreetText:
	text "Hallo! Met mij," ; "Hello! It's me,"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	done

AlanGreetDayText:
	text "Hallo! Met mij," ; "Hello! It's me,"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	done

AlanGreetNiteText:
	text "Hallo! Met mij," ; "Hello! It's me,"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	done

AlanGenericText:
	text "<PLAY_G>, zorg je" ; "<PLAY_G>, are you"
	line "goed voor je" ; "raising your"
	cont "#MON?" ; "#MON properly?"

	para "Ik las in een boek" ; "I read in a book"
	line "dat je elke #-" ; "that you should"

	para "MON die je vangt" ; "raise any #MON"
	line "liefde en aandacht" ; "you catch with"
	cont "moet geven." ; "love and care."
	done
