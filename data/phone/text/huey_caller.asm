HueyBattleRematchText:
	text "He, ik daag je uit" ; "Hey, I challenge"
	line "voor een gevecht!" ; "you to a battle!"

	para "Ditmaal zal het" ; "It won't be like"
	line "anders gaan!" ; "last time!"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text_start ; "'s"
	line "is waar ik wacht." ; "where I'm waiting"

	para "Als de wiede-" ; "for you. Hustle"
	line "weerga hierheen!" ; "over here pronto!"
	done

HueyHangUpText:
	text "Spreek je!" ; "See ya!"
	done

HueyWeHaveToBattleAgainSometimeText:
	text "We moeten nog eens" ; "We have to battle"
	line "vechten." ; "again sometime."

	para "Reken er maar op" ; "You can bet I'm"
	line "dat ik je blijf" ; "going to keep"

	para "uitdagen totdat ik" ; "challenging you"
	line "win." ; "till I win."
	done

HueyReminderText:
	text "He, beter vergeet" ; "Hey, you'd better"
	line "je niet dat we" ; "not have forgotten"
	cont "gaan vechten!" ; "about our battle!"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!"

	para "Als de wiedeweerga" ; "Hustle over quick!"
	line "komen! Ik wacht!" ; "I'm waiting!"
	done
