	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	def_scene_scripts

	def_callbacks

FastShipCabins_SE_SSE_CaptainsCabinNoopScene: ; unreferenced
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext SSAquaGranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SSAquaGranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special FadeInFromBlack
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext SSAquaGranddaughterWasPlayingMText
	waitbutton
	closetext
	sjump .cont

.PlayerIsFemale:
	opentext
	writetext SSAquaGranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, SSAquaGrandpaApproachesPlayerMovement
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	sjump SSAquaMetalCoatAndDocking

SSAquaGrandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	end

SSAquaMetalCoatAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	end

SSAquaGotMetalCoat:
	writetext SSAquaGrandpaTravellingText
	waitbutton
	closetext
	end

SSAquaGranddaughterAfter:
	faceplayer
	opentext
	writetext SSAquaGranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd TrashCanScript

SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step UP
	step UP
	turn_head LEFT
	step_end

SSAquaGrandpaApproachesPlayerMovement:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "Whew! Bedankt dat" ; "Whew! Thanks for"
	line "je langskwam." ; "coming along."

	para "Vermoeiend om dat" ; "Keeping that lit-"
	line "kleine meisje te" ; "tle girl amused"
	cont "blijven vermaken." ; "was exhausting."
	done

SSAquaCaptainHowDoYouLikeText:
	text "Hoe vind je de" ; "How do you like"
	line "tocht op S.S.AQUA?" ; "S.S.AQUA's ride?"

	para "Ze schaatst zo-" ; "She practically"
	line "wat over de" ; "skates across the"
	cont "golven." ; "waves."
	done

SSAquaCantFindGranddaughterText:
	text "Oh, hallo…" ; "Oh, hello…"

	para "Mijn kleindochter" ; "I still can't find"
	line "is nog vermist." ; "my granddaughter."

	para "Prima zolang ze op" ; "If she's on the"
	line "het schip is." ; "ship, that's OK."

	para "Ze is een energiek" ; "She's an energetic"
	line "kind, wat als ze" ; "child, so she may"

	para "iemand stoort? Ik" ; "be bugging some-"
	line "maak me zorgen…" ; "one. I'm worried…"
	done

SSAquaEntertainedGranddaughterText:
	text "<PLAY_G>, toch?" ; "<PLAY_G>, was it?"
	line "Ik hoorde dat je" ; "I heard you enter-"
	cont "mijn kleindochter" ; "tained my grand-"
	cont "hebt vermaakt." ; "daughter."

	para "Daar wil ik je" ; "I want to thank"
	line "voor bedanken." ; "you for that."
	done

SSAquaGrandpaHaveThisText:
	text "Ik weet het! Deze" ; "I know! I'd like"
	line "mag je hebben!" ; "you to have this!"
	done

SSAquaGrandpaTravellingText:
	text "We reizen rond" ; "We're traveling"
	line "de wereld." ; "around the world."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "KAPITEIN, wilt u" ; "CAPTAIN, play with"
	line "met me spelen?" ; "me, please?"

	para "Ik verveel me! Ik" ; "I'm bored! I want"
	line "wil meer spelen!" ; "to play more!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "Hoi! Wil jij met" ; "Hi! Will you play"
	line "me spelen?" ; "with me?"

	para "…Oh!" ; "…Oh!"

	para "Opa maakt zich" ; "Grandpa's worried"
	line "zorgen om me?" ; "about me?"

	para "Ik moet gaan!" ; "I have to go!"

	para "Ik moet opa" ; "I have to go find"
	line "vinden!" ; "Grandpa!"
	done

SSAquaGranddaughterWasPlayingMText:
	text "Opa, hier ben ik!" ; "Grandpa, here I"
	line "Ik speelde met de" ; "am! I was playing"

	para "de KAPITEIN en met" ; "with the CAPTAIN"
	line "deze jongen!" ; "and this guy!"
	done

SSAquaGranddaughterWasPlayingFText:
	text "Opa, hier ben ik!" ; "Grandpa, here I"
	line "Ik speelde met de" ; "am! I was playing"

	para "de KAPITEIN en met" ; "with the CAPTAIN"
	line "dit grote meisje!" ; "and this big girl!"
	done

SSAquaGranddaughterHadFunText:
	text "Ik had veel ple-" ; "I had lots of fun"
	line "zier met spelen!" ; "playing!"
	done

