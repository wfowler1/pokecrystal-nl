	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts
	scene_const SCENE_GOLDENRODPOKECENTER1F_GS_BALL

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1F_GSBallSceneLeft:
	; setval BATTLETOWERACTION_GSBALL
	; special BattleTowerAction
	; ifequal GS_BALL_AVAILABLE, .gsball
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	; setval BATTLETOWERACTION_GSBALL
	; special BattleTowerAction
	; ifequal GS_BALL_AVAILABLE, .gsball
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokecomCenterWelcomeToTradeCornerText: ; unreferenced
	text "Hallo! welkom bij" ; "Hello! Welcome to"
	line "de #MONCENTRUM-" ; "#COM CENTER"
	cont "RUILHOEK." ; "TRADE CORNER."

	para "Je kunt #MON" ; "You can trade"
	line "met andere mensen" ; "#MON with other"
	cont "ver weg ruilen." ; "people far away."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText: ; unreferenced
	text "Om te ruilen, " ; "To make a trade,"
	line "moeten we je" ; "we must hold your"
	cont "#MON bewaren." ; "#MON."

	para "Wil je een ruil" ; "Would you like to"
	line "starten?" ; "trade?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText: ; unreferenced
	text "Wat voor #MON" ; "What kind of"
	line "wil je in ruil" ; "#MON do you"
	cont "ontvangen?" ; "want in return?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText: ; unreferenced
	text "Prima. We ruilen" ; "Fine. We will try"
	line "je" ; "to trade your"

	para "@"
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text " voor" ; "for"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "."

	para "We moeten je #-" ; "We'll have to hold"
	line "MON bewaren" ; "your #MON"
	cont "tijdens de ruil." ; "during the trade."

	para "Wacht hier a.u.b." ; "Please wait while"
	line "terwijl wij de" ; "we prepare the"
	cont "kamer klaarmaken." ; "room for it."
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText: ; unreferenced
	text "Prima. We ruilen" ; "Fine. We will try"
	line "jouw" ; "to trade your"

	para "@"
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text "voor een" ; "for a"
	line "#MON die je" ; "#MON that you"
	cont "nooit hebt gezien." ; "have never seen."

	para "We moeten je #-" ; "We'll have to hold"
	line "MON bewaren" ; "your #MON"
	cont "tijdens de ruil." ; "during the trade."

	para "Wacht hier a.u.b." ; "Please wait while"
	line "terwijl wij de" ; "we prepare the"
	cont "kamer klaarmaken." ; "room for it."
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText: ; unreferenced
	text "Je ruil-#MON" ; "Your trade #MON"
	line "is ontvangen." ; "has been received."

	para "Het zal even duren" ; "It will take time"
	line "om een ruilpartner" ; "to find a trade"

	para "te vinden. Kom " ; "partner. Please"
	line "later terug." ; "come back later."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText: ; unreferenced
	text "Oh? Je hebt maar" ; "Oh? You have only"
	line "één #MON in je" ; "one #MON in"
	cont "team." ; "your party. "

	para "Kom terug nadat" ; "Please come back"
	line "je meer #MON in" ; "once you've in-"
	cont "je team hebt" ; "creased the size"
	cont "geplaatst." ; "of your party."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText: ; unreferenced
	text "We hopen je snel" ; "We hope to see you"
	line "weer te zien." ; "again."
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Communicatie-" ; "Communication"
	line "fout…" ; "error…"
	done

GoldenrodPokecomCenterCantAcceptLastMonText: ; unreferenced
	text "If we accept that"
	line "#MON, what will"
	cont "you battle with?"
	done

GoldenrodPokecomCenterCantAcceptEggText: ; unreferenced
	text "Sorry. We can't"
	line "accept an EGG."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText: ; unreferenced
	text "Sorry, but your"
	line "#MON appears to"

	para "be abnormal. We"
	line "can't accept it."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText: ; unreferenced
	text "Oh? Aren't we"
	line "already holding a"
	cont "#MON of yours?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText: ; unreferenced
	text "We'll check the"
	line "rooms."

	para "Please wait."
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText: ; unreferenced
	text "Thank you for your"
	line "patience."

	para "A trade partner"
	line "has been found."
	done

