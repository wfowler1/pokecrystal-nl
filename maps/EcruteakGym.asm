	object_const_def
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUIDE
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScripts:
	def_scene_scripts
	scene_script EcruteakGymForcedToLeaveScene, SCENE_ECRUTEAKGYM_FORCED_TO_LEAVE
	scene_script EcruteakGymNoopScene,          SCENE_ECRUTEAKGYM_NOOP

	def_callbacks

EcruteakGymForcedToLeaveScene:
	sdefer EcruteakGymClosed
	end

EcruteakGymNoopScene:
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutToWhite
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuideWinScript
	writetext EcruteakGymGuideText
	waitbutton
	closetext
	end

.EcruteakGymGuideWinScript:
	writetext EcruteakGymGuideWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	jumpstd GymStatue2Script

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Goed dat je" ; "Good of you to"
	line "bent gekomen." ; "have come."

	para "Hier in ECRUTEAK" ; "Here in ECRUTEAK,"
	line "zijn #MON" ; "#MON have been"
	cont "vereerd." ; "revered."

	para "Er wordt gezegd" ; "It's said that a"
	line "dat een regen-" ; "rainbow-colored"
	cont "boogkleurige" ; 

	para "#MON zal neer-" ; "#MON will come"
	line "dalen om zich te" ; "down to appear"

	para "tonen voor een" ; "before a truly"
	line "echt machtige" ; "powerful trainer."
	cont "trainer." ; 

	para "Ik geloofde dat" ; "I believed that"
	line "verhaal, dus heb" ; "tale, so I have"

	para "ik hier stiekem" ; "secretly trained"
	line "mijn hele leven" ; "here all my life."
	cont "getraind." ; 

	para "En nu kan ik" ; "As a result, I can"
	line "zien wat ander-" ; "now see what"
	cont "en niet zien." ; "others cannot."

	para "Slechts een" ; "Just a bit more…"
	line "beetje meer…" ; 

	para "Met een beetje" ; "With a little"
	line "meer, kan ik een" ; "more, I could see"

	para "toekomst zien" ; "a future in which"
	line "waarin ik de" ; "I meet the #MON"
	cont "#MON van de" ; "of rainbow colors."
	cont "regenboog ontmoet." ; 

	para "Jij gaat me helpen" ; "You're going to"
	line "dat level te" ; "help me reach that"
	cont "bereiken!" ; "level!"
	done

MortyWinLossText:
	text "Ik ben nog niet" ; "I'm not good"
	line "goed genoeg…" ; "enough yet…"

	para "Oké. Deze BADGE" ; "All right. This"
	line "is van jou." ; "BADGE is yours."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> ontvangt" ; "<PLAYER> received"
	line "FOGBADGE." ; "FOGBADGE."
	done

MortyText_FogBadgeSpeech:
	text "Met de FOGBADGE" ; "By having FOG-"
	line "luisteren #MON" ; "BADGE, #MON up"

	para "tot L50" ; "to L50 will obey"
	line "naar je." ; "you."

	para "En, #MON die" ; "Also, #MON that"
	line "SURF kennen" ; "know SURF will be"

	para "kunnen die aanval" ; "able to use that"
	line "overal gebruiken." ; "move anytime."

	para "Ik wil je dit" ; "I want you to have"
	line "ook geven." ; "this too."
	done

MortyText_ShadowBallSpeech:
	text "Het is SCHADUWBAL." ; "It's SHADOW BALL."
	line "Het doet schade" ; "It causes damage"

	para "en kan de SPCL." ; "and may reduce"
	line "VERD. verminderen." ; "SPCL.DEF."

	para "Gebruik het als" ; "Use it if it"
	line "het je wat lijkt." ; "appeals to you."
	done

MortyFightDoneText:
	text "Aha…" ; "I see…"

	para "Je reis heeft je" ; "Your journey has"
	line "naar verre oorden" ; "taken you to far-"
	cont "geleid." ; "away places."

	para "En je hebt veel" ; "And you have wit-"
	line "meer meegemaakt" ; "nessed much more"
	cont "dan ik." ; "than I."

	para "Ik ben daar" ; "I envy you for"
	line "jaloers op…" ; "that…"
	done

