	object_const_def
	const BILLSHOUSE_GRAMPS

BillsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsGrandpa:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext BillsGrandpaIntroText
	promptbutton
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlitheVulpix
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext BillsGrandpaLickitungText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LICKITUNG, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	sjump .ShowedLickitung

.GotEverstone:
	writetext BillsGrandpaOddishText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	sjump .ShowedOddish

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	sjump .ShowedStaryu

.GotWaterStone:
	checkver
	iftrue .AskVulpix
	writetext BillsGrandpaGrowlitheText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.AskVulpix:
	writetext BillsGrandpaVulpixText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal VULPIX, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.GotFireStone:
	writetext BillsGrandpaPichuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	sjump .ShowedPichu

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedOddish:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse .BagFull
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedGrowlitheVulpix:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedPichu:
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	promptbutton
	end

.SaidNo:
	writetext BillsGrandpaYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	promptbutton
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	promptbutton
	end

.JustShowedSomething:
	writetext BillsGrandpaComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext BillsGrandpaShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext BillsGrandpaWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

BillsGrandpaIntroText:
	text "Hm? Je kent BILL?" ; "Hm? You know BILL?"
	line "Hij is mijn klein-" ; "He's my grandson."

	para "zoon. Hij is in" ; "He's in JOHTO. He"
	line "JOHTO en doet wat" ; "does something"

	para "met PC's, dus ik" ; "with PCs, so I'm"
	line "pas op zijn huis." ; "house-sitting."
	done

BillsGrandpaAskToSeeMonText:
	text "Als je die #MON" ; "If you have that"
	line "hebt, mag ik 'm" ; "#MON, may I see"
	cont "dan eens zien?" ; "it, please?"
	done

BillsGrandpaExcitedToSeeText:
	text "Je laat het zien?" ; "You will show me?"
	line "Wat goed van je!" ; "How good of you!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "Je hebt het niet?" ; "You don't have it?"
	line "Dat is jammer…" ; "That's too bad…"
	done

BillsGrandpaShownPokemonText:
	text "Ah, dus dat is" ; "Ah, so that is"
	line "@" ; "@"
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text "?" ; "?"

	para "Wat schattig!" ; "Isn't it cute!"
	line "Heel erg aardig" ; "That's so kind of"
	cont "van je." ; "you."
	done

BillsGrandpaTokenOfAppreciationText:
	text "Bedankt!" ; "Thanks!"

	para "Hier, mijn blijk" ; "This is a token of"
	line "van waardering." ; "my appreciation."
	done

BillsGrandpaComeAgainText:
	text "Kom weer eens een" ; "Come visit again"
	line "keertje langs." ; "sometime."
	done

BillsGrandpaShownAllThePokemonText:
	text "Bedankt dat je mij" ; "Thanks for showing"
	line "zoveel schattige" ; "me so many cute"
	cont "#MON liet zien." ; "#MON."

	para "Ik amuseerde me" ; "I really enjoyed"
	line "enorm en ben blij" ; "myself. I'm glad"

	para "dat ik zo'n lang" ; "I've lived such a"
	line "leven heb gehad." ; "long life."
	done

BillsGrandpaWrongPokemonText:
	text "Hm?" ; "Hm?"

	para "Dat is niet de" ; "That's not the"
	line "#MON waarover" ; "#MON that I was"
	cont "ik verteld ben." ; "told about."
	done

BillsGrandpaLickitungText:
	text "Mijn kleinzoon" ; "My grandson BILL"
	line "BILL vertelde over" ; "told me about a"

	para "een #MON met" ; "#MON that has a"
	line "een lange tong." ; "long tongue."
	done

BillsGrandpaOddishText:
	text "Ah, mijn kleinzoon" ; "Ah, my grandson"
	line "had het over een" ;  "mentioned a round,"

	para "ronde, groene" ; "green #MON that"
	line "#MON met bla-" ; has leaves growing"
	cont "deren op de kop." ; "on its head."
	done

BillsGrandpaStaryuText:
	text "Ken jij een zee-" ; "Do you know of a"
	line "#MON met een" ; "sea #MON that"

	para "rode bol in" ; "has a red sphere"
	line "het lichaam?" ; "in its body?"

	para "Je weet wel, die" ; "You know, the one"
	line "in de vorm van" ; "that's shaped like"
	cont "een ster?" ; "a star?"

	para "Die verschijnt in" ; "I heard that it"
	line "de nacht, meen ik." ; "appears at night."

	para "Ik zou 't echt" ; "I would surely"
	line "graag willen zien." ; "like to see it."
	done

BillsGrandpaGrowlitheText:
	text "BILL vertelde me" ; "BILL told me about"
	line "over een #MON" ; "a #MON that is"

	para "die heel loyaal is" ; "very loyal to its"
	line "aan een trainer." ; "trainer."

	para "Hij zou ook" ; "It's supposed to"
	line "moeten BRULLEN." ; "ROAR well."
	done

BillsGrandpaVulpixText:
	text "Ik hoorde over een" ; "I heard about a"
	line "snoezige #MON" ; "cute #MON that"
	cont "met zes staarten." ; "has six tails."

	para "Zo'n schattige" ; "I would love to"
	line "#MON zou ik" ; "hug a cute #MON"
	cont "willen knuffelen." ; "like that."
	done

BillsGrandpaPichuText:
	text "Ken je die ene" ; "Do you know that"
	line "megapopulaire" ; "hugely popular"
	cont "#MON?" ; "#MON?"

	para "die #MON met" ; "The #MON that"
	line "een geel lichaam" ; "has a yellow body"
	cont "en rode wangen." ; "and red cheeks."

	para "Ik wil graag zien" ; "I would love to"
	line "hoe die eruit ziet" ; "see what it looks"

	para "voordat ie" ; "like before it"
	line "evolueert." ; "evolves."
	done

BillsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
