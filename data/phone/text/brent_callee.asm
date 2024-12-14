BrentAnswerPhoneText:
	text "Ja? @" ; "Yes? @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "hier…" ; " here…"

	para "Ah, <PLAYER>. Wat" ; "Ah, <PLAYER>. What"
	line "kan ik voor je doen?" ; "can I do for you?"
	done

BrentAnswerPhoneDayText:
	text "Ja? @" ; "Yes? @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "hier…" ; " here…"

	para "Ah, <PLAYER>. Wat" ; "Ah, <PLAYER>. What"
	line "kan ik voor je doen?" ; "can I do for you?"
	done

BrentAnswerPhoneNiteText:
	text "Ja? @" ; "Yes? @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "hier…" ; " here…"

	para "Ah, <PLAYER>. Wat" ; "Ah, <PLAYER>. What"
	line "kan ik voor je doen?" ; "can I do for you?"
	done

BrentGreetText:
	text "Hoi, <PLAYER>. Hoe" ; "Hiya, <PLAYER>. How"
	line "gaat het met je?" ; "are you doing?"

	para "He! Ik ben het," ; "Hey! It's me,"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."
	done

BrentGreetDayText:
	text "Hoi, <PLAYER>. Hoe" ; "Hiya, <PLAYER>. How"
	line "gaat het met je?" ; "are you doing?"

	para "He! Ik ben het," ; "Hey! It's me,"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."
	done

BrentGreetNiteText:
	text "Hoi, <PLAYER>. Hoe" ; "Hiya, <PLAYER>. How"
	line "gaat het met je?" ; "are you doing?"

	para "He! Ik ben het," ; "Hey! It's me,"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."
	done

BrentGenericText:
	text "Oh ja, ik zag je" ; "Oh yeah, I saw you"
	line "vertrekken uit een" ; "coming out of a"

	para "#MONCENTRUM een" ; "#MON CENTER the"
	line "tijdje geleden." ; "other day."

	para "Je geneest je" ; "You heal your"
	line "#MON vaak, of" ; "#MON regularly,"

	para "niet soms? Ik ben" ; "don't you?"
	line "onder de indruk." ; "I'm impressed."

	para "Heh, m'n @" ; "Heh, my @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start
	line "is zo sterk, dat" ; "is so tough, it"

	para "ik amper naar een" ; "doesn't need to go"
	line "#MONCENTRUM" ; "to #MON CENTERS"
	cont "hoef. Heheh!" ; "often. Heheh!"
	done
