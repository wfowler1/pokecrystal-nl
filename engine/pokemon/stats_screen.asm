	const_def
	const PINK_PAGE   ; 0
	const GREEN_PAGE  ; 1
	const BLUE_PAGE   ; 2
	const ORANGE_PAGE ; 3
DEF NUM_STAT_PAGES EQU const_value

DEF STAT_PAGE_MASK EQU %00000011
	const_def 4
	const STATS_SCREEN_PLACE_FRONTPIC ; 4
	const STATS_SCREEN_ANIMATE_MON    ; 5
	const STATS_SCREEN_ANIMATE_EGG    ; 6

BattleStatsScreenInit:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, StatsScreenInit

	ld a, [wBattleMode]
	and a
	jr z, StatsScreenInit
	jr _MobileStatsScreenInit

StatsScreenInit:
	ld hl, StatsScreenMain
	jr StatsScreenInit_gotaddress

_MobileStatsScreenInit:
	ld hl, StatsScreenMobile
	jr StatsScreenInit_gotaddress

StatsScreenInit_gotaddress:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations
	ld a, [wBoxAlignment] ; whether sprite is to be mirrorred
	push af
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wStatsScreenFlags]
	ld c, a

	push bc
	push hl
	call ClearBGPalettes
	call ClearTilemap
	call UpdateSprites
	farcall StatsScreen_LoadFont
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTilemap
	pop bc

	; restore old values
	ld a, b
	ld [wJumptableIndex], a
	ld a, c
	ld [wStatsScreenFlags], a
	pop af
	ld [wBoxAlignment], a
	pop af
	ldh [hMapAnims], a
	ret

StatsScreenMain:
	xor a
	ld [wJumptableIndex], a
	ld [wStatsScreenFlags], a ; PINK_PAGE

.loop
	ld a, [wJumptableIndex]
	and ~(1 << 7)
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call StatsScreen_WaitAnim
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr z, .loop
	ret

StatsScreenMobile:
	xor a
	ld [wJumptableIndex], a
	ld [wStatsScreenFlags], a ; PINK_PAGE

.loop
	farcall Mobile_SetOverworldDelay
	ld a, [wJumptableIndex]
	and JUMPTABLE_INDEX_MASK
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call StatsScreen_WaitAnim
	farcall MobileComms_CheckInactivityTimer
	jr c, .exit
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr z, .loop

.exit
	ret

StatsScreenPointerTable:
	dw MonStatsInit       ; regular pokémon
	dw EggStatsInit       ; egg
	dw StatsScreenWaitCry
	dw EggStatsJoypad
	dw StatsScreen_LoadPage
	dw StatsScreenWaitCry
	dw MonStatsJoypad
	dw StatsScreen_Exit

StatsScreen_WaitAnim:
	ld hl, wStatsScreenFlags
	bit STATS_SCREEN_ANIMATE_EGG, [hl]
	jr nz, .try_anim
	bit STATS_SCREEN_ANIMATE_MON, [hl]
	jr nz, .finish
	call DelayFrame
	ret

.try_anim
	farcall SetUpPokeAnim
	jr nc, .finish
	ld hl, wStatsScreenFlags
	res STATS_SCREEN_ANIMATE_EGG, [hl]
.finish
	ld hl, wStatsScreenFlags
	res STATS_SCREEN_ANIMATE_MON, [hl]
	farcall HDMATransferTilemapToWRAMBank3
	ret

StatsScreen_SetJumptableIndex:
	ld a, [wJumptableIndex]
	and JUMPTABLE_EXIT
	or h
	ld [wJumptableIndex], a
	ret

StatsScreen_Exit:
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret

MonStatsInit:
	ld hl, wStatsScreenFlags
	res STATS_SCREEN_ANIMATE_EGG, [hl]
	call ClearBGPalettes
	call ClearTilemap
	farcall HDMATransferTilemapToWRAMBank3
	call StatsScreen_CopyToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call StatsScreen_InitUpperHalf
	ld hl, wStatsScreenFlags
	set STATS_SCREEN_PLACE_FRONTPIC, [hl]
	ld h, 4
	call StatsScreen_SetJumptableIndex
	ret

.egg
	ld h, 1
	call StatsScreen_SetJumptableIndex
	ret

EggStatsInit:
	call EggStatsScreen
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

