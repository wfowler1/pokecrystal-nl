ErinAnswerPhoneText:
	text "Ja, je spreekt met" ; "Yes, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Oh. Hoi, <PLAY_G>!" ; "Oh. Hi, <PLAY_G>!"
	line "Goedemorgen!" ; "Good morning!"
	done

ErinAnswerPhoneDayText:
	text "Ja, je spreekt met" ; "Yes, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"
	
	para "Oh. Hoi, <PLAY_G>!" ; "Oh. Hi, <PLAY_G>!"
	line "Jahoe!" ; "Yahoo!"
	done

ErinAnswerPhoneNiteText:
	text "Ja, je spreekt met" ; "Yes, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"
	
	para "Oh. Hoi, <PLAY_G>!" ; "Oh. Hi, <PLAY_G>!"
	done

ErinGreetText:
	text "<PLAY_G>!"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	line "Goedemorgen!" ; "Good morning!"
	done

ErinGreetDayText:
	text "<PLAY_G>!"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	line "Hard aan het werk?" ; "Working hard?"
	done

ErinGreetNiteText:
	text "<PLAY_G>!"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	line "Was je wakker?" ; "Were you up?"
	done

ErinGenericText:
	text "Je #MON aan het" ; "Are you raising"
	line "trainen?" ; "your #MON?"

	para "He, @" ; "Hey, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "'s"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is"
	cont "dik in orde!" ; "looking good!"
	done
