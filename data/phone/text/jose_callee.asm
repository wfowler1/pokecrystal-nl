JoseAnswerPhoneText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Oh, <PLAY_G>?"
	line "Goedemorgen!" ; "Good morning!"
	done

JoseAnswerPhoneDayText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Oh, <PLAY_G>? Hoi!" ; "Oh, <PLAY_G>? Hi!"
	done

JoseAnswerPhoneNiteText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Oh, <PLAY_G>?"
	line "Goedenavond!" ; "Good evening!"
	done

JoseGreetText:
	text "Oh, <PLAY_G>?"

	para "Twiet! Ja, ik ben" ; "Tweet! Yeah, it's"
	line "het, @" ; "me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	done

JoseGreetDayText:
	text "Oh, <PLAY_G>?"

	para "Twiet! Ja, ik ben" ; "Tweet! Yeah, it's"
	line "het, @" ; "me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	done

JoseGreetNiteText:
	text "Oh, <PLAY_G>?"

	para "Twiet! Ja, ik ben" ; "Tweet! Yeah, it's"
	line "het, @" ; "me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	done

JoseGenericText:
	text "Weten je #MON" ; "Are your #MON"
	line "er wat van te" ; "still cooking?"
	cont "brouwen?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " heeft" ; " has"
	line "te veel energie." ; "too much energy."

	para "Als ie eenmaal weg" ; "Once it takes off,"
	line "is, zie ik die een" ; "it won't come back"
	cont "tijd niet terug." ; "for a while."
	done
