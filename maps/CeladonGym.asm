	object_const_def
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BEAUTY
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	promptbutton
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ErikaBeforeBattleText:
	text "ERIKA: Hallo…" ; "ERIKA: Hello…"
	line "Heerlijk weertje," ; "Lovely weather,"

	para "nietwaar?" ; "isn't it?"
	line "Zo aangenaam…" ; "It's so pleasant…"

	para "Straks droom ik" ; "…I'm afraid I may"
	line "nog weg…" ; "doze off…"

	para "Mijn naam is ERIKA" ; "My name is ERIKA."
	line "Ik ben de LEIDER" ; "I am the LEADER of"
	cont "van CELADON GYM." ; "CELADON GYM."

	para "…Oh? Helemaal" ; "…Oh? All the way"
	line "uit JOHTO, zeg je?" ; "from JOHTO, you"
	cont "Wat leuk…" ; "say? How nice…"

	para "Oh, sorry. Ik" ; "Oh. I'm sorry, I"
	line "had niet door dat" ; "didn't realize"

	para "je me wilde" ; "that you wished to"
	line "uitdagen." ; "challenge me."

	para "Vooruit dan, maar" ; "Very well, but I"
	line "ik verlies nooit." ; "shall not lose."
	done

ErikaBeatenText:
	text "ERIKA: Oh!" ; "ERIKA: Oh!"
	line "Ik geef me over…" ; "I concede defeat…"

	para "Je bent opvallend" ; "You are remarkably"
	line "sterk…" ; strong…"

	para "Ik geef je de" ; "I shall give you"
	line "REGENBOOGBADGE…" ; RAINBOWBADGE…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "REGENBOOGBADGE." ; "RAINBOWBADGE."
	done

ErikaExplainTMText:
	text "ERIKA: dat was een" ; "ERIKA: That was a"
	line "zalig gevecht." ; "delightful match."

	para "Je inspireerde me." ; "I felt inspired."
	line "Alsjeblieft, deze" ; "Please, I wish you"
	cont "TM is voor jou." ; "to have this TM."

	para "Het is GIGADRAIN" ; "It is GIGA DRAIN."

	para "Deze prachtige" ; "It is a wonderful"
	line "aanval geneest" ; "move that drains"

	para "jouw #MON" ; "half the damage it"
	line "voor de helft van" ; "inflicts to heal"
	cont "de gedane schade." ; "your #MON."

	para "Gebruik deze" ; "Please use it if"
	line "wanneer je wil…" ; "it pleases you…"
	done

ErikaAfterBattleText:
	text "ERIKA: Verliezen" ; "ERIKA: Losing"
	line "geeft een bittere" ; "leaves a bitter"
	cont "nasmaak…" ; "aftertaste…"

	para "Maar sterke" ; "But knowing that"
	line "trainers sporen me" ; "there are strong"

	para "aan om beter" ; "trainers spurs me"
	line "mijn best te doen…" ; "to do better…"
	done

LassMichelleSeenText:
	text "Denk je dat een" ; "Do you think a"
	line "GYM met alleen" ; "girls-only GYM"
	cont "meiden uniek is?" ; "is rare?"
	done

LassMichelleBeatenText:
	text "Oh, bleh!" ; "Oh, bleah!"
	done

LassMichelleAfterBattleText:
	text "Ik lette even niet" ; "I just got care-"
	line "op, meer niet!" ; "less, that's all!"
	done

PicnickerTanyaSeenText:
	text "Oh, een gevecht?" ; "Oh, a battle?"
	line "Wel een beetje," ; "That's kind of"
	cont "eng, maar OK!" ; "scary, but OK!"
	done

PicnickerTanyaBeatenText:
	text "Oh, dat was het?" ; "Oh, that's it?"
	done

PicnickerTanyaAfterBattleText:
	text "Oh, moet je al" ; "Oh, look at all"
	line "je BADGES zien." ; "your BADGES. No"

	para "Geen wonder dat" ; "wonder I couldn't"
	line "ik verloor van je!" ; "win!"
	done

BeautyJuliaSeenText:
	text "Keek je naar" ; "Were you looking"
	line "deze bloemen of" ; "at these flowers"
	cont "naar mij?" ; "or at me?"
	done

BeautyJuliaBeatenText:
	text "Wat irritant!" ; "How annoying!"
	done

BeautyJuliaAfterBattleText:
	text "Hoe word ik net" ; "How do I go about"
	line "zo damesachtig" ; "becoming ladylike"
	cont "als ERIKA?" ; "like ERIKA?"
	done

TwinsJoAndZoe1SeenText:
	text "Deze #MON-" ; "We'll show you"
	line "aanvallen heeft" ; "#MON moves that"
	cont "ERIKA ons geleerd!" ;"ERIKA taught us!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… Verloren…" ; "Oh… We lost…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "ERIKA zal je een" ; "ERIKA will get you"
	line "lesje leren!" ; back for us!"
	done

TwinsJoAndZoe2SeenText:
	text "We zullen ERIKA" ; "We're going to"
	line "beschermen!" ; "protect ERIKA!"
	done

TwinsJoAndZoe2BeatenText:
	text "Winnen lukte niet…" ; "We couldn't win…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "ERIKA is veel," ; "ERIKA is much,"
	line "veel sterker!" ; "much stronger!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
