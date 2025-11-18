; HiddenMoveMenu.Items indexes
	const_def
	const HIDDENMOVEMENUITEM_CUT ; 0
	const HIDDENMOVEMENUITEM_FLY ; 1
	const HIDDENMOVEMENUITEM_SURF ; 2
	const HIDDENMOVEMENUITEM_STRENGTH ; 3
	const HIDDENMOVEMENUITEM_FLASH ;4 
	const HIDDENMOVEMENUITEM_WHIRLPOOL ; 5
	const HIDDENMOVEMENUITEM_WATERFALL ; 6
	const HIDDENMOVEMENUITEM_HEADBUTT ; 7
	const HIDDENMOVEMENUITEM_ROCKSMASH ; 8
	const HIDDENMOVEMENUITEM_TELEPORT ; 9
	const HIDDENMOVEMENUITEM_DIG ; 10

HiddenMoveMenu::
	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate

	ld hl, .MenuHeader

.GotMenuData:
	call LoadMenuHeader
	call .SetUpMenuItems
	ld a, [wBattleMenuCursorPosition]
	ld [wMenuCursorPosition], a
	call DrawVariableLengthMenuBox
	call SafeUpdateSprites
	call HDMATransferTilemapAndAttrmap_Menu
	farcall LoadFonts_NoOAMUpdate
	call UpdateTimePals
	jr .Select

.Reopen:
	call UpdateSprites
	call UpdateTimePals
	call .SetUpMenuItems
	ld a, [wBattleMenuCursorPosition]
	ld [wMenuCursorPosition], a

.Select:
	call .GetInput
	jr c, .Exit
	ld a, [wMenuCursorPosition]
	ld [wBattleMenuCursorPosition], a
	call PlayClickSFX
	call PlaceHollowCursor
	call .OpenMenu
	
	ld a, [wFieldMoveSucceeded]
	ld b, a
	and %00001111
	cp 2
	jr nz, .Exit

	ld a, b
	swap a
	and %00001111
; Menu items have different return functions.
; For example, saving exits the menu.
	ld hl, .MenuReturns
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuReturns:
	dw .Reopen
	dw .Exit
	dw .ExitMenuCallFuncCloseText
	dw .ExitMenuRunScriptCloseText
	dw .ExitMenuRunScript
	dw .ReturnEnd
	dw .ReturnRedraw

.Exit:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ldh [hOAMUpdate], a
.ReturnEnd:
	call ExitMenu
.ReturnEnd2:
	call CloseText
	call UpdateTimePals
	ret

.GetInput:
; Return carry on exit, and no-carry on selection.
	xor a
	ldh [hBGMapMode], a
	call SetUpMenu
	ld a, $ff
	ld [wMenuSelection], a
.loop
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp PAD_B
	jr z, .b
	cp PAD_A
	jr z, .a
	cp PAD_SELECT
	jr z, .select
	jr .loop
.a
	call PlayClickSFX
	and a
	ret
.select
	farcall UseRegisteredItem
	scf
	ret
.b
	scf
	ret

.ExitMenuRunScript:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.ExitMenuRunScriptCloseText:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	jr .ReturnEnd2

.ExitMenuCallFuncCloseText:
	call ExitMenu
	ld hl, wQueuedScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wQueuedScriptBank]
	rst FarCall
	jr .ReturnEnd2

.ReturnRedraw:
	call .Clear
	jp .Reopen

.Clear:
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	call DrawVariableLengthMenuBox
	call UpdateSprites
	call GSReloadPalettes
	call FinishExitMenu
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_ENABLE_START ; flags
	dn 0, 0 ; rows, columns
	dw wMenuItemsList
	dw .MenuString
	dw .Items

