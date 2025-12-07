FieldMoveJumptableReset:
	xor a
	ld hl, wFieldMoveData
	ld bc, wFieldMoveDataEnd - wFieldMoveData
	call ByteFill
	ret

FieldMoveJumptable:
	ld a, [wFieldMoveJumptableIndex]
	rst JumpTable
	ld [wFieldMoveJumptableIndex], a
	bit JUMPTABLE_EXIT_F, a
	jr nz, .okay
	and a
	ret

.okay
	and JUMPTABLE_INDEX_MASK
	scf
	ret

GetPartyNickname:
; write wCurPartyMon nickname to wStringBuffer1-3
	ld hl, wPartyMonNicknames
	ld a, BOXMON
	ld [wMonType], a
	ld a, [wCurPartyMon]
	call GetNickname
	call CopyName1
; copy text from wStringBuffer2 to wStringBuffer3
	ld de, wStringBuffer2
	ld hl, wStringBuffer3
	call CopyName2
	ret

SetCurPartyMonToFieldMoveSpecies:
; Takes the species of wCurPartyMon and puts it into wFieldMoveSpecies
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wFieldMoveSpecies], a
	ret

GetFieldMoveSpeciesName:
; Puts the name of wFieldMoveSpecies into wStringBuffer1
	ld a, [wFieldMoveSpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ret

Script_DisplayFieldMoveMonWithCry:
; Shows wFieldMoveSpecies in a pokepic and play its cry
	readmem wFieldMoveSpecies
	refreshmap
	pokepic 0
	cry 0
	waitsfx
	closepokepic
	;refreshmap
	end

CheckFlagResult:
	ld a, c
	and a
	jr nz, .yes
;.no
	ld a, 1
	scf
	jr .done
.yes
	xor a
.done
	ld [wScriptVar], a
	ret

CheckEventFlag:
; Check event flag de
; Carry and wScriptVar are 0 if set, otherwise no.
	ld b, CHECK_FLAG
	farcall EventFlagAction
	jr CheckFlagResult

GotTM08RockSmash:
	ld de, EVENT_GOT_TM08_ROCK_SMASH
	jr CheckEventFlag

GotTM02Headbutt:
	ld de, EVENT_GOT_TM02_HEADBUTT
	jr CheckEventFlag

GotTM12SweetScent:
	ld de, EVENT_GOT_TM12_SWEET_SCENT
	jr CheckEventFlag

GotTM28Dig:
	ld de, EVENT_NATIONAL_PARK_TM_DIG
	jr CheckEventFlag
	
GotHM01:
	ld de, EVENT_GOT_HM01_CUT
	jr CheckEventFlag
	
GotHM02:
	ld de, EVENT_GOT_HM02_FLY
	jr CheckEventFlag
	
GotHM03:
	ld de, EVENT_GOT_HM03_SURF
	jr CheckEventFlag
	
GotHM04:
	ld de, EVENT_GOT_HM04_STRENGTH
	jr CheckEventFlag

GotHM05:
	ld de, EVENT_GOT_HM05_FLASH
	jr CheckEventFlag
	
GotHM06:
	ld de, EVENT_GOT_HM06_WHIRLPOOL
	jr CheckEventFlag

GotHM07:
	ld de, EVENT_GOT_HM07_WATERFALL
	jr CheckEventFlag

CheckEngineFlag:
; Check engine flag de
; Carry and wScriptVar are 0 if set, otherwise no.
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	jr CheckFlagResult

CheckBadge:
; Check engine flag a (ENGINE_ZEPHYRBADGE thru ENGINE_EARTHBADGE)
; Display "Badge required" text and set carry if the badge is not owned
	call CheckEngineFlag
	ret nc
	scf
	ret

PrintBadgeRequiredText:
	ld hl, BadgeRequiredText
	call MenuTextboxBackup ; push text to queue

BadgeRequiredText:
	text_far _BadgeRequiredText
	text_end
	
CheckZephyrBadge:
	ld de, ENGINE_ZEPHYRBADGE
	jr CheckBadge

CheckHiveBadge:
	ld de, ENGINE_HIVEBADGE
	jr CheckBadge

CheckPlainBadge:
	ld de, ENGINE_PLAINBADGE
	jr CheckBadge

CheckFogBadge:
	ld de, ENGINE_FOGBADGE
	jr CheckBadge

CheckStormBadge:
	ld de, ENGINE_STORMBADGE
	jr CheckBadge

CheckGlacierBadge:
	ld de, ENGINE_GLACIERBADGE
	jr CheckBadge

CheckRisingBadge:
	ld de, ENGINE_RISINGBADGE
	jr CheckBadge

CheckPartyMove:
; Check if a monster in your party has move d. If yes, sets wCurPartyMon. If no, set carry.
	ld e, 0
	xor a
	ld [wCurPartyMon], a
.loop
	ld c, e
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no
	cp -1
	jr z, .no
	cp EGG
	jr z, .next

	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Moves
	ld a, e
	call AddNTimes
	ld b, NUM_MOVES
.check
	ld a, [hli]
	cp d
	jr z, .yes
	dec b
	jr nz, .check

.next
	inc e
	jr .loop

.yes
	ld a, e
	ld [wCurPartyMon], a ; which mon has the move
	xor a
	ret
.no
	scf
	ret

FieldMoveFailed:
	ld hl, .CantUseItemText
	call MenuTextboxBackup
	ret

.CantUseItemText:
	text_far _CantUseItemText
	text_end

HasMove:
; Calls CheckPartyMove to check if the move in d exists in the party.
; Carry and wScriptVar are 0 if yes, otherwise no.
; If yes, wCurPartyMon will contain the mon with the move.
	call CheckPartyMove
	jr nc, .yes
; no
	ld a, 1
	jr .done
.yes
	xor a
	; jr .done
.done
	ld [wScriptVar], a
	ret

HasCut:
	ld d, CUT
	jr HasMove

HasFly:
	ld d, FLY
	jr HasMove

HasSurf:
	ld d, SURF
	jr HasMove

HasStrength:
	ld d, STRENGTH
	jr HasMove

HasFlash:
	ld d, FLASH
	jr HasMove

HasWhirlpool:
	ld d, WHIRLPOOL
	jr HasMove

HasWaterfall:
	ld d, WATERFALL
	jr HasMove

HasHeadbutt:
	ld d, HEADBUTT
	jr HasMove

HasRockSmash:
	ld d, ROCK_SMASH
	jr HasMove

HasDig:
	ld d, DIG
	jr HasMove

HasTeleport:
	ld d, TELEPORT
	jr HasMove

HasSweetScent:
	ld d, SWEET_SCENT
	jr HasMove

; HasItem:
; Calls CheckItem to check if item a is in the player's bag
; Carry and wScriptVar are 0 if yes, otherwise no.
    ; ld [wCurItem], a
    ; ld hl, wNumItems
    ; call CheckItem
    ; jr c, .yes
	; ld a, 1
	; scf
	; jr .done
; .yes
	; xor a
; .done
	; ld [wScriptVar], a
	; ret


; CUT field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
CutFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .CheckAble
	dw .DoCut
	dw .FailCut

.CheckAble:
	call CheckHiveBadge
	jr c, .nohivebadge
	call CheckMapForSomethingToCut
	jr c, .nothingtocut
	call SaveCutWhirlpoolFieldMoveData
	ld a, $1
	ret

.nohivebadge
	call PrintBadgeRequiredText
	ld a, JUMPTABLE_EXIT
	ret

.nothingtocut
	ld a, $2
	ret

.DoCut:
	ld hl, Script_CutFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailCut:
	ld hl, CutNothingText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

UseCutText:
	text_far _UseCutText
	text_end

WildUseCutText:
	text_far _WildUseCutText
	text_end

CutNothingText:
	text_far _CutNothingText
	text_end

CheckMapForSomethingToCut:
	; Does the collision data of the facing tile permit cutting?
	call GetFacingTileCoord
	ld c, a
	push de
	farcall CheckCutCollision
	pop de
	jr nc, .fail
	; Get the location of the current block in wOverworldMapBlocks.
	call GetBlockLocation
	ld c, [hl]
	; See if that block contains something that can be cut.
	push hl
	ld hl, CutTreeBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .fail
	xor a
	ret

.fail
	scf
	ret

Script_CutFromMenu:
	refreshmap
	special UpdateTimePals

Script_Cut:
	opentext
	
	callasm HasCut
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext UseCutText
	sjump .do_cut
.not_in_party
	callasm .LoadWildCutMon
	callasm GetFieldMoveSpeciesName
	writetext WildUseCutText
.do_cut
	scall Script_DisplayFieldMoveMonWithCry
	callasm CutDownTreeOrGrass
	closetext
	end

.LoadWildCutMon:
	ld a, SCYTHER
	ld [wFieldMoveSpecies], a
	ret

CutDownTreeOrGrass:
	call SetUpCutWhirlpoolAnim
	call UpdateSprites
	call DelayFrame
	ld a, [wCutWhirlpoolAnimationType]
	ld e, a
	farcall OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	call UpdateSprites
	call DelayFrame
	call LoadStandardFont
	ret

CheckOverworldTileArrays:
	; Input: c contains the tile you're facing
	; Output: Replacement tile in b and effect on wild encounters in c, plus carry set.
	;         Carry is not set if the facing tile cannot be replaced, or if the tileset
	;         does not contain a tile you can replace.

	; Dictionary lookup for pointer to tile replacement table
	push bc
	ld a, [wMapTileset]
	ld de, 3
	call IsInArray
	pop bc
	jr nc, .nope
	; Load the pointer
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Look up the tile you're facing
	ld de, 3
	ld a, c
	call IsInArray
	jr nc, .nope
	; Load the replacement to b
	inc hl
	ld b, [hl]
	; Load the animation type parameter to c
	inc hl
	ld c, [hl]
	scf
	ret

.nope
	xor a
	ret

TryCutOW::
	call CheckHiveBadge
	jr c, .cant_cut
	call HasCut
	jr nc, .can_cut
	call GotHM01
	jr c, .cant_cut
.can_cut
	ld a, BANK(AskCutScript)
	ld hl, AskCutScript
	call CallScript
	scf
	ret

.cant_cut
	ld a, BANK(CantCutScript)
	ld hl, CantCutScript
	call CallScript
	scf
	ret

AskCutScript:
	;opentext
	;writetext AskCutText
	;yesorno
	;iffalse .declined
	callasm .CheckMap
	iftrue Script_Cut
.declined
	;closetext
	end

.CheckMap:
	xor a
	ld [wScriptVar], a
	call CheckMapForSomethingToCut
	ret c
	call SaveCutWhirlpoolFieldMoveData
	ld a, TRUE
	ld [wScriptVar], a
	ret

;AskCutText:
;	text_far _AskCutText
;	text_end

CantCutScript:
	jumptext CanCutText

CanCutText:
	text_far _CanCutText
	text_end


; WHIRLPOOL field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
WhirlpoolFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryWhirlpool
	dw .DoWhirlpool
	dw .FailWhirlpool

.TryWhirlpool:
	call CheckGlacierBadge
	jr c, .noglacierbadge
	call TryWhirlpoolMenu
	jr c, .failed
	call SaveCutWhirlpoolFieldMoveData
	ld a, $1
	ret

.failed
	ld a, $2
	ret

.noglacierbadge
	call PrintBadgeRequiredText
	ld a, JUMPTABLE_EXIT
	ret

.DoWhirlpool:
	ld hl, Script_WhirlpoolFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailWhirlpool:
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

UseWhirlpoolText:
	text_far _UseWhirlpoolText
	text_end

WildUseWhirlpoolText:
	text_far _WildUseWhirlpoolText
	text_end

TryWhirlpoolMenu:
	call GetFacingTileCoord
	ld c, a
	push de
	call CheckWhirlpoolTile
	pop de
	jr c, .failed
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, WhirlpoolBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .failed
	xor a
	ret

.failed
	scf
	ret

Script_WhirlpoolFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedWhirlpool:
	opentext
	
	callasm HasWhirlpool
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext UseWhirlpoolText
	sjump .do_whirlpool
.not_in_party
	callasm .LoadWildWhirlpoolMon
	callasm GetFieldMoveSpeciesName
	writetext WildUseWhirlpoolText
.do_whirlpool
	scall Script_DisplayFieldMoveMonWithCry
	callasm DisappearWhirlpool
	closetext
	end

.LoadWildWhirlpoolMon:
	ld a, AZUMARILL
	ld [wFieldMoveSpecies], a
	ret
	
DisappearWhirlpool:
	call SetUpCutWhirlpoolAnim
	ld a, [wCutWhirlpoolAnimationType]
	ld e, a
	farcall PlayWhirlpoolSound
	call BufferScreen
	call GetMovementPermissions
	ret

TryWhirlpoolOW::
	call CheckGlacierBadge
	jr c, .failed
	call TryWhirlpoolMenu
	jr c, .failed
	call SaveCutWhirlpoolFieldMoveData
	call HasWhirlpool
	jr nc, .success
	call GotHM06
	jr c, .failed
.success
	ld a, BANK(Script_UsedWhirlpool)
	ld hl, Script_UsedWhirlpool
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_MightyWhirlpool)
	ld hl, Script_MightyWhirlpool
	call CallScript
	scf
	ret

