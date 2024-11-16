UnknownGenericText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Mijn #MON zijn" ; "My #MON are a"
	line "wat te energiek." ; "bit too energetic."

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text ","
	line "vooral." ; "especially."

	para "Steeds als het een" ; "Every time it"
	line "trainer spot, wil" ; "spots a trainer,"
	cont "het vechten." ; "it has to battle."

	para "Het wordt mij wat" ; "It gets to be a"
	line "teveel!" ; "bit much for me!"
	done

UnknownTougherThanEverText:
	text "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " " "'s"
	line "lijkt sterker dan" ; "looking tougher"
	cont "ooit." ; "than ever."

	para "Het lijkt zelfs" ; "It looks even"
	line "sterker dan mij!" ; "tougher than me!"
	done
