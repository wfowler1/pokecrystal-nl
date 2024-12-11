BeverlyAnswerPhoneText:
	text "Hallo, dit is" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Oh! Goedemorgen," ; "Oh! Good morning,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Hallo, dit is" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Oh! Goedendag," ; "Oh! Good day,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Hallo, dit is" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Oh! Goedenavond," ; "Oh! Good evening,"
	line "<PLAYER>."
	done

BeverlyGreetText:
	text "Hallo <PLAYER>." ; "Hello, <PLAYER>."
	line "Goedemorgen." ; "Good morning."

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."
	line "Sliep je?" ; "Were you asleep?"
	done

BeverlyGreetDayText:
	text "Hoi, <PLAYER>." ; "Hi, <PLAYER>."
	line "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Hoe gaat het?" ; "How are you doing?"
	done

BeverlyGreetNiteText:
	text "Hoi, <PLAYER>." ; "Hi, <PLAYER>."
	line "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text "."

	para "Was je wakker?" ; "Were you awake?"
	done

BeverlyGenericText:
	text "Zijn je #MON" ; "Keeping your"
	line "nog blij?" ; "#MON happy?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is"
	line "gezond. Het eet" ; "healthy. It eats a"
	cont "iedere dag flink." ; "lot every day."
	done