Script_MightyWhirlpool:
	jumptext .MayPassWhirlpoolText

.MayPassWhirlpoolText:
	text_far _MayPassWhirlpoolText
	text_end

;Script_AskWhirlpoolOW:
	;opentext
	;writetext AskWhirlpoolText
	;yesorno
	;iftrue Script_UsedWhirlpool
	;closetext
	;end

;AskWhirlpoolText:
;	text_far _AskWhirlpoolText
;	text_end

SaveCutWhirlpoolFieldMoveData:
	; Save the field move data
	ld a, l
	ld [wCutWhirlpoolOverworldBlockAddr], a
	ld a, h
	ld [wCutWhirlpoolOverworldBlockAddr + 1], a
	ld a, b
	ld [wCutWhirlpoolReplacementBlock], a
	ld a, c
	ld [wCutWhirlpoolAnimationType], a
	ret

SetUpCutWhirlpoolAnim:
	ld hl, wCutWhirlpoolOverworldBlockAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCutWhirlpoolReplacementBlock]
	ld [hl], a
	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	ret

INCLUDE "data/collision/field_move_blocks.asm"


; FLASH field move
	
; Farcall from menu (engine/pokemon/mon_menu.asm)
FlashFunction:
	call .CheckUseFlash
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.CheckUseFlash:
	call CheckZephyrBadge
	jr c, .nozephyrbadge
	call CheckFlashLocation
	jr c, .notadarkcave
