	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script RadioTower5FNoop1Scene, SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_script RadioTower5FNoop2Scene, SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script RadioTower5FNoop3Scene, SCENE_RADIOTOWER5F_NOOP

	def_callbacks

RadioTower5FNoop1Scene:
	end

RadioTower5FNoop2Scene:
	end

RadioTower5FNoop3Scene:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScript:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInFromBlack
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "J-jij! Je komt" ; "Y-you! You came to"
	line "me redden?" ; "rescue me?"
	done

FakeDirectorTextBefore2:
	text "Is dat wat je" ; "Is that what you"
	line "verwachtte?" ; "were expecting?"

	para "Fout! Ik ben" ; "Wrong!"
	line "een bedrieger!" ; "I'm an imposter!"

	para "Ik deed alsof ik" ; "I pretended to be"
	line "de echte was, ter" ; "the real thing to"

	para "voorbereiding van" ; "prepare for our"
	line "onze overname." ; "takeover."

	para "Wil je weten waar" ; "Do you want to"
	line "we de echte" ; "know where we hid"
	cont "DIRECTEUR hebben" ; "the real DIRECTOR?"
	cont "verstopt?" ; 

	para "Ja hoor, ik zal" ; "Sure, I'll tell"
	line "het zeggen. Als je" ; "you. But only if"
	cont "mij verslaat!" ; "you can beat me!"
	done

FakeDirectorWinText:
	text "Oké, oké. Ik zeg" ; "OK, OK. I'll tell"
	line "je waar hij is." ; "you where he is."
	done

FakeDirectorTextAfter:
	text "We hebben de" ; "We stashed the"
	line "echte DIRECTEUR" ; "real DIRECTOR in"

	para "verstopt in de" ; "the UNDERGROUND"
	line "OPSLAGKELDER." ; "WAREHOUSE."

	para "Het is aan het" ; "It's at the far"
	line "einde van het" ; "end of the UNDER-"
	cont "ONDERGRONDSE." ; "GROUND."

	para "Maar ik betwijfel" ; "But I doubt you'll"
	line "of je zo ver komt." ; "get that far."
	done

Executivef1SeenText:
	text "Herken je mij van" ; "Remember me from"
	line "de SCHUILPLAATS" ; "the HIDEOUT in"
	cont "in MAHOGANY TOWN?" ; "MAHOGANY TOWN?"

	para "Ik verloor toen," ; "I lost then, but I"
	line "maar deze keer" ; "won't this time."
	cont "niet." ; 
	done

Executivef1BeatenText:
	text "Dit kan niet" ; "This can't be"
	line "waar zijn!" ; "happening!"

	para "Ik deed m'n best," ; "I fought hard, but"
	line "maar ik heb toch" ; "I still lost…"
	cont "verloren…" ; 
	done

Executivef1AfterBattleText:
	text "<PLAYER>, toch?" ; "<PLAYER>, isn't it?"

	para "Een ettertje als" ; "A brat like you"
	line "jij zal de pracht" ; "won't appreciate"

	para "van TEAM ROCKET" ; "the magnificence"
	line "niet waarderen." ; "of TEAM ROCKET."

	para "Jammer. Ik" ; "That's too bad."
	line "bewonder je" ; "I really admire"
	cont "kracht." ; "your power."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? Je bent" ; "Oh? You managed to"
	line "zo ver gekomen?" ; "get this far?"

	para "Je moet een goede" ; "You must be quite"
	line "trainer zijn." ; "the trainer."

	para "We gaan dit RADIO-" ; "We intend to take"
	line "STATION overnemen" ; "over this RADIO"

	para "en onze" ; "STATION and an-"
	line "terugkeer" ; "nounce our come-"
	cont "aankondigen." ; "back."

	para "Dat zal onze baas" ; "That should bring"
	line "GIOVANNI doen" ; "our boss GIOVANNI"

	para "terugkeren van" ; "back from his solo"
	line "z'n solo-training." ; "training."

	para "We gaan onze" ; "We are going to"
	line "vroegere glorie" ; "regain our former"
	cont "terugpakken." ; "glory."

	para "Ik sta je niet toe" ; "I won't allow you"
	line "om onze plannen" ; "to interfere with"
	cont "te verhinderen." ; "our plans."
	done

