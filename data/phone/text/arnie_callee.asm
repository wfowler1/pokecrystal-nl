ArnieAnswerPhoneText:
	text "Ja, hallo." ; "Yeah, hello."
	line "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."

	para "…Huh, <PLAY_G>? Yo!"
	done

ArnieAnswerPhoneDayText:
	text "Ja, hallo. " ; "Yeah, hello, you"
	line "met @" ; "got @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."

	para "…Huh, <PLAY_G>? Yo!"
	done

ArnieAnswerPhoneNiteText:
	text "Ja, hallo. " ; "Yeah, hello, you"
	line "met @" ; "got @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."

	para "…Huh, <PLAY_G>? Yo!"
	done

ArnieGreetText:
	text "Ja, hallo?" ; "Yeah, hello?"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "spreek je." ; " calling."

	para "Wat ben je aan het" ; "What are you up"
	line "doen, <PLAY_G>?" ; "to, <PLAY_G>?"
	done

ArnieGreetDayText:
	text "Ja, hallo?" ;  "Yeah, hello?"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "spreek je." ; " calling."

	para "Waar ben je nu," ; "Where are you now,"
	line "<PLAY_G>?"
	done

ArnieGreetNiteText:
	text "Ja, hallo?" ; "Yeah, hello?"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "spreek je." ; " calling."

	para "Ben je nu wakker," ; "Are you awake now,"
	line "<PLAY_G>?"
	done

ArnieGenericText:
	text "Je MON zijn nu" ; "I bet your #MON"
	line "vast veel sterker" ; "are a lot stronger"
	cont "dan eerder." ; "than before."
	done
