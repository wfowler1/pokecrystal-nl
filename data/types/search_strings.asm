PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH
	db "  ----  @"
	db "NORMAAL @" ; " NORMAL @"
	db "  VUUR  @" ; "  FIRE  @"
	db " WATER  @"
	db "  GRAS  @" ; " GRASS  @"
	db " DONDER @" ; "ELECTRIC@"
	db "  IJS   @" ; "  ICE   @"
	db " VECHT  @" ; "FIGHTING@"
	db "  GIF   @" ; " POISON @"
	db " GROND  @" ; " GROUND @"
	db "VLIEGEN @" ; " FLYING @"
	db "PARANORM@" ; "PSYCHIC @"
	db " INSECT @" ; "  BUG   @"
	db " STEEN  @" ; "  ROCK  @"
	db " GEEST  @" ; " GHOST  @"
	db " DRAAK  @" ; " DRAGON @"
	db " DONKER @" ; "  DARK  @"
	db " STAAL  @" ; " STEEL  @"
	assert_table_length NUM_TYPES + 1
