	object_const_def
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign: ; unreferenced
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_LakeOfRageHistory:
	text "MEER VAN RAZERNIJ" ; "LAKE OF RAGE is"
	line "is een krater ooit" ; "actually a crater"

	para "gemaakt door" ; "made by rampaging"
	line "woeste GYARADOS." ; "GYARADOS."

	para "De krater vulde" ; "The crater filled"
	line "met regenwater" ; "up with rainwater"

	para "en zo vormde het" ; "and the LAKE was"
	line "MEER." ; "formed."

	para "Dat verhaal werd" ; "That's the story"
	line "al verteld aan" ; "passed on from my"

	para "mijn opa's over-" ; "Grandpa's great-"
	line "over-grootvader." ; "great-grandpa."

	para "Vroeger kon je" ; "It used to be that"
	line "daar levendige" ; "you could catch"

	para "MAGIKARP vangen," ; "lively MAGIKARP"
	line "maar nu…" ; "there, but…"

	para "Ik snap er echt" ; "I don't understand"
	line "niks van." ; "what's happening."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Het meer is vreemd" ; "The LAKE hasn't"
	line "geworden nadat die" ; "been normal since"

	para "zwartgeklede" ; "those men wearing"
	line "mannen kwamen." ; "black arrived."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "MEER VAN RAZERNIJ" ; "LAKE OF RAGE is"
	line "is weer normaal." ; "back to normal."

	para "De MAGIKARP zijn" ; "The MAGIKARP have"
	line "teruggekeerd." ; "returned."

	para "Misschien zie ik" ; "I may yet realize"
	line "op een dag toch" ; "my dream of see-"
	cont "nog 's werelds'" ; "ing the world's"
	cont "grootste MAGIKARP." ; "largest MAGIKARP."

	para "Heb je een HENGEL?" ; "Do you have a ROD?"
	line "Zo ja, help me dan" ; "Please help me if"
	cont "alsjeblieft." ; "you do."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, je hebt een" ; "Ah, you have a"
	line "MAGIKARP! Eens" ; "MAGIKARP! Let's"

	para "zien hoe groot dit" ; "see how big that"
	line "schatje is." ; "baby is."
	done

MagikarpLengthRaterText_Memento:
	text "Wauw! Deze is" ; "Wow! This one is"
	line "uitmuntend!" ; "outstanding!"

	para "Mijn complimenten" ; "I tip my hat to"
	line "voor de vangst!" ; "you!"

	para "Neem dit als een" ; "Take this as a"
	line "aandenken!" ; "memento!"
	done

MagikarpLengthRaterText_Bonus:
	text "Het record is het" ; "The record is the"
	line "belangrijkst." ; "important thing."

	para "Zie dat maar als" ; "Think of that as"
	line "een bonus!" ; "a bonus!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wauw! Deze is" ; "Wow! This one is"
	line "uitmuntend!" ; "outstanding!"

	para "…Dat zou ik graag" ; "…I wish I could"
	line "nu zeggen, maar ik" ; "say that, but I've"

	para "heb wel eens" ; "seen a bigger one"
	line "groter gezien." ; "before."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Wat? Dat is geen" ; "What? That's not a"
	line "MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… Je hebt nog" ; "Oh… So you didn't"
	line "niet eentje die" ; "get one good"

	para "goed genoeg is?" ; "enough to show me?"
	line "Volgende keer…" ; "Maybe next time."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "HUIDIG RECORD" ; "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer3 ; MaxLength 5
	text " gevangen" ; " caught by"
	line "door @" ; "@"
	text_ram wStringBuffer4 ; MaxLength MaxTrainerNameLength
	text_end

LakeOfRageMagikarpHouseUnusedDummyText: ; unreferenced
	text_end

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
