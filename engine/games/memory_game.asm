_MemoryGame:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call .LoadGFXAndPals
	call DelayFrame
.loop
	call .JumptableLoop
	jr nc, .loop
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ret

.LoadGFXAndPals:
	call DisableLCD
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	callfar ClearSpriteAnims
	ld hl, MemoryGameLZ
	ld de, vTiles2 tile $00
	call Decompress
	ld hl, MemoryGameCursorLZ
	ld de, vTiles0 tile $00
	ld bc, 4 tiles
	ld a, BANK(MemoryGameCursorLZ)
	call Decompress
	ld a, SPRITE_ANIM_DICT_ARROW_CURSOR
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $00
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	ldh [rWY], a
	ld [wJumptableIndex], a
	ld a, $1
	ldh [hBGMapMode], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call DmgToCgbObjPal0
	ret

.JumptableLoop:
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .quit
	call .ExecuteJumptable
	callfar PlaySpriteAnimations
	call DelayFrame
	and a
	ret

.quit
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	scf
	ret

.ExecuteJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw .RestartGame ; 0
	dw .ResetBoard ; 1
	dw .InitBoardTilemapAndCursorObject ; 2
	dw .CheckTriesRemaining ; 3
	dw .PickCard1 ; 4
	dw .PickCard2 ; 5
	dw .DelayPickAgain ; 6
	dw .RevealAll ; 7
	dw .AskPlayAgain ; 8

.RestartGame:
	ld hl, .CardFlipPlayWithThreeCoinsText
	call PrintText
	call CardFlip_DrawCoinBalanceBox
	call YesNoBox
	jr c, .SaidNo
	call .DeductCoins
	call MemoryGame_InitStrings
	ld hl, wJumptableIndex
	inc [hl]
	ret

.SaidNo:
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret

.CardFlipPlayWithThreeCoinsText:
	text_far _CardFlipPlayWithThreeCoinsText
	text_end

.DeductCoins:
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	ld a, h
	and a
	jr nz, .deduct ; You have at least 256 coins.
	ld a, l
	cp 3
	jr nc, .deduct ; You have at least 3 coins.
	ld hl, .CardFlipNotEnoughCoinsText
	call CardFlip_UpdateCoinBalanceDisplay
	ld a, 7
	ld [wJumptableIndex], a
	ret

.deduct
	ld de, -3
	add hl, de
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	xor a
	ldh [hBGMapMode], a
	call CardFlip_PrintCoinBalance
	ld a, $1
	ldh [hBGMapMode], a
	call WaitSFX
	ret

.CardFlipNotEnoughCoinsText:
	text_far _CardFlipNotEnoughCoinsText
	text_end

.ResetBoard:
	; call UnusedCursor_InterpretJoypad_AnimateCursor
	jr nc, .proceed
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret

.proceed
	call MemoryGame_InitBoard
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wMemoryGameCounter], a
	ld hl, wMemoryGameLastMatches
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld [wMemoryGameNumCardsMatched], a
.InitBoardTilemapAndCursorObject:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .spawn_object
	inc [hl]
	call MemoryGame_Card2Coord
	xor a
	ld [wMemoryGameLastCardPicked], a
	call MemoryGame_PlaceCard
	ret

; Creates cursor and initializes tries remaining count
.spawn_object
	depixel 6, 3, 4, 4
	ld a, SPRITE_ANIM_OBJ_MEMORY_GAME_CURSOR
	call InitSpriteAnimStruct
	ld a, 5
	ld [wMemoryGameNumberTriesRemaining], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

; Ends game if no tries remaining, otherwise begins next try
.CheckTriesRemaining:
	ld hl, wMemoryGameNumberTriesRemaining
	ld a, [hl]
	and a
	jr nz, .next_try
	ld hl, MemoryGameGameOverText
	call PrintText
	ld a, $7
	ld [wJumptableIndex], a
	ret

