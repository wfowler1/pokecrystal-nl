HueyAnswerPhoneText:
	text "Ja, je spreekt met" ; "Yeah, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Huh? Hoe gaat ie," ; "Huh? What's up,"
	line "<PLAYER>?"
	done

HueyAnswerPhoneDayText:
	text "Ja, je spreekt met" ; "Yeah, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Huh? What's up"
	line "<PLAYER>?"
	done

HueyAnswerPhoneNiteText:
	text "Ja, je spreekt met" ; "Yeah, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."

	para "Huh? Hoe gaat ie," ; "Huh? What's up,"
	line "<PLAYER>?"
	done

HueyGreetText:
	text "Yo, <PLAYER>!"
	line "Al wakker?" ; "You awake?"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	line "Wat is er gaande?" ; "How's it going?"
	done

HueyGreetDayText:
	text "Yo, <PLAYER>! Heb" ; "Yo, <PLAYER>! You"
	line "je nu tijd?" ; "free right now?"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	line "Wat is er gaande?" ; "How's it going?"
	done

HueyGreetNiteText:
	text "Yo, <PLAYER>!"
	line "Sliep je?" ; "Were you asleep?"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "!"
	line "Wat is er gaande?" ; "How's it going?"
	done