.Items:
; entries correspond to HIDDENMOVEMENUITEM_* constants
	dw HiddenMoveMenu_Cut,        .CutString,             .CutString
	dw HiddenMoveMenu_Fly,        .FlyString,             .FlyString
	dw HiddenMoveMenu_Surf,       .SurfString,            .SurfString
	dw HiddenMoveMenu_Strength,   .StrengthString,        .StrengthString
	dw HiddenMoveMenu_Flash,      .FlashString,           .FlashString
	dw HiddenMoveMenu_Whirlpool,  .WhirlpoolString,       .WhirlpoolString
	dw HiddenMoveMenu_Waterfall,  .WaterfallString,       .WaterfallString
	dw HiddenMoveMenu_Headbutt,   .HeadbuttString,        .HeadbuttString
	dw HiddenMoveMenu_RockSmash,  .RockSmashString,       .RockSmashString
	dw HiddenMoveMenu_Teleport,   .TeleportString,        .TeleportString
	dw HiddenMoveMenu_Dig,        .DigString,             .DigString

.FieldMoveString: db "VERBORGEN@" ; "HIDDEN MOVES@"
.CutString:       db "SNIJD@" ; "CUT@"
.FlyString:       db "VLIEG@" ; "FLY@"
.SurfString:      db "SURF@"
.StrengthString:  db "KRACHT@" ; "STRENGTH@"
.FlashString:     db "FLITS@" ; "FLASH@"
.WhirlpoolString: db "DRAAIKOLK@" ; "WHIRLPOOL@"
.WaterfallString: db "WATERVAL@" ; "WATERFALL@"
.HeadbuttString:  db "KOPSTOOT@" ; "HEADBUTT@"
.RockSmashString: db "STEENKNAL@" ; "ROCK SMASH@"
.TeleportString:  db "TELEPORTEER@" ; "TELEPORT@"
.DigString:       db "GRAVEN@" ; "DIG@"

.OpenMenu:
	ld a, [wMenuSelection]
	call .GetMenuAccountTextPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuString:
	push de
	ld a, [wMenuSelection]
	call .GetMenuAccountTextPointer
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

.GetMenuAccountTextPointer:
	ld e, a
	ld d, 0
	ld hl, wMenuDataPointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 6
	add hl, de
endr
	ret

.SetUpMenuItems:
	xor a
	ld [wWhichIndexSet], a
	call .FillMenuList
	push bc
	push de

; Check in front of player for something interactable with a field move.
; Cut, Surf, Whirlpool, Waterfall, Headbutt and Rock Smash are all mutually exclusive.
;.check_cut
	call CheckHiveBadge
	jr c, .check_surf

	call HasHM01
    jr nc, .check_cut_map_usability

	call HasCut
	jr c, .check_surf

.check_cut_map_usability
	call CheckMapForSomethingToCut
	jr c, .check_surf

.add_cut
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_CUT
	call .AppendMenuList
	push bc
	push de
	jp c, .check_fly

.check_surf
	call CheckFogBadge
	jr c, .check_whirlpool
	
	call HasHM03
    jr nc, .check_surf_map_usability
	
	call HasSurf
	jr c, .check_whirlpool

.check_surf_map_usability
; Don't surf if already surfing.
	call CheckAlreadySurfing
	jr c, .check_whirlpool
; Ensure target tile is a surfable tile
	call GetFacingTileCoord
	ld [wFacingTileID], a
	call CheckCanSurfHere
	jr c, .check_whirlpool
; Ensure we're not about to surf onto an object like an NPC
	farcall CheckFacingObject
	jr c, .check_whirlpool

.add_surf
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_SURF
	call .AppendMenuList
	push bc
	push de
	jr c, .check_fly

.check_whirlpool
	call CheckGlacierBadge
	jr c, .check_waterfall
	
	call HasHM06
    jr nc, .check_whirlpool_map_usability
	
	call HasWhirlpool
	jr c, .check_waterfall

.check_whirlpool_map_usability
	call TryWhirlpoolMenu
	jr c, .check_waterfall
	
.add_whirlpool
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_WHIRLPOOL
	call .AppendMenuList
	push bc
	push de
	jr c, .check_fly

.check_waterfall
	call CheckRisingBadge
	jr c, .check_headbutt

	call HasHM07
    jr nc, .check_waterfall_map_usability

	call HasWaterfall
	jr c, .check_headbutt

.check_waterfall_map_usability
	call CheckMapCanWaterfall
	jr c, .check_headbutt

.add_waterfall
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_WATERFALL
	call .AppendMenuList
	push bc
	push de
	jr c, .check_fly

.check_headbutt
	call GotTM02Headbutt
	jr nc, .check_headbutt_map_usability
	
	call HasHeadbutt
	jr c, .check_rocksmash

