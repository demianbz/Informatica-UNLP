;Calcular suma de enteros y mostrar en pantalla 

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	A: .word 9 
	B: .word 12
	
.code 
	ld $t2,DIR_CONTROL($0)
	LD $t3,DIR_DATA($0)
	
	ld $t0,A($0)
	ld $t1,B($0)
	dadd $t4,$t0,$t1 ;sumo los numeros 
	sd $t4,0($t3) ; cargo el resultado en DATA
	daddi $t5,$0,1 ; pongo en t5 el 1
	sd $t5,0($t2) ; cargo el 1 en CONTROL, para imprimir un entero sin signo 
	
halt