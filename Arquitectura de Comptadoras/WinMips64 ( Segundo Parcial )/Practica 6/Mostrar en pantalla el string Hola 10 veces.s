;Mostrar en pantalla el string "Hola" 10 veces

.data
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	string: .asciiz "Hola\n"

.code 	
	ld $t2,DIR_CONTROL($0)
	ld $t3,DIR_DATA($0)
	
	;guardo en t0 la direccion de la cadena
	daddi $t0,$0,string
	sd $t0,0($t3) ; mando la cadena a DATA
	;cargo en t1 el codigo para imprimir string
	daddi $t1,$0,4
    daddi $t4,$0,10 ; inicializo el contador
	
	loop: sd $t1,0($t2) ; mando el codigo a CONTROL
		  daddi $t4,$t4,-1 ; decremento el contador 
		  bnez $t4,loop
halt
