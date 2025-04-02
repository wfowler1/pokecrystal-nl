	object_const_def
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route35NationalParkGateNoop1Scene,             SCENE_ROUTE35NATIONALPARKGATE_NOOP
	scene_script Route35NationalParkGateNoop2Scene,             SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script Route35NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route35NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route35NationalParkGateCheckIfContestAvailableCallback

Route35NationalParkGateNoop1Scene:
	end

Route35NationalParkGateNoop2Scene:
	end

Route35NationalParkGateLeaveContestEarlyScene:
	sdefer Route35NationalParkGateLeavingContestEarlyScript
	end

Route35NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkBugContestIsRunningScript
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOOP
	endcallback

Route35NationalParkBugContestIsRunningScript:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route35NationalParkGateCheckIfContestAvailableCallback:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkBugContestIsRunningScript
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGateLeavingContestEarlyScript:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd BugContestResultsWarpScript

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd DayToTextScript
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Het is @" ; "Today's @"
	text_ram wStringBuffer3 ; Day of the week MaxLength 9
	text "."
	line "De dag van het" ; "That means the"

	para "wekelijkse" ; "Bug-Catching Con-"
	line "KEVERTOERNOOI." ; "test is on today."

	para "De regels zijn" ; "The rules are sim-"
	line "simpel." ; "ple."

	para "Vang met één van" ; "Using one of your"
	line "je #MON een" ; "#MON, catch a"

	para "insect-#MON om" ; "bug #MON to be"
	line "te beoordelen." ; "judged."

	para "Wil je het" ; "Would you like to"
	line "proberen?" ; "give it a try?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Hier zijn de PARK-" ; "Here are the PARK"
	line "BALLEN voor het" ; "BALLS for the"
	cont "Toernooi." ; "Contest."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> kreeg" ; "<PLAYER> received"
	line "{d:BUG_CONTEST_BALLS} PARKBALLEN." ; "{d:BUG_CONTEST_BALLS} PARK BALLS."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "De persoon met de" ; "The person who"
	line "sterkste insect-" ; "gets the strong-"
	cont "#MON is de" ; "est bug #MON"
	cont "winnaar." ; "is the winner."

	para "Je hebt {d:BUG_CONTEST_MINUTES}" ; "You have {d:BUG_CONTEST_MINUTES}"
	line "minuten." ; "minutes."

	para "Als je PARKBALLEN" ; "If you run out of"
	line "op zijn, ben je" ; "PARK BALLS, you're"
	cont "klaar." ; "done."

	para "Je kunt je laatst" ; "You can keep the"
	line "gevangen #MON" ; "last #MON you"
	cont "achteraf houden." ; "catch as your own."

	para "Ga en vang de" ; "Go out and catch"
	line "sterkste insect-" ; "the strongest bug"

	para "#MON die je" ; "#MON you can"
	line "kunt vinden!" ; "find!"
	done


Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "Uh-oh…"

	para "Je hebt meer dan" ; "You have more than"
	line "één #MON." ; "one #MON."

	para "Je moet" ; "You'll have to use"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text ", de" ; ", the"

	para "eerste #MON in" ; "first #MON in"
	line "je team gebruiken." ; "your party."

	para "Is dat oké voor" ; "Is that OK with"
	line "jou?" ; "you?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Prima, we bewaren" ; "Fine, we'll hold"
	line "je andere #MON" ; "your other #MON"
	cont "ondertussen." ; "while you compete."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER>'s #MON"
	line "zijn achtergelaten" ; "were left with the"
	cont "bij TOERNOOIHULP." ; "CONTEST HELPER."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Kies de #MON" ; "Please choose the"
	line "om te gebruiken" ; "#MON to be used"

	para "in de wedstrijd en" ; "in the Contest,"
	line "kom dan naar mij." ; "then come see me."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "OK. We hopen dat" ; "OK. We hope you'll"
	line "je in de toekomst" ; "take part in the"
	cont "meedoet." ; "future."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "Uh-oh…"
	line "De eerste #MON" ; "The first #MON"

	para "in je team kan" ; "in your party"
	line "niet vechten." ; "can't battle."

	para "Wissel met de" ; "Please switch it"
	line "#MON die je wil" ; "with the #MON"

	para "gebruiken en kom" ; "you want to use,"
	line "dan naar mij." ; "then come see me."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	text "Uh-oh…"
	line "Zowel je team als" ; "Both your party"

	para "je PC-BOX zitten" ; "and your PC BOX"
	line "vol." ; "are full."

	para "Je hebt geen plek" ; "You have no room"
	line "voor de insecten-" ; "to put the bug"
	cont "die je vangt." ; "#MON you catch."

	para "Maak ruimte in je" ; "Please make room"
	line "team of PC-BOX, en" ; "in your party or"

	para "kom dan naar mij" ; "your PC BOX, then"
	line "toe." ; "come see me."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Uh-oh…"
	line "Je hebt een EI als" ; "You have an EGG as"

	para "eerste #MON in" ; "the first #MON"
	line "je team. Wissel" ; "in your party."

	para "deze voor de" ; "Please switch it"
	line "#MON die je wil" ; "with the #MON"

	para "gebruiken en kom" ; "you want to use,"
	line "dan naar mij toe." ; "then come see me."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Je hebt nog @" ; "You still have @"
	text_ram wStringBuffer3 ; MaxLength 2
	text_start
	line "minuten te gaan." ; "minute(s) left."

	para "Wil je nu al" ; "Do you want to"
	line "afronden?" ; "finish now?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "OK. Wacht bij de" ; "OK. Please wait at"
	line "Noorderpoort op" ; "the North Gate for"

	para "de aankondiging" ; "the announcement"
	line "van de winnaars." ; "of the winners."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "OK. Ga alsjeblieft" ; "OK. Please get back"
	line "weer naar buiten" ; "outside and finish"
	cont "en rond af." ; "up."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "Het Toernooi van" ; "Today's Contest is"
	line "de dag is voorbij." ; "over. We hope you"

	para "Hopelijk doe je" ; "will participate"
	line "een andere keer" ; "in the future."
	cont "mee."
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "We houden vaak" ; "We hold Contests"
	line "Toernooien in het" ; "regularly in the"

	para "PARK. Je moet eens" ; "PARK. You should"
	line "meedoen." ; "give it a shot."
	done

Route35NationalParkGateYoungsterText:
	text "Wanneer vindt het" ; "When is the next"
	line "volgende KEVER-" ; "Bug-Catching Con-"
	cont "TOERNOOI plaats?" ; "test going to be?"
	done

BugCatchingContestExplanationText:
	text "Het KEVERTOERNOOI" ; "The Bug-Catching"
	line "is iedere dinsdag," ; "Contest is held on"

	para "donderdag en op" ; "Tuesday, Thursday"
	line "zaterdag." ; "and Saturday."

	para "Niet alleen win je" ; "Not only do you"
	line "er prijzen door" ; "earn a prize just"

	para "mee te doen, je" ; "for participating,"
	line "mag gevangen" ; "you also get to"

	para "insect-#MON" ; "keep the bug"
	line "na de wedstrijd" ; "#MON you may"

	para "ook nog eens" ; "have at the end of"
	line "houden." ; "the contest."
	done

Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	def_object_events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
