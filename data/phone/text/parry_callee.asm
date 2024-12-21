ParryAnswerPhoneText:
	text "Yep, yep!" ; "Yup, yup!"
	line "Het is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"

	para "Hah, en hier is" ; "Hah, and here's"
	line "<PLAY_G>!"
	done

ParryAnswerPhoneDayText:
	text "Yep, yep!" ; "Yup, yup!"
	line "Het is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	
	para "Hah, en hier is" ; "Hah, and here's"
	line "<PLAY_G>!"
	done

ParryAnswerPhoneNiteText:
	text "Yep, yep!" ; "Yup, yup!"
	line "Het is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	
	para "Hah, en hier is" ; "Hah, and here's"
	line "<PLAY_G>!"
	done

ParryGreetText:
	text "<PLAY_G>, met" ; "<PLAY_G>, it's"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"

	para "Heb je wel goed" ; "Have you had a"
	line "ontbeten?" ; "proper breakfast?"
	done

ParryGreetDayText:
	text "<PLAY_G>, met" ; "<PLAY_G>, it's"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"

	para "Heb je een goede" ; "Have you had a"
	line "lunch gehad?" ; "proper lunch?"
	done

ParryGreetNiteText:
	text "<PLAY_G>, met" ; "<PLAY_G>, it's"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"

	para "Heb je goed" ; "Have you had a"
	line "gegeten?" ; "proper dinner?"
	done

ParryGenericText:
	text "Zien je #MON er" ; "Are your #MON"
	line "goed uit?" ; "looking good?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " en" ; " and"
	line "ik--we zien er" ; "me--we're looking"

	para "echt tiptop uit!" ; "mighty dandy!"
	line "Hahahah!"
	done
