GavenAnswerPhoneText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier…" ; " speaking…"

	para "Hi, <PLAY_G>!"
	line "Good morning!"
	done

GavenAnswerPhoneDayText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier…" ; " speaking…"

	para "Hi, <PLAY_G>!"
	done

GavenAnswerPhoneNiteText:
	text "Hallo, je spreekt" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " hier…" ; " speaking…"

	para "Hoi, <PLAY_G>!" ; "Hi, <PLAY_G>!"
	line "Goedenavond!" ; "Good evening!"
	done

GavenGreetText:
	text "<PLAY_G>," ; "<PLAY_G>, good"
	line "goedemorgen!" ; "morning!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."
	line "Hoe gaat ie?" ; "How are you doing?"
	done

GavenGreetDayText:
	text "Hoi, <PLAY_G>!" ; "Hi, <PLAY_G>!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."
	line "Hoe gaat ie?" ; "How are you doing?"
	done

GavenGreetNiteText:
	text "<PLAY_G>," ; "<PLAY_G>, good"
	line "goedenavond!" ; "evening!"

	para "Ik ben het, @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 5
	text "."
	line "Hoe gaat ie?" ; "How are you doing?"
	done

GavenGenericText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start ; "'s"
	line "is zoals altijd" ; "doing as great as"
	cont "prima in orde." ; "ever."

	para "Laten we zo" ; "Let's keep at it"
	line "doorgaan en #-" ; "and become #MON"
	cont "KAMPIOENEN worden!" ; "CHAMPS!"
	done
