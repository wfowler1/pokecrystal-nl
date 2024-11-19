GinaAnswerPhoneText:
	text "Hallo? Dit is" ; "Hello? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Oh, <PLAY_G>!"
	line "Goedemorgen!" ; "Good morning!"
	done

GinaAnswerPhoneDayText:
	text "Hallo? Dit is" ; "Hello? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Oh, <PLAY_G>!"
	line "Hoi, hoe gaat ie?" ; "Hi, how are you?"
	done

GinaAnswerPhoneNiteText:
	text "Hallo? Dit is" ; "Hello? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Oh, <PLAY_G>!"
	line "Goedenavond!" ; "Good evening!"
	done

GinaGreetText:
	text "<PLAY_G>?"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Goedemorgen!" ; "Good morning!"
	done

GinaGreetDayText:
	text "<PLAY_G>?"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text ". Komt" ; ". Is"
	line "het even uit?" ; "this a bad time?"
	done

GinaGreetNiteText:
	text "<PLAY_G>?"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Zin om te kletsen?" ; "Got time to chat?"
	done

GinaGenericText:
	text "Zijn je #MON" ; "Are your #MON"
	line "nog steeds sterk?" ; "still tough?"

	para "Ik train dagelijks" ; "I train every day"
	line "met @" ; "with @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "."
	done
