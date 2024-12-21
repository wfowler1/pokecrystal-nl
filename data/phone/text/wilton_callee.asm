WiltonAnswerPhoneText:
	text "Hallo, je spreekt" ; "Hello, you have"
	line "met @" ; "reached @"
	text_ram wStringBuffer3 ; MaxLength 6
	text "…"

	para "Ah, <PLAY_G>."
	done

WiltonAnswerPhoneDayText:
	text "Hallo, je spreekt" ; "Hello, you have"
	line "met @" ; "reached @"
	text_ram wStringBuffer3 ; MaxLength 6
	text "…"

	para "Ah, <PLAY_G>, of" ; "Ah, <PLAY_G>, is"
	line "niet?" ; "it?"
	done

WiltonAnswerPhoneNiteText:
	text "Hallo, je spreekt" ; "Hello, you have"
	line "met @" ; "reached @"
	text_ram wStringBuffer3 ; MaxLength 6
	text "…"

	para "Ah, daar heb je" ; "Ah, if it isn't"
	line "<PLAY_G>."
	done

WiltonGreetText:
	text "Ah, het is @" ; "Ah, it's @"
	text_ram wStringBuffer3 ; MaxLength 6
	text "…"

	para "Heb je even een" ; "Have you got a"
	line "momentje?" ; "moment?"
	done

WiltonGreetDayText:
	text "Ah, het is @" ; "Ah, it's @"
	text_ram wStringBuffer3 ; MaxLength 6
	text "…"

	para "Kun je nu praten?" ; "Can you talk now?"
	done

WiltonGreetNiteText:
	text "Ah, het is @" ; "Ah, it's @"
	text_ram wStringBuffer3 ; MaxLength 6
	text "…"

	para "Sorry dat ik zo" ; "Sorry for calling"
	line "laat bel." ; "so late."
	done

WiltonGenericText:
	text "Zijn je #MON" ; "Have your #MON"
	line "nog gegroeid?" ; "grown any?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is" ; " has"
	line "best wat groter nu." ; "grown quite a bit."
	done