.useflash
	call UseFlash
	ld a, JUMPTABLE_EXIT | $1
	ret

.notadarkcave
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

.nozephyrbadge
	call PrintBadgeRequiredText
	ld a, JUMPTABLE_EXIT
	ret

CheckFlashLocation:
; Can we use flash here? c = no
	push hl
	farcall SpecialAerodactylChamber
	pop hl
	jr c, .yes
	
	ld a, [wTimeOfDayPalset]
	cp DARKNESS_PALSET
	jr z, .yes
	
	scf
	ret
	
.yes
	xor a
	ret
	

UseFlash:
	ld hl, Script_UseFlash
	jp QueueScript

Script_UseFlash:
; We've confirmed the player can use flash here, they have the badge, and the HM or a mon with the move.
	opentext
	
	special UpdateTimePals
	callasm HasFlash
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext UseFlashText
	sjump .do_flash
.not_in_party
	callasm .LoadWildFlashMon
	callasm GetFieldMoveSpeciesName
	writetext WildUseFlashText
.do_flash
	scall Script_DisplayFieldMoveMonWithCry
	writetext UseFlashTextScript
	closetext
	callasm BlindingFlash
	end

.LoadWildFlashMon:
	ld a, MAREEP
	ld [wFieldMoveSpecies], a
	ret
	
UseFlashTextScript:
	text_far _BlindingFlashText
	text_asm
	call WaitSFX
	ld de, SFX_FLASH
	call PlaySFX
	call WaitSFX
	ld hl, .BlankText
	ret

.BlankText:
	text_end

; "Party Pokémon used FLASH!"
UseFlashText:
	text_far _UseFlashText
	text_end

; "A wild Pokémon helped out with FLASH!"
WildUseFlashText:
	text_far _WildUseFlashText
	text_end


; SURF field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
SurfFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TrySurf
	dw .DoSurf
	dw .FailSurf
	dw .AlreadySurfing

.TrySurf:
; Check badge eligibility
	call CheckFogBadge
	jr c, .nofogbadge
; Don't surf if already surfing.
	call CheckAlreadySurfing
	jr c, .alreadyfail
; Ensure target tile is a surfable tile
	call GetFacingTileCoord
	ld [wFacingTileID], a
	call CheckCanSurfHere
	jr c, .cannotsurf
; Ensure we're not about to surf onto an object like an NPC
	farcall CheckFacingObject
	jr c, .cannotsurf
	ld a, $1
	ret
.nofogbadge
	call PrintBadgeRequiredText
	ld a, JUMPTABLE_EXIT
	ret
.alreadyfail
	ld a, $3
	ret
