;Leer dos numeros por teclado, imprimir suma

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	
.code 
;inicializo CONTROL y DATA
	ld $t1, DIR_CONTROL($0)
	ld $t2, DIR_DATA($0)
	
;pongo el valor 8 en t0, para leer numeros 
	daddi $t0,$0,8
;guardo el valor 8 en CONTROL para ingresar el numero 
	sd $t0,0($t1) 
;me guardo el valor ingresado que quedo almacenado en DATA
	ld $t3,0($t2) 
;guardo el valor 8 en CONTROL para ingresar el numero 
	sd $t0,0($t1)
;me guardo el valor ingresado que quedo almacenado en DATA
	ld $t4,0($t2) 
	
;sumo los valores 
	dadd $t5,$t3,$t4 
	
;guardo el valor en DATA
	sd $t5,0($t2)
	
;guardo el valor 1 en t6 para imprimir 
	daddi $t6,$0,1
	
;mando el valor a CONTROL para imprimir
	sd $t6,0($t1)
	
halt