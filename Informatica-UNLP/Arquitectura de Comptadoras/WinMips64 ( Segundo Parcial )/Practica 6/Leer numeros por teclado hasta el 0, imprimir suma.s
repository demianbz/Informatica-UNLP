;Leer numeros por teclado hasta el 0, imprimir suma

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	
.code 
;inicializo CONTROL y DATA
	ld $t1, DIR_CONTROL($0)
	ld $t2, DIR_DATA($0)
;me guardo el valor 8 en t0 para leer num 
	daddi $t0,$0,8 
;inicializo la suma en 0
	daddi $t3,$0,0
	loop: sd $t0,0($t1) ; mando el 8 a CONTROL  
		  ld $t4,0($t2) ; me guardo el valor leido que quedo en DATA 
		  beqz $t4,fin ; si el valor es 0 termino 
		  dadd $t3,$t3,$t4 ; hago la suma 
		  j loop 
		  
	fin: sd $t3,0($t2) ; mando el valor a DATA 
		 daddi $t5,$0,1 ; guardo el 1 para imprimir
		 sd $t5,0($t1) ; imprimo 
		 
halt