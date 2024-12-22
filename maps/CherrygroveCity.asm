	object_const_def
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_RIVAL
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER

CherrygroveCity_MapScripts:
	def_scene_scripts
	scene_script CherrygroveCityNoop1Scene, SCENE_CHERRYGROVECITY_NOOP
	scene_script CherrygroveCityNoop2Scene, SCENE_CHERRYGROVECITY_MEET_RIVAL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CherrygroveCityFlypointCallback

CherrygroveCityNoop1Scene:
	end

CherrygroveCityNoop2Scene:
	end

CherrygroveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	sjump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute30Text
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "REGIOKAART@" ; "MAP CARD@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveRivalSceneSouth:
	moveobject CHERRYGROVECITY_RIVAL, 39, 7
CherrygroveRivalSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_RIVAL
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Totodile:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Chikorita:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_RIVAL
	setscene SCENE_CHERRYGROVECITY_NOOP
	special HealParty
	playmapmusic
	end

CherrygroveTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CherrygroveTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CherrygroveTeacherText_HaveMapCard
	waitbutton
	closetext
	end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd PokecenterSignScript

CherrygroveCityMartSign:
	jumpstd MartSignScript

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_UnusedMovementData: ; unreferenced
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "Je bent een be-" ; "You're a rookie"
	line "ginnende trainer," ; "trainer, aren't"
	cont "zeker? Ik zie het!" ; "you? I can tell!"

	para "Niks mis mee!" ; "That's OK! Every-"
	line "Iedereen is ooit" ; "one is a rookie"
	cont "een beginner!" ; "at some point!"

	para "Als je wil, kan ik" ; "If you'd like, I"
	line "je wat dingen" ; "can teach you a"
	cont "leren." ; "few things."
	done

GuideGentTourText1:
	text "OK, dan!" ; "OK, then!"
	line "Volg mij!" ; "Follow me!"
	done

GuideGentPokecenterText:
	text "Dit is een" ; "This is a #MON"
	line "#MONCENTRUM." ; "CENTER. They heal"

	para "Zij genezen je" ; "your #MON in no"
	line "#MON zomaar." ; "time at all."

	para "Je gaat er veel" ; "You'll be relying"
	line "gebruik van maken," ; "on them a lot, so"

	para "dus leer ze goed" ; "you better learn"
	line "kennen." ; "about them."
	done

GuideGentMartText:
	text "Dit is een" ; "This is a #MON"
	line "#MONMARKT." ; "MART."

	para "Zij hebben BALLEN" ; "They sell BALLS"
	line "voor wilde #MON" ; "for catching wild"

	para "en andere handige" ; "#MON and other"
	line "spullen." ; "useful items."
	done

GuideGentRoute30Text:
	text "ROUTE 30 is die" ; "ROUTE 30 is out"
	line "kant op." ; "this way."

	para "Trainers vechten" ; "Trainers will be"
	line "daar met hun" ; "battling their"

	para "#MON tegen" ; "prized #MON"
	line "elkaar." ; "there."
	done

GuideGentSeaText:
	text "Dit is de zee," ; "This is the sea,"
	line "het is me wad." ; "as you can see."

	para "Sommige #MON" ; "Some #MON are"
	line "vind je alleen in" ; "found only in"
	cont "het water." ; "water."
	done

GuideGentGiftText:
	text "Kijk…" ; "Here…"

	para "Dit is mijn huis!" ; "It's my house!"
	line "Bedankt voor je" ; "Thanks for your"
	cont "gezelschap." ; "company."

	para "Ik heb een klein-" ; "Let me give you a"
	line "igheidje voor je." ; "small gift."
	done

GotMapCardText:
	text "<PLAYER>'s #GEAR" ; "<PLAYER>'s #GEAR"
	line "heeft een KAART!" ; "now has a MAP!"
	done

GuideGentPokegearText:
	text "De #GEAR wordt" ; "#GEAR becomes"
	line "nuttiger als je" ; "more useful as you"
	cont "functies toevoegt." ; "add CARDS."

	para "Veel succes op je" ; "I wish you luck on"
	line "reis!" ; "your journey!"
	done