EggStatsJoypad:
	call StatsScreen_GetJoypad
	jr nc, .check
	ld h, 0
	call StatsScreen_SetJumptableIndex
	ret

.check
	bit B_PAD_A, a
	jr nz, .quit
if DEF(_DEBUG)
	cp PAD_START
	jr z, .hatch
endc
	and PAD_DOWN | PAD_UP | PAD_A | PAD_B
	jp StatsScreen_JoypadAction

.quit
	ld h, 7
	call StatsScreen_SetJumptableIndex
	ret

if DEF(_DEBUG)
.hatch
	ld a, [wMonType]
	or a
	jr nz, .skip
	push bc
	push de
	push hl
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Happiness
	call AddNTimes
	ld [hl], 1
	ld a, 1
	ld [wTempMonHappiness], a
	ld a, 127
	ld [wStepCount], a
	ld de, .HatchSoonString
	hlcoord 8, 17
	call PlaceString
	ld hl, wStatsScreenFlags
	set STATS_SCREEN_ANIMATE_MON, [hl]
	pop hl
	pop de
	pop bc
.skip
	xor a
	jp StatsScreen_JoypadAction

.HatchSoonString:
	db "▶HATCH SOON!@"
endc

StatsScreen_LoadPage:
	call StatsScreen_LoadGFX
	ld hl, wStatsScreenFlags
	res STATS_SCREEN_PLACE_FRONTPIC, [hl]
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

MonStatsJoypad:
	call StatsScreen_GetJoypad
	jr nc, .next
	ld h, 0
	call StatsScreen_SetJumptableIndex
	ret

.next
	and PAD_CTRL_PAD | PAD_A | PAD_B
	jp StatsScreen_JoypadAction

StatsScreenWaitCry:
	call IsSFXPlaying
	ret nc
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

StatsScreen_CopyToTempMon:
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .not_tempmon
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBufferMon
	ld de, wTempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	jr .done

.not_tempmon
	farcall CopyMonToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .done
	ld a, [wMonType]
	cp BOXMON
	jr c, .done
	farcall CalcTempmonStats
.done
	and a
	ret

StatsScreen_GetJoypad:
	call GetJoypad
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .not_tempmon
	push hl
	push de
	push bc
	farcall StatsScreenDPad
	pop bc
	pop de
	pop hl
	ld a, [wMenuJoypad]
	and PAD_DOWN | PAD_UP
	jr nz, .set_carry
	ld a, [wMenuJoypad]
	jr .clear_carry

.not_tempmon
	ldh a, [hJoyPressed]
.clear_carry
	and a
	ret

.set_carry
	scf
	ret

StatsScreen_JoypadAction:
	push af
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	pop af
	bit B_PAD_B, a
	jp nz, .b_button
	bit B_PAD_LEFT, a
	jr nz, .d_left
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit B_PAD_A, a
	jr nz, .a_button
	bit B_PAD_UP, a
	jr nz, .d_up
	bit B_PAD_DOWN, a
	jr nz, .d_down
	jr .done

.d_down
	ld a, [wMonType]
	cp BOXMON
	jr nc, .done
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, .done
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.d_up
	ld a, [wCurPartyMon]
	and a
	jr z, .done
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.a_button
	ld a, c
	cp ORANGE_PAGE ; last page
	jr z, .b_button
.d_right
	inc c
	ld a, ORANGE_PAGE ; last page
	cp c
	jr nc, .set_page
	ld c, PINK_PAGE ; first page
	jr .set_page

.d_left
	ld a, c
	dec c
	and a ; cp PINK_PAGE ; first page
	jr nz, .set_page
	ld c, ORANGE_PAGE ; last page
	jr .set_page

.done
	ret

.set_page
	ld a, [wStatsScreenFlags]
	and ~STAT_PAGE_MASK
	or c
	ld [wStatsScreenFlags], a
	ld h, 4
	call StatsScreen_SetJumptableIndex
	ret

.load_mon
	ld h, 0
	call StatsScreen_SetJumptableIndex
	ret

.b_button
	ld h, 7
	call StatsScreen_SetJumptableIndex
	ret