.cannotsurf
	ld a, $2
	ret

.DoSurf:
	ld hl, SurfFromMenuScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailSurf:
	ld hl, CantSurfText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

.AlreadySurfing:
	ld hl, AlreadySurfingText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

SurfFromMenuScript:
	special UpdateTimePals

UsedSurfScript:
; BUG: Surfing directly across a map connection does not load the new map (see docs/bugs_and_glitches.md)
; We've confirmed the player can use surf here, they have the badge, and the HM or a mon with the move.
	opentext
	
	callasm HasSurf
	ifequal 1, .not_in_party

	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext UsedSurfText ; "used SURF!"
	sjump .do_surf
.not_in_party
	callasm .LoadWildSurfMon
	callasm GetFieldMoveSpeciesName
	writetext WildUsedSurfText
.do_surf
	scall Script_DisplayFieldMoveMonWithCry
	closetext

	callasm GetSurfType

	readmem wSurfingPlayerState
	writevar VAR_MOVEMENT

	special UpdatePlayerSprite
	special PlayMapMusic
; step into the water (slow_step DIR, step_end)
	special SurfStartStep
	applymovement PLAYER, wMovementBuffer
	end

.LoadWildSurfMon:
	ld a, AZUMARILL
	ld [wFieldMoveSpecies], a
	ret

UsedSurfText:
	text_far _UsedSurfText
	text_end

WildUsedSurfText:
	text_far _WildUsedSurfText
	text_end

CantSurfText:
	text_far _CantSurfText
	text_end

AlreadySurfingText:
	text_far _AlreadySurfingText
	text_end

GetSurfType:
; Surfing on Pikachu uses an alternate sprite.
; This is done by using a separate movement type.
	ld a, [wFieldMoveSpecies]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	jr z, .done
	ld a, PLAYER_SURF
.done
	ld [wSurfingPlayerState], a
	ret

CheckCanSurfHere:
; carry = no
; Make sure we're not in a location where the player can't dismount the bike
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	jr nz, .no

; Check tile permissions.
	call CheckDirection
	jr c, .no
	
; Must be facing water.
	ld a, [wFacingTileID]
	call GetTilePermission
	cp WATER_TILE
	jr nz, .no
	
;.yes
	xor a
	ret
.no
	scf
	ret

CheckAlreadySurfing:
; carry = yes
	ld a, [wPlayerState]
	cp PLAYER_SURF_PIKA
	jr z, .yes
	cp PLAYER_SURF
	jr z, .yes
	xor a
	ret
.yes
	scf
	ret

CheckDirection:
; Return carry if a tile permission prevents you
; from moving in the direction you're facing.

; Get player direction
	ld a, [wPlayerDirection]
	and %00001100 ; bits 2 and 3 contain direction
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .Directions
	add hl, de

; Can you walk in this direction?
	ld a, [wTilePermissions]
	and [hl]
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret

.Directions:
	db FACE_DOWN
	db FACE_UP
	db FACE_LEFT
	db FACE_RIGHT

; Farcall from overworld TryTileCollisionEvent (engine/overworld/events.asm)
TrySurfOW::
; Checks if player can use SURF here and now.
; Return carry if surf is allowed.
	
; Check badge eligibility
	call CheckFogBadge
	jr c, .quit

; Don't ask to surf if already surfing.
	call CheckAlreadySurfing
	jr c, .quit

; Ensure target tile is a surfable tile
	call CheckCanSurfHere
	jr c, .quit

; Check player has HM
	call GotHM03
	jr nc, .yes
	
; If player does not have HM, check party for move
	call HasSurf
	jr c, .quit

.yes
	ld a, BANK(UsedSurfScript)
	ld hl, UsedSurfScript
	call CallScript
	
	scf
	ret

.quit
	xor a
	ret

;AskSurfScript:
	;opentext
	;writetext AskSurfText
	;yesorno
	;iftrue UsedSurfScript
	;closetext
	;end

;AskSurfText:
;	text_far _AskSurfText
;	text_end


; FLY field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
FlyFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryFly
	dw .DoFly
	dw .FailFly

.TryFly:
	call CheckStormBadge
	jr c, .nostormbadge
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .outdoors
	jr .indoors

.outdoors
	xor a
	ldh [hMapAnims], a
	call LoadStandardMenuHeader
	call ClearSprites
	
	call HasFly
	jr c, .does_not_have_fly
	call SetCurPartyMonToFieldMoveSpecies
	jr .flymap
.does_not_have_fly
	call .LoadWildFlyMon

.flymap
	farcall _FlyMap
	ld a, e
	cp -1
	jr z, .illegal
	cp NUM_SPAWNS
	jr nc, .illegal

	ld [wDefaultSpawnpoint], a
	call CloseWindow
	ld a, $1
	ret

.nostormbadge
	call PrintBadgeRequiredText
	ld a, JUMPTABLE_EXIT | $2
	ret

.indoors
	ld a, $2
	ret

.illegal
	call CloseWindow
	ld a, [wUsingItemWithSelect]
	and a
	jr z, .done_tiles
	call ExitFlyMap
	xor a
	ld [wUsingItemWithSelect], a
.done_tiles
	call WaitBGMap
	ld a, JUMPTABLE_EXIT
	ret

.DoFly:
	ld a, [wUsingItemWithSelect]
	and a
	jr z, .done_select
	call ExitFlyMap
	xor a
	ld [wUsingItemWithSelect], a
.done_select
	ld hl, .FlyScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailFly:
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT | $2
	ret

.FlyScript:
; We've confirmed the player can use fly here, they have the badge, and the HM or a mon with the move.
	opentext
	
	callasm HasFly
	ifequal 1, .not_in_party
	
	callasm GetPartyNickname
	writetext UsedFlyText ; "used SURF!"
	sjump .do_fly
.not_in_party
	callasm GetFieldMoveSpeciesName
	writetext WildUsedFlyText
