	object_const_def
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	def_scene_scripts
	scene_script WiseTriosRoomNoop1Scene, SCENE_WISETRIOSROOM_SAGE_BLOCKS
	scene_script WiseTriosRoomNoop2Scene, SCENE_WISETRIOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomWiseTrioCallback

WiseTriosRoomNoop1Scene:
	end

WiseTriosRoomNoop2Scene:
	end

WiseTriosRoomWiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, WiseTriosRoomSageBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, WiseTriosRoomSageReturnsMovement
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, WiseTriosRoomSageAllowsPassageMovement
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_WISETRIOSROOM_NOOP
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

WiseTriosRoomSageBlocksPlayerMovement:
	step LEFT
	step LEFT
	step_end

WiseTriosRoomSageReturnsMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSageAllowsPassageMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Verbluffend…" ; "Astounding…"

	para "SUICUNE, ENTEI en" ; "SUICUNE, ENTEI and"
	line "RAIKOU zijn ein-" ; "RAIKOU have arisen"
	cont "delijk ontwaakt…" ; "from their sleep…"

	para "Komt de legende" ; "Is the legend"
	line "echt uit?" ; "coming true?"
	done

WiseTriosRoomSage2Text:
	text "We trainen bij de" ; "We train at the"
	line "VERBRANDE TOREN, maar" ; "BURNED TOWER, but"

	para "hebben nog nooit" "we've never heard"
	line "gehoord dat er" ; "of a hole opening"

	para "zomaar een gat" ; "up there before."
	line "opende. Dat heeft" ; "It must have been"

	para "vast iemand expres" ; "deliberately made"
	line "gedaan." ; "by someone."
	done

WiseTriosRoomSage3BlocksExitText:
	text "Met de GYMBADGE" ; "TIN TOWER may be"
	line "van ECRUTEAK mag" ; "entered by those"

	para "je de TINTOREN" ; "bearing ECRUTEAK's"
	line "betreden." ; "GYM BADGE."

	para "Echter, nu" ; "However, now that"
	line "SUICUNE, RAIKOU" ; "SUICUNE, RAIKOU"

	para "en ENTEI zijn" ; "and ENTEI have"
	line "herrezen, wil ik" ; "arisen, I ask you"

	para "je vragen buiten" ; "to refrain from"
	line "te blijven." ; "entering!"
	done

WiseTriosRoomSage3Text:
	text "Wij, het WIJZE" ; "We, the WISE TRIO,"
	line "TRIO, beschermen" ; "are the protectors"

	para "deze legendarische" ; "of the legendary"
	line "#MON." ; "#MON."
	done

SageGakuSeenText:
	text "Volgens de legen-" ; "Legend has it that"
	line "des zal er een" ; "upon the emergence"

	para "trainer opstaan die" ; "of a trainer who"
	line "de zielen van" ; "has the ability to"

	para "#MON kan raken." ; "touch the souls of"
	line "Een #MON zal" ; "#MON, a #MON"

	para "dan tevoorschijn" ; "will come forth to"
	line "komen om deze" ; "put that trainer"

	para "trainer te testen" ; "to test at the TIN"
	line "bij de TINTOREN." ; "TOWER."

	para "De legenden" ; "The legend has"
	line "zijn waar!" ; "come true!"

	para "De legendarische" ; "The legendary"
	line "#MON SUICUNE" ; "#MON SUICUNE"
	cont "is verschenen!" ; "has arrived!"

	para "Wij, het WIJZE" ; "We, the WISE TRIO,"
	line "TRIO, zullen je" ; "shall test your"

	para "waardigheid op de" ; "worthiness to go"
	line "proef stellen!" ; "inside!"
	done

SageGakuBeatenText:
	text "Sterker dan we" ; "Stronger than we"
	line "dachten? Wellicht…" ; "thought? Perhaps…"
	done

SageGakuAfterBattleText:
	text "Ah, dus jij bent" ; "Ah, so it is you"
	line "degene die een" ; "who claim to have"

	para "slapende SUICUNE," ; "seen SUICUNE,"
	line "ENTEI en RAIKO ge-" ; "ENTEI and RAIKOU"
	cont "zien heeft?" ; "while they slept?"

	para "Echt niet!" ; "Unbelievable!"

	para "De legendes zeggen" ; "Legend has it that"
	line "dat ze onzichtbaar" ; "they can't be seen"
	cont "zijn, al slapende…" ; "while they sleep…"
	done