StatsScreen_InitUpperHalf:
	call .PlaceHPBar
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wTextDecimalByte], a
	ld [wCurSpecies], a
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	hlcoord 10, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	ld de, wTextDecimalByte
	call PrintNum
	hlcoord 14, 0
	call PrintLevel
	ld hl, .NicknamePointers
	call GetNicknamePointer
	call CopyNickname
	hlcoord 8, 2
	call PlaceString
	hlcoord 18, 0
	call .PlaceGenderChar
	hlcoord 9, 4
	ld a, "/"
	ld [hli], a
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	call PlaceString
	call StatsScreen_PlaceHorizontalDivider
	call StatsScreen_PlacePageSwitchArrows
	call StatsScreen_PlaceShinyIcon
	ret

.PlaceHPBar:
	ld hl, wTempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	farcall ComputeHPBarPixels
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call DelayFrame
	ret

.PlaceGenderChar:
	push hl
	farcall GetGender
	pop hl
	ret c
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	ld [hl], a
	ret

.NicknamePointers:
	dw wPartyMonNicknames
	dw wOTPartyMonNicknames
	dw sBoxMonNicknames
	dw wBufferMonNickname

StatsScreen_PlaceVerticalDivider: ; unreferenced
; The Japanese stats screen has a vertical divider.
	hlcoord 7, 0
	ld bc, SCREEN_WIDTH
	ld d, SCREEN_HEIGHT
.loop
	ld a, $31 ; vertical divider
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ret

StatsScreen_PlaceHorizontalDivider:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $62 ; horizontal divider (empty HP/exp bar)
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

StatsScreen_PlacePageSwitchArrows:
	hlcoord 10, 6
	ld [hl], "◀"
	hlcoord 19, 6
	ld [hl], "▶"
	ret

StatsScreen_PlaceShinyIcon:
	ld bc, wTempMonDVs
	farcall CheckShininess
	ret nc
	hlcoord 19, 0
	ld [hl], "⁂"
	ret

StatsScreen_LoadGFX:
	ld a, [wBaseDexNo]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	xor a
	ldh [hBGMapMode], a
	call .ClearBox
	call .PageTilemap
	call .LoadPals
	ld hl, wStatsScreenFlags
	bit STATS_SCREEN_PLACE_FRONTPIC, [hl]
	jr nz, .place_frontpic
	call SetDefaultBGPAndOBP
	ret

.place_frontpic
	call StatsScreen_PlaceFrontpic
	ret

.ClearBox:
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	call StatsScreen_LoadPageIndicators
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	ret

.LoadPals:
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	farcall LoadStatsScreenPals
	call DelayFrame
	ld hl, wStatsScreenFlags
	set STATS_SCREEN_ANIMATE_MON, [hl]
	ret

.PageTilemap:
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
; entries correspond to *_PAGE constants
	table_width 2
	dw LoadPinkPage
	dw LoadGreenPage
	dw LoadBluePage
	dw LoadOrangePage
	assert_table_length NUM_STAT_PAGES

LoadPinkPage:
	hlcoord 0, 9
	ld b, $0
	predef DrawPlayerHP
	hlcoord 8, 9
	ld [hl], $41 ; right HP/exp bar end cap
	ld de, .Status_Type
	hlcoord 0, 12
	call PlaceString
	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .HasPokerus
	ld a, b
	and $f0
	jr z, .NotImmuneToPkrs
	hlcoord 8, 8
	ld [hl], "." ; Pokérus immunity dot
.NotImmuneToPkrs:
	ld a, [wMonType]
	cp BOXMON
	jr z, .StatusOK
	hlcoord 6, 13
	push hl
	ld de, wTempMonStatus
	predef PlaceStatusString
	pop hl
	jr nz, .done_status
	jr .StatusOK
.HasPokerus:
	ld de, .PkrsStr
	hlcoord 1, 13
	call PlaceString
	jr .done_status
.StatusOK:
	ld de, .OK_str
	call PlaceString
