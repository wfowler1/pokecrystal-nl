	object_const_def
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_RIVAL

SproutTower3F_MapScripts:
	def_scene_scripts
	scene_script SproutTower3FNoop1Scene, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER
	scene_script SproutTower3FNoop2Scene, SCENE_SPROUTTOWER3F_NOOP

	def_callbacks

SproutTower3FNoop1Scene:
	end

SproutTower3FNoop2Scene:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalApproachesElderMovement
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_RIVAL, 15
	turnobject SPROUTTOWER3F_RIVAL, DOWN
	pause 15
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_RIVAL, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_RIVAL
	waitsfx
	special FadeInFromBlack
	setscene SCENE_SPROUTTOWER3F_NOOP
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

SproutTower3FPlayerApproachesRivalMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SproutTower3FRivalApproachesElderMovement:
	step UP
	step_end

SproutTower3FRivalLeavesElderMovement:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "OUDERE: Je bent" ; "ELDER: You are in-"
	line "echt vaardig als" ; "deed skilled as a"
	cont "trainer." ; "trainer."

	para "Zoals beloofd," ; "As promised, here"
	line "hier is je VM." ; "is your HM."

	para "Maar ik zeg je" ; "But let me say"
	line "dit: behandel je" ; "this: You should"

	para "#MON beter dan" ; "treat your"
	line "je nu doet." ; "#MON better."

	para "Je vecht op een" ; "The way you battle"
	line "erg ruwe manier." ; "is far too harsh."

	para "#MON zijn geen" ; "#MON are not"
	line "oorlogswapens…" ; "tools of war…"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "…Humph!"

	para "Hij beweert de" ; "He claims to be"
	line "OUDERE te zijn," ; "the ELDER but"
	cont "maar hij is zwak." ; "he's weak."

	para "Het is ook best" ; "It stands to"
	line "logisch." ; "reason."

	para "Ik zou nooit ver-" ; "I'd never lose to"
	line "liezen van dwazen" ; "fools who babble"

	para "die kletsen over" ; "about being nice"
	line "lief doen." ; "to #MON."

	para "Ik geef enkel om" ; "I only care about"
	line "sterke #MON die" ; "strong #MON"
	cont "kunnen winnen." ; "that can win."

	para "Om zwakke #MON" ; "I really couldn't"
	line "geef ik echt bar" ; "care less about"
	cont "weinig." ; "weak #MON."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> gebruikte" ; "<RIVAL> used an"
	line "ONTSNAPPINGSTOUW!" ; "ESCAPE ROPE!"
	done

SageLiSeenText:
	text "Wat goed dat je" ; "So good of you to"
	line "bent gekomen!" ; "come here!"

	para "SPROUT-TOREN is" ; "SPROUT TOWER is a"
	line "een trainingsplek." ; "place of training."

	para "Mensen en #MON" ; "People and #MON"
	line "testen hun band." ; "test their bonds"

	para "Om samen een mooie" ; "to build a bright"
	line "toekomst te bouwen." ; "future together."

	para "Ik ben de laatste" ; "I am the final"
	line "test."

	para "Laat me de band" ; "Allow me to check"
	line "tussen jou en je" ; "the ties between"

	para "#MON op de!" ; "your #MON and"
	line "proef stellen!" ; "you!"
	done

SageLiBeatenText:
	text "Ah, uitstekend!" ; "Ah, excellent!"
	done

SageLiTakeThisFlashText:
	text "Jij en je #MON" ; "You and your #-"
	line "kunnen deze" ; "MON should have"

	para "vaardigheid wel" ; "no problem using"
	line "prima gebruiken." ; "this move."

	para "Neem deze VM met" ; "Take this FLASH"
	line "FLITS." ; "HM."
	done

SageLiFlashExplanationText:
	text "FLITS verlicht" ; "FLASH illuminates"
	line "zelfs de meest" ; "even the darkest"
	cont "donkere ruimtes." ; "of all places."

	para "Om het buiten ge-" ; "But to use it out"
	line "vechten te doen" ; "of battle, you"

	para "heb je VIOLET'S" ; "need the BADGE"
	line "BADGE nodig." ; "from VIOLET's GYM."
	done

SageLiAfterBattleText:
	text "Ik hoop dat je" ; "I hope you learn"
	line "leert en groeit" ; "and grow from your"
	cont "tijdens je reis." ; "journey."
	done

SageJinSeenText:
	text "ik train om ver-" ; "I train to find"
	line "lichting in #-" ; "enlightenment in"
	cont "MON te vinden!" ; "#MON!"
	done

SageJinBeatenText:
	text "Mijn training is" ; "My training is"
	line "nog niet compleet…" ; "incomplete…"
	done

SageJinAfterBattleText:
	text "Als een #MON" ; "As #MON grow"
	line "groeit, wordt ook" ; "stronger, so does"
	cont "de trainer sterk." ; "the trainer."

	para "Nee, wacht. Als" ; "No, wait. As the"
	line "de trainer groeit," ; "trainer grows"

	para "wordt ook de" ; "stronger, so do"
	line "#MON sterk." ; "the #MON."
	done

SageTroySeenText:
	text "Ik laat je zien" ; "Let me see how"
	line "hoeveel jij je" ; "much you trust"
	cont "MON vertrouwt." ; "your #MON."
	done

SageTroyBeatenText:
	text "Ja, je vertrouwen" ; "Yes, your trust is"
	line "is het echte werk!" ; "real!"
	done

SageTroyAfterBattleText:
	text "Je bent vlakbij de" ; "It is not far to"
	line "OUDERE." ; "the ELDER."
	done

SageNealSeenText:
	text "Het licht van de" ; "The ELDER's HM"
	line "OUDERE zijn VM" ; "lights even pitch-"
	cont "verlicht duister." ; "black darkness."
	done

SageNealBeatenText:
	text "Mijn hoofd is" ; "It is my head that"
	line "helder!" ; "is bright!"
	done

SageNealAfterBattleText:
	text "Laat er licht zijn" ; "Let there be light"
	line "op je reis." ; "on your journey."
	done

SproutTower3FPaintingText:
	text "Het is een mooi" ; "It's a powerful"
	line "schilderij van een" ; "painting of a"
	cont "BELLSPROUT."
	done

SproutTower3FStatueText:
	text "Een #MON-beeld…" ; "A #MON statue…"

	para "Het ziet er fraai" ; "It looks very"
	line "uit." ; "distinguished."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event 11,  9, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER, SproutTower3FRivalScene

	def_bg_events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	def_object_events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
