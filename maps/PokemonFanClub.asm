	object_const_def
	const POKEMONFANCLUB_CHAIRMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_CLEFAIRY_GUY
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeechButBagFull:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext PokemonFanClubChairmanItsARareCandyText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue .MetCopycat
	waitbutton
	closetext
	end

.MetCopycat:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	giveitem LOST_ITEM
	iffalse .NoRoom
	disappear POKEMONFANCLUB_FAIRY
	writetext PokemonFanClubPlayerReceivedDollText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

.GotLostItem:
	writetext PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PokemonFanClubClefairyGuyPackIsJammedFullText
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext PokemonFanClubClefairyDollText

PokemonFanClubBayleefScript:
	opentext
	writetext PokemonFanClubBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Ik ben de VOOR-" ; "I'm the CHAIRMAN"
	line "ZITTER van de" ; "of the #MON FAN"
	cont "#MON-FANCLUB." ; "CLUB."

	para "Ik heb meer dan" ; "I've raised over"
	line "150 #MON" ; "150 #MON."

	para "opgevoed. Ik ben" ; "I'm very fussy"
	line "erg kieskeurig" ; "when it comes to"
	cont "met #MON." ; "#MON."

	para "Ben je op bezoek" ; "Did you visit just"
	line "om over mijn" ; "to hear about my"
	cont "#MON te horen?" ; "#MON?"
	done

PokemonFanClubChairmanRapidashText:
	text "Goed!" ; "Good!"
	line "Luister maar!" ; "Then listen up!"

	para "Dus… m'n favoriete" ; "So… my favorite"
	line "GALLOPAARD…"

	para "Het is… schattig…" ; "It… cute… lovely…"
	line "lief… slim…" ; "smart… unbearably…"
	cont "onweerstaanbaar…" ; "plus… amazing… oh…"
	cont "plus… geweldig…" ; "you think so?…"
	cont "oh… denk je?…" ; "Too much… wild…"
	cont "Te veel… wild…" ; "beautiful… kindly…"
	cont "mooi… aardig…" ; "love it!"
	cont "Ik hou er van!" ;

	para "Knuffel 't… als…" ; "Hug it… when…"
	line "slapend… warm en" ; "sleeping… warm and"
	cont "knuffelig… Oh," ; "cuddly… Oh, and…"
	cont "en… spectaculair…" ; "spectacular…"
	cont "betoverend… gewoon" ; "ravishing… simply"
	cont "goddelijk…" ; "divine…"
	cont "Oeps! Zie de" ; "Oops! Look at the"
	cont "tijd! Ik hou je" ; "time! I've kept"
	cont "te lang vast!" ; "you too long!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Bedankt dat je me" ; "Thanks for hearing"
	line "aanhoorde. Ik wil" ; "me out. I want you"
	cont "je dit geven!" ; "to have this!"
	done

PokemonFanClubChairmanItsARareCandyText:
	text "Het is een UNIEK" ; "It's a RARE CANDY"
	line "SNOEP dat #MON" ; "that makes #MON"
	cont "sterker maakt." ; "stronger."

	para "Ik maak mijn #-" ; "I prefer making my"
	line "MON liever sterker" ; "#MON stronger"

	para "door te vechten," ; "by battling, so"
	line "dus 't is van jou." ; "you can have it."
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "Hallo, <PLAY_G>!" ; "Hello, <PLAY_G>!"

	para "Kom je me weer" ; "Did you come see"
	line "voor m'n #MON" ; "me about my #-"
	cont "zien?" ; "MON again?"

	para "Niet? Oh… Ik had" ; "No? Oh… I had more"
	line "nog meer verhalen…" ; "tales to tell…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Wat jammer…" ; "How disappointing…"

	para "Kom terug als je" ; "Come back if you"
	line "wil luisteren." ; "want to listen."
	done

PokemonFanClubReceptionistText:
	text "Onze VOORZITTER" ; "Our CHAIRMAN is"
	line "is zeer mondig" ; "very vocal when it"
	cont "over #MON…" ; "comes to #MON…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "Ik hou van de" ; "I love the way"
	line "manier waarop" ; "CLEFAIRY waggles"

	para "CLEFEE hun" ; "its finger when"
	line "vingers wiebelen" ; "it's trying to use"

	para "als ze METRONOOM" ; "METRONOME."
	line "gebruiken. Zo" ; "It's so adorable!"
	cont "schattig!" ;
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Ik hou van" ; "I love CLEFAIRY,"
	line "CLEFEE, maar ik" ; "but I could never"

	para "kon er nooit een" ; "catch one. So I'm"
	line "vangen. Dus ik" ; "making do with a"

	para "doe het maar met" ; "# DOLL that I"
	line "een #POP die" ; "found."
	cont "ik heb gevonden." ;
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Oh, ik snap 't nu." ; "Oh, I see now. The"
	line "Het meisje die de" ; "girl who lost this"

	para "#POP kwijt is," ; "# DOLL is sad…"
	line "is verdrietig…" ;

	para "Oké. Kun je deze" ; "OK. Could you take"
	line "#POP terug naar" ; "this # DOLL"

	para "dat arme kleine" ; "back to that poor"
	line "meisje brengen?" ; "little girl?"

	para "Ik zal op een dag" ; "I'll befriend a"
	line "vrienden worden" ; "real CLEFAIRY on"

	para "met een echte" ; "my own one day."
	line "CLEFEE. Geen" ; "No worries!"
	cont "zorgen!" ;
	done

PokemonFanClubPlayerReceivedDollText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "#POP." ; "# DOLL."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "Je zal zien. Ik" ; "You watch. I'm"
	line "ga een echte" ; "going to get a"

	para "CLEFEE als m'n" ; "real CLEFAIRY as"
	line "vriend krijgen!" ; "my friend."
	done

PokemonFanClubClefairyGuyPackIsJammedFullText:
	text "Je TAS zit" ; "Your PACK is"
	line "ramvol." ; "jammed full."
	done

PokemonFanClubTeacherText:
	text "Kijk mijn lieve" ; "Look at my darling"
	line "BAYLEEF!"

	para "Het blad op de" ; "The leaf on its"
	line "kop is zo leuk!" ; "head is so cute!"
	done

PokemonFanClubClefairyDollText:
	text "'Tis een CLEFEE!" ; "It's a CLEFAIRY!"
	line "Huh?"

	para "Oh, oké. Het is" ; "Oh, right. It's a"
	line "een CLEFEE-" ; "CLEFAIRY #"
	cont "#POP." ; "DOLL."
	done

PokemonFanClubBayleefText:
	text "BAYLEEF: Li liif!"
	done

PokemonFanClubListenSignText:
	text "Laten we beleefd" ; "Let's all listen"
	line "luisteren naar" ; "politely to other"
	cont "andere trainers." ; "trainers."
	done

PokemonFanClubBraggingSignText:
	text "Als iemand" ; "If someone brags,"
	line "opschept, doe het" ; "brag right back!"
	cont "terug!" ;
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	def_object_events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_BAYLEEF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBayleefScript, -1
