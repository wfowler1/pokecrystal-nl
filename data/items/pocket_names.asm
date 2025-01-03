ItemPocketNames:
; entries correspond to item type constants
	table_width 2
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	assert_table_length NUM_ITEM_TYPES

.Item: db "VOORWERPZAK@" ; "ITEM POCKET@"
.Key:  db "BEL.ZAK@" ; "KEY POCKET@"
.Ball: db "BALLENZAK@" ; "BALL POCKET@"
.TM:   db "TM-ZAK@" ; "TM POCKET@"