.done_status
	hlcoord 1, 15
	predef PrintMonTypes
	hlcoord 9, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	ld de, .ExpPointStr
	hlcoord 10, 8
	call PlaceString
	hlcoord 17, 13
	call .PrintNextLevel
	hlcoord 13, 9
	lb bc, 3, 7
	ld de, wTempMonExp
	call PrintNum
	call .CalcExpToNextLevel
	hlcoord 13, 12
	lb bc, 3, 7
	ld de, wExpToNextLevel
	call PrintNum
	ld de, .LevelUpStr
	hlcoord 10, 11
	call PlaceString
	ld de, .ToStr
	hlcoord 12, 13
	call PlaceString
	hlcoord 11, 14
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	predef FillInExpBar
	hlcoord 10, 14
	ld [hl], $40 ; left exp bar end cap
	hlcoord 19, 14
	ld [hl], $41 ; right exp bar end cap
	
	ld de, .HappinessStr
	hlcoord 10, 16
	call PlaceString
	ld a, [wTempMonHappiness]
	cp 0
	jr z, .HappinessZero
	hlcoord 15, 17
	ld [hl], "♥"
	cp 50
	jr c, .HappinessOne
	hlcoord 16, 17
	ld [hl], "♥"
	cp 100
	jr c, .HappinessTwo
	hlcoord 17, 17
	ld [hl], "♥"
	cp 150
	jr c, .HappinessThree
	hlcoord 18, 17
	ld [hl], "♥"
	cp $ff
	jr c, .HappinessFour
	hlcoord 19, 17
	ld [hl], "♥"
	ret
.HappinessZero
	hlcoord 15, 17
	ld [hl], "♦"
.HappinessOne
	hlcoord 16, 17
	ld [hl], "♦"
.HappinessTwo
	hlcoord 17, 17
	ld [hl], "♦"
.HappinessThree
	hlcoord 18, 17
	ld [hl], "♦"
.HappinessFour
	hlcoord 19, 17
	ld [hl], "♦"
	ret

