	object_const_def
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "Waarom ben je" ; "Why are you here?"
	line "hier? Ga je alleen" ; "Are you just going"

	para "maar wat aangapen?" ; "to gawk? I suggest"
	line "Ik stel voor dat" ; "that you leave!"
	cont "je gaat!" ; 
	done

BirdKeeperTheoBeatenText:
	text "Je bent" ; "You really are"
	line "echt bezorgd…" ; "concerned…"
	done

BirdKeeperTheoAfterBattleText:
	text "Hoe kom je in" ; "How the heck do"
	line "hemelsnaam boven?" ; "you go up?"

	para "Ik wil de zieke" ; "I want to visit"
	line "#MON bezoeken," ; "the sick #MON,"

	para "maar ik kan daar" ; "but I can't get up"
	line "niet komen…" ; "there…"
	done

SailorTerrellSeenText:
	text "Matrozen zijn" ; "Sailors are both"
	line "zowel aardig als" ; "kind and strong."
	cont "sterk. En jij?" ; "How about you?"
	done

SailorTerrellBeatenText:
	text "Je bent zowel aar-" ; "You are both kind"
	line "dig als sterk…" ; "and strong…"
	done

SailorTerrellAfterBattleText:
	text "Elke keer als ik" ; "Every time I come"
	line "terugkeer naar" ; "back to OLIVINE, I"
	cont "OLIVINE, bezoek" ; "visit the GYM."
	cont "ik de GYM." ; 

	para "Het #MON-type" ; "The GYM LEADER's"
	line "van de GYMLEIDER" ; "#MON type has"

	para "is veranderd zon-" ; "changed without me"
	line "der dat ik het" ; "noticing."
	cont "merkte." ; 
	done

GentlemanPrestonSeenText:
	text "Ik reis de wereld" ; "I travel the world"
	line "rond om mijn #-" ; "to train my #-"
	cont "MON te trainen." ; "MON. I wish to"
	cont "Ik wil met je" ; "battle with you."
	cont "vechten." ; 
	done

GentlemanPrestonBeatenText:
	text "…zucht… Ik moet" ; "…sigh… I must"
	line "meer trainen…" ; "train some more…"
	done

GentlemanPrestonAfterBattleText:
	text "JASMINE gebruikte" ; "JASMINE used to"
	line "vroeger steen-" ; "use rock #MON"
	cont "#MON als ONIX." ; "like ONIX."
	done

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	object_event  3,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperTheo, -1
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
