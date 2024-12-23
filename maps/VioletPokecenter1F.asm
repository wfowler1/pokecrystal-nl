	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "EI@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>, lang" ; "<PLAY_G>, long"
	line "niet gezien." ; "time, no see."

	para "PROF.ELM vroeg of" ; "PROF.ELM asked me"
	line "ik je kon vinden." ; "to find you."

	para "Hij wil je om nog" ; "He has another"
	line "een gunst vragen." ; "favor to ask."

	para "Wil je passen op" ; "Would you take the"
	line "het #MON-EI?" ; "#MON EGG?"
	done

VioletPokecenterElmsAideGiveEggText:
	text "We ontdekten dat" ; "We discovered that"
	line "een #MON pas" ; "a #MON will not"

	para "uit een EI komt" ; "hatch until it"
	line "als het groeit." ; "grows in the EGG."

	para "Dat gebeurt alleen" ; "It also has to be"
	line "in de buurt van" ; "with other active"
	cont "andere #MON." ; "#MON to hatch."

	para "<PLAY_G>, jij" ; "<PLAY_G>, you're"
	line "bent de enige op" ; "the only person"
	cont "wie we aan kunnen." ; "we can rely on."

	para "Bel alsjeblieft" ; "Please call PROF."
	line "PROF.ELM als het" ; "ELM when that EGG"
	cont "EI uitkomt!" ; "hatches!"
	done

VioletCityElmsAideFullPartyText:
	text "Oh, nee. Je kunt" ; "Oh, no. You can't"
	line "niet meer #MON" ; "carry any more"
	cont "meedragen." ; "#MON with you."

	para "Ik wacht hier wel" ; "I'll wait here"
	line "terwijl je ruimte" ; "while you make"
	cont "maakt voor het EI." ; "room for the EGG."
	done

VioletPokecenterElmsAideRefuseText:
	text "M-maar… PROF.ELM" ; "B-but… PROF.ELM"
	line "vroeg om jou…" ; "asked for you…"
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, neem je" ; "<PLAY_G>, will you"
	line "het EI mee?" ; "take the EGG?"
	done

VioletPokecenterFarawayLinkText: ; unreferenced
	text "Ik zat te denken" ; "I've been thinking"
	line "hoe leuk het zou" ; "it'd be great to"

	para "zijn om te linken" ; "be able to link up"
	line "en vechten met m'n" ; "and battle with my"

	para "vrienden die ver" ; "friends who live"
	line "weg wonen." ; "far away."
	done

VioletPokecenterMobileAdapterText: ; unreferenced
	text "Ik vocht net tegen" ; "I just battled a"
	line "een vriend in" ; "friend in CIANWOOD"
	cont "CIANWOOD via link." ; "over a link."

	para "als je een MOBIELE" ; "If you connect a"
	line "ADAPTER verbindt," ; "MOBILE ADAPTER,"

	para "kun je met vriend-" ; "you can link with"
	line "en van ver linken." ; "a friend far away."
	done

VioletPokecenter1FGameboyKidText:
	text "Ene BILL bouwde" ; "A guy named BILL"
	line "het #MON-PC-" ; "made the #MON"
	cont "opslagsysteem." ; "PC storage system."
	done

VioletPokecenter1FGentlemanText:
	text "Het was zo'n drie" ; "It was around"
	line "jaar geleden." ; "three years ago."

	para "TEAM ROCKET had" ; "TEAM ROCKET was up"
	line "iets kwaads in de" ; "to no good with"
	cont "zin met #MON." ; "#MON."

	para "Maar het kwam goed" ; "But justice pre-"
	line "toen een jonge" ; "vailed--a young"
	cont "knaap ze versloeg." ; "versloeg ze." ; "kid broke 'em up."
	done

VioletPokecenter1FYoungsterText:
	text "#MON zijn slim." ; "#MON are smart."
	line "Ze luisteren niet" ; "They won't obey a"

	para "als ze de trainer" ; "trainer they don't"
	line "niet respecteren." ; "respect."

	para "Zonder de juiste" ; "Without the right"
	line "GYMBADGES, doen ze" ; "GYM BADGES, they"

	para "gewoon wat ze" ; "will just do as"
	line "willen." ; "they please."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
