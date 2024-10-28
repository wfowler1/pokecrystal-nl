	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsYoungerSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsYoungerSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsYoungerSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsYoungerSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsYoungerSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillTakeThisEeveeText:
	text "BILL: He, <PLAYER>!" ; "BILL: Hi, <PLAYER>!"
	line "Wil je deze EEVEE" ; "Do us a favor and"
	cont "overnemen?" ; "take this EEVEE."

	para "Hij kwam aan toen" ; "It came over when"
	line "ik de TIJDCAPSULE" ; "I was adjusting"
	cont "bijstelde." ; "the TIME CAPSULE."

	para "Iemand moet ervoor" ; "Someone has to"
	line "zorgen, maar ik" ; "take care of it,"

	para "ga niet graag naar" ; "but I don't like"
	line "buiten toe." ; "being outside."

	para "Kan ik op jou" ; "Can I count on you"
	line "rekenen ermee te" ; "to play with it,"
	cont "spelen, <PLAYER>?" ; "<PLAYER>?"
	done

BillImCountingOnYouText:
	text "BILL: Ik wist dat" ; "BILL: I knew you'd"
	line "je ja zou zeggen!" ; "come through!"

	para "Goed zo! Jij bent" ; "Way to go! You're"
	line "het echte werk!" ; "the real deal!"

	para "OK, ik reken" ; "OK, I'm counting"
	line "op jou." ; "on you."

	para "Pas er goed" ; "Take good care of"
	line "op!" ; "it!"
	done

ReceivedEeveeText:
	text "<PLAYER> ontvangt" ; "<PLAYER> received"
	line "EEVEE!" ; "EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: PROF.ELM" ; "BILL: PROF.ELM"
	line "claimt dat EEVEE" ; "claims EEVEE may"

	para "op nieuwe manieren" ; "evolve in new and"
	line "evoluren kan." ; "unknown ways."
	done

BillPartyFullText:
	text "Ho, wacht eens. Je" ; "Whoa, wait. You"
	line "kan niet meer" ; "can't carry any"
	cont "#MON meenemen." ; "more #MON."
	done

BillNoEeveeText:
	text "Oh… En wat" ; "Oh… Now what to"
	line "nu dan?" ; "do?"
	done

BillPopWontWorkText:
	text "BILL: Mijn pa, hij" ; "BILL: My pop, he"
	line "wil niet werken." ; "won't work. All he"

	para "Hij zit de hele" ; "does is goof off"
	line "dag te niksen." ; "all day long."

	para "Ik krijg er echt" ; "He's getting to be"
	line "hoofdpijn van…" ; "a real headache…"
	done

BillsMomText_BeforeEcruteak:
	text "Oh, je verzamelt" ; "Oh, you collect"
	line "#MON? Mijn zoon" ; "#MON? My son"
	cont "BILL is expert." ; "BILL is an expert."

	para "Hij is net opge-" ; "He just got called"
	line "roepen naar het" ; "to the #MON"

	para "#MONCENTRUM in" ; "CENTER in ECRUTEAK"
	line "ECRUTEAK CITY." ; "CITY."

	para "Mijn man is net" ; "My husband went"
	line "naar de SPELHOEK" ; "off to the GAME"

	para "vertrokken zonder" ; "CORNER without"
	line "te zijn gebeld…" ; "being called…"
	done

BillsMomText_AfterEcruteak:
	text "Mijn man stond" ; "My husband was"
	line "ooit bekend als" ; "once known as a"

	para "een #MANIAK." ; "#MANIAC."
	line "Dat heeft BILL" ; "BILL must have"

	para "vast van zijn" ; "taken after his"
	line "vader." ; "father."
	done

BillsYoungerSisterUsefulNumberText:
	text "Je bent trainer?" ; "Are you a trainer?"

	para "Hier, een nuttig" ; "I've got a useful"
	line "telefoonnummer" ; "phone number for"
	cont "voor je." ; "you."
	done

RecordedBillsNumberText:
	text "<PLAYER> slaat" ; "<PLAYER> recorded"
	line "BILL's nummer op." ; "BILL's number."
	done

BillsYoungerSisterRefusedNumberText:
	text "Mijn broer heeft" ; "My brother made"
	line "de PC-#MON-" ; "the PC #MON"
	cont "opslag bedacht." ; "storage system."

	para "Ik wilde je" ; "I was going to"
	line "BILL's nummer" ; "give you BILL's"
	cont "geven…" ; "number…"
	done

BillsYoungerSisterPhoneFullText:
	text "Je kan niet meer" ; "You can't record"
	line "nummers opslaan." ; "any more numbers."
	done

BillsYoungerSisterStorageSystemText:
	text "Mijn grote broer" ; "My big brother"
	line "BILL bedacht het" ; "BILL made the PC"

	para "#MON-opslag" ; "#MON storage"
	line "-systeem." ; "system."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsYoungerSisterScript, -1
