StatNames:
; entries correspond to stat ids
	list_start
	li "AANVAL" ; "ATTACK"
	li "VER" ; "DEFENSE"
	li "SNELHEID" ; "SPEED"
	li "SPCL.AAN" ; "SPCL.ATK"
	li "SPCL.VER" ; "SPCL.DEF"
	li "NAUWKEUR" ; "ACCURACY"
	li "ONTWIJK" ; "EVASION"
	li "VERMOGEN" ; "ABILITY" ; used for BattleCommand_Curse
	assert_list_length NUM_LEVEL_STATS
