	object_const_def
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_COOLTRAINER_F2
	const ROUTE26_YOUNGSTER
	const ROUTE26_FISHER
	const ROUTE26_FRUIT_TREE
	const ROUTE26_POKE_BALL

Route26_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermGaven3:
	trainer COOLTRAINERM, GAVEN3, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGaven3SeenText, CooltrainermGaven3BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	endifjustbattled
	opentext
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftrue .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainermGaven3BeatenText, 0
	readmem wGavenFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 1
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 2
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfBeth1:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	endifjustbattled
	opentext
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftrue .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfBeth1BeatenText, 0
	readmem wBethFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 1
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 2
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherScott:
	trainer FISHER, SCOTT, EVENT_BEAT_FISHER_SCOTT, FisherScottSeenText, FisherScottBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherScottAfterBattleText
	waitbutton
	closetext
	end

Route26Sign:
	jumptext Route26SignText

Route26FruitTree:
	fruittree FRUITTREE_ROUTE_26

Route26MaxElixer:
	itemball MAX_ELIXER

CooltrainermJakeSeenText:
	text "Ik doe m'n laatste" ; "I'm making my"
	line "voorbereidingen" ; "final preparations"

	para "voor de #MON-" ; "for the #MON"
	line "LEAGUE."
	done

CooltrainermJakeBeatenText:
	text "Verknald!" ; "I blew it!"
	done

CooltrainermJakeAfterBattleText:
	text "Het gaat lastig" ; "It's going to be"
	line "worden om bij de" ; "tough to win at"
	cont "LEAGUE te winnen." ; "the LEAGUE."

	para "Ik moet wat meer" ; "I need to do some"
	line "trainen." ; "more training."

	para "Ik hoorde dat de" ; "I hear that the"
	line "LEAGUE's ELITE"

	para "FOUR sterker zijn" ; "FOUR are tougher"
	line "dan GYMLEIDERS." ; "than GYM LEADERS."
	done

CooltrainermGaven3SeenText:
	text "Je wordt sterker" ; "By experiencing"
	line "door moeilijke" ; "tough battles, you"
	cont "gevechten." ; "gain power."
	done

CooltrainermGaven3BeatenText:
	text "Aaah! Het leven" ; "Gaah! Life is even"
	line "is nog moeilijker!" ; "tougher!"
	done

CooltrainermGavenAfterText:
	text "Om bij de #MON" ; "To get to #MON"
	line "LEAGUE te komen," ; "LEAGUE, you have"

	para "moet je door" ; "to get through"
	line "VICTORY ROAD heen." ; "VICTORY ROAD."

	para "Maar VICTORY ROAD" ; "But VICTORY ROAD"
	line "is moeilijk." ; "is tough."

	para "Praktisch niemand" ; "Practically nobody"
	line "gaat daar heen!" ; "goes there!"
	done

CooltrainerfJoyceSeenText:
	text "Als je zo ver" ; "Since you've come"
	line "bent gekomen, moet" ; "this far, you must"
	cont "je wel goed zijn." ; "be good."

	para "Ik ga dit gevecht" ; "I'm going to give"
	line "alles geven wat" ; "this battle every-"
	cont "ik in me heb!" ; "thing I've got!"
	done

CooltrainerfJoyceBeatenText:
	text "Nee! Ik geloof" ; "No! I don't"
	line "dit niet!" ; "believe this!"
	done

CooltrainerfJoyceAfterBattleText:
	text "Ik heb acht" ; "I've defeated"
	line "GYMLEIDERS ver-" ; "eight GYM LEADERS,"

	para "slagen, dus ik was" ; "so I was feeling"
	line "vol vertrouwen." ; "confident."

	para "Ik moet harder m'n" ; "I'll have to try"
	line "best doen." ; "harder next time."
	done

CooltrainerfBeth1SeenText:
	text "Ik verloor van een" ; "I lost to a train-"
	line "trainer genaamd" ; "er named <RIVAL>."

	para "<RIVAL>. Hij was" ; "He was really"
	line "erg sterk, maar…" ; "strong, but…"

	para "Het leek alsof hij" ; "It was as if he"
	line "koste wat het kost" ; "absolutely had to"
	cont "moest winnen." ; "win at any cost."

	para "Ik had medelijden" ; "I felt sorry for"
	line "met zijn #MON." ; "his #MON."
	done

CooltrainerfBeth1BeatenText:
	text "#MON zijn geen" ; "#MON aren't"
	line "oorlogswapens." ; "tools of war."
	done

CooltrainerfBethAfterText:
	text "#MON zijn on-" ; "#MON are in-"
	line "schatbare partners" ; "valuable, lifelong"
	cont "voor het leven." ; "partners."
	done

PsychicRichardSeenText:
	text "Wow, kijk al die" ; "Wow, look at all"
	line "BADGES! Ik ben" ; "those BADGES!"
	cont "onder de indruk." ; "I'm impressed."

	para "Maar ze gewoon" ; "But you're not"
	line "verzamelen is niet" ; "satisfied by just"

	para "genoeg voor je," ; "collecting them,"
	line "toch?" ; "right?"
	done

PsychicRichardBeatenText:
	text "Goed gevecht!" ; "Good battle!"
	done

PsychicRichardAfterBattleText:
	text "Mensen en #MON" ; "People and #MON"
	line "groeien van hun" ; "grow from their"
	cont "ervaringen." ; "experiences."

	para "Word niet lui en" ; "Don't get lazy and"
	line "zelfingenomen." ; "complacent."
	done

FisherScottSeenText:
	text "Ik voel me ge-" ; "I'm feeling great"
	line "weldig vandaag!" ; "today!"

	para "Ik denk dat ik" ; "I feel like I"
	line "zelfs de LEAGUE-" ; "could boot even"
	cont "KAMPIOEN kan" ; "the LEAGUE CHAMP!"
	cont "verslaan!" ;
	done

FisherScottBeatenText:
	text "Nee! Niet in" ; "No! Not in this"
	line "dit gevecht!" ; "battle!"
	done

FisherScottAfterBattleText:
	text "Net als met vissen" ; "Just like in fish-"
	line "is het voorbij" ; "ing, it's all over"

	para "met #MON als" ; "in #MON if you"
	line "je opgeeft." ; "give up."
	done

Route26SignText:
	text "ROUTE 26"

	para "#MON-LEAGUE"
	line "ONTVANGSTPOORT" ; "RECEPTION GATE"
	done

Route26_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, VICTORY_ROAD_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_HOUSE, 1
	warp_event  5, 71, DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  8,  6, BGEVENT_READ, Route26Sign

	def_object_events
	object_event 14, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermJake, -1
	object_event  9, 38, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermGaven3, -1
	object_event 10, 56, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	object_event  5,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfBeth1, -1
	object_event 13, 79, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicRichard, -1
	object_event 10, 92, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherScott, -1
	object_event 14, 54, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26FruitTree, -1
	object_event  9, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