; Decrease tries remaining and begin a new try
.next_try
	push hl
	ld hl, CardFlipChooseACardText
	call PrintText
	call MemoryGame_DrawTriesBox
	pop hl
	dec [hl]
	xor a
	ld [wMemoryGameCardChoice], a
	ld hl, wJumptableIndex
	inc [hl]
; Player picking a card
.PickCard1:
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard1], a
	ld a, e
	ld [wMemoryGameCard1Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	ld a, [wMemoryGameLastCardPicked]
	cp $8
	jr z, .GameOverCard
	xor a
	ld [wMemoryGameCardChoice], a
	ld de, SFX_STOP_SLOT
	call PlaySFX
	ld hl, wJumptableIndex
	inc [hl]
	ret
; Player picking a second card
.PickCard2:
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld hl, wMemoryGameCard1Location
	cp [hl]
	ret z
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard2], a
	ld a, e
	ld [wMemoryGameCard2Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	ld a, [wMemoryGameLastCardPicked]
	cp $8
	jr z, .GameOverCard
	ld a, 30
	ld [wMemoryGameCounter], a
	ld de, SFX_STOP_SLOT
	call PlaySFX
	ld hl, wJumptableIndex
	inc [hl]
.DelayPickAgain:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	and a
	jr z, .PickAgain
	dec [hl]
	ret

; Check match and CheckTriesRemaining.
.PickAgain:
	call MemoryGame_CheckMatch
	ld a, $3
	ld [wJumptableIndex], a
	ret

.GameOverCard:
	ld a, 30
	ld de, SFX_WRONG
	call PlaySFX
	ld a, 0
	ld [wMemoryGameNumberTriesRemaining], a
	ld a, $7
	ld [wJumptableIndex], a
	ld hl, GameOverCardText
	call PrintText
	ret

.RevealAll:
	;ldh a, [hJoypadPressed]
	;and PAD_A
	;ret z
	xor a
	ld [wMemoryGameCounter], a
.RevelationLoop:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .finish_round
	inc [hl]
	push af
	call MemoryGame_Card2Coord
	pop af
	push hl
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	pop hl
	cp -1
	jr z, .RevelationLoop
	ld [wMemoryGameLastCardPicked], a
	call MemoryGame_PlaceCard
	jr .RevelationLoop

.finish_round
	call WaitPressAorB_BlinkCursor
	ld hl, wJumptableIndex
	inc [hl]
.AskPlayAgain:
;	ld hl, .CardFlipPlayAgainText
;	call PrintText
;	call YesNoBox
;	call UnusedCursor_InterpretJoypad_AnimateCursor
	jr .restart
;	ld hl, wJumptableIndex
;	set JUMPTABLE_EXIT_F, [hl]
;	ret

.CardFlipPlayAgainText
	text_far _CardFlipPlayAgainText
	text_end

.restart
	xor a
	ld [wJumptableIndex], a
	ret

; Check if the two selected cards are a match.
MemoryGame_CheckMatch:
	ld hl, wMemoryGameCard1
	ld a, [hli]
	cp [hl]
	jr nz, .no_match
; Cards match
; Do not deduct a try for a match!
	ld hl, wMemoryGameNumberTriesRemaining
	inc [hl]

	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard

	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard

	ld a, [wMemoryGameCard1Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1

	ld a, [wMemoryGameCard2Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1

	ld hl, wMemoryGameLastMatches
.find_empty_slot
	ld a, [hli]
	and a
	jr nz, .find_empty_slot
	dec hl
	ld a, [wMemoryGameCard1]
	ld [hl], a
	ld [wMemoryGameLastCardPicked], a
	ld hl, wMemoryGameNumCardsMatched
	ld e, [hl]
	inc [hl]
	; inc [hl]
	ld d, 0
	hlcoord 0, 0
	add hl, de
	call MemoryGame_PlaceCard
	call .HandleMatch
	call MemoryGame_DrawTriesBox
	ret

; Selected cards were not a match. Return to try phase
.no_match
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, MemoryGameDarnText
	call PrintText

	xor a
	ld [wMemoryGameLastCardPicked], a

	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard

	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard

	call MemoryGame_DrawTriesBox
	call WaitSFX
	ret

; Take action based on what was matched
.HandleMatch
	ld a, [wMemoryGameLastCardPicked]
	cp 1 ; Medkit
	jr nz, .not_medkit
	; Add an extra try
	ld hl, wMemoryGameNumberTriesRemaining
	inc [hl]
	ld hl, .GameExtraTurnText
	call PrintText
	ld de, SFX_2ND_PLACE
	call PlaySFX
	call WaitSFX
	call WaitPressAorB_BlinkCursor
	ret
.not_medkit
	cp 2 ; Candy
	jr nz, .not_candy
	; Reward 1 coin
	ld c, $1
	ld de, SFX_3RD_PLACE
	jr .Payout
.not_candy
	cp 3 ; Poke doll
	jr nz, .not_pokedoll
	; Reward 2 coins
	ld c, 3
	ld de, SFX_3RD_PLACE
	jr .Payout
.not_pokedoll
	cp 4 ; Star
	jr nz, .not_star
	; Reward 3 coins
	ld c, 5
	ld de, SFX_3RD_PLACE
	jr .Payout
.not_star
	cp 5 ; Bottle
	jr nz, .not_bottle
	; Turn not used, but no reward
	ld hl, .NoPrizeText
	call PrintText
	ld de, SFX_BUMP
	call PlaySFX
	call WaitSFX
	call WaitPressAorB_BlinkCursor
	ret
.not_bottle
	cp 6 ; pokeball
	jr nz, .not_pokeball
	; Reward 10 coins
	ld c, 10
	ld de, SFX_3RD_PLACE
	jr .Payout
.not_pokeball
	cp 7 ; Super ball
	ret nz
	; Reward 50 coins
	ld c, 50
	ld de, SFX_1ST_PLACE
	; fallthrough

.Payout:
	ld a, c
	push bc
	push de
	ld [wStringBuffer2], a
	ld hl, .EarnedCoinsText
	call PrintText
	call CardFlip_DrawCoinBalanceBox
	pop de
	call PlaySFX
	call WaitSFX
	pop bc
.loop
	push bc
	call .IsCoinCaseFull
	jr c, .full
	call .AddCoinPlaySFX

.full
	call CardFlip_DrawCoinBalanceBox
	ld c, 2
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop
	call WaitPressAorB_BlinkCursor
	ret

.AddCoinPlaySFX:
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	inc hl
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_PAY_DAY
	call PlaySFX
	ret

.IsCoinCaseFull:
	ld a, [wCoins]
	cp HIGH(MAX_COINS)
	jr c, .less
	jr z, .check_low
	jr .more

.check_low
	ld a, [wCoins + 1]
	cp LOW(MAX_COINS)
	jr c, .less

.more
	scf
	ret

.less
	and a
	ret

.EarnedCoinsText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameYeahText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

.NoPrizeText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameNoPrizeText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

.GameExtraTurnText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameExtraTurnText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

GameOverCardText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameGameOverCardText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

MemoryGameYeahText:
	text_far _MemoryGameYeahText
	text_end

MemoryGameNoPrizeText:
	text_far _MemoryGameNoPrizeText
	text_end

MemoryGameExtraTurnText:
	text_far _MemoryGameExtraTurnText
	text_end

MemoryGameGameOverCardText:
	text_far _MemoryGameGameOverCardText
	text_end

MemoryGameGameOverText:
	text_far _MemoryGameGameOverText
	text_end

MemoryGameDarnText:
	text_far _MemoryGameDarnText
	text_end

MemoryGame_InitBoard:
	ld hl, wMemoryGameCards
	ld bc, wMemoryGameCardsEnd - wMemoryGameCards
	xor a
	call ByteFill
	call MemoryGame_GetDistributionOfTiles

	ld c, 2
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 8
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 4
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 7
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 3
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 6
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 1
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 5
	ld hl, wMemoryGameCards
	ld b, wMemoryGameCardsEnd - wMemoryGameCards
.loop
	ld a, [hl]
	and a
	jr nz, .no_load
	ld [hl], c
.no_load
	inc hl
	dec b
	jr nz, .loop
	ret

MemoryGame_SampleTilePlacement:
	push hl
	ld de, wMemoryGameCards
.loop
	call Random
	and %00111111
	cp 45
	jr nc, .loop
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .loop
	ld [hl], c
	dec c
	jr nz, .loop
	pop hl
	inc hl
	ret

MemoryGame_GetDistributionOfTiles:
	ld a, [wMenuCursorY]
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .distributions
	add hl, de
	ret

.distributions
	db $02, $03, $06, $06, $06, $08, $08, $06
	db $02, $02, $04, $06, $06, $08, $08, $09
	db $02, $02, $02, $04, $07, $08, $08, $0c

; Places card wMemoryGameLastCardPicked at coordinates h, l
MemoryGame_PlaceCard:
	ld a, [wMemoryGameLastCardPicked]
	sla a
	sla a
	add 4
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	inc a
	ld [hl], a
	ld c, 1
	call DelayFrames
	ret

; Removes card graphic at coords h, l
MemoryGame_DeleteCard:
	ld a, $1
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld c, 3
	call DelayFrames
	ret

MemoryGame_InitStrings:
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	ld a, $1
	call ByteFill
;	hlcoord 4, 0
;	ld de, .japstr1
;	call PlaceString
;	ld hl, CardFlipChooseACardText
;	call PrintText
	ret

CardFlipChooseACardText:
	text_far _CardFlipChooseACardText
	text_end
;.japstr1
;	db "Memory Game@" ; "とったもの@"

MemoryGame_DrawTriesBox:
	hlcoord 9, 15
	lb bc, 1, 9
	call Textbox
	hlcoord 10, 16
	ld de, .japstr2
	call PlaceString
	hlcoord 17, 16
	ld de, wMemoryGameNumberTriesRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
.japstr2
	db "POGEN@" ; "あと　かい@"

CardFlip_DrawCoinBalanceBox:
	hlcoord 9, 15
	lb bc, 1, 9
	call Textbox
	hlcoord 10, 16
	ld de, .CoinStr
	call PlaceString
	hlcoord 15, 16
	ld de, wCoins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	ret
.CoinStr:
	db "MUNT@" ; "COIN@"

MemoryGame_Card2Coord:
	ld d, 0
.find_row
	sub 9
	jr c, .found_row
	inc d
	jr .find_row

.found_row
	add 9
	ld e, a
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
.loop2
	ld a, d
	and a
	jr z, .done
	add hl, bc
	dec d
	jr .loop2

.done
	sla e
	add hl, de
	ret

MemoryGame_InterpretJoypad_AnimateCursor:
	ld a, [wJumptableIndex]
	cp $7
	jr nc, .quit
	cp $6
	ret z
	call JoyTextDelay
	ld hl, hJoypadPressed
	ld a, [hl]
	and PAD_A
	jr nz, .pressed_a
	ld a, [hl]
	and PAD_B
	jr nz, .pressed_b
	ld a, [hl]
	and PAD_LEFT
	jr nz, .pressed_left
	ld a, [hl]
	and PAD_RIGHT
	jr nz, .pressed_right
	ld a, [hl]
	and PAD_UP
	jr nz, .pressed_up
	ld a, [hl]
	and PAD_DOWN
	jr nz, .pressed_down
	ret

.quit
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.pressed_a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc a
	ld [wMemoryGameCardChoice], a
	ret

.pressed_b
	ret

.pressed_left
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	dec [hl]
	jr .play_movement_sound

.pressed_right
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp (9 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	jr .play_movement_sound

.pressed_up
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub 9
	ld [hl], a
	jr .play_movement_sound

.pressed_down
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp (5 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	add 9
	ld [hl], a
;	jr .play_movement_sound

.play_movement_sound
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

MemoryGameLZ:
INCBIN "gfx/memory_game/memory_game.2bpp.lz"

MemoryGameCursorLZ:
INCBIN "gfx/pokegear/pokegear_sprites.2bpp.lz"