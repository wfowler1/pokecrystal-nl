WadeAnswerPhoneText:
	text "Hallo? Met" ; "Hello? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "spreek je." ; " speaking."

	para "Oh. Hoi, <PLAY_G>!" ; "Oh. Hi, <PLAY_G>!"
	line "Goedemorgen!" ; "Good morning!"
	done

WadeAnswerPhoneDayText:
	text "Hallo? Met" ; "Hello? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "spreek je." ; " speaking."

	para "Oh. Hoi, <PLAY_G>!" ; "Oh. Hi, <PLAY_G>!"
	done

WadeAnswerPhoneNiteText:
	text "Hallo? Met" ; "Hello? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "spreek je." ; " speaking."

	para "Oh. Hoi, <PLAY_G>!" ; "Oh. Hi, <PLAY_G>!"
	line "Goedenavond!" ; "Good evening!"
	done

WadeGreetText:
	text "<PLAY_G>," ; "<PLAY_G>, good"
	line "goedemorgen!" ; "morning!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Lekker weertje hé?" ; "Isn't it nice out?"
	done

WadeGreetDayText:
	text "<PLAY_G>, howdy!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Lekker weertje hé?" ; "Isn't it nice out?"
	done

WadeGreetNiteText:
	text "Goedenavond," ; "Good evening,"
	line "<PLAY_G>!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Was je wakker?" ; "Were you awake?"
	done

WadeGenericText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Mijn #MON zijn" ; "My #MON have"
	line "veel te druk. Het" ; "too much energy to"

	para "begint een pro-" ; "burn. It gets to"
	line "bleem te worden." ; "be a problem."

	para "Van m'n #MON is" ; "Of all my #MON,"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "het" ; " is the"
	cont "drukste." ; "hardest to handle."

	para "Het is vermoeiend" ; "Working with it is"
	line "om mee te werken." ; "exhausting."
	done