GoldenrodPokecomCenterItsYourNewPartnerText: ; unreferenced
	text "It's your new"
	line "partner."

	para "Please take care"
	line "of it with love."

	para "We hope to see you"
	line "again."
	done

GoldenrodPokecomCenterYourPartyIsFullText: ; unreferenced
	text "Uh-oh. Your party"
	line "is already full."

	para "Please come back"
	line "when you have room"
	cont "in your party."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText: ; unreferenced
	text "It's unfortunate,"
	line "but no one has"

	para "come forward as a"
	line "trade partner."

	para "Would you like"
	line "your #MON back?"
	done

GoldenrodPokecomCenterReturnedYourMonText: ; unreferenced
	text "We have returned"
	line "your #MON."
	done

GoldenrodPokecomCenterYourMonIsLonelyText: ; unreferenced
	text "It's unfortunate,"
	line "but no one has"

	para "come forward as a"
	line "trade partner."

	para "We've held your"
	line "#MON for a long"

	para "time. As a result,"
	line "it is very lonely."

	para "Sorry, but we must"
	line "return it to you."
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2: ; unreferenced
	text "We hope to see you"
	line "again."
	done

GoldenrodPokecomCenterContinueToHoldYourMonText: ; unreferenced
	text "Fine. We will"
	line "continue to hold"
	cont "your #MON."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText: ; unreferenced
	text "Oh? You left your"
	line "#MON with us"
	cont "only recently."

	para "Please come back"
	line "later."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText: ; unreferenced
	text "We'll SAVE before"
	line "connecting to the"
	cont "CENTER."
	done

GoldenrodPokecomCenterWhichMonToTradeText: ; unreferenced
	text "Which #MON do"
	line "you want to trade?"
	done

GoldenrodPokecomCenterTradeCanceledText: ; unreferenced
	text "Sorry, but we must"
	line "cancel the trade."
	done

GoldenrodPokecomCenterEggTicketText: ; unreferenced
	text "Oh!"

	para "I see you have an"
	line "EGG TICKET!"

	para "It's a coupon that"
	line "special people can"

	para "redeem for a"
	line "special #MON!"
	done

GoldenrodPokecomCenterOddEggBriefingText: ; unreferenced
	text "Let me give you a"
	line "quick briefing."

	para "Trades held at the"
	line "TRADE CORNER are"

	para "between two"
	line "trainers who don't"

	para "know each other's"
	line "identity."

	para "As a result, it"
	line "may take time."

	para "However, an ODD"
	line "EGG is available"
	cont "just for you."

	para "It will be sent to"
	line "you right away."

	para "Please choose one"
	line "of the rooms in"

	para "the CENTER."
	line "An ODD EGG will be"

	para "sent from the"
	line "chosen room."
	done

GoldenrodPokecomCenterPleaseWaitAMomentText: ; unreferenced
	text "Please wait a"
	line "moment."
	done

GoldenrodPokecomCenterHereIsYourOddEggText: ; unreferenced
	text "Thank you for"
	line "waiting."

	para "We received your"
	line "ODD EGG."

	para "Here it is!"

	para "Please raise it"
	line "with loving care."
	done

GoldenrodPokecomCenterNoEggTicketServiceText: ; unreferenced
	text "I'm awfully sorry."

	para "The EGG TICKET"
	line "exchange service"
	cont "isn't running now."
	done

GoldenrodPokecomCenterNewsMachineText: ; unreferenced
	text "It's a #MON"
	line "NEWS MACHINE."
	done

