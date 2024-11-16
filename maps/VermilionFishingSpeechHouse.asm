	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Ik ben de VIS-" ; "I am the FISHING"
	line "VENT, de oudste" ; "DUDE, the elder of"
	cont "van de VISBROERS." ; "the FISHING BROS."

	para "Heb je de VIS-" ; "Have you met the"
	line "GOEROE ontmoet bij" ; "FISHING GURU at"
	cont "MEER VAN RAZERNIJ?" ; "LAKE OF RAGE?"

	para "Zijn droom is om" ; "He dreams about"
	line "'s werelds grootste" ; "seeing the world's"
	cont "MAGIKARP te zien." ; "greatest MAGIKARP."

	para "Wil je hem alle" ; "If you don't mind,"
	line "MAGIKARP laten zien" ; "could you show him"

	para "die je vangt?" ; "any MAGIKARP you"
	line "Wie weet, mogelijk" ; "catch?"

	para "vang je wel de" ; "Who knows, you may"
	line "MAGIKARP van zijn" ; "catch the MAGIKARP"
	cont "dromen." ; "of his dreams."
	done

FishingDudesHousePhotoText:
	text "Het is een foto" ; "It's a photo of"
	line "van wat vissers…" ; "people fishing…"

	para "Ze hebben het naar" ; "They're having a"
	line "hun zin…" ; "great time…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
