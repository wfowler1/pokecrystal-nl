	object_const_def
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_OLIVINE_RIVAL

OlivineCity_MapScripts:
	def_scene_scripts
	scene_script OlivineCityNoop1Scene, SCENE_OLIVINECITY_RIVAL_ENCOUNTER
	scene_script OlivineCityNoop2Scene, SCENE_OLIVINECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, OlivineCityFlypointCallback

OlivineCityNoop1Scene:
	end

OlivineCityNoop2Scene:
	end

OlivineCityFlypointCallback:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

OlivineCityRivalSceneTop:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityRivalApproachesTopMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext
	applymovement PLAYER, OlivineCityPlayerStepsAsideTopMovement
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityRivalLeavesTopMovement
	setscene SCENE_OLIVINECITY_NOOP
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SWIMMER_GUY
	special LoadUsedSpritesGFX
	end

OlivineCityRivalSceneBottom:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityRivalApproachesBottomMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext
	applymovement PLAYER, OlivineCityPlayerStepsAsideBottomMovement
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityRivalLeavesBottomMovement
	disappear OLIVINECITY_OLIVINE_RIVAL
	setscene SCENE_OLIVINECITY_NOOP
	special RestartMapMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SWIMMER_GUY
	special LoadUsedSpritesGFX
	end

OlivineCitySailor1Script:
	jumptextfaceplayer OlivineCitySailor1Text

OlivineCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext OlivineCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext OlivineCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokecenterSign:
	jumpstd PokecenterSignScript

OlivineCityMartSign:
	jumpstd MartSignScript

OlivineCityRivalApproachesTopMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step_end

OlivineCityRivalApproachesBottomMovement:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step_end

OlivineCityRivalLeavesTopMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OlivineCityRivalLeavesBottomMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OlivineCityPlayerStepsAsideTopMovement:
	step DOWN
	turn_head UP
	step_end

OlivineCityPlayerStepsAsideBottomMovement:
	step UP
	turn_head DOWN
	step_end

OlivineCityRivalText:
	text "…"; "…"

	para "Jij weer?" ; "You again?"

	para "Geen reden voor" ; "There's no need to"
	line "paniek. Ik hou me" ; "panic. I don't"

	para "niet bezig met" ; "bother with wimps"
	line "watjes als jij." ; "like you."

	para "Over zwakkelingen" ; "Speaking of weak-"
	line "gesproken, de" ; "lings, the city's"

	para "GYMLEIDER van de" ; "GYM LEADER isn't"
	line "stad is hier niet." ; "here."

	para "Blijkbaar aan het" ; "Supposedly taking"
	line "zorgen voor een" ; "care of a sick"

	para "zieke #MON in de" ; "#MON at the"
	line "VUURTOREN." ; "LIGHTHOUSE."

	para "Pff! Huilie-huilie!" ; "Humph! Boo-hoo!"
	line "Laat zieke #MON" ; "Just let sick"
	cont "gewoon zitten!" ; "#MON go!"

	para "Een #MON die" ; "A #MON that"
	line "niet kan vechten" ; "can't battle is"
	cont "is waardeloos!" ; "worthless!"

	para "Waarom ga je niet" ; "Why don't you go"
	line "trainen in de" ; "train at the"
	cont "VUURTOREN?" ; "LIGHTHOUSE?"

	para "Wie weet. Het" ; "Who knows. It may"
	line "maakt je misschien" ; "make you a bit"
	cont "minder zwak!" ; "less weak!"
	done

OlivineCitySailor1Text:
	text "Donkere paden" ; "Dark roads are"
	line "zijn 's nachts'" ; "dangerous at"
	cont "gevaarlijk." ; "night."

	para "Maar in het pikke-" ; "But in the pitch-"
	line "donker van de" ; "black of night,"

	para "nacht, is de zee" ; "the sea is even"
	line "nog verradelijker!" ; "more treacherous!"

	para "Zonder het baken" ; "Without the beacon"
	line "van de VUURTOREN" ; "of the LIGHTHOUSE"

	para "kan geen schip" ; "to guide it, no"
	line "veilig varen." ; "ship can sail."
	done

