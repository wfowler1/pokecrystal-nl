	object_const_def
	const DANCETHEATER_KIMONO_GIRL1
	const DANCETHEATER_KIMONO_GIRL2
	const DANCETHEATER_KIMONO_GIRL3
	const DANCETHEATER_KIMONO_GIRL4
	const DANCETHEATER_KIMONO_GIRL5
	const DANCETHEATER_GENTLEMAN
	const DANCETHEATER_RHYDON
	const DANCETHEATER_COOLTRAINER_M
	const DANCETHEATER_GRANNY

DanceTheater_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheaterCooltrainerMScript:
	jumptextfaceplayer DanceTheaterCooltrainerMText

DanceTheaterGrannyScript:
	jumptextfaceplayer DanceTheaterGrannyText

DanceTheaterFancyPanel:
	jumptext DanceTheaterFancyPanelText

KimonoGirlNaokoSeenText:
	text "Je hebt mooie" ; "You have lovely"
	line "#MON. Mag ik ze" ; "#MON. May I see"
	cont "in gevecht zien?" ; "them in battle?"
	done

KimonoGirlNaokoBeatenText:
	text "Oh, je bent" ; "Oh, you are very"
	line "erg sterk." ; "strong."
	done

KimonoGirlNaokoAfterBattleText:
	text "Ik genoot van dat" ; "I enjoyed that"
	line "gevecht. Ik wil je" ; "bout. I would like"
	cont "graag weer zien." ; "to see you again."
	done

KimonoGirlSayoSeenText:
	text "Ik dans altijd" ; "I always dance"
	line "met mijn #MON." ; "with my #MON."

	para "Ik train ze" ; "Of course, I also"
	line "natuurlijk ook." ; "train them."
	done

KimonoGirlSayoBeatenText:
	text "Oh, bijna!" ; "Oh, so close!"
	line "Ik had je bijna." ; "I almost had you."
	done

KimonoGirlSayoAfterBattleText:
	text "Ritme is belang-" ; "Rhythm is impor-"
	line "rijk voor zowel" ; "tant for both"

	para "dansen als" ; "dancing and #-"
	line "#MON." ; "MON."
	done

KimonoGirlZukiSeenText:
	text "Vind je mijn" ; "Isn't my barrette"
	line "haarspeld mooi?" ; "pretty?"

	para "Oh, een #MON-" ; "Oh. A #MON"
	line "gevecht?" ; "battle?"
	done

KimonoGirlZukiBeatenText:
	text "Ik heb geen" ; "I don't have any"
	line "#MON over…" ; "#MON left…"
	done

KimonoGirlZukiAfterBattleText:
	text "Ik stop elke maand" ; "I put a different"
	line "een nieuwe bloem" ; "flower in my bar-"
	cont "in mijn haarspeld." ; "rette every month."
	done

KimonoGirlKuniSeenText:
	text "Aw, je bent een" ; "Oh, you're a cute"
	line "schattige trainer." ; "trainer. Would you"
	cont "Wil je vechten?" ; "like to battle?"
	done

KimonoGirlKuniBeatenText:
	text "Je bent sterker" ; "You're stronger"
	line "dan je eruit ziet." ; "than you look."
	done

KimonoGirlKuniAfterBattleText:
	text "Ik heb veel ge-" ; "I trained a lot,"
	line "traind dus ik" ; "so I thought I was"

	para "dacht dat ik een" ; "a capable trainer."
	line "goede trainer was." ; "I guess I'm not."
	cont "Blijkbaar niet." ; 
	done

KimonoGirlMikiSeenText:
	text "Hou je van mijn" ; "Do you like my"
	line "dans? Ik ben ook" ; "dancing? I'm good"
	cont "goed met #MON." ; "at #MON too."
	done

KimonoGirlMikiBeatenText:
	text "Ooh, jij bent ook" ; "Ooh, you're good"
	line "goed met #MON." ; "at #MON too."
	done

KimonoGirlMikiAfterBattleText:
	text "Ik blijf dansen" ; "I can keep dancing"
	line "want er zijn men-" ; "because there are"

	para "sen die ervan" ; "people who enjoy"
	line "genieten." ; "what I do."

	para "Mijn #MON mo-" ; "My #MON keep my"
	line "tiveren me ook." ; "spirits up too."
	done

SurfGuyNeverLeftAScratchText:
	text "De KIMONO-MEIDEN" ; "Not only are the"
	line "zijn niet alleen" ; "KIMONO GIRLS great"

	para "geweldige dansers," ; "dancers, they're"
	line "maar ook goed" ; "also skilled at"
	cont "met #MON." ; "#MON."

	para "Ik daag ze" ; "I always challenge"
	line "altijd uit, maar" ; "them, but I've"

	para "heb zelfs nooit" ; "never even left a"
	line "een krasje achter-" ; "scratch…"
	cont "gelaten…" ; 
	done

SurfGuyLadGiftText:
	text "Jochie! Als je" ; "Lad! If you can"
	line "alle KIMONO-MEIDEN" ; "defeat all the"

	para "kan verslaan," ; "KIMONO GIRLS, I'll"
	line "geef ik je iets." ; "give you a gift."
	done

SurfGuyLassieGiftText:
	text "Meissie, als je" ; "Lassie, if you can"
	line "alle KIMONO-MEIDEN" ; "defeat all the"

	para "kan verslaan," ; "KIMONO GIRLS, I'll"
	line "geef ik je iets." ; "give you a gift."
	done

SurfGuyLikeADanceText:
	text "De manier waarop" ; "The way you bat-"
	line "je vocht was als" ; "tled, it was like"
	cont "kijken naar dans." ; "watching a dance."

	para "Het was een" ; "It was a rare"
	line "waar cadeau!" ; "treat to see!"

	para "Ik wil je dit" ; "I want you to have"
	line "geven. Geen zorgen" ; "this. Don't worry"
	cont "--neem het!" ; "--take it!"
	done

SurfGuySurfExplanationText:
	text "Dat is SURF." ; "That's SURF."

	para "Een aanval die" ; "It's a move that"
	line "#MON over" ; "lets #MON swim"
	cont "water laat" ; "across water."
	cont "zwemmen." ;
	done

SurfGuyElegantKimonoGirlsText:
	text "Ik wou dat mijn" ; "I wish my #MON"
	line "#MON zo elegant" ; "were as elegant as"
	cont "waren als de" ; "the KIMONO GIRLS…"
	cont "KIMONO-MEIDEN…" ;
	done

RhydonText:
	text "RHYDON: Grugoh" ; "RHYDON: Gugooh"
	line "grugoooh!" ; "gugogooh!"
	done

DanceTheaterCooltrainerMText:
	text "Die man is altijd" ; "That man's always"
	line "bij zijn RHYDON." ; "with his RHYDON."

	para "Zegt dat ie een" ; "Says he wants a"
	line "#MON wil die" ; "#MON that can"
	cont "SURFt en danst." ; "SURF and dance."

	para "Probeert ie een" ; "Is he trying to"
	line "synchroon-" ; "make a synchro-"
	cont "zwemmende" ; "nized swimming"
	cont "#MON te maken?" ; "#MON?"
	done

DanceTheaterGrannyText:
	text "De KIMONO-MEIDEN" ; "The KIMONO GIRLS"
	line "zijn zo knap…" ; "are so beautiful…"

	para "Maar ze onder-" ; "But they have to"
	line "gaan een strenge" ; "go through rigor-"
	cont "training." ; "ous training."

	para "En ze moeten leren" ; "And they have to"
	line "om tradities te" ; "learn to follow"

	para "volgen voordat ze" ; "customs before ap-"
	line "in het openbaar" ; "pearing in public."
	cont "verschijnen." ;

	para "Maar als je" ; "But if you love"
	line "ergens van houdt," ; "something, any-"
	cont "is alles mogelijk." ; "thing is possible."
	done

DanceTheaterFancyPanelText:
	text "Het is een luxe" ; "It's a fancy panel"
	line "bord dat is ver-" ; "that's decorated"
	cont "sierd met bloemen." ; "with flowers."
	done

DanceTheater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, DanceTheaterFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheaterFancyPanel

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheaterCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterGrannyScript, -1