.do_fly
	scall Script_DisplayFieldMoveMonWithCry
	closetext
	
	callasm HideSprites
	special UpdateTimePals
	callasm FlyFromAnim
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	callasm SkipUpdateMapSprites
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
	callasm FlyToAnim
	special WaitSFX
	callasm .ReturnFromFly
	end

.ReturnFromFly:
	ld e, PAL_OW_RED
	farcall SetFirstOBJPalette
	farcall RespawnPlayer
	call DelayFrame
	call UpdatePlayerSprite
	farcall LoadOverworldFont
	ret

.LoadWildFlyMon:
	ld a, PIDGEOT
	ld [wFieldMoveSpecies], a
	ret

UsedFlyText:
	text_far _UsedFlyText
	text_end

WildUsedFlyText:
	text_far _WildUsedFlyText
	text_end


; WATERFALL field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
WaterfallFunction:
	call .TryWaterfall
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.TryWaterfall:
	call CheckRisingBadge
	jr c, .norisingbadge
	call CheckMapCanWaterfall
	jr c, .failed
	ld hl, Script_WaterfallFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.norisingbadge
	call PrintBadgeRequiredText
	ld a, JUMPTABLE_EXIT
	ret

.failed
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

CheckMapCanWaterfall:
	ld a, [wPlayerDirection]
	and $c
	cp FACE_UP
	jr nz, .failed
	ld a, [wTileUp]
	call CheckWaterfallTile
	jr nz, .failed
	xor a
	ret

.failed
	scf
	ret

Script_WaterfallFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedWaterfall:
	opentext
	
	callasm HasWaterfall
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext .UseWaterfallText
	sjump .do_waterfall
.not_in_party
	callasm .LoadWildWaterfallMon
	callasm GetFieldMoveSpeciesName
	writetext .WildUseWaterfallText
.do_waterfall
	scall Script_DisplayFieldMoveMonWithCry
	closetext
	
	playsound SFX_BUBBLEBEAM
.loop
	applymovement PLAYER, .WaterfallStep
	callasm .CheckContinueWaterfall
	iffalse .loop
	end

.LoadWildWaterfallMon
	ld a, AZUMARILL
	ld [wFieldMoveSpecies], a
	ret

.CheckContinueWaterfall:
	xor a
	ld [wScriptVar], a
	ld a, [wPlayerTileCollision]
	call CheckWaterfallTile
	ret z
	farcall StubbedTrainerRankings_Waterfall
	ld a, $1
	ld [wScriptVar], a
	ret

.WaterfallStep:
	turn_waterfall UP
	step_end

.UseWaterfallText:
	text_far _UseWaterfallText
	text_end

.WildUseWaterfallText:
	text_far _WildUseWaterfallText
	text_end

TryWaterfallOW::
	call CheckRisingBadge
	jr c, .failed
	call CheckMapCanWaterfall
	jr c, .failed
	call HasWaterfall
	jr nc, .success
	call GotHM07
	jr c, .failed
.success
	ld a, BANK(Script_UsedWaterfall)
	ld hl, Script_UsedWaterfall
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_CantDoWaterfall)
	ld hl, Script_CantDoWaterfall
	call CallScript
	scf
	ret

Script_CantDoWaterfall:
	jumptext .HugeWaterfallText

.HugeWaterfallText:
	text_far _HugeWaterfallText
	text_end

;Script_AskWaterfall:
	;opentext
	;writetext .AskWaterfallText
	;yesorno
	;iftrue Script_UsedWaterfall
	;closetext
	;end

;.AskWaterfallText:
;	text_far _AskWaterfallText
;	text_end


; DIG field move

EscapeRopeFunction:
	call FieldMoveJumptableReset
	ld a, $1
	jr EscapeRopeOrDig

; Farcall from menu (engine/pokemon/mon_menu.asm)
DigFunction:
	call FieldMoveJumptableReset
	ld a, $2

EscapeRopeOrDig:
	ld [wEscapeRopeOrDigType], a
.loop
	ld hl, .DigTable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.DigTable:
	dw .CheckCanDig
	dw .DoDig
	dw .FailDig

.CheckCanDig:
	call CanDig
	ld a, $1
	jr nc, .done
	ld a, $2
.done
	ret

.DoDig:
	ld hl, wDigWarpNumber
	ld de, wNextWarp
	ld bc, 3
	call CopyBytes
	call HasDig
	call SetCurPartyMonToFieldMoveSpecies
	call GetPartyNickname
	ld a, [wEscapeRopeOrDigType]
	cp $2
	jr nz, .escaperope
	ld hl, .UsedDigScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.escaperope
	farcall SpecialKabutoChamber
	ld hl, .UsedEscapeRopeScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailDig:
	ld a, [wEscapeRopeOrDigType]
	cp $2
	jr nz, .failescaperope
	ld hl, .CantUseDigText
	call MenuTextbox
	call WaitPressAorB_BlinkCursor
	call CloseWindow

.failescaperope
	ld a, JUMPTABLE_EXIT
	ret

.UseDigText:
	text_far _UseDigText
	text_end

.WildUseDigText:
	text_far _WildUseDigText
	text_end

.UseEscapeRopeText:
	text_far _UseEscapeRopeText
	text_end

.CantUseDigText:
	text_far _CantUseDigText
	text_end

.UsedEscapeRopeScript:
	refreshmap
	special UpdateTimePals
	writetext .UseEscapeRopeText
	waitbutton
	closetext
	sjump .UsedDigOrEscapeRopeScript

.UsedDigScript:
	refreshmap
	special UpdateTimePals
	
	callasm HasDig
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext .UseDigText
	sjump .do_dig
.not_in_party
	callasm .LoadWildDigMon
	callasm GetFieldMoveSpeciesName
	writetext .WildUseDigText
