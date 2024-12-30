	object_const_def
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19FuchsiaGateOfficerText_RocksCleared
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "De vulkaan van" ; "CINNABAR's volcano"
	line "CINNABAR is uit-" ; "erupted."
	cont "gebarsten." ;

	para "Er slingerden" ; "It hurled boulders"
	line "rotsen die ROUTE" ; "that cut off ROUTE"
	cont "19 voor onbepaalde" ; "19 indefinitely."
	cont "tijd blokkeren." ;

	para "Ik vraag me af of" ; "I wonder if the"
	line "de mensen van" ; "people of CINNABAR"
	cont "CINNABAR veilig" ; "are safe…"
	cont "zijn…" ;
	done

Route19FuchsiaGateOfficerText_RocksCleared:
	text "CINNABAR-inwoners" ; "No CINNABAR citi-"
	line "bleven ongedeerd" ; "zens were injured"

	para "bij de uitbarst-" ; "by the eruption."
	line "ing. Dat is fijn!" ; "That's great!"
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, FUCHSIA_CITY, 10
	warp_event  5,  0, FUCHSIA_CITY, 11
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
