	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "Wie ben jij" ; "Who are you?"

	para "Het is wel" ; "Well, it's plain"
	line "duidelijk dat je" ; "to see that you're"
	cont "een trainer bent…" ; "a trainer…"

	para "Mijn naam is BLUE." ; "My name's BLUE."

	para "Ik was ooit de" ; "I was once the"
	line "KAMPIOEN, al was" ; "CHAMPION, although"

	para "was dat maar van" ; "it was for only a"
	line "korte duur…" ; "short time…"

	para "Die bemoeial RED" ; "That meddling RED"
	line "pakte me aan…" ; "did me in…"

	para "Maar goed, wat wil" ; "Anyway, what do"
	line "je van me? Wil" ; "you want? You want"

	para "je me misschien," ; "to challenge me or"
	line "uitdagen, ofzo?" ; "something?"

	para "…Ik zeg het liever" ; "…I hate to say"
	line "niet, maar ik heb" ; "it, but I'm not in"

	para "weinig zin om nu" ; "the mood for a"
	line "met je te vechten." ; "battle now."

	para "Kijk eens goed" ; "Take a good look"
	line "om je heen…" ; "around you…"

	para "Een vulkaan barst" ; "A volcano erupts,"
	line "uit, en zomaar" ; "and just like"

	para "verdwijnt er een" ; that, a whole town"
	line "hele stad." ; "disappears."

	para "We kunnen wel" ; "We can go on win-"
	line "blijven vechten," ; "ning and losing in"

	para "maar de natuur" ; "#MON. But if"
	line "wint het altijd." ; "nature so much as"

	para "En dan verliezen" ; "twitches, we can"
	line "we allemaal." ; "lose in a second."

	para "…" ; "…"

	para "Zo is het nu" ; "That's the way it"
	line "eenmaal…" ; "is…"

	para "Nou ja, ik ben nog" ; "But, anyway, I'm"
	line "wel een trainer." ; still a trainer."

	para "Als ik een sterke" ; "If I see a strong"
	line "tegenstander zie," ; "opponent, it makes"
	cont "wil ik vechten." ; "me want to battle."

	para "Als je mij wil" ; "If you want to"
	line "verslaan, kom dan" ; "battle me, come to"
	cont "naar VIRIDIAN." ; "the VIRIDIAN GYM."

	para "In de GYM daar" ; "I'll take you on"
	line "wacht ik op je." ; "then."
	done

CinnabarIslandGymSignText:
	text "Er hangt hier" ; "There's a notice"
	line "een briefje…" ; "here…"

	para "CINNEBAR GYM is" ; "CINNABAR GYM has"
	line "nu op de ZEE-" ; relocated to SEA-"
	cont "SCHUIM-EILANDEN." ; "FOAM ISLANDS."

	para "BLAINE" ; "BLAINE"
	done

CinnabarIslandSignText:
	text "CINNABAR EILAND" ; "CINNABAR ISLAND"

	para "De Vurige Stad van" ; "The Fiery Town of"
	line "Brandend Verlangen" ; "Burning Desire"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
