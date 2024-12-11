	object_const_def
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1
	const CELADONCAFE_FISHER2
	const CELADONCAFE_FISHER3
	const CELADONCAFE_TEACHER

CeladonCafe_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonCafeChef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

CeladonCafeFisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER1, LEFT
	end

CeladonCafeFisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER2, RIGHT
	end

CeladonCafeFisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_GoldenrodIsBest
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER3, RIGHT
	end

CeladonCafeTeacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	promptbutton
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd TrashCanScript

ChefText_Eatathon:
	text "Hoi!" ; "Hi!"

	para "We houden hier" ; "We're holding an"
	line "een eetwedstrijd." ; "eatathon contest."

	para "We kunnen je niet" ; "We can't serve you"
	line "bedienen, sorry." ; "right now. Sorry."
	done

Fisher1Text_Snarfle:
	text "…Schrok, hap…" ; "…Snarfle, chew…"
	done

Fisher1Text_Concentration:
	text "Houd je mond!" ; "Don't talk to me!"

	para "Je haalt me uit" ; "You'll break my"
	line "mijn concentratie!" ; "concentration!"
	done

Fisher2Text_GulpChew:
	text "…Slik… Hap…" ; "…Gulp… Chew…"
	done

Fisher2Text_Quantity:
	text "Kwantiteit boven" ; "I take quantity"
	line "kwaliteit, zeg ik!" ; "over quality!"

	para "Ik ben zo gelukkig" ; "I'm happy when I'm"
	line "als ik vol zit!" ; "full!"
	done

Fisher3Text_MunchMunch:
	text "Smak, smak…" ; "Munch, munch…"
	done

Fisher3Text_GoldenrodIsBest:
	text "Het eten hier is" ; "The food is good"
	line "lekker, maar niet" ; "here, but GOLDEN-"
	cont "zo lekker als dat" ; "ROD has the best"
	cont "van GOLDENROD." ; "food anywhere."
	done

TeacherText_CrunchCrunch:
	text "Kraak… Knars…" ; "Crunch… Crunch…"
	done

TeacherText_NoCoinCase:
	text "Niemand hier heeft" ; "Nobody here will"
	line "een GELDKISTJE" ; "give you a COIN"

	para "voor je. Kijk eens" ; "CASE. You should"
	line "rond in JOHTO." ; "look in JOHTO."
	done

TeacherText_KeepEating:
	text "Kraak… Knars…" ; "Crunch… Crunch…"

	para "Ik zit nooit vol!" ; "I can keep eating!"
	done

TeacherText_MoreChef:
	text "KOK, meer!" ; "More, CHEF!"
	done

EatathonContestPosterText:
	text "Eetwedstrijd!" ; "Eatathon Contest!"
	line "Geen tijdslimiet!" ; "No time limit!"

	para "Een gevecht zonder" ; "A battle without"
	line "einde! De grootste" ; "end! The biggest"

	para "smulpaap krijgt" ; "muncher gets it"
	line "alles gratis!" ; "all for free!"
	done

FoundLeftoversText:
	text "<PLAYER> vond" ; "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "!"
	done

NoRoomForLeftoversText:
	text "Maar VOORWERPZAK" ; "But <PLAYER> can't"
	line "zit vol…" ; "hold another item…"
	done

CeladonCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  7,  1, BGEVENT_READ, CeladonCafeTrashcan

	def_object_events
	object_event  9,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCafeChef, -1
	object_event  4,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
