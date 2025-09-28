	object_const_def
	const NATIONALPARKBUGCONTEST_YOUNGSTER1
	const NATIONALPARKBUGCONTEST_YOUNGSTER2
	const NATIONALPARKBUGCONTEST_ROCKER
	const NATIONALPARKBUGCONTEST_POKEFAN_M
	const NATIONALPARKBUGCONTEST_YOUNGSTER3
	const NATIONALPARKBUGCONTEST_YOUNGSTER4
	const NATIONALPARKBUGCONTEST_LASS
	const NATIONALPARKBUGCONTEST_YOUNGSTER5
	const NATIONALPARKBUGCONTEST_YOUNGSTER6
	const NATIONALPARKBUGCONTEST_YOUNGSTER7
	const NATIONALPARKBUGCONTEST_POKE_BALL1
	const NATIONALPARKBUGCONTEST_POKE_BALL2

NationalParkBugContest_MapScripts:
	def_scene_scripts

	def_callbacks

BugCatchingContestant1AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant1AText
	waitbutton
	closetext
	end

BugCatchingContestant2AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant2AText
	waitbutton
	closetext
	end

BugCatchingContestant3AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant3AText
	waitbutton
	closetext
	end

BugCatchingContestant4AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant4AText
	waitbutton
	closetext
	end

BugCatchingContestant5AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant5AText
	waitbutton
	closetext
	end

BugCatchingContestant6AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant6AText
	waitbutton
	closetext
	end

BugCatchingContestant7AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant7AText
	waitbutton
	closetext
	end

BugCatchingContestant8AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant8AText
	waitbutton
	closetext
	end

BugCatchingContestant9AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant9AText
	waitbutton
	closetext
	end

BugCatchingContestant10AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant10AText
	waitbutton
	closetext
	end

NationalParkBugContestRelaxationSquareSign:
	jumptext NationalParkBugContestRelaxationSquareText

NationalParkBugContestBattleNoticeSign:
	jumptext NationalParkBugContestBattleNoticeText

NationalParkBugContestTrainerTipsSign:
	jumptext NationalParkBugContestTrainerTipsText

NationalParkBugContestParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkBugContestTMDig:
	itemball TM_DIG

NationalParkBugContestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

BugCatchingContestant1AText:
	text "DON: Ik ga winnen!" ; "DON: I'm going to"
	line "Beter laat je me" ; "win! Don't bother"
	cont "met rust." ; "me."
	done

BugCatchingContestant2AText:
	text "ED: Mijn PARASECT" ; "ED: My PARASECT"
	line "brengt #MON in" ; "puts #MON to"
	cont "slaap met SPOOR." ; "sleep with SPORE."
	done

BugCatchingContestant3AText:
	text "NICK: Ik train" ; "NICK: I'm raising"
	line "snelle #MON" ; "fast #MON for"
	cont "voor gevechten." ; "battles."
	done

BugCatchingContestant4AText:
	text "WILLIAM: Ik ben" ; "WILLIAM: I'm not"
	line "niet echt bezig" ; "concerned about"
	cont "met winnen." ; "winning."

	para "Ik zoek naar" ; "I'm just looking"
	line "zeldzame #MON." ; "for rare #MON."
	done

BugCatchingContestant5AText:
	text "BENNY: Ssh! Je" ; "BENNY: Ssh! You'll"
	line "jaagt SCYTHER weg." ; "scare off SCYTHER."

	para "Ik spreek je" ; "I'll talk to you"
	line "later." ; "later."
	done

BugCatchingContestant6AText:
	text "BARRY: Je moet" ; "BARRY: You should"
	line "insect-#MON" ; "weaken bug #MON"

	para "verzwakken en dan" ; "first, then throw"
	line "een BAL gooien." ; "a BALL."
	done

BugCatchingContestant7AText:
	text "CINDY: Ik hou van" ; "CINDY: I love bug"
	line "insect-#MON." ; "#MON."

	para "Jij lijkt ze ook" ; "I guess you must"
	line "leuk te vinden." ; "like them too."
	done

BugCatchingContestant8AText:
	text "JOSH: Ik verzamel" ; "JOSH: I've been"
	line "al insect-#MON" ; "collecting bug"

	para "sinds ik een baby" ; "#MON since I"
	line "was." ; "was just a baby."

	para "Ik ga dit absoluut" ; "There's no way I'm"
	line "niet verliezen!" ; "going to lose!"
	done

BugCatchingContestant9AText:
	text "SAMUEL: Als je" ; "SAMUEL: If you've"
	line "tijd hebt om te" ; "got the time to"

	para "kletsen, zoek dan" ; "chat, go find some"
	line "insect-#MON." ; "bug #MON."
	done

BugCatchingContestant10AText:
	text "KIPP: Ik heb" ; "KIPP: I've studied"
	line "insect-#MON" ; "about bug #MON"
	cont "veel bestudeerd." ; "a lot."

	para "Ik ga dit vast en" ; "I'm going to win"
	line "zeker winnen." ; "for sure."
	done

NationalParkBugContestRelaxationSquareText:
	text "ONTSPANPLEIN" ; "RELAXATION SQUARE"
	line "NATIONAAL PARK" ; "NATIONAL PARK"
	done

NationalParkBugContestBattleNoticeText:
	text "Wat is dit voor" ; "What is this"
	line "bericht?" ; "notice?"

	para "Gelieve alleen in" ; "Please battle only"
	line "het gras vechten." ; "in the grass."

	para "NATIONAAL PARK" ; "NATIONAL PARK"
	line "BOSWACHTERSHUISJE" ; "WARDEN'S OFFICE"
	done

NationalParkBugContestTrainerTipsText:
	text "TRAINERTIPS" ; "TRAINER TIPS"

	para "Print POST door 't" ; "Print out MAIL by"
	line "te openen en op" ; "opening it then"
	cont "START te drukken." ; "pressing START."
	done

NationalParkBugContest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 44, BGEVENT_READ, NationalParkBugContestRelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkBugContestBattleNoticeSign
	bg_event  6, 47, BGEVENT_ITEM, NationalParkBugContestHiddenFullHeal
	bg_event 12,  4, BGEVENT_READ, NationalParkBugContestTrainerTipsSign

	def_object_events
	object_event 19, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 28, 22, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event  9, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  7, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 23,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 27, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event 11, 27, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 16,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 17, 34, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	object_event 35, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event  1, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestTMDig, EVENT_NATIONAL_PARK_TM_DIG
