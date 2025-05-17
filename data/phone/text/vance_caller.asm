VanceMonHasBecomeTougherText:
	text "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is" ; "'s"
	line "nu sterker." ; "become tougher."

	para "Klaar om op te" ; "We've achieved"
	line "stijgen!" ; "liftoff!"
	done

VanceDefeatedMonText:
	text "We winnen zo van" ; "We can easily beat"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "!"

	para "…Huh? Jij ook?" ; "…Huh? You too?"
	line "Goed nieuws, toch?" ; "Isn't that great?"
	done

VanceLostAMonText:
	text "Moet je horen, een" ; "But get this, a"
	line "wilde @" ; "wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start
	para "ontglipte ons echt" ; "just barely eluded"
	line "net." ; "us."

	para "Ik wilde daarna" ; "I wanted to FLY"
	line "VLIEGEN…" ; "after it…"
	done

VanceBattleRematchText:
	text "Ik ben nu op" ; "Right now, I'm on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."

	para "Weet je nog, waar" ; "You know, where I"
	line "ik je ontmoette?" ; "first met you?"

	para "Wil je vechten?" ; "Want to battle?"
	line "Ik wacht hier wel." ; "I'll wait here."
	done

VanceHangUpText:
	text "OK, doei voor nu!" ; "OK, bye for now!"
	done

VanceLookingForwardText:
	text "Ik kijk uit naar" ; "I'll be looking"
	line "ons volgende" ; "forward to our"
	cont "gevecht!" ; "next battle!"
	done

VanceHurryHurryText:
	text "Oh, <PLAY_G>!"
	line "Maak haast!" ; "Hurry, hurry!"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"
	line "VLIEG hierheen!" ; "FLY over now!"
	done
