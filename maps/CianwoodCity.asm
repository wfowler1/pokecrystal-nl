	object_const_def
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCity_MapScripts:
	def_scene_scripts
	scene_script CianwoodCityNoop1Scene, SCENE_CIANWOODCITY_NOOP
	scene_script CianwoodCityNoop2Scene, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlypointAndSuicuneCallback

CianwoodCityNoop1Scene:
	end

CianwoodCityNoop2Scene:
	end

CianwoodCityFlypointAndSuicuneCallback:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	endcallback

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	promptbutton
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	promptbutton
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	promptbutton
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript: ; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd PokecenterSignScript

CianwoodCityRock:
	jumpstd SmashRockScript

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "Je stak de zee" ; "You crossed the"
	line "over om hier te" ; "sea to get here?"
	cont "komen?" ;

	para "Dat was vast" ; "That must have"
	line "lastig." ; "been hard."

	para "Het zou eenvou-" ; "It would be much"
	line "diger zijn als" ; "easier if your"

	para "je #MON konden" ; "#MON knew how"
	line "VLIEGEN…" ; "to FLY…"
	done

ChucksWifeBeatChuckText:
	text "Maar VLIEG werkt" ; "But you can't use"
	line "niet zonder GYM-" ; "FLY without this"
	cont "BADGE van de stad." ; "city's GYM BADGE."

	para "Als je de GYM-" ; "If you beat the"
	line "LEIDER hier ver-" ; "GYM LEADER here,"
	cont "slaat, kom dan" ; "come see me."

	para "langs. Ik zal" ; "I'll have a nice"
	line "je iets geven." ; "gift for you
	done

ChucksWifeGiveHMText:
	text "Dat is CIANWOOD's" ; "That's CIANWOOD's"
	line "GYMBADGE!" ; "GYM BADGE!"

	para "Neem dan deze" ; "Then you should"
	line "VM." ; "take this HM."
	done

ChucksWifeFlySpeechText:
	text "Leer je #MON" ; "Teach FLY to your"
	line "VLIEG." ; "#MON."

	para "Je zal direct" ; "You will be able"
	line "kunnen VLIEGEN" ; "to FLY instantly"

	para "naar alle plek-" ; "to anywhere you "
	line "ken die je hebt" ; "have visited."
	cont "bezocht." ;
	done

ChucksWifeChubbyText:
	text "Mijn man heeft van" ; "My husband lost to"
	line "je verloren, dus" ; "you, so he needs"
	cont "hij moet harder" ; "to train harder."
	cont "trainen." ;

	para "Dat is goed, want" ; "That's good, since"
	line "hij werd een" ; "he was getting a"
	cont "beetje lui." ; "little chubby."
	done

CianwoodCityYoungsterText:
	text "Als je gaat" ; "If you use FLY,"
	line "VLIEGEN, kun je" ; "you can get back"

	para "meteen naar OLI-" ; "to OLIVINE in-"
	line "VINE terugkeren." ; "stantly."
	done

CianwoodCityPokefanMText:
	text "De rotsen ten" ; "Boulders to the"
	line "noorden van de" ; "north of town can"
	cont "stad kunnen" ; "be crushed."
	cont "worden verwoest." ;

	para "Wellicht verbergen" ; "They may be hiding"
	line "ze iets." ; "something."

	para "Je #MON kunnen" ; "Your #MON could"
	line "ze breken met" ; "use ROCK SMASH to"
	cont "STEENKNAL." ; "break them."
	done

CianwoodCityLassText:
	text "CHUCK, de GYM-" ; "CHUCK, the GYM"
	line "LEIDER, vecht" ; "LEADER, spars with"

	para "met zijn" ; "his fighting #-"
	line "vecht-#MON." ; "MON."
	done

CianwoodCityUnusedText:
	text "Er is een aantal" ; "There are several"
	line "eilanden tussen" ; "islands between"
	cont "hier en OLIVINE" ; "here and OLIVINE."

	para "Een mythisch" ; "A mythical sea"
	line "zeewezen schijnt" ; "creature supposed-"
	cont "daar te leven." ; "ly lives there."
	done

EusineSuicuneText:
	text "EUSINE: Yo,"
	line "<PLAYER>."

	para "Was dat niet" ; "Wasn't that"
	line "SUICUNE daar net?" ; "SUICUNE just now?"

	para "Ik zag alleen" ; "I only caught a"
	line "een glimp, maar" ; "quick glimpse, but"

	para "ik dacht dat" ; "I thought I saw"
	line "ik SUICUNE op de" ; "SUICUNE running on"
	cont "golven zag rennen." ; "the waves."

	para "SUICUNE is prach-" ; "SUICUNE is beau-"
	line "tig en groots." ; "tiful and grand."

	para "En racet door" ; "And it races"
	line "dorpen en wegen" ; "through towns and"

	para "op geweldige" ; "roads at simply"
	line "snelheden." ; "awesome speeds."

	para "Echt schitterend…" ; "It's wonderful…"

	para "Ik wil SUICUNE" ; "I want to see"
	line "van dichtbij zien…" ; "SUICUNE up close…"

	para "Ik heb besloten." ; "I've decided."

	para "Ik vecht met je" ; "I'll battle you as"
	line "als trainer om" ; "a trainer to earn"
	cont "SUICUNE's respect" ; "SUICUNE's respect!"
	cont "te verdienen!" ;

	para "Kom op, <PLAYER>." ; "Come on, <PLAYER>."
	line "Laten we vechten!" ; "Let's battle now!"
	done

EusineBeatenText:
	text "Ik zeg het niet" ; "I hate to admit"
	line "graag, maar je" ; "it, but you win."
	cont "hebt gewonnen." ;
	done

EusineAfterText:
	text "Je bent geweldig," ; "You're amazing,"
	line "<PLAYER>!"

	para "Geen wonder dat" ; "No wonder #MON"
	line "#MON naar je" ; "gravitate to you."

	para "toe trekken. Ik" ; "I get it now."
	line "snap het nu." ;

	para "Ik zal blijven" ; "I'm going to keep"
	line "zoeken naar" ; "searching for"
	cont "SUICUNE."

	para "We zullen elkaar" ; "I'm sure we'll see"
	line "vast weer zien." ; "each other again."

	para "Tot later!" ; "See you around!"
	done

CianwoodCitySignText:
	text "CIANWOOD CITY"

	para "Een Haven Omringd" ; "A Port Surrounded"
	line "door Ruwe Zee" ; "by Rough Seas"
	done

CianwoodGymSignText:
	text "CIANWOOD CITY"
	line "#MON-GYMLEIDER:" ; "#MON GYM"

	para "CHUCK" ; "LEADER: CHUCK" ; "LEADER: CHUCK"

	para "Zijn Krachtige" ; "His Roaring Fists"
	line "Vuisten Spreken" ; "Do the Talking"
	cont "voor Hem" ;
	done

CianwoodPharmacySignText:
	text "500 Jaar aan" ; "500 Years of"
	line "Traditie" ; "Tradition"

	para "CIANWOOD CITY"
	line "APOTHEEK" ; "PHARMACY"

	para "We Behandelen Uw" ; "We Await Your"
	line "Medische Vragen" ; "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "CIANWOOD CITY"
	line "FOTOSTUDIO" ; "PHOTO STUDIO"

	para "Neem een Kiekje" ; "Take a Snapshot as"
	line "als Aandenken" ; "a Keepsake!"
	done

CianwoodPokeSeerSignText:
	text "DE #ZIENER" ; "THE # SEER"
	line "VERDEROP" ; "AHEAD"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1

	def_coord_events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	def_object_events
	object_event 21, 37, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
