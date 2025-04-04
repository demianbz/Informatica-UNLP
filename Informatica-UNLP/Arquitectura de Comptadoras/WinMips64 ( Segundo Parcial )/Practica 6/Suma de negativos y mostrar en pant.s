;Calcular suma de negativos y mostrar en pantalla 

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	A: .word -12
	B: .word -18
	
.code 
	ld $t2,DIR_CONTROL($0)
	LD $t3,DIR_DATA($0)
	
	ld $t0,A($0)
	ld $t1,B($0)
	dadd $t4,$t0,$t1 ;sumo los numeros 
	sd $t4,0($t3) ; cargo el resultado en DATA
	daddi $t5,$0,2 ; pongo en t5 el 2
	sd $t5,0($t2) ; cargo el 2 en CONTROL, para imprimir un entero con signo
	
halt