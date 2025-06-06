	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "Ik ben FALKNER, de" ; "I'm FALKNER, the"
	line "#MON-GYMLEIDER" ; "VIOLET #MON GYM"
	cont "van VIOLET CITY!" ; "leader!"

	para "Men zegt dat je de" ; "People say you can"
	line "vleugels van een" ; "clip flying-type"

	para "vlieg-#MON kunt" ; "#MON's wings"
	line "knippen met" ; "with a jolt of"
	cont "elektriciteit…" ; "electricity…"

	para "Zulke beledigingen" ; "I won't allow such"
	line "van vogel-#MON" ; "insults to bird"
	cont "sta ik niet toe!" ; "#MON!"

	para "Ik toon je de ware" ; "I'll show you the"
	line "kracht van mijn" ; "real power of the"

	para "fenomenale vogel-" ; "magnificent bird"
	line "#MON!"
	done

FalknerWinLossText:
	text "…Verdraaid! Mijn" ; "…Darn! My dad's"
	line "vaders gekoesterde" ; "cherished bird"
	cont "vogel-#MON…" ; "#MON…"

	para "Goed dan." ; "All right."
	line "Neem dit." ; "Take this."

	para "Het is de ZEFIER-" ; "It's the official"
	line "BADGE van de" ; "#MON LEAGUE"
	cont "#MONLEAGUE." ; "ZEPHYRBADGE."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "ZEFIERBADGE."
	done

FalknerZephyrBadgeText:
	text "De ZEFIERBADGE" ; "ZEPHYRBADGE"
	line "verhoogt de aanval" ; "raises the attack"
	cont "van #MON." ; "power of #MON."

	para "Het laat #MON" ; "It also enables"
	line "ook FLITS" ; "#MON to use"

	para "gebruiken, mits ze" ; "FLASH, if they"
	line "het hebben." ; "have it, anytime."

	para "Hier--neem ook" ; "Here--take this"
	line "dit." ; "too."
	done

FalknerTMMudSlapText:
	text "Gebruik een TM om" ; "By using a TM, a"
	line "een #MON meteen" ; "#MON will"

	para "een nieuwe aanval" ; "instantly learn a"
	line "te leren." ; "new move."

	para "Maar wees voor-" ; "Think before you"
	line "zichtig--een TM" ; "act--a TM can be"
	cont "werkt één keer." ; "used only once."

	para "TM31 bevat" ; "TM31 contains"
	line "MODDERSCHOT." ; "MUD-SLAP."

	para "Het verlaagt de" ; "It reduces the"
	line "precisie van je" ; "enemy's accuracy"

	para "vijand terwijl het" ; "while it causes"
	line "schade doet." ; "damage."

	para "Kort gezegd, het" ; "In other words, it"
	line "is een aanval die" ; "is both defensive"
	cont "ook verdedigt." ; "and offensive."
	done

FalknerFightDoneText:
	text "Er zijn #MON-" ; "There are #MON"
	line "GYMS in steden en" ; "GYMS in cities and"
	cont "dorpen verderop." ; "towns ahead."

	para "Probeer je vaar-" ; "You should test"
	line "digheden in deze" ; "your skills at"
	cont "GYMS testen." ; "these GYMS."

	para "Ik ga harder" ; "I'm going to train"
	line "trainer om de" ; "harder to become"

	para "beste vogelmeester" ; "the greatest bird"
	line "te worden!" ; "master!"
	done

BirdKeeperRodSeenText:
	text "Het belangrijkste" ; "The keyword is"
	line "woord is lef!" ; "guts!"

	para "Ieder hier traint" ; "Those here are"
	line "dag en nacht om" ; "training night and"

	para "meester van vogel-" ; "day to become bird"
	line "#MON te worden." ; "#MON masters."

	para "Kom maar op!" ; "Come on!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "FALKNER is het" ; "FALKNER's skills"
	line "echte werk!" ; "are for real!"

	para "Ga niet naast je" ; "Don't get cocky"
	line "schoenen lopen" ; "just because you"
	cont "omdat je net won!" ; "beat me!"
	done

BirdKeeperAbeSeenText:
	text "Laat eens zien of" ; "Let me see if you"
	line "je goed genoeg" ; "are good enough to"
	cont "bent voor FALKNER!" ; "face FALKNER!"
	done

BirdKeeperAbeBeatenText:
	text "Dit kan niet" ; "This can't be"
	line "waar zijn!" ; "true!"
	done

BirdKeeperAbeAfterBattleText:
	text "Wat gênant om te" ; "This is pathetic,"
	line "verliezen van een" ; "losing to some"
	cont "groentje…" ; "rookie trainer…"
	done

VioletGymGuideText:
	text "He! Ik ben geen" ; "Hey! I'm no train-"
	line "trainer maar kan" ; "er but I can give"
	cont "je advies geven!" ; "some advice!"

	para "Geloof mij maar!" ; "Believe me!"
	line "Als je gelooft," ; "If you believe, a"

	para "kunnen kampioens-" ; "championship dream"
	line "dromen uitkomen." ; "can come true."

	para "Heb je vertrouwen?" ; "You believe?"
	line "Luister dan." ; "Then listen."

	para "Gras-types zijn" ; "The grass-type is"
	line "zwak tegen vlieg-" ; "weak against the"

	para "types. Onthoud dat" ; "flying-type. Keep"
	line "goed." ; "this in mind."
	done

VioletGymGuideWinText:
	text "Goed gevecht! Ga" ; "Nice battle! Keep"
	line "zo door en je" ; "it up, and you'll"

	para "wordt in no-time" ; "be the CHAMP in no"
	line "de KAMPIOEN!" ; "time at all!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
