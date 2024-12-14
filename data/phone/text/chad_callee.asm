ChadAnswerPhoneText:
	text "Hallo, dit is" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Hoi, <PLAY_G>," ; "Hi, <PLAY_G>!"
	line "goedemorgen!" ; "Good morning!"
	done

ChadAnswerPhoneDayText:
	text "Hallo, dit is" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Hoi, <PLAY_G>," ; "Hi, <PLAY_G>, good"
	line "goedemiddag!" ; "day!"
	done

ChadAnswerPhoneNiteText:
	text "Hallo, dit is" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 4
	text "…"

	para "Hoi, <PLAY_G>!" ; "Hi, <PLAY_G>, good"
	line "Goedenavond!" ; "evening!"
	done

ChadGreetText:
	para "Hoi, <PLAY_G>," ; "Hi, <PLAY_G>, good"
	line "goedemorgen!" ; "morning!"

	para "Dit is" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Hoe gaat het?" ; "How are you?"
	done

ChadGreetDayText:
	text "Hoi, <PLAY_G>," ; "Hi, <PLAY_G>, good"
	line "goedendag!" ; "day!"

	para "Dit is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "Hoe gaat het?" ; "How are you?"
	done

ChadGreetNiteText:
	text "Hoi, <PLAY>," ; "Hi, <PLAY_G>, good"
	line "goedenavond!" ; "evening!"

	para "Het is @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 4
	text "."
	line "hoe gat het?" ; "How are you?"
	done

ChadGenericText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Je kent PROF.OAK," ; "You know PROF.OAK,"
	line "dus je #MON" ; "so of course your"
	cont "zijn vast prima!" ; "#MON are fine!"

	para "Mijn #MON zijn" ; "My #MON are"
	line "ook in orde." ; "doing well too."

	para "Maar ja, ik wil" ; "But then, I am"
	line "dan ook #MON-" ; "trying to become a"

	para "professor worden," ; "#MON professor,"
	line "dus dat is vast" ; "so that shouldn't"
	cont "geen verrassing." ; "be a big surprise."
	done
