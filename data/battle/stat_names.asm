StatNames:
; entries correspond to stat ids
	list_start StatNames
	li "AANVAL" ; "ATTACK"
	li "VERDEDIG" ; "DEFENSE"
	li "SNELHEID" ; "SPEED"
	li "SPCL.AAN" ; "SPCL.ATK"
	li "SPCL.VER" ; "SPCL.DEF"
	li "PRECISIE" ; "ACCURACY"
	li "ONTWIJK" ; "EVASION"
	li "VERMOGEN" ; "ABILITY" ; used for BattleCommand_Curse
	assert_list_length NUM_LEVEL_STATS
