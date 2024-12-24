BethExhilaratingRideText:
	text "Herinner je mijn" ; "Do you remember my"
	line "lieve @" ; "sweet @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "?"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "rent" ; " runs"
	line "heel snel." ; "very fast."

	para "Het is bevrijdend" ; "It's exhilarating"
	line "om achterop te" ; "to ride on its"

	para "rijden bij een" ; "back when it"
	line "hoge snelheid." ; "really gets going."
	done

BethDefeatedMonText:
	text "Oh, heb je eerder" ; "Oh, have you ever"
	line "een @" ; "seen a @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start
	cont "gezien?" ; "before?"

	para "Ik vocht er net" ; "I just battled"
	line "tegen…" ; "one…"

	para "Het was sneller" ; "It was much faster"
	line "dan gedacht." ; "than I expected."

	para "Ik schrok er een" ; "I was a little"
	line "beetje van." ; "shocked."

	para "Uiteraard won ik" ; "I still won, of"
	line "alsnog." ; "course."
	done

BethLostAMonText:
	text "Oh, ik zag net een" ; "Oh, I just saw a"
	line "wilde @" ; "wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "."

	para "Ik probeerde het" ; "I was trying to"
	line "te vangen, maar ik" ; "catch it when I"

	para "bleek helemaal" ; "noticed that I was"
	line "geen #BALLEN te" ; "all out of #"
	cont "hebben. Als je" ; "BALLS."

	para "niet je spullen" ; "If you don't check"
	line "bijhoudt, zit je" ; "your items, you"

	para "soms op 't slecht-'" ; "may run out at the"
	line "ste moment zonder." ; "worst time."

	para "Hopelijk leer je" ; "I hope you learn"
	line "van mijn fout." ; "from my mistake."
	done

BethBattleRematchText:
	text "Wil je vechten?" ; "Do you want to"
	line "Ditmaal ga ik van" ; "battle? I'm going"
	cont "je winnen!" ; "to win this time!"

	para "Ik wacht op je" ; "I'll be waiting"
	line "in de buurt van" ; "for you around"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."
	line "Zoek me op, OK?" ; "Look for me, OK?"
	done

BethHangUpText:
	text "OK, doei-doei!" ; "OK, bye-bye!"
	done

BethLetsBattleAgainSometimeText:
	text "Laten we nog eens" ; "Let's battle again"
	line "vechten!" ; "sometime!"
	done

BethReminderText:
	text "Um… <PLAY_G>?"
	line "Wat is er mis?" ; "What's wrong?"

	para "Ben je onze" ; "Did you forget our"
	line "afspraak vergeten?" ; "deal?"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."

	para "Dat is waar ik op" ; "That's where I'm"
	line "je wacht." ; "waiting."
	done
