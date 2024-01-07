	object_const_def
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST

RuinsOfAlphKabutoChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphKabutoChamberCheckWallScene, SCENE_RUINSOFALPHKABUTOCHAMBER_CHECK_WALL
	scene_script RuinsOfAlphKabutoChamberNoopScene,      SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphKabutoChamberHiddenDoorsCallback

RuinsOfAlphKabutoChamberCheckWallScene:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	sdefer RuinsOfAlphKabutoChamberWallOpenScript
	end

RuinsOfAlphKabutoChamberNoopScene:
	end

RuinsOfAlphKabutoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	endcallback

RuinsOfAlphKabutoChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP
	closetext
	end

RuinsOfAlphKabutoChamberReceptionistScript:
	jumptextfaceplayer RuinsOfAlphKabutoChamberReceptionistText

RuinsOfAlphKabutoChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_KABUTO
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_K
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphKabutoChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .PuzzleIncomplete
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end

.WallOpen:
	writetext RuinsOfAlphKabutoChamberScientistHoleText
	waitbutton
	closetext
	end

.AllUnownCaught:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberAncientReplica:
	jumptext RuinsOfAlphKabutoChamberAncientReplicaText

RuinsOfAlphKabutoChamberDescriptionSign:
	jumptext RuinsOfAlphKabutoChamberDescriptionText

RuinsOfAlphKabutoChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternLeftText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphKabutoChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternRightText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphKabutoChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphKabutoChamberReceptionistText:
	text "Welkom in dis" ; "Welcome to this"
	line "kamer." ; "chamber."

	para "Er zijn hier" ; "There are sliding"
	line "schuifpanelen die" ; "panels that depict"

	para "beelden af een" ; "a #MON drawn by"
	line "#MON van de" ; "the ancients."
	cont "oudheid."

	para "Glijd de panelen" ; "Slide the panels"
	line "voor maken de" ; "around to form the"
	cont "beeld." ; "picture."

	para "Aan de rechterkant" ; "To the right is a"
	line "zit een beschrijv-" ; "description of the"
	cont "ing van de #-" ; "#MON."
	cont "MON."

	para "Een wetenschapper" ; "Scientists in the"
	line "achterin ben aan" ; "back are examining"

	para "het onderzoeken" ; "some newly found"
	line "nieuwe patronen." ; "patterns."
	done

RuinsOfAlphKabutoChamberScientistCrypticText:
	text "Vreemd patronen" ; "Recently, strange,"
	line "hebben onlangs" ; "cryptic patterns"
	cont "verschijnen." ; "have appeared."

	para "Het is raar. Ze" ; "It's odd. They"
	line "waren hier niet" ; "weren't here a"
	cont "eerder…" ; "little while ago…"

	para "Je zou de muren" ; "You should take a"
	line "moeten inspect-" ; "look at the walls."
	cont "eren."
	done

RuinsOfAlphKabutoChamberScientistHoleText:
	text "Oh! Hier is een" ; "Ah! Here's another"
	line "andere groot gat!" ; "huge hole!"

	para "Het is groot genoeg" ; "It's big enough to"
	line "voor een mens om" ; "go through!"
	cont "erin te gaan!"
	done

RuinsOfAlphKabutoChamberScientistTremorText:
	text "Die termor was" ; "That tremor was"
	line "heel eng!" ; "pretty scary!"

	para "Maar ik maak me" ; "But I'm more"
	line "meer bezorgd over" ;  "concerned about"
	cont "deze muur hier…" ; "this wall here…"
	done

RuinsOfAlphKabutoChamberUnusedText: ; unreferenced
	text "De patronen op de" ; "The patterns on"
	line "muur lijken woord-" ; "the wall appear to"
	cont "en te zijn!" ; "be words!"

	para "En de schuifpanel-" ; "And those sliding"
	line "en lijken signalen" ; "stone panels seem"

	para "of andere soort te" ; "to be signals of"
	line "zijn." ; "some kind."

	para "Ik denk dat ze" ; "I think they make"
	line "#MON maken ver-" ; "#MON appear,"

	para "schijnen, maar het" ; "but it's not clear"
	line "is nog niet duide-" ; "yet…"
	cont "lijk…"
	done

RuinsOfAlphKabutoChamberWallPatternLeftText:
	text "Patronen ges-" ; "Patterns appeared"
	line "chreefde op de" ; "on the walls…"
	cont "muur…"
	done

RuinsOfAlphKabutoChamberUnownText: ; unreferenced
	text "Het is tekst" ; "It's UNOWN text!"
	line "van UNOWN!"
	done

RuinsOfAlphKabutoChamberWallPatternRightText:
	text "Patronen ges-" ; "Patterns appeared"
	line "chreefde op de" ; "on the walls…"
	cont "muur…"
	done

RuinsOfAlphKabutoChamberWallHoleText:
	text "Er zit een groot" ; "There's a big hole"
	line "gat in de muur!" ; "in the wall!"
	done

RuinsOfAlphKabutoChamberAncientReplicaText:
	text "Het is een replica" ; "It's a replica of"
	line "van een oude #-" ; "an ancient #-"
	cont "MON."
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "Deze #MON ver-" ; "A #MON that hid"
	line "stopte op de bodem" ; "on the sea floor."
	cont "van de zee."

	para "De ogen op zijn" ; "Eyes on its back"
	line "rug kijkte naar" ; "scanned the area."
	cont "het gebied."
	done

RuinsOfAlphKabutoChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternRight

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberReceptionistScript, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1
