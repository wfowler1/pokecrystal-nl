	object_const_def
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUIDE
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script EcruteakPokecenter1FMeetBillScene, SCENE_ECRUTEAKPOKECENTER1F_MEET_BILL
	scene_script EcruteakPokecenter1FNoopScene,     SCENE_ECRUTEAKPOKECENTER1F_NOOP

	def_callbacks

EcruteakPokecenter1FMeetBillScene:
	sdefer EcruteakPokcenter1FBillActivatesTimeCapsuleScript
	end

EcruteakPokecenter1FNoopScene:
	end

EcruteakPokcenter1FBillActivatesTimeCapsuleScript:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	promptbutton
	sjump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_ECRUTEAKPOKECENTER1F_NOOP
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

EcruteakPokecenter1FPokefanMScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuideScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuideText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Hoi, ik ben BILL." ; "Hi, I'm BILL. And"
	line "En wie ben jij?" ; "who are you?"

	para "Hmm, <PLAYER>, hè?" ; "Hmm, <PLAYER>, huh?"
	line "Je bent op het" ; "You've come at the"
	cont "goede moment" ; "right time."
	cont "gekomen." ; 
	done

EcruteakPokecenter1F_BillText2:
	text "Ik ben net klaar" ; "I just finished"
	line "met sleutelen" ; "adjustments on my"
	cont "aan mijn TIJD-" ; "TIME CAPSULE."
	cont "CAPSULE." ; 

	para "Je weet dat je" ; "You know that"
	line "#MON kan" ; "#MON can be"
	cont "ruilen, toch?" ; "traded, right?"

	para "Mijn TIJDCAPSULE" ; "My TIME CAPSULE"
	line "is ontwikkeld om" ; "was developed to"

	para "te ruilen met" ; "enable trades with"
	line "het verleden." ; "the past."

	para "Maar je kan niets" ; "But you can't send"
	line "sturen dat in" ; "anything that"

	para "het verleden" ; "didn't exist in"
	line "niet bestond." ; "the past."

	para "Als je dat zou" ; "If you did, the PC"
	line "doen, zou de PC" ; "in the past would"
	cont "in het verleden" ; "have a breakdown."
	cont "crashen." ; 

	para "Dus je moet" ; "So you have to"
	line "alles weghalen" ; "remove anything"

	para "dat er vroeger" ; "that wasn't around"
	line "niet was." ; "in the past."

	para "Oftewel, stuur" ; "Put simply, no"
	line "geen nieuwe" ; "sending new moves"

	para "aanvallen of" ; "or new #MON in"
	line "nieuwe #MON in" ; "the TIME CAPSULE."
	cont "de TIJDCAPSULE." ; 

	para "Geen zorgen." ; "Don't you worry."
	line "Ik ben klaar" ; "I'm done with the"
	cont "met sleutelen." ; "adjustments."

	para "Morgen zullen" ; "Tomorrow, TIME"
	line "TIJDCAPSULES" ; "CAPSULES will be"

	para "draaien in alle" ; "running at all"
	line "#MONCENTRA." ; "#MON CENTERS."

	para "Ik moet nu snel" ; "I have to hurry on"
	line "naar GOLDENROD" ; "back to GOLDENROD"
	cont "om mijn ouders" ; "and see my folks."
	cont "te zien." ; 

	para "Doe-doei!" ; "Buh-bye!"
	done

EcruteakPokecenter1FPokefanMText:
	text "Geweldig hoe" ; "The way the KIMONO"
	line "de KIMONO-MEIDEN" ; "GIRLS dance is"

	para "dansen. Net als" ; "marvelous. Just"
	line "de manier hoe ze" ; "like the way they"
	cont "met hun #MON" ; "use their #MON."
	cont "omgaan." ; 
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "Je hoopt zeker" ; "You must be hoping"
	line "om met meer" ; "to battle more"

	para "mensen te vechten?" ; "people, right?"
	line "Blijkbaar is er" ; "There's apparently"

	para "een plek waar" ; "some place where"
	line "trainers samen-" ; "trainers gather."
	cont "komen." ; 

	para "Waar, vraag je?" ; "Where, you ask?"

	para "Het is even voor-" ; "It's a little past"
	line "bij OLIVINE CITY." ; "OLIVINE CITY."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "MORTY, de GYM-" ; "MORTY, the GYM"
	line "LEIDER, is" ; "LEADER, is soooo"
	cont "zoooo cool." ; "cool."

	para "Zijn #MON zijn" ; "His #MON are"
	line "ook erg sterk." ; "really tough too."
	done

EcruteakPokecenter1FGymGuideText:
	text "MEER VAN RAZERNIJ…" ; "LAKE OF RAGE…"

	para "Het verschijnen" ; "The appearance of"
	line "van een GYARADOS-" ; "a GYARADOS swarm…"
	cont "zwerm…"

	para "Ik ruik een samen-" ; "I smell a conspir-"
	line "zwering. Sowieso!" ; "acy. I know it!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuideScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
