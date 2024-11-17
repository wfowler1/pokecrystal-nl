	object_const_def
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE

CeladonPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeladonPokecenter1FGentlemanScript:
	jumpstd HappinessCheckScript

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	setval SUICUNE
	special MonCheck
	iffalse .NoSuicune
	special BeastsCheck
	iftrue .HoOh
	writetext NoBeastsText
	waitbutton
.NoSuicune:
	closetext
	end

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .Location1
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement1
	sjump .Continue

.Location1:
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement2
.Continue:
	disappear CELADONPOKECENTER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.Movement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonPokecenter1FCooltrainerFText:
	text "ERIKA is een" ; "ERIKA is a master"
	line "meester van gras-" ; "of grass #MON."
	cont "#MON." ; 

	para "Ze rekent met je" ; "She'll make you"
	line "af als je niet" ; "pay if you don't"
	cont "uitkijkt." ; "watch yourself."
	done

CeladonPokecenter1FPharmacistText:
	text "TEAM ROCKET's"
	line "schuilplaats is" ; "hideout is in the"

	para "in de kelder van" ; "basement of the"
	line "de SPELHOEK." ; "GAME CORNER."

	para "Oh, wacht. Dat was" ; "Oh, wait. That was"
	line "drie jaar geleden." ; "three years ago."
	done

CeladonEusineText1:
	text "EUSINE: Hoi!" ; "EUSINE: Hi!"

	para "Ik ben terug in" ; "I'm back visiting"
	line "mijn geboortestad." ; "my hometown."

	para "Het is best een" ; "It's been quite a"
	line "tijd geleden." ; "while."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, heb" ; "<PLAYER>, have you"
	line "je het gehoord?" ; "heard?"

	para "Er zijn geruchten" ; "There have been"
	line "dat een regen-" ; "fresh rumors of a"

	para "boogkleurige #MON" ; "rainbow-colored"
	line "bij TINTOREN is" ; "#MON appearing"
	cont "verschenen." ; "at TIN TOWER."

	para "Ik heb mijn" ; "I've just had my"
	line "team genezen," ; "party healed, so"

	para "dus nu ga ik naar" ; "now I'm headed to"
	line "ECRUTEAK."

	para "Ik zie je daar," ; "I'll be seeing"
	line "<PLAYER>!" ; "you, <PLAYER>!"
	done

NoBeastsText:
	text "Oh, trouwens," ; "Oh, by the way,"
	line "<PLAYER>."

	para "Heb je de legen-" ; "Have you caught"
	line "darische #MON" ; "the legendary"

	para "RAIKOU en ENTEI" ; "#MON RAIKOU and"
	line "gevangen?" ; "ENTEI?"

	para "<……><……><……>"

	para "Oké…" ; "Okay…"

	para "Als je er een" ; "If you catch even"
	line "vangt, hoop ik dat" ; "one, I hope that"
	cont "je het me vertelt." ; "you'll inform me."

	para "Ik reken op je," ; "I'm counting on"
	line "<PLAYER>!" ; "you, <PLAYER>!"
	done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
