	object_const_def
	const OLIVINELIGHTHOUSE6F_JASMINE
	const OLIVINELIGHTHOUSE6F_MONSTER
	const OLIVINELIGHTHOUSE6F_POKE_BALL

OlivineLighthouse6F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouseJasmine:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .BroughtSecretpotion
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftrue .ExplainedSickness
	writetext JasmineCianwoodPharmacyText
	promptbutton
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
.ExplainedSickness:
	writetext JasmineGetSomeMedicineText
	waitbutton
	closetext
	end

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalse .Refused
	writetext PlayerHandedSecretpotionText
	promptbutton
	takeitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	promptbutton
	closetext
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutToWhite
	pause 10
	special FadeInFromWhite
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	faceplayer
	opentext
	writetext JasmineThankYouText
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_OLIVINE_GYM_JASMINE
	readvar VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesUpMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingDown:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesDownMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesRightMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.Refused:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	opentext
	writetext JasmineAmphyHangOnText
	waitbutton
	closetext
	end

.Unused: ; unreferenced
	end

OlivineLighthouseAmphy:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .HealthyNow
	writetext AmphyPalPalooText
	setval AMPHAROS
	special PlaySlowCry
	promptbutton
	writetext AmphyBreathingLaboredText
	waitbutton
	closetext
	end

.HealthyNow:
	writetext AmphyPaluPaluluText
	cry AMPHAROS
	waitbutton
	closetext
	special FadeOutToWhite
	special FadeInFromWhite
	special FadeOutToWhite
	special FadeInFromWhite
	end

OlivineLighthouse6FSuperPotion:
	itemball SUPER_POTION

OlivineLighthouseJasmineLeavesUpMovement:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_sleep 8
	step_sleep 8
	step_end

OlivineLighthouseJasmineLeavesDownMovement:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

OlivineLighthouseJasmineLeavesRightMovement:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_sleep 8
	step_end

JasmineCianwoodPharmacyText:
	text "JASMINE: …Deze" ; "JASMINE: … This"
	line "#MON lichtte" ; "#MON always"

	para "altijd 's nachts" ; "kept the sea lit"
	line "de zee op." ; "at night."

	para "…Maar het werd" ; "…But it suddenly"
	line "opeens ziek… Het" ; "got sick… It's"
	cont "snakt naar lucht…" ; "gasping for air…"

	para "…Ik begrijp dat" ; "…I understand"
	line "er een goede" ; "that there is a"

	para "APOTHEEK is in" ; "wonderful PHARMACY"
	line "CIANWOOD…" ; "in CIANWOOD…"

	para "Maar dat is" ; "But that's across"
	line "over de zee…" ; "the sea…"

	para "En ik kan AMPHY" ; "And I can't leave"
	line "niet achterlaten…" ; "AMPHY unattended…"
	done

JasmineGetSomeMedicineText:
	text "…Zou je wat" ; "…May I ask you to"
	line "medicijn voor me" ; "get some medicine"
	cont "willen halen?" ; "for me? Please?"
	cont "Alsjeblieft?" ;
	done

JasmineCureAmphyText:
	text "JASMINE: …Zal" ; "JASMINE: …Will"
	line "dat medicijn" ; "that medicine cure"
	cont "AMPHY genezen?" ; "AMPHY?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> geeft de" ; "<PLAYER> handed the"
	line "GEHEIMEDRANK" ; "SECRETPOTION to"
	cont "aan JASMINE." ; "JASMINE."
	done

JasmineDontBeOffendedText:
	text "JASMINE: …Um," ; "JASMINE: …Um,"
	line "wees alsjeblieft" ; "please don't be"
	cont "niet beledigd…" ; "offended…"

	para "…AMPHY neemt" ; "…AMPHY will not"
	line "alleen iets van" ; "take anything from"
	cont "mij…" ; "anyone but me…"
	done

JasmineAmphyHowAreYouFeelingText:
	text "JASMINE: …" ; "JASMINE: …"

	para "AMPHY, hoe" ; "AMPHY, how are you"
	line "voel je je?" ; "feeling?"
	done

JasmineThankYouText:
	text "JASMINE: …Oh, ik" ; "JASMINE: …Oh, I'm"
	line "ben zo opgelucht…" ; "so relieved…"

	para "Dit is gewoon" ; "This is just so"
	line "zo fijn…" ; "wonderful…"

	para "Heel, heel erg" ; "Thank you so very,"
	line "bedankt." ; "very much."

	para "…Ik zal terug" ; "…I will return to"
	line "naar de GYM gaan…" ; "the GYM…"
	done

JasmineISeeText:
	text "JASMINE: …Aha…" ; "JASMINE: …I see…"
	done

JasmineAmphyHangOnText:
	text "…AMPHY, hou vol!" ; "…AMPHY, hang on!"
	done

AmphyPalPalooText:
	text "AMPHY: …" ; "AMPHY: …"
	line "…Pa… paloo…" ; "…Pa… paloo…"
	done

AmphyBreathingLaboredText:
	text "Het ademen gaat" ; "Its breathing is"
	line "erg moeizaam…" ; "terribly labored…"
	done

AmphyPaluPaluluText:
	text "AMPHY: Paloe!" ; "AMPHY: Palu!"
	line "Paloeloe!" ; "Palulu!"
	done

OlivineLighthouse6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_5F, 1
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_5F, 6
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_5F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseJasmine, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  9,  8, SPRITE_AMPHAROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseAmphy, -1
	object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse6FSuperPotion, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION
