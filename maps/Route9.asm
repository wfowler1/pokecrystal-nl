	object_const_def
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "Ik kwam om de" ; "I came to explore"
	line "ROTSTUNNEL te" ; "ROCK TUNNEL."
	cont "verkennen." ;
	done

CamperDeanBeatenText:
	text "Wauw! Gevaarlijk," ; "Whoa! Danger, man."
	line "man." ;
	done

CamperDeanAfterBattleText:
	text "Mijn #MON" ; "My #MON were"
	line "waren gewond" ; "hurt before even"

	para "zelfs voordat" ; "entering ROCK"
	line "ik de ROTSTUNNEL" ; "TUNNEL."

	para "in ging. Ik moet" ; "I'd better take"
	line "ze meteen naar" ; "them to a #MON"
	cont "een #MONCENTRUM" ; "CENTER right away."
	cont "brengen." ;
	done

PicnickerHeidiSeenText:
	text "Ben je ooit wezen" ; "Have you ever been"
	line "picknicken?" ; "to a picnic?"

	para "Dat is zo leuk om" ; "They're so much"
	line "te doen!" ; "fun!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "We bakken een" ; "We bake lots of"
	line "hoop lekkernijen" ; "goodies and share"

	para "en delen ze met" ; "them all around."
	line "iedereen. Zo" ; "They're delicious!"
	cont "lekker!" ;
	done

CamperSidSeenText:
	text "Hé, jij! Ruim je" ; "Hey, you!"
	line "afval op!" ; "Don't litter!"
	done

CamperSidBeatenText:
	text "Ik zei het" ; "I was just point-"
	line "alleen maar…" ; "ing out…"
	done

CamperSidAfterBattleText:
	text "Sorry. Je gooide" ; "Sorry. You weren't"
	line "geen afval weg." ; "littering. It was"
	cont "Mijn fout." ; "my mistake."
	done

PicnickerEdnaSeenText:
	text "Mensen moeten" ; "People shouldn't"
	line "geen afval" ; "leave any litter"
	cont "achterlaten." ; "behind."
	done

PicnickerEdnaBeatenText:
	text "Ohh… Ik heb" ; "Ohh… I lost…"
	line "verloren…" ;
	done

PicnickerEdnaAfterBattleText:
	text "Zuinig zijn met" ; "Conserving energy"
	line "energie is belang-" ; "is important, but"

	para "rijk, maar het" ; "the environment is"
	line "milieu is nog" ; "even more vital."
	cont "essentiëler." ;
	done

HikerTimSeenText:
	text "Ze komt van de" ; "She'll be coming"
	line "ZILVERBERG af," ; "'round MT.SILVER"
	cont "ja ze komt…" ; "when she comes…"

	para "ZILVERBERG is" ; "MT.SILVER is in"
	line "in JOHTO, toch?" ; "JOHTO, right?"
	done

HikerTimBeatenText:
	text "Ik was te druk" ; "I was too busy"
	line "met zingen…" ; "singing…"
	done

HikerTimAfterBattleText:
	text "Vechten draait om" ; "Battles are about"
	line "concentratie." ; "concentration."
	done

HikerSidneySeenText:
	text "Ik zal je een" ; "I'll tell you a"
	line "geheimpje" ; "secret."
	cont "vertellen." ;

	para "Maar eerst" ; "But first, we"
	line "vechten we!" ; "battle!"
	done

HikerSidneyBeatenText:
	text "Oh, verdorie!" ; "Oh, dang!"
	line "Verloren…" ; "I lost that…"
	done

HikerSidneyAfterBattleText:
	text "De ENERGIECENTRALE" ; "The POWER PLANT is"
	line "is aan de overkant" ; "across a small"
	cont "van een rivier." ; "river."
	done

Route9SignText:
	text "ROUTE 9"

	para "CERULEAN CITY -"
	line "ROTSTUNNEL" ; "ROCK TUNNEL"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	def_object_events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
