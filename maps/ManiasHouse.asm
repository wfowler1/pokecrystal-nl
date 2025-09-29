	object_const_def
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnShuckie
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .nothingleft
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_ShuckleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_ShuckleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft ; unreferenced
	writetext ManiaText_ShuckleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

ManiaText_AskLookAfterShuckle:
	text "Ik ben geschokt!" ; "I, I'm in shock!"

	para "Een jongen van" ; "A guy about your"
	line "jouw leeftijd met" ; "age with piercing"

	para "indringende ogen" ; "eyes and long hair"
	line "en lang haar liep" ; "came in."
	cont "naar binnen."

	para "Ik schrok zo, dat" ; "He scared me into"
	line "ik hem mijn beste" ; "giving him my"
	cont "#MON gaf!" ; "prized #MON!"

	para "Ik heb nog één" ; "I still have one"
	line "over, maar wat als" ; "left, but what if"
	cont "hij terugkomt?" ; "he comes back?"

	para "Jij ziet er sterk" ; "You look strong."
	line "uit. Kun jij even" ; "Could you look"

	para "op mijn #MON" ; "after my #MON"
	line "letten?" ; "for a while?"
	done

ManiaText_TakeCareOfShuckle:
	text "Oh, dankjewel!" ; "Oh, thank you!"

	para "Pas er alsjeblieft" ; "Take good care of"
	line "goed op!" ; "it, please!"
	done

ManiaText_GotShuckle:
	text "<PLAYER> ontving" ; "<PLAYER> received a"
	line "een #MON." ; "#MON."
	done

ManiaText_PartyFull:
	text "Je #MON-team" ; "Your #MON party"
	line "zit vol." ; "is full."
	done

ManiaText_IfHeComesBack:
	text "Oh nee… Wat doe ik" ; "Oh, no… What'll"
	line "als hij later" ; "I do if he comes"
	cont "terugkomt?" ; "back?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Hoi! Hoe is het" ; "Hi! How's my #-"
	line "met mijn #MON?" ; "MON?"

	para "Ik denk dat ik nu" ; "I think I'm safe"
	line "veilig ben, mag ik" ; "now, so may I have"
	cont "het terug?" ; "it back?"
	done

ManiaText_ThankYou:
	text "Dankjewel!" ; "Thank you!"
	done

ManiaText_ShuckleNotThere:
	text "He, je hebt mijn" ; "Hey, you don't"
	line "#MON niet in je" ; "have my #MON"
	cont "team." ; "with you."
	done

ManiaText_ShuckleLikesYou:
	text "M'n #MON begint" ; "My #MON has"
	line "je leuk te vinden." ; "come to like you."

	para "Oké, zorg jij er" ; "All right, you"
	line "maar goed voor." ; "should keep it."

	para "Zolang je er goed" ; "But promise to"
	line "op past!" ; "be good to it!"
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, nee, nee… Nu" ; "Oh, no, no… That's"
	line "ben ik alsnog" ; "the same as being"
	cont "beroofd." ; "robbed."
	done

ManiaText_HappinessSpeech:
	text "#MON zijn het" ; "For #MON, hap-"
	line "gelukkigst met" ; "piness is being"

	para "iemand die goed" ; "with a person who"
	line "voor ze zorgt." ; "treats them well."
	done

ManiaText_ShuckleIsYourLastMon:
	text "Als ik de #MON" ; "If I take my #-"
	line "terugneem, waar" ; "MON back, what are"

	para "ga jij dan mee" ; "you going to use"
	line "vechten?" ; "in battle?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
