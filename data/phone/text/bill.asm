BillPhoneMornGreetingText:
	text "Goedemorgen!" ; "Good morning!"

	para "Dit is de ADMIN-" ; "This is the #-"
	line "ISTRATIEDIENST van" ; "MON STORAGE SYSTEM"

	para "het #MON-" ; "ADMINISTRATION"
	line "OPSLAGSYSTEEM." ; "SERVICE."
	done

BillPhoneDayGreetingText:
	text "Goedendag!"

	para "Dit is de ADMIN-" ; "This is the #-"
	line "ISTRATIEDIENST van" ; "MON STORAGE SYSTEM"
	
	para "het #MON-" ; "ADMINISTRATION"
	line "OPSLAGSYSTEEM." ; "SERVICE."
	done

BillPhoneNiteGreetingText:
	text "Goedenavond!"

	para "Dit is de ADMIN-" ; "This is the #-"
	line "ISTRATIEDIENST van" ; "MON STORAGE SYSTEM"
	
	para "het #MON-" ; "ADMINISTRATION"
	line "OPSLAGSYSTEEM." ; "SERVICE."
	done

BillPhoneGenericText:
	text "Met wie spreek ik?" ; "Who's calling?"

	para "<PLAY_G>, zeg je?" ; "<PLAY_G>, is it?"
	line "Een ogenblik…" ; "Hang on a sec…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "Bedankt voor het" ; "Thanks for"
	line "wachten!" ; "waiting!"

	para "<PLAY_G>, je BOX" ; "<PLAY_G>, your BOX"
	line "heeft plek voor @" ; "has room for @"
	text_ram wStringBuffer3 ; MaxLength 2
	text_start
	cont "#MON." ; "more #MON."

	para "Ga er op uit en" ; "Get out there and"
	line "vul 'm!" ; "fill it up!"
	done

BillPhoneNearlyFullText:
	text "Bedankt voor het" ; "Thanks for"
	line "wachten!" ; "waiting!"

	para "<PLAY_G>, je BOX" ; "<PLAY_G>, your BOX"
	line "heeft plek voor" ; "has room for only"
	cont "@"
	text_ram wStringBuffer3 ; MaxLength 2
	text " #MON maar." ; " more #MON."

	para "Wellicht moet je" ; "Maybe you should"
	line "van BOX wisselen." ; "switch your BOX."
	done

BillPhoneFullText:
	text "Bedankt voor het" ; "Thanks for"
	line "wachten!" ; "waiting!"

	para "<PLAY_G>, je BOX" ; "<PLAY_G>, your BOX"
	line "is vol!" ; "is full!"

	para "Je moet van BOX" ; "You'll have to"
	line "wisselen als je" ; "switch BOXES if"

	para "meer #MON wil" ; "you want to catch"
	line "vangen." ; "more #MON."
	done

BillPhoneNewlyFullText:
	text "He, <PLAY_G>?" ; "Hi, <PLAY_G>?"
	line "Ik ben het, BILL!" ; "It's me, BILL!"

	para "Fijn dat je mijn" ; "Thanks for using"
	line "OPSLAGSYSTEEM" ; "my STORAGE SYSTEM."
	cont "gebruikt."

	para "Die laatste #-" ; "That last #MON"
	line "MON die je stuurde" ; "you sent filled"
	cont "vulde de BOX." ; "your BOX up."

	para "Je moet van BOX" ; "You'll have to"
	line "wisselen als je" ; "switch BOXES if"

	para "meer #MON wil" ; "you want to catch"
	line "vangen." ; "more #MON."

	para "Doei he!" ; "Bye now!"
	done
