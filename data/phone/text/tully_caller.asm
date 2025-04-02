TullyMonHasGrownText:
	text "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is" ; " has"
	line "weer gegroeid." ; "grown again."

	para "Het was ongeveer" ; "It was only about"
	line "zo groot toen ik" ; "so big when I"

	para "het ving, maar nu" ; "caught it, but now"
	line "is ie veel forser." ; "it's way bigger."
	done

TullyDefeatedMonText:
	text "Oh ja, ik versloeg" ; "Oh yeah, I KO'd a"
	line "een @" ; "wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "."

	para "Die was giga, echt" ; "It was huge, like"
	line "zo groot zelfs." ; "this big even."

	para "Heh, dat kan je" ; "Heh, I guess you"
	line "natuurlijk niet" ; "can't tell over"
	cont "zien nu…" ; "the phone…"
	done

TullyLostAMonText:
	text "Ik verloor ook een" ; "Oh yeah, I lost a"
	line "wilde @" ; "wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "."

	para "Die was giga, echt" ; "It was huge, like"
	line "zo groot zelfs." ; "this big even."
	
	para "Heh, dat kan je" ; "Heh, I guess you"
	line "natuurlijk niet" ; "can't tell over"
	cont "zien nu…" ; "the phone…"
	done

TullyBattleRematchText:
	text "We moeten eens een" ; "We should get a"
	line "gevecht beginnen!" ; "battle going!"

	para "Ik vis nu op" ; "I'll be fishing on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."

	para "Wip langs als je" ; "Swing by if you"
	line "tijd hebt." ; "have the time."
	done

TullyHangUpText:
	text "Nou, ik zie je" ; "Well, I'll be"
	line "snel." ; "seeing you."
	done

TullyFoundItemText:
	text "Ik heb wat leuks" ; "I picked up a good"
	line "aan de rand van" ; "little thing at"
	cont "het water gepakt." ; "the water's edge."

	para "Zoals beloofd," ; "Like I promised,"
	line "voor jou." ; "it's yours."

	para "Ik wacht op" ; "I'll be waiting on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."
	done

TullyNoItemText:
	text "Of ik wat moois" ; "Have I found"
	line "heb gevonden?" ; "anything good?"

	para "Nope, nog niet." ; "Nope, not yet."

	para "Het is net vissen," ; "It's like fishing,"
	line "heb geduld." ; "you need patience."
	done

TullyForwardText:
	text "Yup, TULLY hier…" ; "Yup, TULLY here…"

	para "<PLAY_G>? Wat?" ; "<PLAY_G>? What?"
	line "Je bent verdwaald?" ; "You're lost?"

	para "We vechten straks" ; "Our battle will be"
	line "op @" ; "on @"
	text_ram wStringBuffer5 ; MaxLength 14
	text "."
	done

TullyHurryText:
	text "Ik heb wat moois" ; "I've got something"
	line "voor je." ; "good for you."

	para "Waggel even naar" ; "Hustle over to"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."
	done
