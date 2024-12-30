	object_const_def
	const ROUTE26HEALHOUSE_TEACHER

Route26HealHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route26HealHouseTeacherScript:
	faceplayer
	opentext
	writetext Route26HealHouseRestAWhileText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInFromBlack
	special RestartMapMusic
	opentext
	writetext Route26HealHouseKeepAtItText
	waitbutton
	closetext
	end

Route26HealHouseBookshelf:
	jumpstd PictureBookshelfScript

Route26HealHouseRestAWhileText:
	text "Je #MON lijken" ; "Your #MON look"
	line "een beetje moe." ; "a little tired."

	para "Geef ze een" ; "You should rest"
	line "tijdje rust." ; "them a while."
	done

Route26HealHouseKeepAtItText:
	text "Zo!" ; "There!"

	para "Je #MON zien" ; "Your #MON are"
	line "er goed uit!" ; "looking good!"

	para "Ga zo door!" ; "Keep at it!"
	done

Route26HealHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_26, 2
	warp_event  3,  7, ROUTE_26, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route26HealHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route26HealHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route26HealHouseTeacherScript, -1
