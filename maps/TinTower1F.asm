	object_const_def
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6

TinTower1F_MapScripts:
	def_scene_scripts
	scene_script TinTower1FSuicuneBattleScene, SCENE_TINTOWER1F_SUICUNE_BATTLE
	scene_script TinTower1FNoopScene,          SCENE_TINTOWER1F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTower1FNPCsCallback
	callback MAPCALLBACK_TILES, TinTower1FStairsCallback

TinTower1FSuicuneBattleScene:
	sdefer TinTower1FSuicuneBattleScript
	end

TinTower1FNoopScene:
	end

TinTower1FNPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FaceBeasts
	special BeastsCheck
	iffalse .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse .Done
	appear TINTOWER1F_EUSINE
.Done:
	endcallback

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	setval RAIKOU
	special MonCheck
	iftrue .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjump .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	setval ENTEI
	special MonCheck
	iftrue .NoEntei
	appear TINTOWER1F_ENTEI
	sjump .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	endcallback

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	endcallback

TinTower1FStairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	endcallback

TinTower1FSuicuneBattleScript:
	applymovement PLAYER, TinTower1FPlayerEntersMovement
	pause 15
	setval RAIKOU
	special MonCheck
	iftrue .Next1 ; if player caught Raikou, it doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouApproachesMovement
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouLeavesMovement
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	setval ENTEI
	special MonCheck
	iftrue .Next2 ; if player caught Entei, it doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiApproachesMovement
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiLeavesMovement
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTower1FPlayerBacksUpMovement
	applymovement TINTOWER1F_SUICUNE, TinTower1FSuicuneApproachesMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOOP
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOOP
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOOP
	setscene SCENE_TINTOWER1F_NOOP
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	pause 20
	turnobject PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 10, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineEntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 9, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, TinTower1FSage1EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 9, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, TinTower1FSage2EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 9, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, TinTower1FSage3EntersMovement
	moveobject TINTOWER1F_SAGE1, 7, 13
	moveobject TINTOWER1F_SAGE2, 9, 13
	moveobject TINTOWER1F_SAGE3, 11, 13
	turnobject PLAYER, RIGHT
	opentext
	writetext TinTower1FEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage1Script:
	jumptextfaceplayer TinTower1FSage1Text

TinTower1FSage2Script:
	jumptextfaceplayer TinTower1FSage2Text

TinTower1FSage3Script:
	jumptextfaceplayer TinTower1FSage3Text

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage4Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage4Text2

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext TinTower1FSage5Text1
	promptbutton
	verbosegiveitem RAINBOW_WING
	closetext
	reanchormap
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 10, 2, $20 ; stairs
	refreshmap
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	writetext TinTower1FSage5Text2
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext TinTower1FSage5Text3
	waitbutton
	closetext
	end

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

TinTower1FEusine:
	jumptextfaceplayer TinTower1FEusineHoOhText

TinTower1FPlayerEntersMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTower1FRaikouApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FRaikouLeavesMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FEnteiApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FEnteiLeavesMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FSuicuneApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FPlayerBacksUpMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

TinTower1FEusineEntersMovement:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

TinTower1FEusineLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

TinTower1FSage1EntersMovement:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

TinTower1FSage2EntersMovement:
	step UP
	step UP
	step_end

TinTower1FSage3EntersMovement:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

TinTower1FEusineSuicuneText:
	text "EUSINE: Geweldig!" ; "EUSINE: Awesome!"
	line "Te geweldig zelfs!" ; "Too awesome, even!"

	para "Ik heb nog nooit" ; "I've never seen a"
	line "zo'n groots ge-" ; "battle that great."

	para "vecht gezien. Dat" ; "That was truly"
	line "was echt inspi-" ; "inspiring to see."

	para "rerend om te zien." ; "SUICUNE was tough,"
	line "SUICUNE was taai," ; "but you were even"

	para "maar jij was nog" ; "more incredible,"
	line "indrukwekkender," ; "<PLAYER>."
	cont "<PLAYER>." ;

	para "Ik hoorde dat" ; "I heard SUICUNE's"
	line "SUICUNE's mystieke" ; "mystic power"

	para "kracht een regen-" ; "summons a rainbow-"
	line "boogkleurige #-" ; "colored #MON."
	cont "MON oproept." ;

	para "Heel misschien" ; "Maybe, just maybe,"
	line "zal wat er vandaag" ; "what went on today"

	para "gebeurde #MON" ; "will cause that"
	line "doen verschijnen." ; "#MON to appear."

	para "Ik ga de legendes" ; "I'm going to study"
	line "nader bestuderen." ; "the legends more."

	para "Bedankt voor dat" ; "Thanks for showing"
	line "fantastische ge-" ; "me that fantastic"
	cont "vecht." ; "battle."

	para "Laters, <PLAYER>!" ; "Later, <PLAYER>!"
	done

TinTower1FSage1Text:
	text "Volgens de" ; "According to"
	line "legende…" ; "legend…"

	para "Als de zielen van" ; "When the souls of"
	line "#MON en mensen" ; "#MON and humans"

	para "samenkomen, daalt" ; "commune, from the"
	line "een #MON van" ; "heavens descends a"

	para "regenboogkleuren" ; "#MON of rainbow"
	line "neer uit de hemel…" ; "colors…"

	para "Kan het dat de" ; "Could it mean the"
	line "legendarische" ; "legendary #MON"

	para "#MON ons mensen" ; "are testing us"
	line "test?" ; "humans?"
	done

