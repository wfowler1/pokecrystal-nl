DanaAnswerPhoneText:
	text "Hoi, @" ; "Hi, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text " spreek" ; " on the"
	line "je mee." ; "line."

	para "He! <PLAY_G>!" ; "Hey! It's <PLAY_G>!"
	done

DanaAnswerPhoneDayText:
	text "Hoi, @" ; "Hi, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text " spreek" ; " on the"
	line "je mee." ; "line."

	para "Ik hoor het al!" ; "I know!"
	line "<PLAY_G>!" ; "It's <PLAY_G>!"
	done

DanaAnswerPhoneNiteText:
	text "Hoi, @" ; "Hi, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text " spreek" ; " on the"
	line "je mee." ; "line."

	para "<PLAY_G>?"
	line "Alles goed?" ; "What's up?"
	done

DanaGreetText:
	text "Uh, <PLAY_G>?"

	para "Ik ben het!" ; "It's me!"
	line "Ikke, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	done

DanaGreetDayText:
	text "Uh, <PLAY_G>?"

	para "Ik ben het!" ; "It's me!"
	line "Ikke, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	done

DanaGreetNiteText:
	text "Uh, <PLAY_G>?"

	para "Ik ben het!" ; "It's me!"
	line "Ikke, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	done

DanaGenericText:
	text "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "zit" ; " is"
	line "vol met energie," ; "so full of energy,"

	para "best een beetje" ; "it's a little"
	line "eng, eigenlijk." ; "scary."

	para "Hoe gaat het met" ; "How are your"
	line "jouw #MON?" ; "#MON doing?"
	done