OlivineCityStandingYoungsterPokegearText:
	text "Dat dingetje van" ; "That thing you"
	line "jou--het is een" ; "have--it's a #-"
	cont "#GEAR, toch?" ; "GEAR, right? Wow,"
	cont "Wow, dat is cool." ; "that's cool."
	done

OlivineCityStandingYoungsterPokedexText:
	text "Wow, je hebt" ; "Wow, you have a"
	line "een #DEX!" ; "#DEX!"

	para "Dat is echt" ; "That is just so"
	line "heel gaaf." ; "awesome."
	done

OlivineCitySailor2Text:
	text "De zee is fijn!" ; "The sea is sweet!"

	para "Zonsondergang op" ; "Sunsets on the sea"
	line "zee is geweldig!" ; "are marvelous!"

	para "Zing met me mee!" ; "Sing with me! "
	line "Yo-ho! De wind" ; "Yo-ho! Blow the"
	cont "in de zeilen!…" ; "man down!…"
	done

OlivineCitySignText:
	text "OLIVINE CITY"

	para "De Haven Nabij" ; "The Port Closest"
	line "Verre Oorden" ; "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "OLIVINE HAVEN" ; "OLIVINE PORT"
	line "SNELSCHIP-PIER" ; "FAST SHIP PIER"
	done

OlivineGymSignText:
	text "OLIVINE CITY"
	line "#MON-GYMLEIDER:"
	cont "JASMINE" ; "LEADER: JASMINE"

	para "De Meid met een" ; "The Steel-Clad"
	line "Stalen Pantser" ; "Defense Girl"
	done

OlivineLighthouseSignText:
	text "OLIVINE VUURTOREN" ; "OLIVINE LIGHTHOUSE"
	line "Ook bekend als de" ; "Also known as the"
	cont "GLITTER-VUURTOREN" ; "GLITTER LIGHTHOUSE"
	done

OlivineCityBattleTowerSignText:
	text "GEVECHTSTOREN" ; "BATTLE TOWER AHEAD"
	line "RECHTDOOR-Nu open!" ; "Opening Now!"
	done

OlivineCityBattleTowerSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "BATTLE TOWER AHEAD"
	done

OlivineCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 21, OLIVINE_POKECENTER_1F, 1
	warp_event 10, 11, OLIVINE_GYM, 1
	warp_event 25, 11, OLIVINE_TIMS_HOUSE, 1
	warp_event  0,  0, OLIVINE_HOUSE_BETA, 1 ; inaccessible
	warp_event 29, 11, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 13, 15, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 21, OLIVINE_CAFE, 1
	warp_event 19, 17, OLIVINE_MART, 2
	warp_event 29, 27, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 27, OLIVINE_PORT_PASSAGE, 1
	warp_event 20, 27, OLIVINE_PORT_PASSAGE, 2

	def_coord_events
	coord_event 13, 12, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalSceneTop
	coord_event 13, 13, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalSceneBottom

	def_bg_events
	bg_event 17, 11, BGEVENT_READ, OlivineCitySign
	bg_event 20, 24, BGEVENT_READ, OlivineCityPortSign
	bg_event  7, 11, BGEVENT_READ, OlivineGymSign
	bg_event 30, 28, BGEVENT_READ, OlivineLighthouseSign
	bg_event  3, 23, BGEVENT_READ, OlivineCityBattleTowerSign
	bg_event 14, 21, BGEVENT_READ, OlivineCityPokecenterSign
	bg_event 20, 17, BGEVENT_READ, OlivineCityMartSign

	def_object_events
	object_event 26, 27, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor1Script, -1
	object_event 20, 13, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityStandingYoungsterScript, -1
	object_event 17, 21, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor2Script, -1
	object_event 10, 11, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
