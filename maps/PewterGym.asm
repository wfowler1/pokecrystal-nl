	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUIDE

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetext PewterGymGuideText
	waitbutton
	closetext
	end

.PewterGymGuideWinScript:
	writetext PewterGymGuideWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

BrockIntroText:
	text "BROCK: Wauw, we" ; "BROCK: Wow, it's"
	line "krijgen niet vaak" ; "not often that we"

	para "een uitdager uit" ; "get a challenger"
	line "JOHTO." ; "from JOHTO."

	para "Ik ben BROCK, de" ; "I'm BROCK, the"
	line "PEWTER-GYMLEIDER." ; "PEWTER GYM LEADER."

	para "Ik ben een expert" ; "I'm an expert on"
	line "in steentype-" ; "rock-type #MON."
	cont "#MON." ;

	para "Mijn #MON zijn" ; "My #MON are im-"
	line "niet vatbaar voor" ; "pervious to most"

	para "de meeste fysieke" ; "physical attacks."
	line "aanvallen. Je zal" ; "You'll have a hard"

	para "het lastig hebben" ; "time inflicting"
	line "om schade te doen." ; "any damage."

	para "Kom maar op!" ; "Come on!"
	done

BrockWinLossText:
	text "BROCK: De sterke" ; "BROCK: Your #-"
	line "aanvallen van je" ; "MON's powerful at-"
	cont "#MON overwonnen" ; "tacks overcame my"
	cont "mijn steenharde" ; "rock-hard defense…"
	cont "verdediging…" ;

	para "Je bent sterker" ; "You're stronger"
	line "dan ik dacht…" ; "than I expected…"

	para "Ga je gang--neem" ; "Go ahead--take"
	line "deze BADGE." ; "this BADGE."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "ROTSBADGE." ; "BOULDERBADGE."
	done

BrockBoulderBadgeText:
	text "BROCK: <PLAY_G>,"
	line "dank je. Ik ge-" ; "thanks. I enjoyed"

	para "noot van ons ge-" ; "battling you, even"
	line "vecht, hoewel ik" ; "though I am a bit"
	cont "een beetje van" ; "upset."
	cont "slag ben." ;

	para "Die ROTSBADGE zal" ; "That BOULDERBADGE"
	line "je #MON nog" ; "will make your"

	para "krachtiger" ; "#MON even more"
	line "maken." ; "powerful."
	done

BrockFightDoneText:
	text "BROCK: De wereld" ; "BROCK: The world"
	line "is reusachtig. Er" ; "is huge. There are"

	para "zijn nog veel" ; "still many strong"
	line "sterke trainers" ; "trainers like you."
	cont "als jij." ;

	para "Wacht maar." ; "Just wait and see."
	line "Ik ga ook een" ; "I'm going to be-"
	cont "stuk sterker" ; "come a lot strong-"
	cont "worden." ; "er too."
	done

CamperJerrySeenText:
	text "De trainers van" ; "The trainers of"
	line "deze GYM gebruiken" ; "this GYM use rock-"
	cont "rotstype-#MON." ; "type #MON."

	para "Het rotstype" ; "The rock-type has"
	line "heeft hoge" ; "high DEFENSE."
	cont "AFWEER." ;

	para "Gevechten kunnen" ; "Battles could end"
	line "wellicht lang" ; "up going a long"

	para "duren. Ben je" ; "time. Are you"
	line "hier klaar voor?" ; "ready for this?"
	done

CamperJerryBeatenText:
	text "Ik moet deze ge-" ; "I have to win"
	line "vechten winnen…" ; "these battles…"
	done

CamperJerryAfterBattleText:
	text "Hé jij! Trainer" ; "Hey, you! Trainer"
	line "uit JOHTO! BROCK" ; "from JOHTO! BROCK"

	para "is pittig. Hij" ; "is tough. He'll"
	line "zal je straffen" ; "punish you if you"

	para "als je hem niet" ; "don't take him"
	line "serieus neemt." ; "seriously."
	done

PewterGymGuideText:
	text "Yo! KAMPIOEN" ; "Yo! CHAMP in"
	line "in het verschiet!" ; "making! You're"

	para "Je bent steengoed." ; "really rocking."
	line "Neem je het op" ; "Are you battling"

	para "tegen GYMLEIDERS" ; "the GYM LEADERS of"
	line "van KANTO?" ; "KANTO?"

	para "Ze zijn sterke en" ; "They're strong and"
	line "toegewijde mensen," ; "dedicated people,"

	para "net als JOHTO's" ; "just like JOHTO's"
	line "GYMLEIDERS." ; "GYM LEADERS."
	done

PewterGymGuideWinText:
	text "Yo! KAMPIOEN" ; "Yo! CHAMP in"
	line "in het verschiet!" ; "making! That GYM"

	para "Die GYM gaf je" ; "didn't give you"
	line "niet veel" ; "much trouble."

	para "problemen. Hoe je" ; "The way you took"
	line "de leiding nam was" ; "charge was really"

	para "erg inspirerend." ; "inspiring. I mean"
	line "Ik meen het." ; "that seriously."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
