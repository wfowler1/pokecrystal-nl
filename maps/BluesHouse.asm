	object_const_def
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutToWhite
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "DAISY: Hoi! M'n" ; "DAISY: Hi! My kid"
	line "broertje is de" ; "brother is the GYM"

	para "GYMLEIDER van" ; "LEADER in VIRIDIAN"
	line "VIRIDIAN CITY." ; "CITY."

	para "Maar hij gaat er" ; "But he goes out"
	line "zo vaak op uit," ; "of town so often,"

	para "dat het lastig is" ; "it causes problems"
	line "voor de trainers." ; "for the trainers."
	done

DaisyOfferGroomingText:
	text "DAISY: Hoi! Goede" ; "DAISY: Hi! Good"
	line "timing. Ik heb" ; "timing. I'm about"
	cont "net thee gezet." ; "to have some tea."

	para "Wil je ook" ; "Would you like to"
	line "een kopje?" ; "join me?"

	para "Oh, je #MON" ; "Oh, your #MON"
	line "zijn een beetje" ; "are a bit dirty."

	para "vies. Zal ik er" ; "Would you like me"
	line "eentje verzorgen?" ; "to groom one?"
	done

DaisyWhichMonText:
	text "DAISY: Welke zal" ; "DAISY: Which one"
	line "ik opknappen?" ; "should I groom?"
	done

DaisyAlrightText:
	text "DAISY: Oké, ik" ; "DAISY: OK, I'll"
	line "zal 't lekker" ; "get it looking"
	cont "verzorgen." ; "nice in no time."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text "ziet er" ; " looks"
	line "tevreden uit." ; "content."
	done

DaisyAllDoneText:
	text "DAISY: Zo!" ; "DAISY: There you"
	line "Helemaal klaar." ; "go! All done."

	para "Zie je? Ziet 't" ; "See? Doesn't it"
	line "er niet leuk uit?" ; "look nice?"

	para "'Tis zo'n schat-" ; "It's such a cute"
	line "tige #MON." ; "#MON."
	done

DaisyAlreadyGroomedText:
	text "DAISY: Ik zet" ; "DAISY: I always"
	line "rond deze tijd" ; "have tea around"

	para "altijd thee." ; "this time. Come"
	line "Doe met me mee." ; "join me."
	done

DaisyRefusedText:
	text "DAISY: Je wil er" ; "DAISY: You don't"
	line "geen opknappen?" ; "want to have one"

	para "Oké, dan drinken" ; "groomed? OK, we'll"
	line "we alleen thee." ; "just have tea."
	done

DaisyCantGroomEggText:
	text "DAISY: Oh, sorry."
	line "Ik kan geen EI" ; "I honestly can't"
	cont "opknappen." ; "groom an EGG."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