RadioTower5FRocketBossWinText:
	text "Nee! Vergeef me," ; "No! Forgive me,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Hoe kan dit?" ; "How could this be?"

	para "Onze dromen waren" ; "Our dreams have"
	line "voor niks." ; "come to naught."

	para "Ik kon de taak" ; "I wasn't up to the"
	line "toch niet aan." ; "task after all."

	para "Zoals GIOVANNI" ; "Like GIOVANNI did"
	line "voor mij deed, zal" ; "before me, I will"

	para "ik TEAM ROCKET" ; "disband TEAM"
	line "vandaag ontbinden." ; "ROCKET here today."

	para "Vaarwel." ; "Farewell."
	done

RadioTower5FDirectorThankYouText:
	text "DIRECTEUR: Dankje," ; "DIRECTOR: <PLAY_G>,"
	line "<PLAY_G>!" ; "thank you!"

	para "Je dappere acties" ; "Your courageous"
	line "hebben #MON" ; "actions have saved"

	para "wereldwijd gered." ; "#MON nation-"
	; line "wide."

	para "Ik weet dat het" ; "I know it's not"
	line "niet veel is," ; "much, but please"
	cont "maar neem dit." ; "take this."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Er was hier in" ; "There used to be a"
	line "GOLDENROD CITY" ; "tower right here"
	cont "vroeger een toren." ; "in GOLDENROD CITY."

	para "Maar die was oud" ; "But it was old and"
	line "en krakkemikkig." ; "creaky."

	para "Dus we vervingen" ; "So we replaced it"
	line "hem met onze" ; "with our RADIO"
	cont "RADIOTOREN." ; "TOWER."

	para "We groeven die" ; "We dug up that"
	line "bel op tijdens" ; "bell during"
	cont "de bouw." ; "construction."

	para "Ik heb gehoord dat" ; "I heard that all"
	line "allerlei soorten" ; "sorts of #MON"

	para "#MON vroeger in" ; "lived in GOLDENROD"
	line "GOLDENROD leefden." ; "in the past."

	para "Misschien…" ; "Perhaps…"

	para "Heeft die bel een" ; "That bell has some"
	line "verband met de" ; "connection to the"

	para "TINTOREN in" ; "TIN TOWER in"
	line "ECRUTEAK CITY…"

	para "Ah!"

	para "Dat doet denken…" ; "That reminds me…"

	para "Ik hoorde TEAM" ; "I overheard TEAM"
	line "ROCKET fluisteren." ; "ROCKET whispering."

	para "Blijkbaar is er" ; "Apparently, some-"
	line "iets gaande bij" ; "thing is going on"
	cont "de TINTOREN." ; "at the TIN TOWER."

	para "Ik heb geen idee" ; "I have no idea"
	line "wat er is, maar" ; "what is happening,"

	para "je zou kunnen" ; "but you might look"
	line "gaan kijken." ; "into it."

	para "Oké, ik kan beter" ; "OK, I better go to"
	line "naar m'n KANTOOR" ; "my OFFICE."
	cont "gaan."
	done

RadioTower5FDirectorText:
	text "DIRECTEUR: Hallo," ; "DIRECTOR: Hello,"
	line "<PLAY_G>!"

	para "Weet je, ik" ; "You know, I love"
	line "hou van #MON." ; "#MON."

	para "Ik bouwde deze" ; "I built this RADIO"
	line "RADIOTOREN zodat" ; "TOWER so I could"

	para "ik mijn liefde" ; "express my love"
	line "voor #MON kon" ; "of #MON."
	cont "uiten." ;

	para "Het zou mooi zijn" ; "It would be nice"
	line "als mensen onze" ; "if people enjoyed"
	cont "programma's leuk" ; "our programs."
	cont "vinden." ;
	done

BenText:
	text "BEN: Luister je" ; "BEN: Do you listen"
	line "naar onze muziek?" ; "to our music?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "4V KANTOOR" ; "5F DIRECTOR'S"
	line "VAN DIRECTEUR" ; "   OFFICE"
	done

RadioTower5FStudio1SignText:
	text "4V STUDIO 1" ; "5F STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScript

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
