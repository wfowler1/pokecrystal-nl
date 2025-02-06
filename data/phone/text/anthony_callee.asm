AnthonyAnswerPhoneText:
	text "Ja, met @" ; "Yeah, @"
	text_ram wStringBuffer3  ; MaxLength 7
	text " de" ; " the"
	line "WANDELAAR hier." ; "HIKER here."

	para "Ah, <PLAYER>!"
	done

AnthonyAnswerPhoneDayText:
	text "Ja, met @" ; "Yeah, @"
	text_ram wStringBuffer3  ; MaxLength 7
	text " de" ; " the"
	line "WANDELAAR hier." ; "HIKER here."

	para "Ah, <PLAYER>,"
	line "toch?" ; "right?"
	done

AnthonyAnswerPhoneNiteText:
	text "Ja, met @" ; "Yeah, @"
	text_ram wStringBuffer3  ; MaxLength 7
	text " de" ; " the"
	line "WANDELAAR hier." ; "HIKER here."

	para "Ah, <PLAYER>, was" ; "Ah, <PLAYER>, isn't"
	line "het niet?" ; "it?"
	done

AnthonyGreetText:
	text "Yo, <PLAYER>?"

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text_start
	line "de WANDELAAR!" ; "the HIKER!"
	done

AnthonyGreetDayText:
	text "He, is dit" ; "Hey, is this"
	line "<PLAYER>?"

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text_start
	line "de WANDELAAR!" ; "the HIKER!"
	done

AnthonyGreetNiteText:
	text "<PLAYER>, jij nog" ; "<PLAYER>, you still"
	line "wakker?" ; "awake?"

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 7
	text_start
	line "de WANDELAAR!" ; "the HIKER!"
	done

AnthonyGenericText:
	text "Zijn je #MON zo" ; "Are your #MON"
	line "nog vechtlustig?" ; "as feisty as ever?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " en" ; " and"
	line "ik--we moeten wat" ; "me--we have energy"

	para "energie kwijt. We" ; "to burn. We hike"
	line "bewandelen iedere" ; "up mountains every"

	para "dag de berg om te" ; "day to work out"
	line "trainen." ; "all our energy."
	done
