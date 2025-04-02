	object_const_def
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	def_scene_scripts

	def_callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd PictureBookshelfScript

WardensGranddaughterText1:
	text "Mijn opa is de" ; "My grandpa is the"
	line "SAFARIZONE-" ; "SAFARI ZONE WAR-"
	cont "BOSWACHTER." ; "DEN."

	para "Tenminste, dat" ; "At least he was…"
	line "was hij…" ;

	para "Hij besloot op" ; "He decided to go"
	line "vakantie te gaan" ; "on a vacation and"

	para "en vertrok alleen" ; "took off overseas"
	line "overzee." ; "all by himself."

	para "Zo stopte hij" ; "He quit running"
	line "zomaar met de" ; "SAFARI ZONE just"
	cont "SAFARIZONE." ; "like that."
	done

WardensGranddaughterText2:
	text "Veel mensen waren" ; "Many people were"
	line "teleurgesteld dat" ; "disappointed that"

	para "SAFARIZONE dicht-" ; "SAFARI ZONE closed"
	line "ging, maar Opa" ; "down, but Grandpa"
	cont "is zo koppig…" ; "is so stubborn…"
	done

WardenPhotoText:
	text "Het is een foto" ; "It's a photo of a"
	line "van een lachende" ; "grinning old man"

	para "oude man omringd" ; "who's surrounded"
	line "door #MON." ; "by #MON."
	done

SafariZonePhotoText:
	text "Het is een foto" ; "It's a photo of a"
	line "van een groot" ; "huge grassy plain"

	para "grasveld waarop" ; "with rare #MON"
	line "zeldzame #MON" ; "frolicking in it."
	cont "huppelen." ;
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	def_object_events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
