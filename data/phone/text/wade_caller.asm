WadeAreYourMonGrowingText:
	text "Groeien je #MON" ; "Are your #MON"
	line "een beetje?" ; "growing?"

	para "Mijn #MON" ; "My #MON are"
	line "groeien wat te" ; "growing a bit too"

	para "snel voor mij. Het" ; "quickly for me."
	line "is overweldigend!" ; "It's overwhelming!"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " groeit" ; "'s grow-"
	line "vooral heel erg" ; "ing especially"

	para "snel. Ik denk dat" ; "quickly. I think"
	line "het lastig wordt." ; "it'll get tough."
	done

WadeDefeatedMonText:
	text "We versloegen een" ; "Oh yeah, we KO'd a"
	line "wilde @" ; "wild @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text_start
	para "met één klap" ; "with one hit a"
	line "een tijd terug." ; "while back."

	para "Het ging zo snel" ; "It went down so"
	line "neer, ik kreeg" ; "easily, I felt a"

	para "medelijden met" ; "little sorry for"
	line "het arme beestje." ; "the poor thing."
	done

WadeLostAMonText:
	text "Oh ja, een wilde" ; "Oh yeah, a wild"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " ontkwam" ; " got"

	para "op het laatste" ; "away from me at"
	line "moment van me." ; "the last second."

	para "Ik weet dat ie" ; "I know it's a"
	line "niet zeldzaam is…" ; "common #MON…"

	para "Maar het is irri-" ; "But it does annoy"
	line "tant dat ie" ; "me that it got"

	para "ontkwam toen ik" ; "away when I almost"
	line "het bijna had." ; "had it."
	done

WadeBattleRematchText:
	text "Heb je zin in een" ; "Do you feel like a"
	line "#MON-gevecht?" ; "#MON battle?"

	para "Het zal niet als" ; "It won't be like"
	line "eerder zijn!" ; "last time!"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text_start
	line "is waar ik ben." ; "where I'll be."

	para "Laat me weten als" ; "Let me know when"
	line "je hier heenkomt." ; "you get there."
	done

WadeHangUpText:
	text "Zie je later!" ; "See you later!"
	done

WadeBugCatchingContestText:
	text "Het KEVERTOERNOOI" ; "The Bug-Catching"
	line "vindt vandaag" ; "Contest is at the"

	para "plaats in" ; "NATIONAL PARK"
	line "NATIONAAL PARK." ; "today."

	para "Ga jij erheen," ; "Are you going,"
	line "<PLAY_G>?"

	para "Ik zit nog te" ; "I'm trying to make"
	line "twijfelen." ; "up my mind."
	done

WadeFoundItemText:
	text "Ik vond allerlei" ; "I found all kinds"
	line "soorten BESSEN." ; "of BERRIES. If you"

	para "Als je het wil," ; "want, I'll share"
	line "kan ik wel delen." ; "some with you."

	para "Ik wacht op" ; "I'll be waiting on"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "."
	done

WadeNoBerriesText:
	text "Huh? BESSEN?" ; "Huh? BERRIES?"

	para "Sorry, ik heb nog" ; "Sorry, I haven't"
	line "niks gevonden." ; "found any yet."

	para "Ik bel als ik wat" ; "I'll call you if I"
	line "vind. Kun je daar" ; "find any. Will you"
	cont "op wachten?" ; "please wait?"
	done

WadeQuickBattleText:
	text "Laten we nou eens" ; "Let's battle"
	line "vechten!" ; "already!"

	para "@"
	text_ram wStringBuffer5 ; MaxLength 15
	text " is"
	line "waar ik ben." ; "where I am."

	para "Kom alsjeblieft zo" ; "Please get here as"
	line "snel mogelijk!" ; "soon as you can!"
	done

WadeComeQuickText:
	text "Hoezo ben je hier" ; "How come you're"
	line "nog niet?" ; "not here yet?"

	para "@"
	text_ram wStringBuffer5 ; MaxLength 15
	text " is"
	line "waar ik ben." ; "where I am."

	para "Kom alsjeblieft zo" ; "Please get here as"
	line "snel mogelijk!" ; "soon as you can!"
	done