.do_dig
	scall Script_DisplayFieldMoveMonWithCry
	closetext

.UsedDigOrEscapeRopeScript:
	playsound SFX_WARP_TO
	applymovement PLAYER, .DigOut
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_DOOR
	playsound SFX_WARP_FROM
	applymovement PLAYER, .DigReturn
	end

.LoadWildDigMon
	ld a, SANDSHREW
	ld [wFieldMoveSpecies], a
	ret

.DigOut:
	step_dig 32
	hide_object
	step_end

.DigReturn:
	show_object
	return_dig 32
	step_end

CanDig:
; carry = no
	call GetMapEnvironment
	cp CAVE
	jr z, .incave
	cp DUNGEON
	jr z, .incave
.fail
	scf
	ret

.incave
	ld hl, wDigWarpNumber
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	xor a
	ret


; TELEPORT field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
TeleportFunction:
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryTeleport
	dw .DoTeleport
	dw .FailTeleport

.TryTeleport:
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .CheckIfSpawnPoint
	jr .nope

.CheckIfSpawnPoint:
	call CheckSpawnPointValid
	jr nc, .nope
	ld a, c
	ld [wDefaultSpawnpoint], a
	ld a, $1
	ret

.nope
	ld a, $2
	ret

.DoTeleport:
	call HasTeleport
	call SetCurPartyMonToFieldMoveSpecies
	call GetPartyNickname
	ld hl, .TeleportScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FailTeleport:
	ld hl, .CantUseTeleportText
	call MenuTextboxBackup
	ld a, JUMPTABLE_EXIT
	ret

.UseTeleportText:
	text_far _UseTeleportText
	text_end

.TeleportReturnText:
	text_far _TeleportReturnText
	text_end

.CantUseTeleportText:
	text_far _CantUseTeleportText
	text_end

.TeleportScript:
	refreshmap
	writetext .UseTeleportText
	special UpdateTimePals
	scall Script_DisplayFieldMoveMonWithCry
	writetext .TeleportReturnText
	closetext
	pause 20
	refreshmap
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	end

.TeleportFrom:
	teleport_from
	step_end

.TeleportTo:
	teleport_to
	step_end

CheckSpawnPointValid:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ret

; STRENGTH field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
StrengthFunction:
	call .TryStrength
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.TryStrength:
	call CheckPlainBadge
	jr c, .noplainbadge
	ld hl, wBikeFlags
	bit BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	jr nz, .already_using
	jr .UseStrength

.noplainbadge:
	call PrintBadgeRequiredText
	ld a, JUMPTABLE_EXIT
	ret

.already_using
	ld a, BANK(AlreadyUsedStrength)
	ld hl, AlreadyUsedStrength
	call CallScript
	ld a, JUMPTABLE_EXIT
	ret

.UseStrength:
	ld hl, Script_StrengthFromMenu
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

SetStrengthFlag:
	ld hl, wBikeFlags
	set BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	ret

Script_StrengthFromMenu:
	refreshmap
	special UpdateTimePals

Script_UsedStrength:
	opentext
	
	callasm HasStrength
	ifequal 1, .does_not_have
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext .UseStrengthText
	sjump .do_strength
.does_not_have
	callasm .LoadWildStrengthMon
	callasm GetFieldMoveSpeciesName
	writetext .WildUseStrengthText
.do_strength
	callasm SetStrengthFlag
	
	scall Script_DisplayFieldMoveMonWithCry
	writetext .MoveBoulderText
	closetext
	end

.LoadWildStrengthMon
	ld a, MACHOP
	ld [wFieldMoveSpecies], a
	ret

.UseStrengthText:
	text_far _UseStrengthText
	text_end

.WildUseStrengthText
	text_far _WildUseStrengthText
	text_end

.MoveBoulderText:
	text_far _MoveBoulderText
	text_end

; Script farsjump from StrengthBoulderScript (engine/events/std_scripts.asm)
AskStrengthScript:
	callasm TryStrengthOW
	iffalse Script_UsedStrength
	ifequal $1, .DontMeetRequirements
	sjump AlreadyUsedStrength

.DontMeetRequirements:
	jumptext BouldersMayMoveText

AlreadyUsedStrength:
	jumptext BouldersMoveText

;.AskStrength:
	;opentext
	;writetext AskStrengthText
	;yesorno
	;iftrue Script_UsedStrength
	;closetext
	;end

;AskStrengthText:
;	text_far _AskStrengthText
;	text_end

BouldersMoveText:
	text_far _BouldersMoveText
	text_end

BouldersMayMoveText:
	text_far _BouldersMayMoveText
	text_end

TryStrengthOW:
	call CheckPlainBadge
	jr c, .nope
	
	call HasStrength
	jr nc, .checkbikeflags
	
	call GotHM04
	jr c, .nope

.checkbikeflags
	ld hl, wBikeFlags
	bit BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	jr z, .already_using

	ld a, 2
	jr .done

.nope
	ld a, 1
	jr .done

.already_using
	xor a
	jr .done

.done
	ld [wScriptVar], a
	ret


; HEADBUTT field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
HeadbuttFunction:
	call TryHeadbuttFromMenu
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

TryHeadbuttFromMenu:
	call GetFacingTileCoord
	call CheckHeadbuttTreeTile
	jr nz, .no_tree

	ld hl, HeadbuttFromMenuScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.no_tree
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

UseHeadbuttText:
	text_far _UseHeadbuttText
	text_end

; "Wild pokemon did a HEADBUTT!"
WildUseHeadbuttText:
	text_far _WildUseHeadbuttText
	text_end

HeadbuttNothingText:
	text_far _HeadbuttNothingText
	text_end

HeadbuttFromMenuScript:
	refreshmap
	special UpdateTimePals

HeadbuttScript:
	opentext
	
	callasm HasHeadbutt
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext UseHeadbuttText
	sjump .do_headbutt
