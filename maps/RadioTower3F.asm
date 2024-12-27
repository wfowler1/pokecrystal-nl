	object_const_def
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUIDE
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RadioTower3FCardKeyShutterCallback

RadioTower3FCardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	endcallback

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	endcallback

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuideText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuideText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext RadioTower3FCooltrainerFItsSunnyDayText
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	refreshmap
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "We hebben opnames" ; "We have recordings"
	line "van geluiden van" ; "of the cries of"

	para "alle #MON die" ; "all #MON that"
	line "ontdekt zijn." ; "have been found."

	para "We hebben er" ; "We must have about"
	line "ongeveer 200." ; "200 kinds."
	done

RadioTower3FGymGuideText_Rockets:
	text "Voor trainers" ; "To trainers, #-"
	line "zijn #MON hun" ; "MON are their"
	cont "geliefde partners." ; "beloved partners."

	para "Het is vreselijk" ; "It's terrible how"
	line "hoe TEAM ROCKET" ; "TEAM ROCKET is"

	para "over #MON pro-" ; "trying to control"
	line "beert te heersen." ; "#MON."
	done

RadioTower3FGymGuideText:
	text "We ploeteren 24" ; "We run 24 hours a"
	line "uur per dag om" ; "day to broadcast"

	para "leuke programma's" ; "entertaining pro-"
	line "uit te zenden." ; "grams."

	para "Ik doe m'n best" ; "I'll do my best to"
	line "om ook de klok" ; "run around the"
	cont "rond te maken!" ; "clock too!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "De baas van TEAM" ; "The TEAM ROCKET"
	line "ROCKET heeft zich-" ; "boss has locked"
	cont "zelf opgesloten." ; "himself in."

	para "Maar de DIRECTEUR" ; "But the DIRECTOR"
	line "kan 't openen." ; "can open it."

	para "Hij is boven," ; "He's up on the"
	line "op de vijfde." ; "fifth floor."

	para "Red hem," ; "Please save him!"
	line "alsjeblieft!" ; 
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "Is de DIRECTEUR" ; "Is the DIRECTOR"
	line "veilig?" ; "safe?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "Dank je!" ; "Thank you!"
	line "Je bent m'n held!" ; "You're my hero!"

	para "Hier is een teken" ; "This is a token of"
	line "van mijn dank." ; "my appreciation."
	done

RadioTower3FCooltrainerFItsSunnyDayText:
	text "Da's ZONNIGE DAG." ; "It's SUNNY DAY."
	line "Het maakt vuur-" ; "It powers up fire-"
	cont "type aanvallen" ; "type moves for a"
	cont "tijdelijk sterker." ; "while."
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "Je was gewoon" ; "You were simply"
	line "fantastisch!" ; "marvelous!"
	done

GruntM7SeenText:
	text "Ik heb strenge" ; "I've been given"
	line "orders gekregen." ; "strict orders."

	para "Ik moet ieder die" ; "I'm to crush any-"
	line "TEAM ROCKET uit-" ; "one who challenges"
	cont "daagt verpulveren!" ; "TEAM ROCKET!"
	done

GruntM7BeatenText:
	text "Wat?!" ; "What?!"
	done

GruntM7AfterBattleText:
	text "Ik heb gefaald in" ; "I failed in my"
	line "mijn plichten…" ; "duties…"

	para "Ik zal hierdoor" ; "I'll be docked pay"
	line "minder loon" ; "for this…"
	cont "krijgen…" ;
	done

GruntM8SeenText:
	text "Het voelt top" ; "It feels great"
	line "#MON te bevelen" ; "ordering #MON"
	cont "om misdaad te" ; "to commit crimes."
	cont "plegen." ;
	done

GruntM8BeatenText:
	text "Dit meen je niet!" ; "You're kidding!"
	done

GruntM8AfterBattleText:
	text "Ik voel me beroerd" ; "I feel lousy over"
	line "over verliezen!" ; "losing!"

	para "Verdorie! Ik haat" ; "Darn it! I hate"
	line "nutteloze #MON!" ; "useless #MON!"
	done

GruntM9SeenText:
	text "Waarom ging het" ; "Why did the shut-"
	line "luik open? Heb" ; "ter open? Did you"

	para "jij daar iets" ; "have something to"
	line "mee te maken?" ; "do with this?"
	done

GruntM9BeatenText:
	text "Ik ben er geweest!" ; "I'm done for!"
	done

GruntM9AfterBattleText:
	text "Wat?! Je bent" ; "What?! You made it"
	line "voorbij onze" ; "past our men in"
	cont "troepen in het" ; "the UNDERGROUND?"

	para "ONDERGRONDSE ge-" ; "How could you?"
	line "komen? Hoe dan?" ;
	done

ScientistMarcSeenText:
	text "Een onbekend kind" ; "An unknown child"
	line "die hier rond-" ; "wandering here?"
	cont "dwaalt?" ;

	para "Wie ben je?" ; "Who are you?"
	done

ScientistMarcBeatenText:
	text "Tss! Ik heb je" ; "Tch! I took you"
	line "onderschat!" ; "too lightly!"
	done

ScientistMarcAfterBattleText:
	text "Bwahahaha…" ; "Bwahahaha…"

	para "Ik kan een sterk" ; "I can transmit as"
	line "signaal zenden" ; "strong a signal as"
	cont "vanuit hier." ; "I need from here."
	done

RadioTower3FCardKeySlotText:
	text "Het is het" ; "It's the CARD KEY"
	line "SLEUTELKAART-gat." ; "slot."
	done

InsertedTheCardKeyText:
	text "<PLAYER> stak de" ; "<PLAYER> inserted"
	line "SLEUTELKAART erin." ; "the CARD KEY."
	done

RadioTower3FPersonnelSignText:
	text "2V PERSONEEL" ; "3F PERSONNEL"
	done

RadioTower3FPokemonMusicSignText:
	text "#MONMUZIEK met" ; "#MON MUSIC with"
	line "Gastheer DJ BEN" ; "Host DJ BEN"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