TinTower1FSage2Text:
	text "Toen de KOPEREN" ; "When the BRASS"
	line "TOREN afbrandde," ; "TOWER burned down,"

	para "zijn drie naamloze" ; "three nameless"
	line "#MON naar" ; "#MON were said"

	para "zeggen omgekomen." ; "to have perished."
	line "Tragisch." ; "It was tragic."

	para "Hoewel…" ; "However…"

	para "Een regenboog-" ; "A rainbow-colored"
	line "kleurige #MON…" ; "#MON…"

	para "In andere woorden…" ; "In other words…"

	para "HO-OH daalde neer" ; "HO-OH descended"
	line "uit de hemel en" ; "from the sky and"

	para "gaf nieuw leven" ; "gave new life to"
	line "aan de drie." ; "the three #MON."

	para "Ze zijn…" ; "They are…"

	para "SUICUNE, ENTEI en" ; "SUICUNE, ENTEI and"
	line "RAIKOU."

	para "Dat is wat" ; "That is what they"
	line "ze zeggen." ; "say."
	done

TinTower1FSage3Text:
	text "De twee TORENS" ; "The two TOWERS are"
	line "zijn naar zeggen" ; "said to have been"

	para "gebouwd om vriend-" ; "built to foster"
	line "schap en hoop tus-" ; "friendship and"

	para "sen mens en #-" ; "hope between #-"
	line "MON te borgen." ; "MON and people."

	para "Dat was 700 jaar" ; "That was 700 years"
	line "geleden, maar het" ; "ago, but the ideal"

	para "idee is nog steeds" ; "still remains"
	line "belangrijk." ; "important today."
	done

TinTower1FSage4Text1:
	text "HO-OH lijkt te" ; "HO-OH appears to"
	line "zijn neergedaald" ; "have descended"

	para "hier, op de" ; "upon this, the TIN"
	line "TINTOREN!" ; "TOWER!"
	done

TinTower1FSage5Text1:
	text "Dit zal je be-" ; "This will protect"
	line "schermen. Neem 't." ; "you. Take it."
	done

TinTower1FSage5Text2:
	text "Ga nu." ; "Now, go."
	done

TinTower1FSage6Text1:
	text "Ik geloof dat je" ; "I believe you are"
	line "getest wordt." ; "being tested."

	para "Bevrijd je geest" ; "Free your mind"
	line "van onzekerheid," ; "from uncertainty,"
	cont "en ga vooruit." ; "and advance."
	done

TinTower1FEusineHoOhText:
	text "Ik wist het." ; "I knew it."

	para "Ik wist dat je de" ; "I knew you'd get"
	line "#MON van regen-" ; "to see the #MON"

	para "boogkleuren zou" ; "of rainbow colors,"
	line "zien, <PLAYER>." ; "<PLAYER>."

	para "Het ging precies" ; "It happened just"
	line "zoals ik me voor-" ; "as I envisioned."
	cont "stelde." ;

	para "Mijn onderzoek is" ; "My research isn't"
	line "niet slecht, al" ; "bad, I might say."
	cont "zeg ik het zelf." ;

	para "Ik blijf #MON" ; "I'm going to keep"
	line "bestuderen om" ; "studying #MON"

	para "een beroemde #-" ; "to become a famous"
	line "MANIAC te worden!" ; "#MANIAC!"
	done

TinTower1FSage4Text2:
	text "De legendarische" ; "The legendary"
	line "#MON belichamen" ; "#MON are said"

	para "naar zeggen" ; "to embody three"
	line "drie krachten…" ; "powers…"

	para "De bliksem die" ; "The lightning that"
	line "de TOREN raakte." ; "struck the TOWER."

	para "Het vuur dat de" ; "The fire that"
	line "TOREN verbrandde." ; "burned the TOWER."

	para "En de regen die" ; "And the rain that"
	line "het vuur doofde…" ; "put out the fire…"
	done

TinTower1FSage5Text3:
	text "Toen de legendes" ; "When the legendary"
	line "hier verschenen…" ; "#MON appeared…"

	para "Boezemden ze" ; "They struck terror"
	line "angst in bij wie" ; "in those who saw"
	cont "ze zagen opdoemen." ; "their rise."

	para "En…" ; "And…"

	para "Sommigen vielen ze" ; "Some even took to"
	line "tevergeefs aan." ; "futile attacks."

	para "De legendarische" ; "The legendary"
	line "#MON, die hun" ; "#MON, knowing"

	para "kracht kennen," ; "their own power,"
	line "vluchtten, en ne-" ; "fled, ignoring the"
	cont "geerden de bange" ; "frightened people."
	cont "mensen." ;
	done

TinTower1FSage6Text2:
	text "Van de legen-" ; "Of the legendary"
	line "darische #MON" ; "#MON, SUICUNE"

	para "is SUICUNE het" ; "is said to be the"
	line "dichtst bij HO-OH." ; "closest to HO-OH."

	para "Ik hoorde dat er" ; "I hear there may"
	line "ook een link met" ; "also be a link to"

	para "#MON als ONKEND" ; "#MON known as"
	line "zou zijn." ; "UNOWN."

	para "De #MON ONKEND" ; "The #MON UNOWN"
	line "moet een samen-" ; "must be sharing a"

	para "werking hebben" ; "cooperative bond"
	line "met SUICUNE." ; "with SUICUNE."
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	object_event  7,  9, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	object_event 12,  9, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event  5,  9, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 14,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
