	object_const_def
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35GoldenrodGate_MapScripts:
	def_scene_scripts

	def_callbacks

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftrue .gothpup
	checkevent EVENT_GAVE_KENYA
	iftrue .questcomplete
	checkevent EVENT_GOT_KENYA
	iftrue .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalse .refused
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, 10, NO_ITEM, GiftSpearowName, GiftSpearowOTName
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
	waitbutton
	closetext
	end

.partyfull
	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
	waitbutton
	closetext
	end

.refused
	writetext Route35GoldenrodGateRandyOhNeverMindThenText
	waitbutton
	closetext
	end

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	closetext
	end

GiftSpearowMail:
	db FLOWER_MAIL
	db   "DUISTERE GROT" ; "DARK CAVE leads"
	next "leidt elders@" ; "to another road@"

GiftSpearowName:
	db "KENYA@"

GiftSpearowOTName:
	db "RANDY@"

	db 0 ; unused

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText
	waitbutton
	closetext
	end

.FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText_FoughtSudowoodo
	waitbutton
	closetext
	end

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Pardon, koter!" ; "Excuse me, kid!"
	line "Kun je iets voor" ; "Can you do a guy"
	cont "me doen?" ; "a favor?"

	para "Kun je deze #-" ; "Can you take this"
	line "MON met post naar" ; "#MON with MAIL"
	cont "iemand brengen?" ; "to my friend?"

	para "Op ROUTE 31, dus." ; "He's on ROUTE 31."
	done

Route35GoldenrodGateRandyThanksText:
	text "Doe je het? Top!" ; "You will? Perfect!"
	line "Bedankt, koter!" ; "Thanks, kid!"

	para "Mijn maat is een" ; "My pal's a chubby"
	line "mollige gast die" ; "guy who snoozes"
	cont "vaak dutjes doet." ; "all the time."

	para "Je herkent hem" ; "You'll recognize"
	line "vast meteen!" ; "him right away!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> ontving" ; "<PLAYER> received a"
	line "#MON met POST." ; "#MON with MAIL."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "Lees het gerust," ; "You can read it,"
	line "maar niet kwijt-" ; "but don't lose it!"
	cont "raken! ROUTE 31!" ; "ROUTE 31!"

	para "Oh, ja. Een rare" ; "Oh, yeah. There"
	line "boom blokkeerde de" ; "was a weird tree"
	cont "weg." ; "blocking the road."

	para "Zou die al zijn" ; "I wonder if it's"
	line "weggehaald?" ; "been cleared?"
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "Je kunt niet meer" ; "You can't carry"
	line "#MON meenemen…" ; "another #MON…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Oh… Laat maar," ; "Oh… Never mind,"
	line "dan…" ; "then…"
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Bedankt, koter! Je" ; "Thanks, kid! You"
	line "hebt het voor me" ; "made the delivery"
	cont "bezorgd!" ; "for me!"

	para "Hier, iets voor" ; "Here's something"
	line "de moeite." ; "for your trouble!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Mijn maat lag te" ; "My pal was snooz-"
	line "pitten, of niet?" ; "ing, right? Heh,"
	cont "Dacht ik al!" ; "what'd I say?"
	done

Route35GoldenrodGatePokefanFText:
	text "Een vreemde boom" ; "A strange tree is"
	line "blokkeert de weg." ; "blocking the road."

	para "Hij wiebelt als je" ; "It wriggles around"
	line "er tegen praat." ; "if you talk to it."

	para "Kennelijk werd ie" ; "I heard it became"
	line "wild toen iemand" ; "wild when someone"

	para "er met een SPUIT-" ; "watered it with a"
	line "FLES op sproeide." ; "SQUIRTBOTTLE."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "Ik hou van het" ; "I like the #MON"
	line "#MON-Slaaplied" ; "Lullaby they play"
	cont "op de radio." ; "on the radio."
	done

Route35GoldenrodGateFisherText:
	text "Hoeveel soorten" ; "I wonder how many"
	line "#MON zouden er" ; "kinds of #MON"

	para "op de wereld" ; "there are in the"
	line "zijn?" ; "world."

	para "Drie jaar geleden" ; "Three years ago,"
	line "zei PROF.OAK dat" ; "PROF.OAK said that"

	para "er 150 soorten" ; "there were 150"
	line "bestaan." ; "different kinds."
	done

Route35GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
