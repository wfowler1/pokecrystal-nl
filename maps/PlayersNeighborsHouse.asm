	object_const_def
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F

PlayersNeighborsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PlayersNeighborsDaughterScript:
	jumptextfaceplayer PlayersNeighborsDaughterText

PlayersNeighborScript:
	jumptextfaceplayer PlayersNeighborText

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

PlayersNeighborsDaughterText:
	text "PIKACHU is een" ; "PIKACHU is an"
	line "geëvolueerde" ; "evolved #MON."
	cont "#MON."

	para "De ontdekkingen" ; "I was amazed by"
	line "van ELM verbaasden" ; "PROF.ELM's find-"
	cont "mij." ; "ings."

	para "Hij werd beroemd" ; "He's so famous for"
	line "met onderzoek naar" ; "his research on"
	cont "#MON-evolutie." ; "#MON evolution."

	para "…zucht…" ; "…sigh…"

	para "Was ik maar een" ; "I wish I could be"
	line "onderzoeker zoals" ; "a researcher like"
	cont "hij…" ; "him…"
	done

PlayersNeighborText:
	text "Mijn dochter is" ; "My daughter is"
	line "vastberaden om" ; "adamant about"

	para "ELM's assistent" ; "becoming PROF."
	line "te worden." ; "ELM's assistant."

	para "Ze is dol op" ; "She really loves"
	line "#MON!"

	para "Maar ja, ik ook!" ; "But then, so do I!"
	done

PlayerNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "PRAAT! Luister" ; "TALK! Please tune"
	cont "later weer!" ; "in next time!"
	done

PlayerNeighborRadioText2:
	text "#MON-KANAAL!" ; "#MON CHANNEL!"
	done

PlayerNeighborRadioText3:
	text "Dit is DJ MARY," ; "This is DJ MARY,"
	line "je co-host!" ; "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "#MON-KANAAL…" ; "#MON CHANNEL…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborsDaughterScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