GoldenrodPokecomCenterWhatToDoText: ; unreferenced
	text "What would you"
	line "like to do?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText: ; unreferenced
	text "#MON NEWS is"
	line "news compiled from"

	para "the SAVE files of"
	line "#MON trainers."

	para "When reading the"
	line "NEWS, your SAVE"

	para "file may be sent"
	line "out."

	para "The SAVE file data"
	line "will contain your"

	para "adventure log and"
	line "mobile profile."

	para "Your phone number"
	line "will not be sent."

	para "The contents of"
	line "the NEWS will vary"

	para "depending on the"
	line "SAVE files sent by"

	para "you and the other"
	line "#MON trainers."

	para "You might even be"
	line "in the NEWS!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText: ; unreferenced
	text "Would you like to"
	line "get the NEWS?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText: ; unreferenced
	text "Reading the latest"
	line "NEWS… Please wait."
	done

GoldenrodPokecomCenterNoOldNewsText: ; unreferenced
	text "There is no old"
	line "NEWS…"
	done

GoldenrodPokecomCenterCorruptedNewsDataText: ; unreferenced
	text "The NEWS data is"
	line "corrupted."

	para "Please download"
	line "the NEWS again."
	done

GoldenrodPokecomCenterMakingPreparationsText: ; unreferenced
	text "We're making"
	line "preparations."

	para "Please come back"
	line "later."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText: ; unreferenced
	text "We will SAVE your"
	line "progress before"

	para "starting the NEWS"
	line "MACHINE."
	done

GoldenrodPokecomCenterPerson1Text: ; unreferenced
	text "Whoa, this #MON"
	line "CENTER is huge."

	para "They just built"
	line "this place. They"

	para "installed lots of"
	line "new machines too."
	done

GoldenrodPokecomCenterPerson2Text: ; unreferenced
	text "I thought up a fun"
	line "new thing for the"
	cont "TRADE CORNER!"

	para "I make a PIDGEY"
	line "hold MAIL, then"

	para "put it up for"
	line "trade for another"
	cont "one!"

	para "If everyone did"
	line "that, MAIL could"

	para "be traded with all"
	line "sorts of people!"

	para "I call it PIDGEY"
	line "MAIL!"

	para "If it becomes"
	line "popular, I might"

	para "make lots of new"
	line "friends!"
	done

GoldenrodPokecomCenterPerson3Text: ; unreferenced
	text "They said you can"
	line "trade #MON with"

	para "total strangers up"
	line "here."

	para "But they're still"
	line "adjusting things."
	done

GoldenrodPokecomCenterPerson4Text: ; unreferenced
	text "Some girl I don't"
	line "know sent me her"

	para "HOPPIP."
	line "You should trade"

	para "for a #MON that"
	line "you want."
	done

GoldenrodPokecomCenterPerson5Text: ; unreferenced
	text "I received a"
	line "female HOPPIP, but"
	cont "its named STANLEY!"

	para "That's my dad's"
	line "name!"
	done

GoldenrodPokecomCenterPerson6Text: ; unreferenced
	text "What is the NEWS"
	line "MACHINE?"

	para "Does it get news"
	line "from a wider area"
	cont "than the radio?"
	done

GoldenrodPokecomCenterPerson7Text: ; unreferenced
	text "The #COM CENTER"
	line "will link with all"

	para "#MON CENTERS in"
	line "a wireless net."

	para "That must mean"
	line "I'll be able to"

	para "link with all"
	line "sorts of people."
	done

GoldenrodPokecomCenterPerson8Text: ; unreferenced
	text "The machines here"
	line "can't be used yet."

	para "Still, it's nice"
	line "coming to a trendy"

	para "place before other"
	line "people."
	done

GoldenrodPokecomCenterPerson9Text: ; unreferenced
	text "My friend was in"
	line "the NEWS a while"

	para "back. I was really"
	line "surprised!"
	done

GoldenrodPokecomCenterPerson10Text: ; unreferenced
	text "I get anxious if I"
	line "don't check out"
	cont "the latest NEWS!"
	done