.check_headbutt_map_usability
	call GetFacingTileCoord
	call CheckHeadbuttTreeTile
	jr nz, .check_rocksmash

.add_headbutt
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_HEADBUTT
	call .AppendMenuList
	push bc
	push de
	jr c, .check_fly

.check_rocksmash
	call GotTM08RockSmash
	jr nc, .check_rocksmash_map_usability

	call HasRockSmash
	jr c, .check_fly

.check_rocksmash_map_usability
	call GetFacingObject
	jr c, .check_fly
	ld a, d
	cp SPRITEMOVEDATA_SMASHABLE_ROCK
	jr nz, .check_fly

.add_rocksmash
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_ROCKSMASH
	call .AppendMenuList
	push bc
	push de

.check_fly
	call CheckStormBadge
	jr c, .check_strength

	call HasHM02
    jr nc, .check_fly_map_usability

	call HasFly
	jr c, .check_strength

.check_fly_map_usability
	call GetMapEnvironment
	call CheckOutdoorMap
	jr nz, .check_strength

.add_fly
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_FLY
	call .AppendMenuList
	push bc
	push de

.check_strength
	call CheckPlainBadge
	jr c, .check_flash
	
	call HasHM04
    jr nc, .add_strength
	
	call HasStrength
	jr c, .check_flash

.add_strength
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_STRENGTH
	call .AppendMenuList
	push bc
	push de

.check_flash
	call CheckZephyrBadge
	jr c, .check_teleport
	
	call HasHM05
    jr nc, .check_flash_map_usability
	
	call HasFlash
	jr c, .check_teleport

.check_flash_map_usability
	call CheckFlashLocation
	jr c, .check_teleport
	
.add_flash
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_FLASH
	call .AppendMenuList
	push bc
	push de

.check_teleport
	call HasTeleport
	jr c, .check_dig
	
	call GetMapEnvironment
	call CheckOutdoorMap
	jr nz, .check_dig
	
	call CheckSpawnPointValid
	jr nc, .check_dig

.add_teleport
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_TELEPORT
	call .AppendMenuList
	push bc
	push de

.check_dig
	call HasDig
	jr c, .finish_menu

	call CanDig
	jr c, .finish_menu

.add_dig
	pop de
	pop bc
	ld a, HIDDENMOVEMENUITEM_DIG
	call .AppendMenuList
	jr .finish_menu_2

.finish_menu
	pop de
	pop bc
.finish_menu_2
	ld a, c
	cp 0
	jr nc, .finalize
	ld a, HIDDENMOVEMENUITEM_ROCKSMASH
	call .AppendMenuList
	ld a, c
	
.finalize
	ld [wMenuItemsList], a
	ret

.FillMenuList:
	xor a
	ld hl, wMenuItemsList
	ld [hli], a
	ld a, -1
	ld bc, wMenuItemsListEnd - (wMenuItemsList + 1)
	call ByteFill
	ld de, wMenuItemsList + 1
	ld c, 0
	ret

.AppendMenuList:
	ld [de], a
	inc de
	inc c
	ret

HiddenMoveMenu_Cut:
	farcall MonMenu_Cut
	ret

HiddenMoveMenu_Fly:
	ld a, 1
	ld [wUsingItemWithSelect], a
	farcall MonMenu_Fly
	ret

HiddenMoveMenu_Surf:
	farcall MonMenu_Surf
	ret

HiddenMoveMenu_Strength:
	farcall MonMenu_Strength
	ret

HiddenMoveMenu_Flash:
	farcall MonMenu_Flash
	ret

HiddenMoveMenu_Whirlpool:
	farcall MonMenu_Whirlpool
	ret

HiddenMoveMenu_Waterfall:
	farcall MonMenu_Waterfall
	ret

HiddenMoveMenu_Headbutt:
	farcall MonMenu_Headbutt
	ret

HiddenMoveMenu_RockSmash:
	farcall MonMenu_RockSmash
	ret

HiddenMoveMenu_Teleport:
	farcall MonMenu_Teleport
	ret

HiddenMoveMenu_Dig:
	farcall MonMenu_Dig
	ret
