	object_const_def
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock: ; unreferenced
	jumpstd SmashRockScript

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "Het water is hier" ; "The water's warm"
	line "warm. Ik ben los" ; "here. I'm loose"
	cont "en lenig." ; "and limber."

	para "Ik neem het graag" ; "Sure, I'll take"
	line "tegen je op!" ; "you on!"
	done

SwimmermCharlieBeatenText:
	text "Jeetje! Mijn huid" ; "Yikes! I've got"
	line "is verrimpeld!" ; "prune skin!"
	done

SwimmermCharlieAfterBattleText:
	text "Heerlijk toch, een" ; "Isn't it relaxing"
	line "beetje rond-" ; "just floating like"
	cont "dobberen zo?" ; "this?"
	done

SwimmermGeorgeSeenText:
	text "Ik ben wat moe." ; "I'm a bit tired."
	line "Leen me je #MON" ; "If I win, lend me"
	cont "als ik win." ; "your #MON."
	done

SwimmermGeorgeBeatenText:
	text "Hijg, hijg…" ; "Pant, pant…"
	done

SwimmermGeorgeAfterBattleText:
	text "Het is zo ver" ; "It's so far to"
	line "naar CIANWOOD." ; "CIANWOOD."

	para "Maar terug naar" ; "But it's no easy"
	line "OLIVINE is ook" ; "return trip to"
	cont "niet zo eenvoudig." ; "OLIVINE either."

	para "Wat zal ik doen?" ; "What should I do?"
	done

SwimmermBerkeSeenText:
	text "Zie je die ei-" ; "See those islands"
	line "landen achter" ; "that are blocked"
	cont "de draaikolken?" ; "by whirlpools?"

	para "Daar moet wel iets" ; "There just has to"
	line "geheims zijn!" ; "be a secret!"
	done

SwimmermBerkeBeatenText:
	text "Waarom ben jij" ; "What's the secret"
	line "nou zo sterk?" ; "to your strength?"
	done

SwimmermBerkeAfterBattleText:
	text "Het was een don-" ; "It was a dark and"
	line "kere, gure nacht…" ; "stormy night…"

	para "Ik zag een enorme" ; "I saw this giant"
	line "#MON van de ei-" ; "#MON flying"
	cont "landen afvliegen." ; "from the islands."

	para "Veren dwarrelden" ; "It was scattering"
	line "van zijn zilveren" ; "feathers from its"
	cont "vleugels omlaag." ; "silver wings."
	done

SwimmermKirkSeenText:
	text "De golven zijn" ; "The waves are wild"
	line "wild hier." ; "here."

	para "Bij het zwemmen" ; "They tire you out"
	line "putten ze je uit." ; "while you swim."
	done

SwimmermKirkBeatenText:
	text "Ik ben kapot!" ; "I'm beat!"
	done

SwimmermKirkAfterBattleText:
	text "Door de stroming" ; "The currents keep"
	line "kan ik niet bij" ; "me from reaching"
	cont "dat eiland komen." ; "that island."
	done

SwimmermMathewSeenText:
	text "Zoek je de ge-" ; "Are you seeking"
	line "heimen van de" ; "the secrets of"
	cont "DRAAIKOLKEILANDEN?" ; "WHIRL ISLANDS?"
	done

SwimmermMathewBeatenText:
	text "Zo, wat een uit-" ; "Ooh, you've got"
	line "houdingsvermogen!" ; "great endurance!"
	done

SwimmermMathewAfterBattleText:
	text "Hey, iets over de" ; "A secret about"
	line "DRAAIKOLKEILANDEN…" ; "WHIRL ISLANDS…"

	para "Het is daarbinnen" ; "It's pitch-black"
	line "pikkedonker!" ; "inside!"
	done

SwimmerfKayleeSeenText:
	text "Ik ga naar de" ; "I'm on my way to"
	line "DRAAIKOLKEILANDEN," ; "WHIRL ISLANDS."

	para "om ze te verkennen" ; "I'm going explor-"
	line "met vrienden." ; "ing with friends."
	done

SwimmerfKayleeBeatenText:
	text "Aha, is dat hoe" ; "Is that how you do"
	line "je het doet?" ; "it?"
	done

SwimmerfKayleeAfterBattleText:
	text "Ik hoorde dat er" ; "There's supposed"
	line "een grote #MON" ; "to be a big #-"
	cont "leeft onder de" ; "MON deep beneath"
	cont "DRAAIKOLKEILANDEN." ; "WHIRL ISLANDS."

	para "Wat zou het" ; "I wonder what it"
	line "kunnen zijn?" ; "could be?"
	done

SwimmerfSusieSeenText:
	text "Wat zie je er ele-" ; "You look so ele-"
	line "gant uit, achter-" ; "gant, riding your"
	cont "op je #MON." ; "#MON."
	done

SwimmerfSusieBeatenText:
	text "Verpletterd…" ; "I'm crushed…"
	done

SwimmerfSusieAfterBattleText:
	text "Was er geen liedje" ; "Wasn't there a hit"
	line "over een jongen" ; song about a boy"
	cont "op een LAPRAS?" ; "riding a LAPRAS?"
	done

SwimmerfDeniseSeenText:
	text "Het weer is zo" ; "The weather is so"
	line "heerlijk, ik ben" ; "beautiful, I'm in"
	cont "in een roes!" ; "a daze!"
	done

SwimmerfDeniseBeatenText:
	text "Ohhh!" ; "Ohhh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Verbranden is echt" ; "A sunburn is the"
	line "niet goed voor je." ; "worst for skin."

	para "Toch gebruik ik" ; "But I don't use a"
	line "geen zonnebrand." ; "sunblock."

	para "Ik wil het water" ; "I won't pollute"
	line "niet vervuilen." ; "the water."
	done

SwimmerfKaraSeenText:
	text "Als je wil uit-" ; "If you need to"
	line "rusten, kun je" ; "rest, just tread"
	cont "watertrappelen." ; "water."

	para "Dan kun je even" ; "You'll get your"
	line "op adem komen," ; "wind back, so you"

	para "en daarna er" ; "can keep on going"
	line "weer tegenaan." ; "strong."
	done

SwimmerfKaraBeatenText:
	text "Oh! Je hebt meer" ; "Oh! You have more"
	line "energie dan ik." ; "energy than I do."
	done

SwimmerfKaraAfterBattleText:
	text "Ik hoorde gebrul," ; "I heard roars from"
	line "diep vanuit de" ; "deep inside the"
	cont "EILANDEN." ; "ISLANDS."
	done

SwimmerfWendySeenText:
	text "Rond middernacht" ; "At night, STARYU"
	line "komen STARYU naar" ; "gather near the"
	cont "het oppervlak." ; "water's surface."
	done

SwimmerfWendyBeatenText:
	text "Oh jee…" ; "Oh, dear…"
	done

SwimmerfWendyAfterBattleText:
	text "De clusters STARYU" ; "The clusters of"
	line "geven tegelijk" ; "STARYU light up"
	cont "licht met elkaar." ; "at the same time."

	para "Zo mooi dat het" ; "It's so beautiful,"
	line "een beetje eng is." ; "it's scary."
	done

Route41_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	def_object_events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