.not_in_party
	callasm .LoadWildHeadbuttMon
	callasm GetFieldMoveSpeciesName
	writetext WildUseHeadbuttText
.do_headbutt
	scall Script_DisplayFieldMoveMonWithCry

	callasm ShakeHeadbuttTree

	callasm TreeMonEncounter
	iffalse .no_battle
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.LoadWildHeadbuttMon
	ld a, RATTATA
	ld [wFieldMoveSpecies], a
	ret

.no_battle
	writetext HeadbuttNothingText
	waitbutton
	closetext
	end

; Farcall from overworld TryTileCollisionEvent (engine/overworld/events.asm)
TryHeadbuttOW::
	call GotTM02Headbutt
	jr nc, .yes

	call HasHeadbutt
	jr c, .no

.yes
	ld a, BANK(HeadbuttScript)
	ld hl, HeadbuttScript
	call CallScript
	scf
	ret

.no
	xor a
	ret

;AskHeadbuttScript:
;	opentext
;	writetext AskHeadbuttText
;	yesorno
;	iftrue HeadbuttScript
;	closetext
;	end

;AskHeadbuttText:
;	text_far _AskHeadbuttText
;	text_end


; ROCK SMASH field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
RockSmashFunction:
	call TryRockSmashFromMenu
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

TryRockSmashFromMenu:
	call GetFacingObject
	jr c, .no_rock
	ld a, d
	cp SPRITEMOVEDATA_SMASHABLE_ROCK
	jr nz, .no_rock

	ld hl, RockSmashFromMenuScript
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.no_rock
	call FieldMoveFailed
	ld a, JUMPTABLE_EXIT
	ret

