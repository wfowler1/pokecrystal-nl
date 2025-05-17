ToddAnswerPhoneText:
	text "Ja? Met" ; "Yes? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text " spreek je." ; " speaking."

	para "He, <PLAY_G>!" ; "Hey, <PLAY_G>!"
	done

ToddAnswerPhoneDayText:
	text "Ja? Met" ; "Yes? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text " spreek je." ; " speaking."

	para "Dit is vast" ; "This must be"
	line "<PLAY_G>."
	done

ToddAnswerPhoneNiteText:
	text "Ja? Met" ; "Yes? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text " spreek je." ; " speaking."

	para "Ah, <PLAY_G>!"
	done

ToddGreetText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "<PLAY_G>, toch?" ; "<PLAY_G>, right?"
	done

ToddGreetDayText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "<PLAY_G>, wat ben" ; "<PLAY_G>, what are"
	line "je aan het doen?" ; "you doing?"
	done

ToddGreetNiteText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "<PLAY_G>, sorry" ; "<PLAY_G>, sorry to"
	line "dat ik laat bel." ; "call you so late."
	done

ToddGenericText:
	text "Hoe voed jij je" ; "How do you raise"
	line "#MON op?" ; "your #MON?"

	para "Ik doe van alles," ; "I do all sorts"
	line "zoals ze naar het" ; "of things, like"

	para "DAGVERBLIJF" ; "leaving them in"
	line "brengen en ze" ; "DAY-CARE and"

	para "allerlei voor-" ; "toughening them up"
	line "werpen voeren." ; "with items."
	done
