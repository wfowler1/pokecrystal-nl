	object_const_def
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

VermilionPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

VermilionPokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .FoughtSnorlax
	writetext VermilionPokecenter1FFishingGuruText
	waitbutton
	closetext
	end

.FoughtSnorlax:
	writetext VermilionPokecenter1FFishingGuruText_FoughtSnorlax
	waitbutton
	closetext
	end

VermilionPokecenter1FSailorScript:
	jumptextfaceplayer VermilionPokecenter1FSailorText

VermilionPokecenter1FBugCatcherScript:
	jumptextfaceplayer VermilionPokecenter1FBugCatcherText

VermilionPokecenter1FFishingGuruText:
	text "Er ligt een sla-" ; "A sleeping #MON"
	line "pende #MON voor" ; "is lying in front"
	cont "DIGLETT'S GROT." ; "of DIGLETT'S CAVE."

	para "Een goede kans om" ; "It's a fantastic"
	line "die te vangen," ; "opportunity to get"

	para "maar hoe maak je" ; "it, but how do you"
	line "het wakker?" ; "wake it up?"
	done

VermilionPokecenter1FFishingGuruText_FoughtSnorlax:
	text "Er lag een" ; "There used to be a"
	line "slapende #MON" ; "sleeping #MON"

	para "voor de ingang van" ; "lying in front of"
	line "DIGLETT GROT," ; "DIGLETT'S CAVE."

	para "maar het lijkt te" ; "But it seems to"
	line "zijn verdwenen." ; "have disappeared."
	done

VermilionPokecenter1FSailorText:
	text "Op het SNELLE" ; "The FAST SHIP is a"
	line "SCHIP kun je" ; "great place to"

	para "trainers ontmoeten" ; "meet and battle"
	line "en bevechten." ; "trainers."
	done

VermilionPokecenter1FBugCatcherText:
	text "Oh? Die BADGES heb" ; "Oh? You have some"
	line "zag ik nog nooit." ; "BADGES I've never"
	;cont "gezien." ; "seen before."

	para "Oh, ik zie het. Je" ; "Oh, I get it. You"
	line "hebt ze uit JOHTO." ; "got them in JOHTO."
	done

VermilionPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VERMILION_CITY, 2
	warp_event  4,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FFishingGuruScript, -1
	object_event  6,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSailorScript, -1
	object_event  1,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FBugCatcherScript, -1
