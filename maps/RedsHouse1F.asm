	object_const_def
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script RedHouse1FNoopScene ; unusable

	def_callbacks

RedHouse1FNoopScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_MET_REDS_MOM
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MOM
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Hoi!" ; "Hi!"

	para "RED is al lange" ; "RED's been away"
	line "tijd weg." ; "for a long time."

	para "Hij heeft ook" ; "He hasn't called"
	line "niet gebeld, dus" ; "either, so I have"

	para "ik heb geen idee" ; "no idea where he"
	line "waar hij is of" ; "is or what he's"
	cont "wat ie doet." ; "been doing."

	para "Men zegt dat" ; "They say that no"
	line "geen nieuws is" ; "word is proof that"

	para "goed nieuws," ; "he's doing fine,"
	line "maar ik maak me" ; "but I do worry"
	cont "toch zorgen." ; "about him."
	done

RedsMomText2:
	text "Ik maak me zorgen" ; "I worry about RED"
	line "dat RED gewond" ; "getting hurt or"

	para "raakt of ziek" ; "sick, but he's a" /Eline: a boy -> mijn jongen is expres zo vertaald.
	line "wordt, maar hij" ; "boy. I'm proud"

	para "is mijn jongen." ; "that he is doing"
	line "Ik ben trots dat" ; "what he wants to"

	para "hij doet wat hij" ; "do."
	line "wil doen." ;
	done

RedsHouse1FTVText:
	text "Er zijn shows die" ; "They have programs"
	line "niet in JOHTO wor-" ; "that aren't shown"
	cont "den uitgezonden…" ; "in JOHTO…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
