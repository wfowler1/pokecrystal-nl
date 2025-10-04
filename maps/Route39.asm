	object_const_def
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2

Route39_MapScripts:
	def_scene_scripts

	def_callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	endifjustbattled
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkpoke PIKACHU
	iffalse .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.WantsPikachu:
	writetext PokefanMDerekPikachuIsItText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Mooo!"
	done

SailorEugeneSeenText:
	text "Ik ben net terug" ; "I just got back to"
	line "uit OLIVINE." ; "OLIVINE."

	para "Heb je zin in een" ; "So how about a"
	line "#MON-gevecht?" ; "#MON battle?"
	done

SailorEugeneBeatenText:
	text "Awaaargh!"
	done

SailorEugeneAfterBattleText:
	text "Mijn #MON zijn" ; "My #MON were"
	line "overzee gevangen" ; "caught and raised"
	cont "en opgevoed." ; "overseas."

	para "Het zijn maatjes" ; "They're my compan-"
	line "tijdens mijn lange" ; "ions on those long"
	cont "reizen." ; "voyages."
	done

PokefanmDerekSeenText:
	text "Dit is een goed" ; "This is a good"
	line "moment om op te" ; "time to brag about"
	cont "scheppen over mijn" ; "my PIKACHU!"
	cont "PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "PIKACHU kreeg niet" ; "I had no time to"
	line "de kans te shinen…" ; "show off PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "Ik wil je niet" ; "I'm not listening"
	line "horen opscheppen!" ; "to your bragging!"

	para "Wij #FANS" ; "We # FANS have"
	line "luisteren uit" ; "a policy of not"

	para "beleid niet naar" ; "listening to other"
	line "andermans gepoch!" ; "people brag!"
	done

PokefanfRuthSeenText:
	text "Wat een lieve" ; "Such darling"
	line "#MON." ; "#MON."

	para "Laten we onze" ; "Let's show our"
	line "#MON tegelijk" ; "#MON together"
	cont "laten zien." ; "at the same time."
	done

PokefanfRuthBeatenText:
	text "Ik vind verliezen" ; "I don't mind"
	line "niet erg." ; "losing."
	done

PokefanfRuthAfterBattleText:
	text "Al gehoord over" ; "Do you know about"
	line "baby-#MON?" ; "baby #MON?"

	para "Ze zijn vast" ; "I bet they're just"
	line "aandoenlijk!" ; "adorable!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU is het!" ; "PIKACHU is it!"
	line "Vind je ook?" ; "Don't you agree?"
	done

PsychicNormanSeenText:
	text "Ik wil zien waar" ; "Let me see what"
	line "je #MON toe in" ; "your #MON are"
	cont "staat zijn." ; "capable of."
	done

PsychicNormanBeatenText:
	text "Ooh, je #MON" ; "Ooh, your #MON"
	line "hebben potentie." ; "have potential."
	done

PsychicNormanAfterBattleText:
	text "Weet je hoe #-" ; "You know how #-"
	line "MON andere vaar-" ; "MON have different"
	cont "digheden hebben?" ; "abilities?"

	para "Mensen zijn net" ; "People are like"
	line "zo. Ieder is tot" ; "that too. Every-"
	cont "iets anders in" ; "one has different"
	cont "staat." ; "potential."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufufufu… Hopelijk" ; "Ufufufu… I hope it"
	line "is 't snel donker." ; "gets dark soon."
	done

PokefanfJaimeSeenText:
	text "Je kwam precies op" ; "You came at just"
	line "het juiste moment." ; "the right time."

	para "Laten we vechten." ; "Let's battle."
	done

PokefanfJaimeBeatenText:
	text "Oh, wat" ; "Oh, how disap-"
	line "teleurstellend…" ; "pointing…"
	done

PokefanfJaimeAfterBattleText:
	text "Ik ontmoette mijn" ; "I met my MEOWTH at"
	line "MIAUWS 's nachts," ; "night, right here"
	cont "hier op ROUTE 39." ; "on ROUTE 39."

	para "Ik weet niet" ; "I'm not sure why,"
	line "waarom, maar het" ; "but it seems to"

	para "vindt het fijn als" ; "like it when I"
	line "ik hier train." ; "train here."

	para "MIAUWS wordt" ; "It seems to become"
	line "vriendelijker als" ; "friendlier by"

	para "ik hier train dan" ; "training here than"
	line "elders." ; "anywhere else."
	done

Route39SignText:
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

MoomooFarmSignText:
	text "BOERDERIJ MOOMOO" ; "MOOMOO FARM"

	para "Geniet Van Lekker" ; "Enjoy Our Fresh"
	line "Verse Melk." ; "and Tasty Milk"
	done

Route39TrainerTipsText:
	text "TRAINERTIPS" ; "TRAINER TIPS"

	para "Gebruik KOPSTOOT" ; "Use HEADBUTT on"
	line "om bomen heen en" ; "trees to shake"
	cont "weer te schudden." ; "#MON out."

	para "Allerlei soorten" ; "Different kinds of"
	line "#MON kunnen" ; "#MON drop out"
	cont "losvallen." ; "of trees."

	para "Doe KOPSTOOT op" ; "Use HEADBUTT on"
	line "elke boom!" ; "any tree you see!"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	def_object_events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_ICON_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_ICON_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_ICON_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_ICON_PINK, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  4, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
