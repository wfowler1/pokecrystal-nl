JoeyAnswerPhoneText:
	text "Hoi, @" ; "Hi, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text " hier!" ; " here!"

	para "Oh, <PLAYER>? Gaat" ; "Oh, <PLAYER>? You"
	line "het goed?" ; "doing well?"
	done

JoeyAnswerPhoneDayText:
	text "Hoi, @" ; "Hi, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text " hier!" ; " here!"

	para "Oh, <PLAYER>? Gaat" ; "Oh, <PLAYER>? You"
	line "het goed?" ; "doing well?"
	done

JoeyAnswerPhoneNiteText:
	text "Hoi, @" ; "Hi, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text " hier!" ; " here!"

	para "Oh, <PLAYER>? Gaat" ; "Oh, <PLAYER>? You"
	line "het goed?" ; "doing well?"
	done

JoeyGreetText:
	text "Yo, <PLAYER>!" ; "Yo, <PLAYER>!"
	line "Hoe gaat ie?" ; "How're you doing?"

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 4
	text ","
	line "heb je even?" ; "got a minute?"
	done

JoeyGreetDayText:
	text "Yo, <PLAYER>!" ; "Yo, <PLAYER>!"
	line "Hoe gaat ie?" ; "How're you doing?"

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 4
	text ","
	line "heb je even?" ; "got a minute?"
	done

JoeyGreetNiteText:
	text "Yo, <PLAYER>!" ; "Yo, <PLAYER>!"
	line "Hoe gaat ie?" ; "How're you doing?"

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 4
	text ","
	line "heb je even?" ; "got a minute?"
	done

JoeyGenericText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is" ; "'s"
	line "klaar om te gaan," ; "raring to go, just"
	cont "zoals altijd." ; "like always."

	para "Het is de enige" ; "It's the only one"
	line "die ik heb. Ik ga" ; "I have. I'm going"

	para "een geweldige" ; "to become a great"
	line "partner worden!" ; "trainer with it!"
	done