SageMasaSeenText:
	text "Kun jij de waar-" ; "Can you be trusted"
	line "heid aan?" ; "with the truth?"

	para "Ik moet je waar-" ; "I must ascertain"
	line "digheid testen." ; "your worthiness."
	done

SageMasaBeatenText:
	text "…Ik zal je de" ; "…I will tell you"
	line "waarheid zeggen…" ; "the truth…"
	done

SageMasaAfterBattleText:
	text "Vroeger waren hier" ; "In the past, there"
	line "twee torens met" ; "were two nine-tier"
	cont "negen lagen." ; "towers here."

	para "De KOPERTOREN," ; "The BRASS TOWER,"
	line "die de #MON zou" ; "which was said to"

	para "ontwaken, en de" ; "awaken #MON,"
	line "TINTOREN, waar" ; "and the TIN TOWER,"

	para "#MON zouden" ; "where #MON were"
	line "rusten." ; "said to rest."

	para "Het uitzicht van-" ; "The view from the"
	line "af die TORENS moet" ; "tops of the TOWERS"

	para "schitterend ge-" ; "must have been"
	line "weest zijn." ; "magnificent."

	para "Men zegt dat er" ; "At the time, an"
	line "toen een enorme," ; "immense, silver-"

	para "zilveren #MON" ; "colored #MON"
	line "zijn nest had" ; "was said to make"

	para "bovenop de" ; "its roost atop the"
	line "KOPERTOREN." ; "BRASS TOWER."

	para "Echter…" ; "However…"

	para "150 jaar geleden" ; "About 150 years"
	line "sloeg de bliksem" ; "ago, a lightning"

	para "in bij een van" ; "bolt struck one of"
	line "de TORENS." ; "the TOWERS."

	para "Het vuur woedde" ; "It was engulfed in"
	line "maar liefst drie" ; "flames that raged"
	cont "dagen lang." ; "for three days."

	para "Tot een stortbui" ; "A sudden downpour"
	line "ineens de vlammen" ; "finally put out"
	cont "doofde." ; "the blaze."

	para "De VERBRANDE TOREN" ; "And that is how"
	line "hebben we daaraan" ; "the BURNED TOWER"
	cont "overgehouden." ; "came to be."
	done

SageKojiSeenText:
	text "Laat me zien hoe" ; "Let me see your"
	line "sterk je bent!" ; "power!"
	done

SageKojiBeatenText:
	text "Te sterk!" ; "Too strong!"
	line "Waarom?" ; "Why?"
	done

SageKojiAfterBattleQuestionText:
	text "Jij… Ben jij de" ; "You… Are you the"
	line "trainer waarop de" ; "trainer who is"

	para "legendarische" ; "awaited by the"
	line "#MON wachten?" ; "legendary #MON?"
	done

SageKojiAfterBattleSpeechText:
	text "Vandaar…" ; "I see…"

	para "Wij, het WIJZE" ; "We, the WISE TRIO,"
	line "TRIO, zijn ver-" ; "have been given "

	para "antwoordelijk voor" ; "the responsibility"
	line "het beschermen van" ; "of protecting the"

	para "de legendarische" ; "legendary #MON."
	line "#MON. Alleen" ; "We are to allow"

	para "wie de kracht" ; "passage only to"
	line "en ziel van de" ; "those people who"

	para "waarheid kennen," ; "ziel en "possess the power"
	line "mogen toetreden." ; "and soul of truth."

	para "Alsjeblieft, ga " ; "Please, do go on"
	line "verder en betreed" ; "and enter the TIN"
	cont "de TINTOREN." ; "TOWER ahead."

	para "SUICUNE zal je op" ; "SUICUNE will put"
	line "de proef stellen." ; "you to the test."
	done

SageKojiAfterBattleFinalText:
	text "Je mag doorgaan." ; "Please, do go on."

	para "SUICUNE zal je op" ; "SUICUNE will put"
	line "de proef stellen." ; "you to the test."
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	def_coord_events
	coord_event  7,  4, SCENE_WISETRIOSROOM_SAGE_BLOCKS, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
