JackAnswerPhoneText:
	text "Hallo. Dit is" ; "Hello. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Goedemorgen," ; "Good morning,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneDayText:
	text "Hallo. Dit is" ; "Hello. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Hoe gaat ie," ; "How's it going,"
	line "<PLAY_G>?"
	done

JackAnswerPhoneNiteText:
	text "Hallo. Dit is" ; "Hello. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Goedenavond," ; "Good evening,"
	line "<PLAY_G>!"
	done

JackGreetText:
	text "<PLAY_G>," ; "<PLAY_G>, good"
	line "goedemorgen!" ; "morning!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Hoe gaat ie?" ; "How are you doing?"
	done

JackGreetDayText:
	text "<PLAY_G>, howdy!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Lekker weertje he?" ; "Isn't it nice out?"
	done

JackGreetNiteText:
	text "<PLAY_G>," ; "<PLAY_G>, good"
	line "goedenavond!" ; "evening!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Heb je even?" ; "Got a minute?"
	done

JackGenericText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is"
	line "zo nieuwsgierig," ; "so curious, it's a"

	para "het gedraagt zich" ; "problem. Maybe"
	line "net als ik…" ; "it's like me…"
	done
