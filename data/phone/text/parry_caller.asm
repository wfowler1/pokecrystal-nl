ParryNothingCanMatchText:
	text "Niks evenaart nu" ; "Nothing can match"
	line "m'n @" ; "my @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "nog." ; " now."
	done

ParryDefeatedMonText:
	text "We versloegen een" ; "Yeah, we KO'd a"
	line "wilde " ; "wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "!"

	para "Leuk hoor, maar ik" ; "That was OK, but I"
	line "wilde het vangen…" ; "wanted to get it…"
	done

ParryLostAMonText:
	text "Gisteren zagen we" ; "And yesterday, we"
	line "nog een wilde" ; "spotted a wild"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "."
	line "We twijfelden of" ; "We were debating"

	para "we die moesten" ; "whether to catch"
	line "vangen of ver-" ; "it or beat it."
	cont "slaan."

	para "En toen kwam een" ; "When along came"
	line "andere gast die" ; "another guy who"

	para "het ving! Het lef" ; "caught it!"
	line "van die gozer!" ; "How about that!"
	done

ParryBattleRematchText:
	text "Je overweegt om" ; "You're thinking"
	line "weer met mij te" ; "you'd like to"

	para "vechten. Heb ik" ; "battle me. Am I"
	line "gelijk of niet?" ; "right or what?"

	para "Yep! Ik zie je op" ; "Yep! We'll meet on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"
	done

ParryHangUpText:
	text "OK, bel me snel" ; "OK, give me a call"
	line "nog eens!" ; "again!"
	done

ParryBattleWithMeText:
	text "Je vecht weer met" ; "You'll battle with"
	line "me, toch?" ; "me again, right?"
	done

ParryHaventYouGottenToText:
	text "Ben je nog niet" ; "Haven't you gotten"
	line "bij @" ; "to @"
	text_ram wStringBuffer5 ; MaxLength 14
	text "?"

	para "Ik vind het niet" ; "Waiting here isn't"
	line "erg om te wachten," ; "bad, but I'd sure"
	cont "maar heb zin om te" ; "like to battle!"
	cont "vechten!"
	done
