;Mostrar en pantalla un vector de numeros 

.data
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	V: .word 9,12,18,3,1,0,7
	
.code 
	ld $t5,DIR_CONTROL($0)
	ld $t6,DIR_DATA($0)
	
	;cargo en  t4 el 2 para imprimir enteros con signo
	daddi $t4,$0,2
	;cargo en t1 la cantidad de elementos del vector 
	daddi $t1,$0,7 
	;inicializo t2 en 0 para usarlo como desplazamiento 
	daddi $t2,$0,0
	
	loop: ld $t0,V($t2)
		  ;guardar el valor en DATA
		  sd $t0,0($t6)
		  ;cargo codigo 2 en control
		  sd $t4,0($t5)
		  daddi $t2,$t2,8 ; desplazamiento
		  daddi $t1,$t1,-1 ; elementos del vector
		  bnez $t1,loop
halt	  
	