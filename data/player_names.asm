ChrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MaleNames
	db 1 ; default option
	db 0 ; ???

.MaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NIEUW@" ; "NEW NAME@"
MalePlayerNameArray:
	db "CHRIS@"
	db "JORIS@" ; "MAT@"
	db "SAM@" ; "ALLAN@"
	db "WILLEM@" ; "JON@"
	db 2 ; title indent
	db " NAAM @" ; " NAME @" ; title

KrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .FemaleNames
	db 1 ; default option
	db 0 ; ???

.FemaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NIEUW@" ; "NEW NAME@"
FemalePlayerNameArray:
	db "KRIS@"
	db "SASKIA@" ; "AMANDA@"
	db "JULIA@" ; "JUANA@"
	db "MILA@" ; "JODI@"
	db 2 ; title indent
	db " NAAM @" ; " NAME @" ; title
