ErinMonIsMuchStrongerText:
	text_ram wStringBuffer3 ; MaxLength 4
	text "'s @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start
	line "is veel sterker" ; "is much stronger"
	cont "dan eerder!" ; "than before!"
	done

ErinDefeatedMonText:
	text "En, en…" ; "And, and…"
	line "Ik versloeg net" ; "I just battled and"
	cont "een @" ; "beat @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "!"

	para "Mijn #MON zijn" ; "I've raised my"
	line "goed getraind!" ; "#MON properly!"
	done

ErinLostAMonText:
	text "Maar, maar…" ; "But, but…"

	para "Een @" ; "A wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start
	line "is mij weer eens" ; "got away from me"

	para "ontglipt. Het is" ; "again. It's just"
	line "niet eerlijk!" ; "not fair!"
	done

ErinBattleRematchText:
	text "Ik ben ERIN. Wil" ; "I'm ERIN. Want to"
	line "je weer vechten?" ; "battle me again?"

	para "Ditmaal verlies ik" ; "I won't lose this"
	line "niet!" ; "time!"

	para "Ik wacht op" ; "I'll be waiting on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"
	done

ErinHangUpText:
	text "Tot snel. Doeiii!" ; "See you. Bye-bye!"
	done

ErinWorkingHardText:
	text "Ik ben hard bezig" ; "I'm working hard"
	line "om mijn #MON" ; "to raise my"
	cont "te trainen!" ; "#MON!"

	para "Kom terug voor nog" ; "Come back for"
	line "een gevecht!" ; "another battle!"
	done

ErinComeBattleText:
	text "Oh, <PLAY_G>!"
	line "Kom vechten met" ; "Come battle ERIN!"
	cont "ERIN!"

	para "Ik wacht wel op" ; "I'll be waiting on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"
	done
