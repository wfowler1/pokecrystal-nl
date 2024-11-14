	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

OaksLabNoopScene: ; unreferenced
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "Goed dat je" ; "It's good of you"

	para "helemaal naar" ; "to come all this"
	line "KANTO bent ge-" ; "way to KANTO."

	para "komen. Wat denk" ; "What do you think"
	line "je van de " ; "of the trainers"

	para "trainers hier?" ; "out here?"
	line "Best sterk hè?" ; "Pretty tough, huh?"
	done

OakLabDexCheckText:
	text "Hoe gaat het" ; "How is your #-"
	line "met je #DEX?" ; "DEX coming?"

	para "Eens zien…" ; "Let's see…"
	done

OakLabGoodbyeText:
	text "Als je in de" ; "If you're in the"
	line "buurt bent, hoop" ; "area, I hope you"
	cont "ik dat je weer" ; "come visit again."
	cont "op bezoek komt." ;
	done

OakOpenMtSilverText:
	text "OAK: Wauw! Dat" ; "OAK: Wow! That's"
	line "is geweldig!" ; "excellent!"

	para "Je hebt de BADGES" ; "You collected the"
	line "van GYMS in KANTO" ; "BADGES of GYMS in"
	cont "verzameld. Goed" ; "KANTO. Well done!"

	para "bezig! Ik heb je" ; "I was right in my"
	line "juist ingeschat." ; "assessment of you."

	para "Weet je wat," ; "Tell you what,"
	line "<PLAY_G>. Ik zorg" ; "<PLAY_G>. I'll make"

	para "dat je naar" ; "arrangements so"
	line "ZILVERBERG kan" ; "that you can go to"
	cont "gaan." ; "MT.SILVER."

	para "ZILVERBERG is een" ; "MT.SILVER is a big"
	line "grote berg waar" ; "mountain that is"

	para "veel wilde" ; "home to many wild"
	line "#MON wonen." ; "#MON."

	para "Het is te ge-" ; "It's too dangerous"
	line "vaarlijk voor een" ; "for your average"

	para "gewone trainer," ; "trainer, so it's"
	line "dus is het ver-" ; "off limits. But"

	para "boden terrein." ; "we can make an"
	line "Maar we kunnen" ; "exception in your"
	cont "een uitzondering" ; "case, <PLAY_G>."
	cont "maken in jouw" ;
	cont "geval, <PLAY_G>." ;

	para "Ga naar INDIGO-" ; "Go up to INDIGO"
	line "PLATEAU. Je kan" ; "PLATEAU. You can"

	para "ZILVERBERG vanaf" ; "reach MT.SILVER"
	line "daar bereiken." ; "from there."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? Je" ; "OAK: Hmm? You're"
	line "verzamelt geen" ; "not collecting"
	cont "KANTO-GYMBADGES?" ; "KANTO GYM BADGES?"

	para "De GYMLEIDERS in" ; "The GYM LEADERS in"
	line "KANTO zijn net" ; "KANTO are as tough"

	para "zo sterk als die" ; "as any you battled"
	line "je in JOHTO hebt" ; "in JOHTO."
	cont "bevochten." ;

	para "Ik raad je aan" ; "I recommend that"
	line "om ze uit te" ; "you challenge"
	cont "dagen." ; "them."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, je" ; "OAK: Ah, you're"
	line "verzamelt KANTO-" ; "collecting KANTO"
	cont "GYMBADGES." ; "GYM BADGES."

	para "Ik kan me voor-" ; "I imagine that"
	line "stellen dat het" ; "it's hard, but the"

	para "moeilijk is, maar" ; "experience is sure"
	line "de ervaring zal" ; "to help you."

	para "je helpen. Kom" ; "Come see me when"
	line "langs als je ze" ; "you get them all."
	cont "allemaal hebt." ;

	para "Ik zal je dan iets" ; "I'll have a gift"
	line "geven." ; "for you."

	para "Doe je best," ; "Keep trying hard,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "De PROF's #MON-" ; "The PROF's #MON"
	line "PRAAT-radiopro-" ; "TALK radio program"

	para "gramma wordt" ; "isn't aired here"
	line "niet in KANTO" ; "in KANTO."
	cont "uitgezonden." ;

	para "Jammer--Ik zou" ; "It's a shame--I'd"
	line "'t graag horen." ; "like to hear it."
	done

OaksAssistant2Text:
	text "Dankzij je werk" ; "Thanks to your"
	line "aan de #DEX" ; "work on the #-"
	cont "is het onderzoek" ; "DEX, the PROF's"

	para "van de PROF" ; "research is coming"
	line "goed op weg." ; "along great."
	done

OaksAssistant3Text:
	text "Niemand vertellen," ; "Don't tell anyone,"
	line "maar PROF.OAK'S" ; "but PROF.OAK'S"

	para "#MONPRAAT is" ; "#MON TALK isn't"
	line "niet live." ; "a live broadcast."
	done

OaksLabPoster1Text:
	text "Druk met START het" ; "Press START to"
	line "MENU." ; "open the MENU."
	done

OaksLabPoster2Text:
	text "De OPSLAAN optie" ; "The SAVE option is"
	line "is in het MENU." ; "on the MENU."

	para "Gebruik het" ; "Use it in a timely"
	line "regelmatig." ; "manner."
	done

OaksLabTrashcanText:
	text "Er zit niets" ; "There's nothing in"
	line "in…" ; "here…"
	done

OaksLabPCText:
	text "Er is een e-mail-" ; "There's an e-mail"
	line "bericht op de PC." ; "message on the PC."

	para "…"

	para "PROF.OAK, hoe" ; "PROF.OAK, how is"
	line "gaat het met je" ; "your research"
	cont "onderzoek?" ; "coming along?"

	para "Ik ben nog steeds" ; "I'm still plugging"
	line "aan het zwoegen." ; "away."

	para "Ik hoor geruchten" ; "I heard rumors"
	line "dat <PLAY_G> best" ; "that <PLAY_G> is"

	para "een reputatie" ; "getting quite a"
	line "begint te krijgen." ; "reputation."

	para "Het verheugt me" ; "I'm delighted to"
	line "dat te horen." ; "hear that."

	para "ELM in NEW BARK"
	line "TOWN 8-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
