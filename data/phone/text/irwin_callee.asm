IrwinAnswerPhoneText:
	text "Hallo? @" ; "Hello? @"
	text_ram wStringBuffer3 ; MaxLength 5
	text_start
	line "hier…" ; "here…"

	para "He, <PLAY_G>!" ; "Hey, <PLAY_G>!"
	done

IrwinAnswerPhoneDayText:
	text "Hallo? @" ; "Hello? @"
	text_ram wStringBuffer3 ; MaxLength 5
	text_start
	line "hier…" ; "here…"

	para "Wauw, <PLAY_G>!" ; "Wow, <PLAY_G>!"
	done

IrwinAnswerPhoneNiteText:
	text "Hallo? @" ; "Hello? @"
	text_ram wStringBuffer3 ; MaxLength 5
	text_start
	line "hier…" ; "here…"

	para "Jippie, <PLAY_G>!" ; "Yippee, <PLAY_G>!"
	done

IrwinGreetText:
	text "Uh, hallo." ; "Uh, hello."
	line "<PLAY_G>?"

	para "Het is je vriend," ; "It's your pal,"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	done

IrwinGreetDayText:
	text "Uh, hallo." ; "Uh, hello."
	line "<PLAY_G>?"

	para "Het is je maatje" ; "It's your buddy"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	done

IrwinGreetNiteText:
	text "Uh, hallo." ; "Uh, hello."
	line "<PLAY_G>?"

	para "Het is je hulpje" ; "It's your sidekick"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "!"
	done
