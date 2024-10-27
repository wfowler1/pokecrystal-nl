	object_const_def
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	promptbutton
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	sjump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText

GoldenrodHappinessRaterTwinScript:
	jumptextfaceplayer GoldenrodHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd DifficultBookshelfScript

HappinessRatersHouseRadio:
	jumpstd Radio2Script

GoldenrodHappinessRaterTeacherText:
	text "Als je #MON" ; "If you treat your"
	line "goed behandelt," ; "#MON nicely,"

	para "zullen ze van" ; "they will love you"
	line "je houden." ; "in return."

	para "Oh? Laat me kijken" ; "Oh? Let me see"
	line "naar @" ; "your @"
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text "…"
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "Het is heel" ; "It looks really"
	line "gelukkig! Het" ; "happy! It must"
	cont "houdt veel van je." ; "love you a lot."
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "Ik heb het gevoel" ; "I get the feeling"
	line "dat het je echt" ; "that it really"
	cont "vertrouwt." ; "trusts you."
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "Het is vriendelijk" ; "It's friendly to-"
	line "naar je. Het is" ; "ward you. It looks"
	cont "best gelukkig." ; "sort of happy."
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "Het is schattig." ; "It's quite cute."
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "Je moet het beter" ; "You should treat"
	line "behandelen. Het is" ; "it better. It's"
	cont "je niet gewend." ; "not used to you."
	done

GoldenrodHappinessRatingText_LooksMean:
	text "Het lijkt je niet" ; "It doesn't seem to"
	line "te mogen. Het ziet" ; "like you at all."
	cont "er gemeen uit." ; "It looks mean."
	done

GoldenrodHappinessRaterPokefanMText:
	text "Ik blijf maar" ; "I keep losing in"
	line "verliezen in" ; "battles, and my"

	para "gevechten, en" ; "#MON end up"
	line "mijn #MON" ; "fainting…"
	cont "vallen flauw…" ;

	para "Misschien mogen" ; "Maybe that's why"
	line "m'n #MON me" ; "my #MON don't"
	cont "daarom niet…" ; "like me much…"
	done

GoldenrodHappinessRaterTwinText:
	text "Als ik een voor-" ; "When I use an item"
	line "werp op m'n #-" ; "on my #MON, it"
	cont "MON gebruik, lijkt" ; "acts really glad!"
	cont "het erg blij!" ;
	done

GoldenrodHappinessRater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, HappinessRatersHouseRadio

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTwinScript, -1
