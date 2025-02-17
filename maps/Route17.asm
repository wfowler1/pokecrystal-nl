	object_const_def
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17AlwaysOnBikeCallback

Route17AlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerRileySeenText:
	text "Hé, jij! Je komt" ; "Hey, you! You're"
	line "uit JOHTO, hè?" ; "from JOHTO, huh?"
	done

BikerRileyBeatenText:
	text "Wow, je beukt!" ; "Whoa, you kick!"
	done

BikerRileyAfterBattleText:
	text "Niet arrogant wor-" ; "Don't get cocky,"
	line "den, JOHTO-boef!" ; "you JOHTO punk!"
	done

BikerJoelSeenText:
	text "Wow. Wat een" ; "Wow. That's a cool"
	line "coole FIETS!" ; "BICYCLE!"
	done

BikerJoelBeatenText:
	text "Maar je lijkt niet" ; "But you don't just"
	line "alleen cool…" ; "look cool…"
	done

BikerJoelAfterBattleText:
	text "Ik lijk cool, maar" ; "I look cool, but"
	line "ik ben zwak, dus" ; "I'm weak, so I'm"
	cont "ik ben niet echt" ; "not really cool."

	para "cool. Ik moet" ; "I have to train"
	line "harder trainen…" ; "harder…"
	done

BikerGlennSeenText:
	text "Hé! Wil je een" ; "Hey! Want to have"
	line "snel gevecht?" ; "a speed battle?"
	done

BikerGlennBeatenText:
	text "Oef! Je hebt" ; "Yikes! You've got"
	line "een goeie draai!" ; "awesome torque!"
	done

BikerGlennAfterBattleText:
	text "Fietsen zonder" ; "Hands-free riding"
	line "handen is cool op" ; "is considered cool"
	cont "het FIETSPAD." ; "on CYCLING ROAD."
	done

BikerCharlesSeenText:
	text "Wij zijn onbevree-" ; "We're fearless"
	line "sde snelweghelden!" ; "highway stars!"
	done

BikerCharlesBeatenText:
	text "Arrrgh!" ; "Arrrgh! Crash and"
	line "Neergestort!" ; "burn!"
	done

BikerCharlesAfterBattleText:
	text "Roekeloos rijden" ; "Reckless driving"
	line "veroorzaakt onge-" ; "causes accidents!"
	cont "lukken! Rustig!" ; "Take it easy!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 82, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 17, 83, ROUTE_17_ROUTE_18_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

	def_object_events
	object_event  4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event  3, 53, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event  6, 80, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
