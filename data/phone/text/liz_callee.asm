LizAnswerPhoneText:
	text "Hallo, @" ; "Hello, @"
	text_ram wStringBuffer3 ; MaxLength 3
	text_start
	line "spreekt hier." ; "speaking."

	para "Oh, <PLAY_G>."
	line "Goedemorgen." ; "Good morning."
	done

LizAnswerPhoneDayText:
	text "Hallo, @" ; "Hello, @"
	text_ram wStringBuffer3 ; MaxLength 3
	text_start
	line "spreekt hier." ; "speaking."

	para "Oh, <PLAY_G>."
	line "Hoe gaat het?" ; "How are you?"
	done

LizAnswerPhoneNiteText:
	text "Hallo, @" ; "Hello, @"
	text_ram wStringBuffer3 ; MaxLength 3
	text_start
	line "spreekt hier." ; "speaking."

	para "Oh, <PLAY_G>."
	line "Goedenavond." ; "Good evening."
	done

LizGreetText:
	text "Goedemorgen," ; "Good morning,"
	line "<PLAY_G>."

	para "Met @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 3
	text "."
	line "Sliep je?" ; "Were you sleeping?"
	done

LizGreetDayText:
	text "Hoi, <PLAY_G>." ; "Hi, <PLAY_G>."
	line "Met @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 3
	text "."

	para "Hoe gaat het met" ; "How are things"
	line "jou?" ; "going for you?"
	done

LizGreetNiteText:
	text "Goedenavond," ; "Good evening,"
	line "<PLAY_G>."

	para "Met @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 3
	text "."
	line "Ben je wakker?" ; "Are you awake?"
	done

LizGenericText:
	text "Ik had even tijd," ; "I had some time,"
	line "dus ik belde je." ; "so I called you."

	para "Hoe dan ook, hoe" ; "So anyway, how are"
	line "zijn je #MON?" ; "your #MON?"

	para "Ik neem mijn" ; "Me, I take my"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " elke" ; " to the"

	para "dag naar het" ; "#MON CENTER in"
	line "#MONCENTRUM." ; "VIOLET every day,"

	para "Daar voelt ie zich" ; "so it's doing just"
	line "fantastisch door!" ; "fantastic!"

	para "Ik ben bevriend" ; "I'm friends with"
	line "met de receptie!" ; "the receptionist!"
	done