GoldenrodPokecomCenterPerson11Text: ; unreferenced
	text "If I get in the"
	line "NEWS and become"

	para "famous, I bet I'll"
	line "be adored."

	para "I wonder how I"
	line "could get in the"
	cont "NEWS?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Het COLOSSEUM" ; "The COLOSSEUM"
	line "boven is voor" ; "upstairs is for"
	cont "linkgevechten." ; "link battles."

	para "Gevechtsdata wordt" ; "Battle records are"
	line "geplaatst op de" ; "posted on the"

	para "muur, dus ik kan" ; "wall, so I can't"
	line "niet verliezen." ; "afford to lose."
	done

GoldenrodPokecomCenterPerson12Text: ; unreferenced
	text "I came over here"
	line "when I got word"

	para "that GOLDENROD's"
	line "#MON CENTER has"

	para "new machines that"
	line "no one's ever seen"
	cont "before."

	para "But it looks like"
	line "they're still busy"

	para "with all their"
	line "preparations…"
	done

GoldenrodPokecomCenterPerson13Text: ; unreferenced
	text "Just seeing all"
	line "these new things"

	para "here makes me feel"
	line "younger!"
	done

GoldenrodPokecenter1FLassText:
	text "Een #MON van" ; "A higher level"
	line "een hoger level" ; "#MON doesn't"
	cont "wint niet altijd." ; "always win."

	para "Het type kan bij-" ; "After all, it may"
	line "voorbeeld niet" ; "have a type dis-"
	cont "gunstig zijn." ; "advantage."

	para "Ik denk dat er" ; "I don't think"
	line "niet één sterkste" ; "there is a single"

	para "#MON bestaat." ; "#MON that is"
	# line "the toughest."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>, toch?" ; "<PLAYER>, isn't it?"

	para "Gefeliciteerd!" ; "Congratulations!"

	para "Als speciale aan-" ; "As a special deal,"
	line "bieding is een" ; "a GS BALL has been"
	cont "GZ-BAL voor je" ; "sent just for you!"
	cont "aangekomen!" ;

	para "Neem het," ; "Please accept it!"
	line "alsjeblieft!" ;
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Tot ziens!" ; "Please do come"
	line "Kom snel weer!" ; "again!"
	done

GoldenrodPokecomCenterSignText: ; unreferenced
	text "#COM CENTER"
	line "1F INFORMATION"

	para "Left:"
	line "ADMINISTRATION"

	para "Center:"
	line "TRADE CORNER"

	para "Right:"
	line "#MON NEWS"
	done

GoldenrodPokecomCenterNewsMachineNotYetText: ; unreferenced
	text "It's a #MON"
	line "NEWS MACHINE!"

	para "It's not in"
	line "operation yet…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Jeetje, je tas" ; "Oh my, your pack"
	line "ziet er zwaar uit!" ; "looks so heavy!"

	para "Oh! Heb je toe-" ; "Oh! Do you happen"
	line "vallig iets dat" ; "to have something"
	cont "EONPOST heet?" ; "named EON MAIL?"

	para "Mijn dochter" ; "My daughter is"
	line "zoekt er een." ; "after one."

	para "Je kan er vast" ; "You can part with"
	line "een missen, toch?" ; "one, can't you?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "Geef een" ; "Give away an EON"
	line "EONPOST weg?" ; "MAIL?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, geweldig!" ; "Oh, that's great!"
	line "Dank je, lieverd!" ; "Thank you, honey!"

	para "Hier, dit is" ; "Here, this is for"
	line "voor jou!" ; "you in return!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Mijn dochter zal" ; "My daughter will"
	line "zo blij zijn!" ; "be delighted!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Je hebt er" ; "Oh? You don't have"
	line "geen? Jammer." ; "one? Too bad."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh… Nou, een" ; "Oh… Well, another"
	line "andere keer dan." ; "time, then."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gaf" ; "<PLAYER> gave away"
	line "de EONPOST weg." ; "the EON MAIL."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  3,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
