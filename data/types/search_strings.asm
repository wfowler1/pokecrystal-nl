PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH
	db "  ----  @"
	db "NORMAAL @" ; " NORMAL @"
	db "  VUUR  @" ; "  FIRE  @"
	db " WATER  @"
	db "  GRAS  @" ; " GRASS  @"
	db "ELEKTRO @" ; "ELECTRIC@"
	db "  IJS   @" ; "  ICE   @"
	db " VECHT  @" ; "FIGHTING@"
	db "  GIF   @" ; " POISON @"
	db " GROND  @" ; " GROUND @"
	db "VLIEGEN @" ; " FLYING @"
	db " PSYCH. @" ; "PSYCHIC @"
	db " INSECT @" ; "  BUG   @"
	db " STEEN  @" ; "  ROCK  @"
	db " GEEST  @" ; " GHOST  @"
	db " DRAAK  @" ; " DRAGON @"
	db "DUISTER @" ; "  DARK  @"
	db " STAAL  @" ; " STEEL  @"
	db "  FEE   @" ; " FAIRY  @"
	assert_table_length NUM_TYPES + 1
