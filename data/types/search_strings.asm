PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH, PokedexTypeSearchStrings
	db "  ----  @"
	db "NORMAAL @"
	db "  VUUR  @"
	db " WATER  @"
	db "  GRAS  @"
	db " DONDER @"
	db "  IJS   @"
	db " VECHT  @"
	db "  GIF   @"
	db " GROND  @"
	db "VLIEGEN @"
	db "PARANORM@"
	db " INSECT @"
	db " STEEN  @"
	db " GEEST  @"
	db " DRAAK  @"
	db " DONKER @"
	db " STAAL  @"
	assert_table_length NUM_TYPES + 1
