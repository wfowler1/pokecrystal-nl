TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2, TypeNames

	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	assert_table_length UNUSED_TYPES

rept UNUSED_TYPES_END - UNUSED_TYPES - 1 ; discount CURSE_TYPE
	dw Normal
endr
	dw CurseType
	assert_table_length UNUSED_TYPES_END

	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	assert_table_length TYPES_END

Normal:    db "NORMAAL@"
Fighting:  db "VECHT@"
Flying:    db "VLIEG@"
Poison:    db "GIF@"
CurseType: db "???@"
Fire:      db "VUUR@"
Water:     db "WATER@"
Grass:     db "GRAS@"
Electric:  db "STROOM@"
Psychic:   db "MENTAAL@"
Ice:       db "IJS@"
Ground:    db "GROND@"
Rock:      db "ROTS@"
Bird:      db "VOGEL@"
Bug:       db "INSECT@"
Ghost:     db "SPOOK@"
Steel:     db "STAAL@"
Dragon:    db "DRAAK@"
Dark:      db "DUISTER@"
