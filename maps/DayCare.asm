	object_const_def
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	promptbutton
	closetext
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext DayCareText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd DifficultBookshelfScript

Text_GrampsLookingForYou:
	text "Opa was naar je op" ; "Gramps was looking"
	line "zoek." ; "for you."
	done

Text_DayCareManTalksAboutEggTicket: ; unreferenced
	text "I'm the DAY-CARE"
	line "MAN."

	para "There's something"
	line "new in GOLDENROD"

	para "called the TRADE"
	line "CORNER."

	para "I was given an EGG"
	line "TICKET that can be"

	para "traded in for a"
	line "ODD EGG."

	para "But since we run a"
	line "DAY-CARE, we don't"

	para "need it. You may"
	line "as well have it."
	done

DayCareManText_GiveOddEgg:
	text "Ik ben de" ; "I'm the DAY-CARE"
	line "DAGVERBLIJFT-MAN." ; "MAN."

	para "Heb je al gehoord" ; "Do you know about"
	line "over EIEREN?" ; "EGGS?"

	para "Weet je, ik voedde" ; "I was raising"
	line "#MON op met" ; "#MON with my"
	cont "mijn vrouw." ; "wife, you see."

	para "We schrokken toen" ; "We were shocked to"
	line "we een EI vonden!" ; "find an EGG!"

	para "Hoe geweldig is" ; "How incredible is"
	line "dat?" ; "that?"

	para "Zeg, wil jij dit" ; "Well, wouldn't you"
	line "EI hebben?" ; "like this EGG?"

	para "Prima, dan mag jij" ; "Then fine, this is"
	line "deze houden!" ; "yours to keep!"
	done

DayCareText_ComeAgain: ; unreferenced
	text "Kom snel weer." ; "Come again."
	done

DayCareText_GotOddEgg:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "VREEMD EI!" ; "ODD EGG!"
	done

DayCareText_DescribeOddEgg:
	text "Ik vond dat toen" ; "I found that when"
	line "ik voor andermans" ; "I was caring for"

	para "#MON aan het" ; "someone's #MON"
	line "zorgen was." ; "before."

	para "Maar de trainer" ; "But the trainer"
	line "wilde het EI niet," ; "didn't want the"

	para "dus ik heb het" ; "EGG, so I'd kept"
	line "maar bewaard." ; "it around."
	done

DayCareText_PartyFull:
	text "Je hebt hier geen" ; "You've no room for"
	line "plek voor." ; "this."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  5, ROUTE_34, 3
	warp_event  0,  6, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  1, BGEVENT_READ, DayCareBookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
