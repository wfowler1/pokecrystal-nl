	object_const_def
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route32Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	promptbutton
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

Route32Pokecenter1FFishingGuruText_Question:
	text "Dit is een goede" ; "This is a great"
	line "plek om te vissen." ; "fishing spot."

	para "Je zag mensen" ; "You saw people"
	line "vissen? En jij" ; "fishing? How"
	cont "dan misschien?" ; "about you?"

	para "Wil je een van" ; "Would you like one"
	line "mijn HENGELS?" ; "of my RODS?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "Heh, dat is fijn" ; "Heh, that's good"
	line "om te horen." ; "to hear."

	para "Nu ben jij ook" ; "Now you're an"
	line "een hengelaar!" ; "angler too!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "Vissen is machtig!" ; "Fishing is great!"

	para "Probeer je HENGEL" ; "If there's water,"
	line "als er water is," ; "be it the sea or a"

	para "zij het de zee" ; "stream, try out"
	line "of rivier." ; "your ROD."
	done

Route32Pokecenter1FFishingGuruText_No:
	text "Oh. Dat is wel" ; "Oh. That's rather"
	line "teleurstellend…" ; "disappointing…"
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Yo, kind! Willen" ; "Yo, kid. How are"
	line "ze bijten?" ; "they biting?"
	done

Route32Pokecenter1FCooltrainerFText:
	text "Wat zal ik mijn" ; "What should I make"
	line "#MON geven?" ; "my #MON hold?"

	para "Misschien iets" ; "Maybe an item that"
	line "dat AANVALSKRACHT" ; "increases ATTACK"
	cont "verhoogt…" ; "power…"
	done

Route32Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_32, 1
	warp_event  4,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
