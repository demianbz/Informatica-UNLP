;Mostrar en pantalla el string "Hola 10,9,8,7..." 

.data
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	string: .asciiz "Hola "
	nl: .asciiz "\n"

.code 	
	ld $t2,DIR_CONTROL($0)
	ld $t3,DIR_DATA($0)
	
	;guardo en t0 la direccion de la cadena
	daddi $t0,$0,string
	
	;guardo en $t6 la direccion de nl 
	daddi $t6,$0,nl 
	
	;cargo en t1 el codigo para imprimir string
	daddi $t1,$0,4
	
	;cargo en $t5 el codigo para imprimir entero sin signo 
	daddi $t5,$0,1
	
	;inicializo el contador y mi variable para imprimir 10,9.8...
    daddi $t4,$0,10 
	
	loop: sd $t0,0($t3) ; cargo en DATA "Hola "
	      sd $t1,0($t2) ; cargo en CONTROL el 4 para imprimir
		  sd $t4,0($t3) ; cargo en DATA el valor inicial 10
		  sd $t5,0($t2) ; cargo en CONTROL el 1 para imprimir el numero
		  daddi $t4,$t4,-1 ; decremento el contador y el valor 
		  bnez $t4,loop
halt