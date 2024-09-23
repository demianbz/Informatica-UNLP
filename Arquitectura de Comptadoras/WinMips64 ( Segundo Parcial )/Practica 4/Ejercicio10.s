;10) Escribir un programa que cuente la cantidad de veces que un determinado caracter aparece en una cadena de texto. Observar 
;cómo se almacenan en memoria los códigos ASCII de los caracteres (código de la letra “a” es 61H). Utilizar la instrucción lbu 
;(load byte unsigned) para cargar códigos en registros. La inicialización de los datos es la siguiente: 

.data 
	cadena: .asciiz "adbdcdedfdgdhdid" 
	car: .asciiz "d" 
	cant: .word 0 
	elementos: .word 16
	
.code
	lbu r2,car(r0)
	ld r3,cant(r0)
	daddi r4,r0,0
	ld r5, elementos(r0)
	
	loop: lbu r1,cadena(r4)
		  bne r1,r2,sig
		  daddi r3,r3,1
	 sig: daddi r4,r4,8
	      daddi r5,r5,-1
		  bnez r5,loop
		  
	sd r3,cant(r0)
halt
	