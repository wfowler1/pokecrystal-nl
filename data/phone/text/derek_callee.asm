DerekAnswerPhoneText:
	text "Hoi, <PLAY_G>?" ; "Hi, <PLAY_G>?"

	para "Goedemorgen pika." ; "Good morning pika."
	line "Alles goed pika?" ; "What's up pika?"
	done

DerekAnswerPhoneDayText:
	text "Hoi, <PLAY_G>?" ; "Hi, <PLAY_G>?"

	para "Goedendag pika," ; "Good day pika,"
	line "alles goed pika?" ; "what's up pika?"
	done

DerekAnswerPhoneNiteText:
	text "Hoi, <PLAY_G>?" ; "Hi, <PLAY_G>?"

	para "Goedenavond pika" ; "Good evening pika,"
	line "alles goed pika?" ; "what's up pika?"
	done

DerekGreetText:
	text "<PLAY_G> pika," ; "<PLAY_G> pika, good"
	line "goedemorgen!" ; "morning!"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text ", hoe" ; ", how"
	line "pika gaat het?" ; "pika are you?"
	done

DerekGreetDayText:
	text "<PLAY_G> pika," ; "<PLAY_G> pika, good"
	line "fijne pika dag!" ; "pika day!"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text ", hoe" ; ", how"
	line "pika gaat het?" ; "pika are you?"
	done

DerekGreetNiteText:
	text "<PLAY_G> pika," ; "<PLAY_G> pika, good"
	line "goedenavond!" ; "evening!"

	para "Met @" ; "It's @"
	text_ram wStringBuffer3 ; MaxLength 5
	text ". Was" ; ". Were"
	line "je pika wakker?" ; "you pika awake?"
	done

DerekGenericText:
	text "Je moet dit dra-" ; "You have to hear"
	line "gen! Mijn geliefde" ; "this! My lovable"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " keek" ; " looked"
	line "naar me en lachte!" ; "at me and grinned!"

	para "Dat is vast omdat" ; "It must be because"
	line "onze harten als" ; "our hearts beat"
	cont "één kloppen!" ; "together as one!"
	done