GuideGentNoText:
	text "Oh… Ik vind het" ; "Oh… It's something"
	line "leuk om te doen…" ; "I enjoy doing…"

	para "Prima. Kom maar" ; "Fine. Come see me"
	line "langs als je wil." ; "when you like."
	done

CherrygroveRivalText_Seen:
	text "<……> <……> <……>"

	para "Je hebt een #-" ; "You got a #MON"
	line "MON uit het lab." ; "at the LAB."

	para "Wat zonde. Een" ; "What a waste."
	line "watje zoals jij." ; "A wimp like you."

	para "<……> <……> <……>"

	para "Hoor je niet wat" ; "Don't you get what"
	line "ik zeg?" ; "I'm saying?"

	para "Nou, ik heb ook" ; "Well, I too, have"
	line "een goede #MON." ; "a good #MON."

	para "Ik laat je zien" ; "I'll show you"
	line "wat ik bedoel!" ; "what I mean!"
	done

RivalCherrygroveWinText:
	text "Humph. Ben je blij" ; "Humph. Are you"
	line "dat je won?" ; "happy you won?"
	done

CherrygroveRivalText_YouLost:
	text "<……> <……> <……>"

	para "Ik heet ???." ; "My name's ???."

	para "Ik ga de beste" ; "I'm going to be"
	line "#MON-trainer" ; "the world's great-"
	cont "ter wereld worden." ; "est #MON"
	; cont "trainer."
	done

RivalCherrygroveLossText:
	text "Humph. Wat een" ; "Humph. That was a"
	line "tijdsverspilling." ; "waste of time."
	done

CherrygroveRivalText_YouWon:
	text "<……> <……> <……>"

	para "Ik heet ???." ; "My name's ???."

	para "Ik ga de beste" ; "I'm going to be"
	line "#MON-trainer" ; "the world's great-"
	cont "ter wereld worden." ; "est #MON"
	; cont "trainer."
	done

CherrygroveTeacherText_NoMapCard:
	text "Heb je de oude man" ; "Did you talk to"
	line "bij het #MON-" ; "the old man by the"
	cont "CENTRUM gesproken?" ; "#MON CENTER?"

	para "Hij stopt de kaart" ; "He'll put a MAP of"
	line "van JOHTO in je" ; "JOHTO on your"
	cont "#GEAR."
	done

CherrygroveTeacherText_HaveMapCard:
	text "Als je met #MON" ; "When you're with"
	line "bent, is iedere" ; "#MON, going"
	cont "reis leuk." ; "anywhere is fun."
	done

CherrygroveYoungsterText_NoPokedex:
	text "MR.#MON's huis" ; "MR.#MON's house"
	line "is nog een stukje" ; "is still farther"
	cont "verderop." ; "up ahead."
	done

CherrygroveYoungsterText_HavePokedex:
	text "Ik vocht met de" ; "I battled the"
	line "trainers op de" ; "trainers on the"
	cont "weg." ; "road."

	para "Ik verloor. Mijn" ; "My #MON lost."
	line "#MON zijn ge-" ; "They're a mess! I"
	cont "wond!"

	para "Ze moeten naar een" ; "must take them to"
	line "#MONCENTRUM." ; "a #MON CENTER."
	done

MysticWaterGuyTextBefore:
	text "Een #MON die ik" ; "A #MON I caught"
	line "ving had wat vast." ; "had an item."

	para "Het was denk ik" ; "I think it's"
	line "MYSTIEKWATER." ; "MYSTIC WATER."

	para "Ik hoef het niet," ; "I don't need it,"
	line "wil jij het?" ; "so do you want it?"
	done

MysticWaterGuyTextAfter:
	text "Ik ga maar weer" ; "Back to fishing"
	line "vissen, denk ik." ; "for me, then."
	done

CherrygroveCitySignText:
	text "CHERRYGROVE CITY"

	para "Stad van Schattige" ; "The City of Cute,"
	line "Geurende Bloemen." ; "Fragrant Flowers"
	done

GuideGentsHouseSignText:
	text "HUIS VAN GIDSGOZER" ; "GUIDE GENT'S HOUSE"
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalSceneSouth

	def_bg_events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
