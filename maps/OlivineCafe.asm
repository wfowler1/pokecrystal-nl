	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "Pff! Je #MON" ; "Hah! Your #MON"
	line "zien eruit als" ; "sure look like"
	cont "lichtgewichten!" ; "lightweights!"

	para "Ze hebben de" ; "They don't have"
	line "kracht niet om" ; "the power to move"
	cont "rotsen te" ; "boulders aside."
	cont "verplaatsen." ; 

	para "Hier, gebruik" ; "Here, use this"
	line "dit en leer ze" ; "and teach them"
	cont "KRACHT!" ; "STRENGTH!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Op zee kan" ; "On the sea, the"
	line "je alleen op" ; "only thing you can"

	para "je eigen kracht" ; "count on is your"
	line "rekenen!" ; "own good self!"

	para "Ik ben zo trots" ; "I'm so proud of my"
	line "op m'n gespierde" ; "buff bod!"
	cont "lijf!" ; 
	done

OlivineCafeFishingGuruText:
	text "Het menu van" ; "OLIVINE CAFE's"
	line "OLIVINE CAFE is" ; "menu is chock full"

	para "gevuld met hartige" ; "of hearty fare for"
	line "kost voor" ; "beefy SAILORS!"
	cont "potige MATROZEN!" ; 
	done

OlivineCafeSailorText:
	text "Elke keer als" ; "Whenever I roll"
	line "ik hier aankom" ; "into this town, I"

	para "bezoek ik het" ; "always visit the"
	line "OLIVINE CAFE." ; "OLIVINE CAFE."

	para "Ik voel me sterker" ; "Everything on the"
	line "door alles op het" ; "menu makes me feel"

	para "menu. Ik kan niet" ; "stronger. I can't"
	line "stoppen met eten!" ; "stop eating!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
