;Mostrar en pantall el string "Hola"

.data
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	string: .asciiz "Hola\n"

.code 	
	ld $t2,DIR_CONTROL($0)
	ld $t3,DIR_DATA($0)
	
	;guardo en t0 la direccion de la cadena
	daddi $t0,$0,string
	sd $t0,0($t3) ;mando la cadena a DATA
	;cargo en t1 el codigo para imprimir string
	daddi $t1,$0,4
	sd $t1,0($t2) ;mando el codigo a CONTROL
halt
