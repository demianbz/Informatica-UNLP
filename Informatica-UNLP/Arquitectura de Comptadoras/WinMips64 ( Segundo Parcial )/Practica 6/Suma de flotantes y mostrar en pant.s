;Calcular suma de flotantes y mostrar en pantalla 

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	A: .double 3.5
	B: .double 3.5
	
.code 
	ld $t2,DIR_CONTROL($0)
	ld $t3,DIR_DATA($0)
	
	l.d f0,A($0)
	l.d f1,B($0)
	add.d f4,f0,f1 ;sumo los numeros 
	s.d f4,0($t3) ; cargo el resultado en DATA
	daddi $t5,$0,3 ; pongo en t5 el 3
	sd $t5,0($t2) ; cargo el 3 en CONTROL, para imprimir un flotante
	
halt