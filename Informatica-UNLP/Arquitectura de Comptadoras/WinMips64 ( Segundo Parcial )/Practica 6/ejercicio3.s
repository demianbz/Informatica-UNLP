; 3) Escriba un programa que realice la suma de dos números enteros (de un dígito cada uno) utilizando dos subrutinas: La 
; denominada ingreso del ejercicio anterior (ingreso por teclado de un dígito numérico) y otra denominada 
; resultado, que muestre en la salida estándar del simulador (ventana Terminal) el resultado numérico de la suma de 
; los dos números ingresados (ejercicio similar al ejercicio 7 de Práctica 2). 

.data
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	
.code 
	ld $a1,DIR_CONTROL($0)
	ld $a2,DIR_DATA($0)
	
	daddi $a0,$0,8				; guardo el 8, codigo para leer un numero 
	jal ingreso 				
	dadd $a3,$0,$v0 			; guardo el primer valor ingresado en a3 
	jal ingreso 
	dadd $a0,$0,$v0 			; guardo el segundo valor ingresado en a0
	jal resultado 
	
halt 

ingreso: sd $a0,0($a1)			; mando el 8 a control 
		 ld $t1,0($a2)			; cargo el valor ingresado en t1 
		 dadd $v0,$0,$t1 		; la subrutina devuelve el valor ingresado en v0 
		 jr $ra 
		 
resultado: dadd $t2,$a3,$a0		; sumo los valores 
		   sd $t2,0($a2)		; cargo en DATA el resultado de la suma 
		   daddi $t3,$0,1		; guardo en t3 el valor uno que es para imprimir caracteres 
		   sd $t3,0($a1)		; mando el 1 a CONTROL para imprimir 
		   jr $ra 