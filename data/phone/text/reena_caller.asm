ReenaMonsIsAPerfectMatchText:
	text "Luister, schat…" ; "Listen, dear…"

	para "Herinner je mijn" ; "Do you recall my"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "?"

	para "Ja, precies. Die" ; "Yes, exactly. That"
	line "lieve @" ; "lovely @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "."

	para "Vind je het ook" ; "Wouldn't you agree"
	line "niet een perfecte" ; "it's a perfect"
	cont "match voor mij?" ; "match for me?"
	done

ReenaDefeatedMonText:
	text "Of ik ooit een" ; "Have I ever faced"
	line " @" ; "a wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " zag?" ; "?"

	para "Wat een vraag!" ; "You need to ask?"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " ver-" ; " I've"
	line "sloeg ik meerdere" ; "beaten on numerous"
	cont "malen!" ; "occasions!"
	done

ReenaLostAMonText:
	text "Of het ooit niet" ; "Have I ever failed"
	line "lukte een wilde" ; "to catch a wild"
	cont "#MON te vangen?" ; "#MON?"

	para "Wat een vraag!" ; "You need to ask?"

	para "Dat zou bij mij" ; "I would never fail"
	line "nooit mislukken." ; "to catch a wild"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "…"
	line "Oh! Laat maar!" ; "Oh! Never mind!"
	done

ReenaBattleRematchText:
	text "Wij gaan samen" ; "We are going to"
	line "vechten!" ; "battle!"

	para "De locatie wordt" ; "The place shall be"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"

	para "Laat me niet" ; "Don't make me"
	line "wachten! Begrepen?" ; "wait! Got it?"
	done

ReenaHangUpText:
	text "Prima, ga maar." ; "Fine, you may go."
	done

ReenaForwardText:
	text "Maar wees niet" ; "Don't be too proud"
	line "trots omdat je mij" ; "just because you"

	para "toevallig wist te" ; "happened to beat"
	line "verslaan… " ; "me… "

	para "'t was een foutje!" ; "It was a fluke!"
	done

ReenaHurryText:
	text "Wat doe jij nou" ; "What are you"
	line "weer?" ; "doing?"

	para "Ik zei waar je" ; "I told you that"
	line "heen moet." ; "the place was"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"
	line "Probeer niet te" ; "Don't try to run!"
	cont "vluchten!"
	done
