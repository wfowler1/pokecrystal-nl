StatNames: ; For printing during battles
; entries correspond to stat ids
	list_start
	li "AANVAL" ; "ATTACK"
	li "AFWEER" ; "DEFENSE"
	li "SNELHEID" ; "SPEED"
	li "SPCL.AAN" ; "SPCL.ATK"
	li "SPCL.AFW" ; "SPCL.DEF"
	li "PRECISIE" ; "ACCURACY"
	li "ONTWIJK" ; "EVASION"
	li "VERMOGEN" ; "ABILITY" ; used for BattleCommand_Curse
	assert_list_length NUM_LEVEL_STATS
