;Leer 5 numeros por teclado , almacenarlos en memoria

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	vec: 0,0,0,0,0
	
.code 
;inicializo CONTROL y DATA
	ld $t1, DIR_CONTROL($0)
	ld $t2, DIR_DATA($0)
;me guardo el valor 8 en t0 para leer num 
	daddi $t0,$0,8 
;desplazamiento 
	daddi $t2,$0,0
;cantidad de elementos del vector
	daddi $t3,$0,5
	
    loop: sd $t0,($t1) ; guardo en CONTROL el 8
		  ld $t4,0($t2) ; guardo el valor en t4, que esta guardado en DATA 
		  sd $t4,vec($t2) ; guardo el valor en el vector 
		  daddi $t2,$t2,8
		  daddi $t4,$t4,-1
		  bnez $t4,loop
	
halt
		  