SageJeffreySeenText:
	text "Ik heb de lente" ; "I spent the spring"
	line "met mijn #MON" ; "with my #MON."
	cont "doorgebracht." ; 

	para "En toen zomer," ; "Then summer, fall"
	line "herfst en winter…" ; "and winter…"

	para "En toen kwam" ; "Then spring came"
	line "lente weer. We" ; "again. We have"

	para "leven al heel" ; "lived together"
	line "lang samen." ; "for a long time."
	done

SageJeffreyBeatenText:
	text "Winst en verlies," ; "Wins and losses, I"
	line "ik heb het beide" ; "experienced both."
	cont "meegemaakt." ; 
	done

SageJeffreyAfterBattleText:
	text "Waar kwamen" ; "Where did #MON"
	line "#MON vandaan?" ; "come from?"
	done

SagePingSeenText:
	text "Kun je onze" ; "Can you inflict"
	line "#MON raken?" ; "any damage on our"
	cont "Ik daag je uit!" ; "#MON?"
	done

SagePingBeatenText:
	text "Ah! Goed gedaan!" ; "Ah! Well done!"
	done

SagePingAfterBattleText:
	text "We gebruiken enkel" ; "We use only ghost-"
	line "Geest-#MON." ; "type #MON."

	para "Normaal-type" ; "No normal-type"
	line "aanvallen kunnen" ; "attack can harm"
	cont "hen niet raken!" ; "them!"
	done

MediumMarthaSeenText:
	text "Ik zal winnen!" ; "I shall win!"
	done

MediumMarthaBeatenText:
	text "I-ik heb verloren!" ; "I, I, I lost!"
	done

MediumMarthaAfterBattleText:
	text "Degene die het" ; "The one who wants"
	line "meest wil winnen-" ; "to win most--will!"
	cont "zal winnen!" ; 
	done

MediumGraceSeenText:
	text "Sta je perplex" ; "Stumped by our in-"
	line "van onze onzicht-" ; "visible floor?"
	cont "bare vloer?" ; 

	para "Versla me als" ; "Defeat me if you"
	line "je een hint wil!" ; "want a hint!"
	done

MediumGraceBeatenText:
	text "Wa-wat?" ; "Wha-what?"
	done

MediumGraceAfterBattleText:
	text "Goed. Ik zal je" ; "Fine. I shall tell"
	line "het geheim ver-" ; "you the secret of"

	para "tellen van de on-" ; "the invisible"
	line "zichtbare vloer." ; "floor."

	para "Het pad is recht" ; "The path is right"
	line "voor onze ogen!" ; "before our eyes!"
	done

EcruteakGymGuideText:
	text "De trainers hier" ; "The trainers here"
	line "hebben verborgen" ; "have secret mo-"
	cont "motieven." ; "tives."

	para "Als je wint, ver-" ; "If you win, they"
	line "tellen ze je wel-" ; "may tell you some"

	para "licht geheimen" ; "deep secrets about"
	line "over ECRUTEAK." ; "ECRUTEAK."
	done

EcruteakGymGuideWinText:
	text "Pfoe, <PLAYER>." ; "Whew, <PLAYER>."
	line "Je deed het" ; "You did great!"
	cont "geweldig!" ; 

	para "Ik zat bevend" ; "I was cowering in"
	line "in de hoek vol" ; "the corner out of"
	cont "pure angst!" ; "pure terror!"
	done

EcruteakGymClosedText:
	text "MORTY, de GYM-" ; "MORTY, the GYM"
	line "LEIDER, is weg." ; "LEADER, is absent."

	para "Sorry, maar je" ; "Sorry, but you'll"
	line "moet vertrekken." ; "have to leave."

	para "Hohohoho." ; "Hohohoho."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuideScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
