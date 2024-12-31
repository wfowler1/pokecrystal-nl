	object_const_def
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Route19ClearRocksCallback

Route19ClearRocksCallback:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	endcallback

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "Heb je ooit" ; "Have you ever gone"
	line "'s nachts in de" ; "swimming in the"
	cont "zee gezwommen?" ; "sea at night?"
	done

SwimmermHaroldBeatenText:
	text "Blub…" ; "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "'s Nachts is de" ; "At night, the sea"
	line "zee superdonker." ; "turns black. It"

	para "Haast alsof het" ; "feels like it will"
	line "je gaat opslokken." ; "swallow you up."
	done

SwimmermTuckerSeenText:
	text "Hijg, Hijg…" ; "Pant, pant…"
	line "Nog… een klein…" ; "Just… a little…"

	para "stukje… naar…" ; "farther… to…"
	line "FUCHSIA…" ; "FUCHSIA…"
	done

SwimmermTuckerBeatenText:
	text "Ik verdrink!" ; "I'm drowning!"
	done

SwimmermTuckerAfterBattleText:
	text "Ik… wilde met mijn" ; "I… asked my girl-"
	line "vriendin naar" ; "friend to swim to"
	cont "FUCHSIA zwemmen…" ; "FUCHSIA… Gasp…"
	done

SwimmerfDawnSeenText:
	text "Ik heb een hekel" ; "I'm disgusted by"
	line "aan watjes!" ; "wimpy people!"
	done

SwimmerfDawnBeatenText:
	text "Met zwemmen zou ik" ; "I could beat you"
	line "je verslaan…" ; "at swimming…"
	done

SwimmerfDawnAfterBattleText:
	text "Het is maar kort" ; "It's a quick swim"
	line "zwemmen tussen" ; "between FUCHSIA"

	para "FUCHSIA en de ZEE-" ; "and SEAFOAM IS-"
	line "SCHUIM-EILANDEN…" ; "LANDS…"

	para "Tjee, m'n vriendje" ; "Sheesh, some big"
	line "valt door de mand." ; "man my boyfriend"

	para "Wat een watje!" ; "is! What a wimp!"
	done

SwimmermJeromeSeenText:
	text "Zwemmen?" ; "Swimming?"
	line "Kan ik niks van." ; "I'm lousy at it."

	para "Ik spetter maar" ; I'm just splashing"
	line "wat rond in het" ; "around in these"
	cont "ondiepe water." ; "shallow waters."
	done

SwimmermJeromeBeatenText:
	text "Ik dacht dat ik" ; "I thought I could"
	line "kon winnen." ; "win."
	done

SwimmermJeromeAfterBattleText:
	text "Ik hou van de zee," ; "I might be bad at"
	line "ook al ben ik" ; "swimming, but I"
	cont "slecht in zwemmen." ; "love the sea."
	done

Route19Fisher1Text:
	text "Sorry. Deze weg" ; "Sorry. This road"
	line "is gesloten wegens" ; "is closed for"
	cont "onderhoud." ; "construction."

	para "Ga zuidwaarts via" ; "If you want to get"
	line "PALLET TOWN als" ; "to CINNABAR, you'd"

	para "je naar CINNABAR" ; "beter zuidwaarts" ; "better go south"
	line "toe wil gaan." ; "from PALLET TOWN."
	done

Route19Fisher1Text_RocksCleared:
	text "Ik zweet helemaal." ; "I'm all sweaty."
	line "Snel even zwemmen!" ; "Time for a swim!"
	done

Route19Fisher2Text:
	text "Wie weet wanneer" ; "Who knows how long"
	line "deze rots ooit" ; "it would take to"
	cont "verplaatst wordt…" ; "move this boulder…"
	done

Route19Fisher2Text_RocksCleared:
	text "De wegwerkzaam-" ; "The roadwork is"
	line "heden zijn klaar." ; "finally finished."

	para "Eindelijk kan ik" ; "Now I can go"
	line "weer vissen." ; "fishing again."
	done

Route19SignText:
	text "ROUTE 19" ; "ROUTE 19"

	para "FUCHSIA CITY -" ; "FUCHSIA CITY -"
	line "ZEESCHUIM-EILANDEN" ; "SEAFOAM ISLANDS"
	done

CarefulSwimmingSignText:
	text "Wees alsjeblieft" ; "Please be careful"
	line "voorzichtig als je" ; "if you are swim-"
	cont "naar de ZEESCHUIM-" ; "ming to SEAFOAM"
	cont "EILANDEN zwemt." ; "ISLANDS."

	para "FUCHSIA POLITIE" ; "FUCHSIA POLICE"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	def_object_events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
