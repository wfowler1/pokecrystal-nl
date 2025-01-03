	object_const_def
	const ROUTE27SANDSTORMHOUSE_GRANNY

Route27SandstormHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	promptbutton
	ifgreater 150 - 1, .Loyal
	sjump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	promptbutton
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd MagazineBookshelfScript

SandstormHouseWomanText1:
	text "Waar ga je met" ; "Where are you off"
	line "je #MON heen?" ; "to with #MON?"

	para "#MON-LEAGUE?"

	para "Zijn je #MON" ; "Are your #MON"
	line "trouw genoeg om" ; "loyal enough for"
	cont "te winnen?" ; "you to win?"

	para "Eens zien…" ; "Let me see…"
	done

SandstormHouseWomanLoyalText:
	text "Ah! Je #MON" ; "Ah! Your #MON"
	line "vertrouwt je" ; "trusts you very"
	cont "volledig." ; "much."

	para "Fijn om een goede" ; "It's nice to see a"
	line "trainer te zien." ; "good trainer."

	para "Hier. Iets kleins" ; "Here. A gift for"
	line "voor je reis." ; "your journey."
	done

SandstormHouseSandstormDescription:
	text "TM37 is ZANDSTORM." ; "TM37 happens to be"
	;line "ZANDSTORM." ; "SANDSTORM."

	para "Het is een aanval" ; "It's a move that"
	line "die schade doet aan" ; "inflicts damage on"
	cont "beide vechters." ; "both battlers."

	para "Het is alleen voor" ; "It's for advanced"
	line "gevorderde" ; "trainers only."
	cont "trainers." ;

	para "Gebruik het als" ; "Use it if you"
	line "je durft. Succes!" ; "dare. Good luck!"
	done

SandstormHouseWomanDisloyalText:
	text "Als het je niet" ; "If it doesn't come"
	line "meer gaat ver-" ; "to trust you some"

	para "trouwen, zal het" ; "more, it could be"
	line "lastig worden." ; "tough going."

	para "Vertrouwen is de" ; "Trust is the tie"
	line "band die #MON" ; "that binds #MON"
	cont "en trainers bindt." ; "and trainers."
	done

Route27SandstormHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SandstormHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
