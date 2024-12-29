	object_const_def
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUIDE

SaffronGym_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuideWinScript
	writetext SaffronGymGuideText
	waitbutton
	closetext
	end

.SaffronGymGuideWinScript:
	writetext SaffronGymGuideWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd GymStatue2Script

SabrinaIntroText:
	text "SABRINA: Ik wist" ; "SABRINA: I knew"
	line "dat je zou komen…" ; "you were coming…"

	para "Drie jaar geleden" ; "Three years ago I"
	line "had ik een visioen" ; "had a vision of"
	cont "over jouw komst." ; "your arrival."

	para "Je wil mijn BADGE" ; "You're after my"
	line "hebben. Ik vecht" ; "BADGE."

	para "niet graag, maar" ; "I don't enjoy bat-"
	line "het is mijn plicht" ; "tling, but it's my"

	para "als LEIDER om" ; "duty as a LEADER"
	line "BADGES toe te" ; "to confer BADGES"

	para "kennen aan ieder" ; "on anyone who has"
	line "die zichzelf" ; "proven him- or"
	cont "waardig bewijst." ; "herself worthy."

	para "Omdat je het" ; "Since you wish it,"
	line "wenst, laat ik je" ; "I will show you my"
	cont "mijn psychische" ; "psychic powers!"
	cont "krachten zien!"
	done

SabrinaWinLossText:
	text "SABRINA: Wat een" ; "SABRINA: Your"
	line "kracht…" ; "power…"

	para "Het overtreft" ; "It far exceeds"
	line "mijn visioenen…" ; "what I foresaw…"

	para "Misschien kan je" ; "Maybe it isn't"
	line "niet voorspellen" ; "possible to fully"

	para "wat de toekomst" ; "predict what the"
	line "in petto heeft…" ; "future holds…"

	para "OK, jij wint. Je" ; "OK, you win. You"
	line "hebt de MOERAS-" ; "earned yourself"
	cont "BADGE verdiend." ; "MARSHBADGE."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "MOERASBADGE." ; "MARSHBADGE."
	done

SabrinaMarshBadgeText:
	text "SABRINA: MOERAS-" ; "SABRINA: MARSH-"
	line "BADGE haalt je" ; "BADGE draws out"

	para "subliminale kracht" ; "your subliminal"
	line "krachten boven…" ; "powers…"

	para "Hoewel ik niet" ; "Although I failed"
	line "exact jouw kracht" ; "to accurately pre-"
	cont "kon voorspellen," ; "dict your power,"
	cont "weet ik dat dit " ; "this much I know"
	cont "waar is." ; "to be true."

	para "Jij wordt een" ; "You will become a"
	line "gevierde en" ; "celebrated and"
	cont "geliefde KAMPIOEN!" ; "beloved CHAMPION!"
	done

SabrinaFightDoneText:
	text "SABRINA: De liefde" ; "SABRINA: Your love"
	line "voor jouw #MON" ; "for your #MON"

	para "overtrof mijn" ; "overwhelmed my"
	line "psychische kracht…" ; "psychic power…"

	para "De kracht van" ; "The power of love,"
	line "liefde is, denk" ; "I think, is also a"

	para "ik, ook een soort" ; "kind of psychic"
	line "psychische kracht…" ; "power…"
	done

MediumRebeccaSeenText:
	text "De kracht van elke" ; "The power of all"
	line "verslagen trainer" ; "those you defeated"
	cont "komt naar mij!" ; "comes to me!"
	done

MediumRebeccaBeatenText:
	text "Sterk…" ; "Strong…"
	line "Veel te sterk…" ; "Far too strong…"
	done

MediumRebeccaAfterBattleText:
	text "Wat is de bron" ; "What is the source"
	line "van jouw kracht?" ; "of your power?"
	done

PsychicFranklinSeenText:
	text "Psychische kracht" ; "Psychic power is"
	line "is de kracht van" ; "the power of your"
	cont "je ziel." ; "soul."
	done

PsychicFranklinBeatenText:
	text "Je ziel is sterker" ; "Your soul has more"
	line "dan de mijne!" ; "power than mine!"
	done

PsychicFranklinAfterBattleText:
	text "Naast je vaardig-" ; "You made your soul"
	line "heid is ook je" ; "stronger, not just"
	cont "ziel sterker." ; "your abilities."
	done

MediumDorisSeenText:
	text "Hahahaha…" ; "Fufufufu…"
	line "Het is glashelder." ; "I see it clearly."

	para "Ik kan in je ziel" ; "I can see into"
	line "kijken!" ; "your soul!"
	done

MediumDorisBeatenText:
	text "Hoewel ik je las," ; "Though I read you,"
	line "verloor ik toch…" ; "I still lost…"
	done

MediumDorisAfterBattleText:
	text "Deksels! Ik vergat" ; "Darn! I forgot"
	line "mijn voorspelde" ; "that I predicted I"
	cont "verlies." ; "would lose to you."
	done

PsychicJaredSeenText:
	text "De VECHTDOJO hier-" ; "The FIGHTING DOJO"
	line "naast was ooit de" ; "next door was once"
	cont "GYM van deze stad." ; "this city's GYM."
	done

PsychicJaredBeatenText:
	text "Ik was kansloos…" ; "I was no match…"
	done

PsychicJaredAfterBattleText:
	text "KARATEMEESTER, de" ; "KARATE KING, the"
	line "meester van de" ; "master of the"

	para "KARATESCHOOL, werd" ; "FIGHTING DOJO, was"
	line "echt gesloopt door" ; "just destroyed by"
	cont "SABRINA." ; "SABRINA."
	done

SaffronGymGuideText:
	text "Yo, KAMPIOEN in" ; "Yo, CHAMP in"
	line "het verschiet!" ; "making!"

	para "Trainers van jouw" ; "A trainer as"
	line "kaliber hoef ik" ; "skilled as you"

	para "niet te vertellen" ; "doesn't need to be"
	line "hoe om te gaan met" ; "told how to deal"

	para "PSYCHISCH-type" ; "with psychic-type"
	line "#MON, toch?" ; "#MON, right?"

	para "Ik verwacht grote" ; "I expect great"
	line "dingen van je!" ; "things from you!"

	para "Veel succes!" ; "Good luck!"
	done

SaffronGymGuideWinText:
	text "Dat was weer een" ; "That was another"
	line "geweldig gevecht!" ; "fantastic battle!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuideScript, -1
