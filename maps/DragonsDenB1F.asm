	object_const_def
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_RIVAL
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScripts:
	def_scene_scripts
	scene_script DragonsDenB1FNoop1Scene, SCENE_DRAGONSDENB1F_NOOP
	scene_script DragonsDenB1FNoop2Scene, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DragonsDenB1FCheckRivalCallback

DragonsDenB1FNoop1Scene:
	end

DragonsDenB1FNoop2Scene:
	end

DragonsDenB1FCheckRivalCallback:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .AppearRival
	ifequal THURSDAY, .AppearRival
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.AppearRival:
	appear DRAGONSDENB1F_RIVAL
	endcallback

DragonsDenB1F_ClairScene:
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext Text_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	promptbutton
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	sjump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOOP
	end

TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DRAGON_FANG
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	promptbutton
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonsDenB1FRivalScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RivalTalkAgain
	writetext RivalText_Training1
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.RivalTalkAgain:
	writetext RivalText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementDragonsDen_ClairWalksAway:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

ClairText_Wait:
	text "Wacht!" ; "Wait!"
	done

ClairText_GiveDragonbreathDragonDen:
	text "CLAIR: Sorry" ; "CLAIR: I'm sorry"
	line "hiervoor." ; "about this."

	para "Hier, neem dit om" ; "Here, take this as"
	line "het goed te maken." ; "my apology."
	done

Text_ReceivedTM24:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "TM24 DRAKENADEM."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "Dat bevat" ; "That contains"
	line "DRAKENADEM." ; "DRAGONBREATH."

	para "Nee, het heeft" ; "No, it doesn't"
	line "niks met mijn adem" ; "have anything to"
	cont "te maken." ; "do with my breath."

	para "Als je het niet" ; "If you don't want"
	line "wil, dan neem je" ; "it, you don't have"
	cont "het niet." ; "to take it."
	done

ClairText_NoRoom:
	text "Oh? Je hebt hier" ; "Oh? You don't have"
	line "geen plek voor." ; "any room for this."

	para "Ik ga terug naar" ; "I'm going back to"
	line "de GYM, maak plek" ; "the GYM, so make"

	para "en kom dan daar" ; "room, then come"
	line "naar me toe." ; "see me there."
	done

ClairText_WhatsTheMatterDragonDen:
	text "CLAIR: Wat is er" ; "CLAIR: What's the"
	line "aan de hand? Ga je" ; "matter? Aren't you"

	para "niet naar de" ; "going on to the"
	line "#MON-LEAGUE?" ; "#MON LEAGUE?"

	para "Weet je hoe je" ; "Do you know how to"
	line "daar komt?" ; "get there?"

	para "Ga vanaf hier naar" ; "From here, go to"
	line "NEW BARK TOWN."

	para "SURF dan naar het" ; "Then SURF east to"
	line "oosten." ; "#MON LEAGUE."

	para "De weg er naartoe" ; "The route there is"
	line "is erg pittig." ; "very tough."

	para "Waag het niet te" ; "Don't you dare"
	line "verliezen bij de" ; "lose at the #-"
	cont "#MON-LEAGUE!" ; "MON LEAGUE!"

	para "Als je dat doet," ; "If you do, I'll"
	line "baal ik nog meer" ; "feel even worse"
	
	para "van mijn verlies" ; "about having lost"
	line "tegen jou!" ; "to you!"

	para "Geef het alles dat" ; "Give it every-"
	line "je in je hebt." ; "thing you've got."
	done

DragonShrineSignpostText:
	text "DRAKENTEMPEL" ; "DRAGON SHRINE"

	para "Deze tempel eert" ; "A shrine honoring"
	line "draak-#MON die" ; "the dragon #MON"

	para "vroeger leefden in" ; "said to have lived"
	line "de DRAKENGROT." ; "in DRAGON'S DEN."
	done

RivalText_Training1:
	text "…"
	line "Wat? <PLAYER>?" ; "What? <PLAYER>?"

	para "…Nee, ik ga niet" ; "…No, I won't"
	line "tegen je vechten…" ; "battle you now…"

	para "M'n #MON kunnen" ; "My #MON aren't"
	line "je niet verslaan." ; "ready to beat you."

	para "Ik kan ze niet te" ; "I can't push them"
	line "hard pushen." ; "too hard now."

	para "Ik moet discipline" ; "I have to be dis-"
	line "hebben om de beste" ; "ciplined to become"

	para "beste #MON-" ; "the greatest #-"
	line "trainer te worden…" ; "MON trainer…"
	done

RivalText_Training2:
	text "…"

	para "Whew…"

	para "Leer om mij uit de" ; "Learn to stay out"
	line "weg te gaan…" ; "of my way…"
	done

CooltrainermDarinSeenText:
	text "Jij! Hoe durf je" ; "You! How dare you"
	line "zonder uitnodiging" ; "enter uninvited!"
	cont "binnen te komen!"
	done

CooltrainermDarinBeatenText:
	text "S-sterk!" ; "S-strong!"
	done

CooltrainermDarinAfterBattleText:
	text "De TEMPEL daar" ; "The SHRINE ahead"
	line "is het thuis van" ; "is home to the"

	para "de MEESTER van de" ; "MASTER of our"
	line "drakenstam." ; "dragon-user clan."

	para "Je mag niet zomaar" ; "You're not allowed"
	line "naar binnen!" ; "to just go in!"
	done

CooltrainerfCaraSeenText:
	text "Je hoort hier niet" ; "You shouldn't be"
	line "te zijn!" ; "in here!"
	done

CooltrainerfCaraBeatenText:
	text "Jakkes, verloren!" ; "Oh yikes, I lost!"
	done

CooltrainerfCaraAfterBattleText:
	text "Mijn meester geeft" ; "Soon I'm going to"
	line "me binnenkort" ; "get permission"

	para "toestemming draken" ; "from our MASTER to"
	line "te gebruiken." ; "use dragons."

	para "Als dat gebeurt," ; "When I do, I'm"
	line "word ik een heuse" ; "going to become an"

	para "drakentrainer die" ; "admirable dragon"
	line "door de MEESTER" ; "trainer and gain"

	para "erkend zal worden." ; "our MASTER's"
	; line "verdienen." ; "approval."
	done

TwinsLeaandpia1SeenText:
	text "Een onbekende" ; "It's a stranger we"
	line "vreemdeling." ; "don't know."
	done

TwinsLeaandpia1BeatenText:
	text "Auwies." ; "Ouchies."
	done

TwinsLeaandpia1AfterBattleText:
	text "Het was alsof ik" ; "It was like having"
	line "met LANCE vocht." ; "to battle LANCE."
	done

TwinsLeaandpia2SeenText:
	text "Wie ben jij?" ; "Who are you?"
	done

TwinsLeaandpia2BeatenText:
	text "Gemenerd." ; "Meanie."
	done

TwinsLeaandpia2AfterBattleText:
	text "We gaan je" ; "We'll tell on you."
	line "verklikken."

	para "De MEESTER zal" ; "MASTER will be"
	line "woedend zijn." ; "angry with you."
	done

Text_FoundDragonFang:
	text "<PLAYER> vond" ; "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "!"
	done

Text_NoRoomForDragonFang:
	text "Maar <PLAYER> kan" ; "But <PLAYER> can't"
	line "geen voorwerpen" ; "carry any more"
	cont "meer dragen." ; "items."
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	def_coord_events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1F_ClairScene

	def_bg_events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	def_object_events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_RIVAL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FRivalScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 20,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event  8,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  4, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 30,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event  5, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