PokefanmColinSeenText:
	text "He, jij daar! Wil" ; "Hey, kid! Want to"
	line "je met me vechten?" ; "battle with me?"
	done

PokefanmColinBeatenText:
	text "Jij bent sterk!" ; "You're strong!"
	done

PokefanmColinAfterBattleText:
	text "Reis je helemaal" ; "You're traveling"
	line "in je eentje?" ; "all alone?"

	para "Is je moeder niet" ; "Isn't your mom"
	line "bezorgd?" ; "worried?"
	done

TwinsMegandpeg1SeenText:
	text "Denk je dat ik een" ; "You think I'm a"
	line "baby ben? Dat is" ; "baby?"
	cont "niet eerlijk!" ; "That's not fair!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! Verloren!" ; "Oh! We lost!"
	done

TwinsMegandpeg1AfterBattleText:
	text "Wat onbeleefd om" ; "Baby is a rude"
	line "ons baby's te" ; "name to call us"
	cont "noemen!" ; "girls!"
	done

TwinsMegandpeg2SeenText:
	text "Ik ben geen baby!" ; "I'm not a baby!"

	para "Zoiets zeg je niet" ; "That's not nice to"
	line "tegen een dame!" ; "say to a lady!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! Verloren!" ; "Oh! We lost!"
	done

TwinsMegandpeg2AfterBattleText:
	text "Soms zijn kinderen" ; "Sometimes, kids"
	line "slimmer dan vol-" ; "are smarter than"
	cont "wassenen!" ; "grown-ups!"
	done

PsychicRodneySeenText:
	text "Sst! Mijn hersens" ; "Ssh! My brain is"
	line "pikken radio-" ; "picking up radio"
	cont "signalen op!" ; "signals!"
	done

PsychicRodneyBeatenText:
	text "…Ik hoor" ; "…I hear some-"
	line "iets!" ; "thing!"
	done

PsychicRodneyAfterBattleText:
	text "Aha. Je kan JOH-" ; "I get it. You can"
	line "TO's radio horen" ; "hear JOHTO's radio"
	cont "op het SNELSCHIP." ; "on the FAST SHIP."
	done

PokefanmJeremySeenText:
	text "Wat vind jij?" ; "What do you think?"
	line "Mijn #MON zijn" ; "My #MON are"
	cont "prachtig, toch?" ; "beautiful, yes?"
	done

PokefanmJeremyBeatenText:
	text "Oh nee! M'n prach-" ; "Oh, no! My beauti-"
	line "tige #MON!" ; "ful #MON!"
	done

PokefanmJeremyAfterBattleText:
	text "Ik moet naar de" ; "I must go to the"
	line "#MONSALON om" ; "#MON SALON and"
	cont "ze op te knappen!" ; "fix them up nice!"
	done

PokefanfGeorgiaSeenText:
	text "Ik ga winkelen bij" ; "I'm going to shop"
	line "het WARENHUIS" ; "at the DEPT.STORE"
	cont "en dan…" ; "and then…"
	done

PokefanfGeorgiaBeatenText:
	text "Wat ging ik ook" ; "What was I going"
	line "alweer doen?" ; "to do?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Oh ja! Ik breng" ; "Oh, yes! I have to"
	line "mijn #MON naar" ; "get my #MON out"
	cont "het DAGVERBLIJF!" ; "of DAY-CARE!"
	done

SupernerdShawnSeenText:
	text "Welke soort #" ; "What kinds of #"
	line "BALLEN heb je" ; "BALLS do you have"
	cont "bij je?" ; "with you?"
	done

SupernerdShawnBeatenText:
	text "Wacht! Stop! Niet" ; "Wait! Stop! Don't!"
	line "doen. Alsjeblieft!" ; "Please!"
	done

SupernerdShawnAfterBattleText:
	text "Voor elke situatie" ; "You should use the"
	line "moet je de juiste" ; "right BALLS to fit"
	cont "BALLEN gebruiken." ; "the situation."
	done

SSAquaHasArrivedVermilionText:
	text "SNELSCHIP S.S.AQUA" ; "FAST SHIP S.S.AQUA"
	line "is aangekomen in" ; "has arrived in"
	cont "VERMILION CITY." ; "VERMILION CITY."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events
	bg_event  4, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	def_object_events
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterAfter, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
