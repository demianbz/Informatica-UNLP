;7) Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una 
;tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla. 
;La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla. 

.data
	M: .word 17
	TABLA: .word 10 15 8 24 9 12 50 19
	ELEMENTOS: .word 8
	Cant: .word 0
	
.code 	
	daddi $a0,$0,TABLA 
	ld $a1,M($zero)
	ld $a2,ELEMENTOS($zero)
	jal MayoresM
	sd $v0,Cant($zero)
halt 

MayoresM: dadd $v0,$0,$0 	
	loop: lbu $t1,0 ($a0)
		  slt $t2,$t1,$a1
		  bnez $t2,sig 
		  daddi $v0,$v0,1
	 sig: daddi $a0,$a0,8
	      daddi $a2,$a2,-1
		  bnez $a2,loop
          jr $ra