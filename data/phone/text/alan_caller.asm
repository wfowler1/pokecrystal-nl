AlanGettingStrongerText:
	text "De @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "wordt" ; "'s"
	line "steeds sterker," ; "getting stronger,"

	para "precies zoals ik" ; "exactly as I"
	line "had berekend!" ; "calculated!"
	done

AlanDefeatedMonText:
	text "Trouwens, we ver-" ; "By the way, we"
	line "sloegen een wilde " ; "knocked out a wild"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " een" ; " just"
	line "tijd terug." ; "the other day."

	para "Vooraf studeren" ; "Studying up in"
	line "heeft geholpen!" ; "advance worked!"
	done

AlanLostAMonText:
	text "Een wilde" ; "By the way, a wild"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " ont-" ; " escaped"
	cont "glipte me gister." ; "on me yesterday."

	para "Een rekenfout van" ; "A computational"
	line "mij…" ; "error on my part…"
	done

AlanBattleRematchText:
	text "Sindsdien heb ik" ; "I've studied quite"
	line "veel gestudeerd en" ; "a bit since then,"

	para "ben ik een stuk" ; "and I've gotten a"
	line "beter geworden!" ; "lot better!"

	para "Ik hang rond op" ; "I'm hanging out on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."

	para "Kun je langskomen" ; "Can you come down"
	line "om te vechten?" ; "for a battle?"
	done

AlanHangUpText:
	text "Tot later!" ; "See you later!"
	done

AlanFoundItemText:
	text "Hehehe, ik heb wat" ; "Hehehe, I picked"
	line "moois gevonden." ; "up something nice!"

	para "Je mag het hebben!" ; "You can have it!"
	line "Kom anders naar" ; "Why don't you come"

	para "" ; "to @"
	text_ram wStringBuffer5 ; MaxLength 15
	text_start
	line "om het te halen?" ; "and pick it up?"
	done

AlanHaventPickedUpAnythingText:
	text "Ik heb nog niks" ; "I haven't picked"
	line "gevonden." ; "up anything yet."

	para "Ik bel je als ik" ; "I'll call you if I"
	line "iets vind." ; "find something."
	done

AlanReminderText:
	text "Als we niet snel" ; "If we don't battle"
	line "vechten, vergeet" ; "soon, I'll forget"
	cont "ik mijn strategie!" ; "my strategy!"

	para "Ik wacht op" ; "I'm waiting on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"
	done

AlanComePickUpGiftText:
	text "Ik moet huiswerk" ; "I have to do my"
	line "doen, kun je snel" ; "homework, so can"

	para "je cadeau komen" ; "you come get your"
	line "ophalen?" ; "gift right away?"

	para "Ik wacht op" ; "I'm waiting on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"
	done