.PrintNextLevel:
	ld a, [wTempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .AtMaxLevel
	inc a
	ld [wTempMonLevel], a
.AtMaxLevel:
	call PrintLevel
	pop af
	ld [wTempMonLevel], a
	ret

.CalcExpToNextLevel:
	ld a, [wTempMonLevel]
	cp MAX_LEVEL
	jr z, .AlreadyAtMaxLevel
	inc a
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wTempMonExp + 2
	ld hl, wTempMonExp + 2
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ld [wExpToNextLevel + 2], a
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec hl
	ld [wExpToNextLevel + 1], a
	ldh a, [hQuotient + 1]
	sbc [hl]
	ld [wExpToNextLevel], a
	ret

.AlreadyAtMaxLevel:
	ld hl, wExpToNextLevel
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.Status_Type:
	db   "STATUS/"
	next "TYPE/@"

.OK_str:
	db "OK @"

.ExpPointStr:
	db "ERV PUNTEN@" ; "EXP POINTS@"

.LevelUpStr:
	db "LVL OMHOOG@" ; "LEVEL UP@"

.ToStr:
	db "NAAR@" ; "TO@"

.PkrsStr:
	db "#RUS@"

.HappinessStr:
	db "BLIJDSCHAP@" ; "HAPPINESS@"

LoadGreenPage:
	ld de, .Item
	hlcoord 0, 8
	call PlaceString
	call .GetItemName
	hlcoord 8, 8
	call PlaceString
	ld de, .Move
	hlcoord 0, 10
	call PlaceString
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 8, 10
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef ListMoves
	hlcoord 12, 11
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef ListMovePP
	ret

.GetItemName:
	ld de, .ThreeDashes
	ld a, [wTempMonItem]
	and a
	ret z
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
	ret

.Item:
	db "VOORW.@" ; "ITEM@"

.ThreeDashes:
	db "---@"

.Move:
	db "AANVAL@" ; "MOVE@"

LoadBluePage:
	call .PlaceOTInfo
	ld de, MetAtMapString
	hlcoord 0, 11
	call PlaceString
	call .placeCaughtLevel
	call .placeCaughtLocationAndTime
	call .placeEggHatch
	hlcoord 10, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	hlcoord 11, 8
	ld bc, 6
	predef PrintTempMonStats
	ret

.PlaceOTInfo:
	ld de, OTString
	hlcoord 0, 8
	call PlaceString
	ld hl, .OTNamePointers
	call GetNicknamePointer
	call CopyNickname
	farcall CorrectNickErrors
	hlcoord 3, 8
	call PlaceString
	ld de, IDNoString
	hlcoord 0, 9
	call PlaceString
	hlcoord 3, 9
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, wTempMonID
	call PrintNum
	ld a, [wTempMonCaughtGender]
	and a
	jr z, .done
	cp $7f
	jr z, .done
	and CAUGHT_GENDER_MASK
	ld a, "♂"
	jr z, .got_gender
	ld a, "♀"
.got_gender
	hlcoord 9, 9
	ld [hl], a
.done
	ret

.OTNamePointers:
	dw wPartyMonOTs
	dw wOTPartyMonOTs
	dw sBoxMonOTs
	dw wBufferMonOT

.placeCaughtLocationAndTime
	ld a, [wTempMonCaughtLocation]
	and CAUGHT_LOCATION_MASK
	jr z, .unknown_location_and_time
	cp LANDMARK_EVENT
	jr z, .unknown_location_and_time
	cp LANDMARK_GIFT
	jr z, .unknown_location_and_time
	ld e, a
	farcall GetLandmarkName
	farcall TownMap_ConvertLineBreakCharacters
	ld de, wStringBuffer1
	hlcoord 0, 12
	call PlaceString
	ld a, [wTempMonCaughtTime]
	and CAUGHT_TIME_MASK
	ret z ; no time
	rlca
	rlca
	dec a
	ld hl, .times
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	ld de, wStringBuffer2
	hlcoord 1, 15
	call PlaceString
	ret

.unknown_location_and_time:
	ld de, MetUnknownMapString
	hlcoord 0, 12
	call PlaceString
	ret

.times
	db "OCHTEND@" ; "MORNING@"
	db "DAG@" ; "DAY@"
	db "NACHT@" ; "NIGHT@"

.placeCaughtLevel
	hlcoord 1, 14
	call PrintMetLevel
	ret

.placeEggHatch
	ld a, [wTempMonCaughtLevel]
	and CAUGHT_LEVEL_MASK
	ret z
	cp CAUGHT_EGG_LEVEL ; egg marker value
	ret nz
	ld de, FromAnEggString
	hlcoord 0, 16
	call PlaceString
	ret

IDNoString:
	db "<ID>№.@"

OTString:
	db "OT/@"

MetAtMapString:
	db "ONTMOET/@" ; "MET/@"
	
MetUnknownMapString:
	db "ONBEKEND@" ; "UNKNOWN@"
	
FromAnEggString:
	db "UIT EEN EI@" ; "FROM EGG@"
	
LoadOrangePage:
	hlcoord 8, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	
	ld de, .DV_Stat_Names
	hlcoord 0, 8
	call PlaceString
	
	ld a, [wTempMonDVs]
	and a, %11110000
	swap a
	ld b, a
	push bc
	hlcoord 6, 11
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 11
	pop bc
	ld a, b
	call .Print_Judge_String
	
.print_def_judge
	ld a, [wTempMonDVs]
	and a, %00001111
	ld b, a
	push bc
	hlcoord 6, 13
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 13
	pop bc
	ld a, b
	call .Print_Judge_String
	
.print_spc_judge
	ld a, [wTempMonDVs + 1]
	and a, %00001111
	ld b, a
	push bc
	hlcoord 6, 15
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 15
	pop bc
	ld a, b
	call .Print_Judge_String

.print_spd_judge
	ld a, [wTempMonDVs + 1]
	and a, %11110000
	swap a
	ld b, a
	push bc
	hlcoord 6, 17
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 17
	pop bc
	ld a, b
	call .Print_Judge_String

.print_hp_judge
	ld c, 0
	ld a, [wTempMonDVs]
	swap a
	and 1
	jr z, .atk_not_odd
	ld a, 0
	add 8
	ld c, a
.atk_not_odd
	ld a, [wTempMonDVs]
	and 1
	jr z, .def_not_odd
	ld a, c
	add 4
	ld c, a
.def_not_odd
	ld a, [wTempMonDVs + 1]
	swap a
	and 1
	jr z, .spd_not_odd
	ld a, c
	add 2
	ld c, a
.spd_not_odd
	ld a, [wTempMonDVs + 1]
	and 1
	jr z, .spc_not_odd
	ld a, c
	add 1
	ld c, a
.spc_not_odd
	ld a, c
	ld b, a
	push bc
	hlcoord 6, 9
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 9
	pop bc
	ld a, b
	call .Print_Judge_String

; Stat EXP bars and DV values
	ld a, [wTempMonHPExp + 1]
	cp $ff
	ld a, [wTempMonHPExp]
	jr nz, .hp_exp_not_full
	cp $ff
	jr nz, .hp_exp_not_full
	ld a, 64
	jr .hp_exp_cont
.hp_exp_not_full
	srl a
	srl a
.hp_exp_cont
	ld b, a
	hlcoord 9, 8
	call PlaceStatExpBar
	
	ld a, [wTempMonHPExp]
	cp $ff
	jr nz, .atk_exp_bar
	ld a, [wTempMonHPExp + 1]
	cp $ff
	jr nz, .atk_exp_bar
	hlcoord 19, 8
	ld [hl], "⁂"

.atk_exp_bar
	ld a, [wTempMonAtkExp + 1]
	cp $ff
	ld a, [wTempMonAtkExp]
	jr nz, .atk_exp_not_full
	cp $ff
	jr nz, .atk_exp_not_full
	ld a, 64
	jr .atk_exp_cont
.atk_exp_not_full
	srl a
	srl a
.atk_exp_cont
	ld b, a
	hlcoord 9, 10
	call PlaceStatExpBar
	
	ld a, [wTempMonAtkExp]
	cp $ff
	jr nz, .def_exp_bar
	ld a, [wTempMonAtkExp + 1]
	cp $ff
	jr nz, .def_exp_bar
	hlcoord 19, 10
	ld [hl], "⁂"

.def_exp_bar
	ld a, [wTempMonDefExp + 1]
	cp $ff
	ld a, [wTempMonDefExp]
	jr nz, .def_exp_not_full
	cp $ff
	jr nz, .def_exp_not_full
	ld a, 64
	jr .def_exp_cont
.def_exp_not_full
	srl a
	srl a
.def_exp_cont
	ld b, a
	hlcoord 9, 12
	call PlaceStatExpBar
	
	ld a, [wTempMonDefExp]
	cp $ff
	jr nz, .spc_exp_bar
	ld a, [wTempMonDefExp + 1]
	cp $ff
	jr nz, .spc_exp_bar
	hlcoord 19, 12
	ld [hl], "⁂"

.spc_exp_bar
	ld a, [wTempMonSpcExp + 1]
	cp $ff
	ld a, [wTempMonSpcExp]
	jr nz, .spc_exp_not_full
	cp $ff
	jr nz, .spc_exp_not_full
	ld a, 64
	jr .spc_exp_cont
.spc_exp_not_full
	srl a
	srl a
.spc_exp_cont
	ld b, a
	hlcoord 9, 14
	call PlaceStatExpBar
	
	ld a, [wTempMonSpcExp]
	cp $ff
	jr nz, .spd_exp_bar
	ld a, [wTempMonSpcExp + 1]
	cp $ff
	jr nz, .spd_exp_bar
	hlcoord 19, 14
	ld [hl], "⁂"

.spd_exp_bar
	ld a, [wTempMonSpdExp + 1]
	cp $ff
	ld a, [wTempMonSpdExp]
	jr nz, .spd_exp_not_full
	cp $ff
	jr nz, .spd_exp_not_full
	ld a, 64
	jr .spd_exp_cont
.spd_exp_not_full
	srl a
	srl a
.spd_exp_cont
	ld b, a
	hlcoord 9, 16
	call PlaceStatExpBar
	
	ld a, [wTempMonSpdExp]
	cp $ff
	ret nz
	ld a, [wTempMonSpdExp + 1]
	cp $ff
	ret nz
	hlcoord 19, 16
	ld [hl], "⁂"
	ret

; Prints judgment string based on the value in "a"
.Print_Judge_String
	cp 15
	jr nz, .check_fantastic
	ld de, BestString
	jr .done
.check_fantastic
	cp 14
	jr nz, .check_very_good
	ld de, FantasticString
	jr .done
.check_very_good
	cp 12
	jr c, .check_pretty_good
	ld de, VeryGoodString
	jr .done
.check_pretty_good
	cp 8
	jr c, .check_decent
	ld de, PrettyGoodString
	jr .done
.check_decent
	cp 1
	jr c, .no_good
	ld de, DecentString
	jr .done
.no_good
	ld de, NoGoodString
.done
	call PlaceString
	ret

.DV_Stat_Names:
	db "LP" ; "HP"
	next "AANVAL" ; "ATTACK"
	next "AFWEER" ; "DEFENSE"
	next "SPECIAAL" ; "SPECIAL"
	next "SNELHEID@" ; "SPEED@"

NoGoodString:
	db "Niet goed@" ; "No good@"

DecentString:
	db "Redelijk@" ; "Decent@"

PrettyGoodString:
	db "Goed@" ; "Pretty good@"

VeryGoodString:
	db "Heel goed@" ; "Very good@"

FantasticString:
	db "Fantastisch@" ; "Fantastic@"

BestString:
	db "Best@"

PlaceStatExpBar:
	ld a, $40
	ld [hli], a ; left exp bar end cap
	ld c, $8 ; number of tiles
.loop1
	ld a, b
	sub $8
	jr c, .next
	ld b, a
	ld a, $6a ; full bar
	ld [hli], a
	dec c
	jr z, .finish
	jr .loop1

.next
	add $8
	jr z, .loop2
	add $62
	jr .skip

.loop2
	ld a, $62 ; empty bar

.skip
	ld [hli], a
	ld a, $62 ; empty bar
	dec c
	jr nz, .loop2

.finish
	ld [hl], $41 ; right exp bar end cap
	ret

StatsScreen_PlaceFrontpic:
	ld hl, wTempMonDVs
	predef GetUnownLetter
	call StatsScreen_GetAnimationParam
	jr c, .egg
	and a
	jr z, .no_cry
	jr .cry

.egg
	call .AnimateEgg
	call SetDefaultBGPAndOBP
	ret

.no_cry
	call .AnimateMon
	call SetDefaultBGPAndOBP
	ret

.cry
	call SetDefaultBGPAndOBP
	call .AnimateMon
	ld a, [wCurPartySpecies]
	call PlayMonCry2
	ret

.AnimateMon:
	ld hl, wStatsScreenFlags
	set STATS_SCREEN_ANIMATE_MON, [hl]
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown
	hlcoord 0, 0
	call PrepMonFrontpic
	ret

.unown
	xor a
	ld [wBoxAlignment], a
	hlcoord 0, 0
	call _PrepMonFrontpic
	ret

.AnimateEgg:
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unownegg
	ld a, TRUE
	ld [wBoxAlignment], a
	call .get_animation
	ret

.unownegg
	xor a
	ld [wBoxAlignment], a
	call .get_animation
	ret

.get_animation
	ld a, [wCurPartySpecies]
	call IsAPokemon
	ret c
	call StatsScreen_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	hlcoord 0, 0
	ld d, $0
	ld e, ANIM_MON_MENU
	predef LoadMonAnimation
	ld hl, wStatsScreenFlags
	set STATS_SCREEN_ANIMATE_EGG, [hl]
	ret

StatsScreen_GetAnimationParam:
	ld a, [wMonType]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw .PartyMon
	dw .OTPartyMon
	dw .BoxMon
	dw .Tempmon
	dw .Wildmon

.PartyMon:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	jr .CheckEggFaintedFrzSlp

.OTPartyMon:
	xor a
	ret

.BoxMon:
	ld hl, sBoxMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld b, h
	ld c, l
	ld a, BANK(sBoxMons)
	call OpenSRAM
	call .CheckEggFaintedFrzSlp
	push af
	call CloseSRAM
	pop af
	ret

.Tempmon:
	ld bc, wTempMonSpecies
	jr .CheckEggFaintedFrzSlp ; utterly pointless

.CheckEggFaintedFrzSlp:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call CheckFaintedFrzSlp
	jr c, .FaintedFrzSlp
.egg
	xor a
	scf
	ret

.Wildmon:
	ld a, $1
	and a
	ret

.FaintedFrzSlp:
	xor a
	ret

StatsScreen_LoadTextboxSpaceGFX:
	nop
	push hl
	push de
	push bc
	push af
	call DelayFrame
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	ld hl, vTiles2 tile " "
	call Get2bpp
	pop af
	ldh [rVBK], a
	pop af
	pop bc
	pop de
	pop hl
	ret

StatsScreenSpaceGFX: ; unreferenced
INCBIN "gfx/font/space.2bpp"

EggStatsScreen:
	xor a
	ldh [hBGMapMode], a
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call StatsScreen_PlaceHorizontalDivider
	ld de, EggString
	hlcoord 8, 1
	call PlaceString
	ld de, IDNoString
	hlcoord 8, 3
	call PlaceString
	ld de, OTString
	hlcoord 8, 5
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 3
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 5
	call PlaceString
if DEF(_DEBUG)
	ld de, .PushStartString
	hlcoord 3, 17
	call PlaceString
	jr .placed_push_start

.PushStartString:
	db "▶DRUK OP START.@" ; "▶PUSH START.@"

.placed_push_start
endc
	ld a, [wTempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	call PlaceString
	ld hl, wStatsScreenFlags
	set STATS_SCREEN_ANIMATE_MON, [hl]
	call SetDefaultBGPAndOBP
	call DelayFrame
	hlcoord 0, 0
	call PrepMonFrontpic
	farcall HDMATransferTilemapToWRAMBank3
	call StatsScreen_AnimateEgg

	ld a, [wTempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call PlaySFX
	ret

EggString:
	db "EI@" ; "EGG@"

FiveQMarkString:
	db "?????@"

EggSoonString:
	db   "Het maakt geluid" ; "It's making sounds"
	next "van binnen. Het" ; "inside. It's going"
	next "komt bijna uit!@" ; "to hatch soon!@"

EggCloseString:
	db   "Het beweegt soms" ; "It moves around"
	next "van binnen. Zal" ; "inside sometimes."
	next "vast bijna uit-" ; "It must be close"
	next "komen.@" ; "to hatching.@"

EggMoreTimeString:
	db   "Wat zou er in" ; "Wonder what's"
	next "zitten? Heeft nog" ; "inside? It needs"
	next "meer tijd nodig.@" ; "more time, though.@"

EggALotMoreTimeString:
	db   "Dit EI heeft meer" ; "This EGG needs a"
	next "tijd nodig om uit" ; "lot more time to"
	next "te komen.@" ; "hatch.@"

StatsScreen_AnimateEgg:
	call StatsScreen_GetAnimationParam
	ret nc
	ld a, [wTempMonHappiness]
	ld e, $7
	cp 6
	jr c, .animate
	ld e, $8
	cp 11
	jr c, .animate
	ret

.animate
	push de
	ld a, $1
	ld [wBoxAlignment], a
	call StatsScreen_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	pop de
	hlcoord 0, 0
	ld d, $0
	predef LoadMonAnimation
	ld hl, wStatsScreenFlags
	set STATS_SCREEN_ANIMATE_EGG, [hl]
	ret

StatsScreen_LoadPageIndicators:
	hlcoord 11, 5
	ld a, $36 ; " " " "
	call .load_square
	hlcoord 13, 5
	ld a, $36 ; first of 4 small square tiles
	call .load_square
	hlcoord 15, 5
	ld a, $36 ; " ; " " ; "
	call .load_square
	hlcoord 17, 5
	ld a, $36 ; " ; " " ; "
	call .load_square
	ld a, c
	cp PINK_PAGE
	hlcoord 11, 5
	jr z, .load_highlighted_square
	cp GREEN_PAGE
	hlcoord 13, 5
	jr z, .load_highlighted_square
	cp BLUE_PAGE
	hlcoord 15, 5
	jr z, .load_highlighted_square
	; must be ORANGE_PAGE
	hlcoord 17, 5
.load_highlighted_square
	ld a, $3a ; first of 4 large square tiles
.load_square
	push bc
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop bc
	ret

CopyNickname:
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	jr .okay ; utterly pointless
.okay
	ld a, [wMonType]
	cp BOXMON
	jr nz, .partymon
	ld a, BANK(sBoxMonNicknames)
	call OpenSRAM
	push de
	call CopyBytes
	pop de
	call CloseSRAM
	ret

.partymon
	push de
	call CopyBytes
	pop de
	ret

GetNicknamePointer:
	ld a, [wMonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonType]
	cp TEMPMON
	ret z
	ld a, [wCurPartyMon]
	jp SkipNames

CheckFaintedFrzSlp:
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .fainted_frz_slp
	ld hl, MON_STATUS
	add hl, bc
	ld a, [hl]
	and 1 << FRZ | SLP_MASK
	jr nz, .fainted_frz_slp
	and a
	ret

.fainted_frz_slp
	scf
	ret
