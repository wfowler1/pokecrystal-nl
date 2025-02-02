TullyAnswerPhoneText:
	text "Hallo, dit is" ; " Hello, this is" ; "
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "…"

	para "Oh, goedemorgen," ; "Oh, Good morning,"
	line "<PLAY_G>."
	done

TullyAnswerPhoneDayText:
	text "Hallo, dit is" ; " Hello, this is" ; "
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "…"

	para "Die stem…" ; "That voice…"
	line "<PLAY_G>, toch?" ; "<PLAY_G> ", right?"
	done

TullyAnswerPhoneNiteText:
	text "Hallo, dit is" ; " Hello, this is" ; "
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "…"

	para "Dit is vast" ; "This must be"
	line "<PLAY_G>!"
	done

TullyGreetText:
	text "Hallo!" ; "Hello!"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier…" ; "here…"

	para "Goedemorgen! Wat" ; "Good morning! The"
	line "een lekker weer!" ; "weather's great!"
	done

TullyGreetDayText:
	text "Hallo!" ; "Hello!"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier…" ; " here…"

	para "Een perfecte dag" ; "What a perfect day"
	line "om te vissen!" ; "for fishing!"
	done

TullyGreetNiteText:
	text "Hallo!" ; "Hello!"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier…" ; " here…"

	para "Een goede nacht om" ; "It's a great night"
	line "te vissen!" ; "for fishing!"
	done

TullyGenericText:
	text "Hoe gaat het met" ; "How's your trip"
	line "je reis?" ; "coming along?"

	para "Ik kan niet klagen" ; "I can't complain"
	line "over mijn vissen!" ; "about my fishing!"
	done
