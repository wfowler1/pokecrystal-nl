SimpleMultiply::
; Return a * c.
	and a
	ret z

	push bc
	ld b, a
	xor a
.loop
	add c
	dec b
	jr nz, .loop
	pop bc
	ret

SimpleDivide::
; Divide a by c. Return quotient b and remainder a.
	ld b, 0
.loop
	inc b
	sub c
	jr nc, .loop
	dec b
	add c
	ret

Multiply::
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
; All values are big endian.
	push hl
	push bc

	callfar _Multiply

	pop bc
	pop hl
	ret

Divide::
; Divide hDividend length b (max 4 bytes) by hDivisor. Result in hQuotient.
; All values are big endian.
	push hl
	push de
	push bc
	homecall _Divide
	pop bc
	pop de
	pop hl
	ret

;SubtractAbsolute:: ; unreferenced
; Return |a - b|, sign in carry.
;	sub b
;	ret nc
;	cpl
;	add 1
;	scf
;	ret

; Adds value in `b` to the value pointed at by [hl], carry to [hld]. If overflow,
; sets [hl] and [hld] to $ff (65535) and sets carry.
AddBToU16NoOverflow::
	ld a, b
	add [hl]
	ld [hl], a
	ret nc
	; overflowed low byte
	dec hl
	ld a, [hl]
	add 1
	jr c, .maxed_out
	ld [hli], a
	ret
.maxed_out
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret