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

Normal:    db "NORMAAL@" ; "NORMAL@"
Fighting:  db "VECHT@" ; "FIGHTING@"
Flying:    db "VLIEGEN@" ; "FLYING@" "VLIEGSOORT" longer than 8 chars
Poison:    db "GIF@" ; "POISON@"
CurseType: db "???@"
Fire:      db "VUUR@" ; "FIRE@"
Water:     db "WATER@"
Grass:     db "GRAS@" ; "GRASS@" 
Electric:  db "ELEKTRO@" ; "ELECTRIC@" "ELEKTRISCH" longer than 8 chars
Psychic:   db "PSYCH.@" ; "PSYCHIC@" "PSYCHISCH" longer than 8 chars
Ice:       db "IJS@" ; "ICE@"
Ground:    db "GROND@" ; "GROUND@"
Rock:      db "STEEN@" ; "ROCK@"
Bird:      db "VOGEL@" ; "BIRD@"
Bug:       db "INSECT@" ; "BUG@"
Ghost:     db "GEEST@" ; "GHOST@"
Steel:     db "STAAL@" ; "STEEL@"
Dragon:    db "DRAAK@" ; "DRAGON@"
Dark:      db "DUISTER@" ; "DARK@"