GetFacingObject:
	farcall CheckFacingObject
	jr nc, .fail

	ldh a, [hObjectStructIndex]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ldh [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.fail
	scf
	ret

RockSmashFromMenuScript:
	refreshmap
	special UpdateTimePals

RockSmashScript:
	opentext
	
	callasm HasRockSmash
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext UseRockSmashText
	sjump .do_rock_smash
.not_in_party
	callasm .LoadWildRockSmashMon
	callasm GetFieldMoveSpeciesName
	writetext WildUseRockSmashText
.do_rock_smash
	scall Script_DisplayFieldMoveMonWithCry
	closetext
	
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovementlasttalked MovementData_RockSmash
	disappear LAST_TALKED

	callasm RockMonEncounter
	readmem wTempWildMonSpecies
	iffalse .no_battle
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.no_battle
	callasm RockItemEncounter
	iffalse .no_item
	opentext
	verbosegiveitem ITEM_FROM_MEM
	closetext
.no_item
	end

.LoadWildRockSmashMon
	ld a, MACHOP
	ld [wFieldMoveSpecies], a
	ret

MovementData_RockSmash:
	rock_smash 10
	step_end

UseRockSmashText:
	text_far _UseRockSmashText
	text_end

WildUseRockSmashText:
	text_far _WildUseRockSmashText
	text_end

AskRockSmashScript:
	callasm HasRockSmash
	ifequal $0, .yes

	callasm GotTM08RockSmash
	ifequal $1, .no

.yes
	;opentext
	;writetext AskRockSmashText
	;yesorno
	;iftrue RockSmashScript
	sjump RockSmashScript
	;closetext
	end
.no
	jumptext MaySmashText

MaySmashText:
	text_far _MaySmashText
	text_end

;AskRockSmashText:
;	text_far _AskRockSmashText
;	text_end


; SWEET SCENT field move

; Farcall from menu (engine/pokemon/mon_menu.asm)
SweetScentFromMenu:
	ld hl, .SweetScent
	call QueueScript
	ld a, $1
	ld [wFieldMoveSucceeded], a
	ret

.SweetScent:
	refreshmap
	special UpdateTimePals
	
	opentext
	
	callasm HasSweetScent
	ifequal 1, .not_in_party
	
	callasm SetCurPartyMonToFieldMoveSpecies
	callasm GetPartyNickname
	writetext UseSweetScentText
	sjump .do_sweet_scent
.not_in_party
	callasm .LoadWildSweetScentMon
	callasm GetFieldMoveSpeciesName
	writetext WildUseSweetScentText
.do_sweet_scent
	scall Script_DisplayFieldMoveMonWithCry
	closetext
	callasm SweetScentEncounter
	iffalse SweetScentNothing
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugCatchingContest
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.LoadWildSweetScentMon:
	ld a, GLOOM
	ld [wFieldMoveSpecies], a
	ret

.BugCatchingContest:
	farsjump BugCatchingContestBattleScript

SweetScentNothing:
	writetext SweetScentNothingText
	waitbutton
	closetext
	end

SweetScentEncounter:
	farcall CanEncounterWildMon
	jr nc, .no_battle
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .in_bug_contest
	farcall GetMapEncounterRate
	ld a, b
	and a
	jr z, .no_battle
	farcall ChooseWildEncounter
	jr nz, .no_battle
	jr .start_battle

.in_bug_contest
	farcall ChooseWildEncounter_BugContest

.start_battle
	ld a, $1
	ld [wScriptVar], a
	ret

.no_battle
	xor a
	ld [wScriptVar], a
	ld [wBattleType], a
	ret

UseSweetScentText:
	text_far _UseSweetScentText
	text_end

WildUseSweetScentText:
	text_far _WildUseSweetScentText
	text_end

SweetScentNothingText:
	text_far _SweetScentNothingText
	text_end


; Fishing

FishFunction:
	ld a, e
	push af
	call FieldMoveJumptableReset
	pop af
	ld [wFishingRodUsed], a
.loop
	ld hl, .FishTable
	call FieldMoveJumptable
	jr nc, .loop
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.FishTable:
	dw .TryFish
	dw .FishNoBite
	dw .FishGotSomething
	dw .FailFish
	dw .FishNoFish

.TryFish:
	ld a, [wPlayerState]
	cp PLAYER_SURF_PIKA
	jr z, .fail
	call GetFacingTileCoord
	call GetTilePermission
	cp WATER_TILE
	jr nz, .fail
	farcall CheckFacingObject
	jr nc, .facingwater
.fail
	ld a, $3
	ret

.facingwater
	call GetFishingGroup
	and a
	jr nz, .goodtofish
	ld a, $4
	ret

.goodtofish
	ld d, a
	ld a, [wFishingRodUsed]
	ld e, a
	farcall Fish
	ld a, d
	and a
	jr z, .nonibble
	ld [wTempWildMonSpecies], a
	ld a, e
	ld [wCurPartyLevel], a
	ld a, BATTLETYPE_FISH
	ld [wBattleType], a
	ld a, $2
	ret

.nonibble
	ld a, $1
	ret

.FailFish:
	ld a, JUMPTABLE_EXIT
	ret

.FishGotSomething:
	ld a, $1
	ld [wFishingResult], a
	ld hl, Script_GotABite
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FishNoBite:
	ld a, $2
	ld [wFishingResult], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

.FishNoFish:
	ld a, $0
	ld [wFishingResult], a
	ld hl, Script_NotEvenANibble2
	call QueueScript
	ld a, JUMPTABLE_EXIT | $1
	ret

Script_NotEvenANibble:
	scall Script_FishCastRod
	writetext RodNothingText
	sjump Script_NotEvenANibble_FallThrough

Script_NotEvenANibble2:
	scall Script_FishCastRod
	writetext RodNothingText

Script_NotEvenANibble_FallThrough:
	loademote EMOTE_SHADOW
	callasm PutTheRodAway
	closetext
	end

Script_GotABite:
	scall Script_FishCastRod
	callasm Fishing_CheckFacingUp
	iffalse .NotFacingUp
	applymovement PLAYER, .Movement_FacingUp
	sjump .FightTheHookedPokemon

.NotFacingUp:
	applymovement PLAYER, .Movement_NotFacingUp

.FightTheHookedPokemon:
	pause 40
	applymovement PLAYER, .Movement_RestoreRod
	writetext RodBiteText
	callasm PutTheRodAway
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.Movement_NotFacingUp:
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	show_emote
	step_end

.Movement_FacingUp:
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	step_sleep 1
	show_emote
	step_end

.Movement_RestoreRod:
	hide_emote
	fish_cast_rod
	step_end

Fishing_CheckFacingUp:
	ld a, [wPlayerDirection]
	and $c
	cp OW_UP
	ld a, $1
	jr z, .up
	xor a

.up
	ld [wScriptVar], a
	ret

Script_FishCastRod:
	refreshmap
	loadmem hBGMapMode, $0
	special UpdateTimePals
	loademote EMOTE_ROD
	callasm LoadFishingGFX
	loademote EMOTE_SHOCK
	applymovement PLAYER, MovementData_CastRod
	pause 40
	end

MovementData_CastRod:
	fish_cast_rod
	step_end

PutTheRodAway:
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ld [wPlayerAction], a
	call UpdateSprites
	call UpdatePlayerSprite
	ret

RodBiteText:
	text_far _RodBiteText
	text_end

RodNothingText:
	text_far _RodNothingText
	text_end

BikeFunction:
	call .TryBike
	and JUMPTABLE_INDEX_MASK
	ld [wFieldMoveSucceeded], a
	ret

.TryBike:
	call .CheckEnvironment
	jr c, .CannotUseBike
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .GetOnBike
	cp PLAYER_BIKE
	jr z, .GetOffBike
	jr .CannotUseBike

.GetOnBike:
	ld hl, Script_GetOnBike
	ld de, Script_GetOnBike_Register
	call .CheckIfRegistered
	call QueueScript
	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume
	ld de, MUSIC_BICYCLE
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ld a, $1
	ret

.GetOffBike:
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	jr nz, .CantGetOffBike
	ld hl, Script_GetOffBike
	ld de, Script_GetOffBike_Register
	call .CheckIfRegistered
	ld a, BANK(Script_GetOffBike)
	jr .done

.CantGetOffBike:
	ld hl, Script_CantGetOffBike
	jr .done

.CannotUseBike:
	ld a, $0
	ret

.done
	call QueueScript
	ld a, $1
	ret

.CheckIfRegistered:
	ld a, [wUsingItemWithSelect]
	and a
	ret z
	ld h, d
	ld l, e
	ret

.CheckEnvironment:
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp GATE
	jr z, .ok
	jr .nope

.ok
	call GetPlayerTilePermission
	and $f ; lo nybble only
	jr nz, .nope ; not FLOOR_TILE
	xor a
	ret

.nope
	scf
	ret

Script_GetOnBike:
	refreshmap
	special UpdateTimePals
	loadvar VAR_MOVEMENT, PLAYER_BIKE
	writetext GotOnBikeText
	waitbutton
	closetext
	special UpdatePlayerSprite
	end

Script_GetOnBike_Register:
	loadvar VAR_MOVEMENT, PLAYER_BIKE
	closetext
	special UpdatePlayerSprite
	end

Script_GetOffBike:
	refreshmap
	special UpdateTimePals
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	writetext GotOffBikeText
	waitbutton

FinishGettingOffBike:
	closetext
	special UpdatePlayerSprite
	special PlayMapMusic
	end

Script_GetOffBike_Register:
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	sjump FinishGettingOffBike

Script_CantGetOffBike:
	writetext .CantGetOffBikeText
	waitbutton
	closetext
	end

.CantGetOffBikeText:
	text_far _CantGetOffBikeText
	text_end

GotOnBikeText:
	text_far _GotOnBikeText
	text_end

GotOffBikeText:
	text_far _GotOffBikeText
	text_end
