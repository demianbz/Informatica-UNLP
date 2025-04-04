;1) El siguiente programa produce la salida de un mensaje predefinido en la ventana Terminal del simulador 
;WinMIPS64. Teniendo en cuenta las condiciones de control del puerto de E/S (en el resumen anterior), modifique el 
;programa de modo que el mensaje a mostrar sea ingresado por teclado en lugar de ser un mensaje fijo. 

.data 
	texto: .asciiz "Hola, Mundo!"   ; El mensaje a mostrar
	CONTROL: .word 0x10000 
	DATA: .word 0x10008 
 
.text 
	ld $t2, DATA($zero) 			
	ld $t1, CONTROL($zero) 		    
	daddi $t0,$0,12 				; cantidad de elementos que voy a ingresar
	daddi $t3,$0,0					; desplazamiento 
	daddi $t4,$0,9					; codigo para leer caracteres 
	
	loop: sd $t4,0($t1)				; mando el codigo a CONTROL
	      lbu $t5,0($t2)			; guardo el valor ingresado en t5 
		  sb $t5,texto($t3)			; guardo el caracter en texto con desplazamiento t3
		  daddi $t3,$t3,1			; incremento el desplazamiento 
		  daddi $t0,$t0,-1			; decremento los elementos que tego que ingresar 
		  bnez $t0,loop
		  
	;imprimir 
	
	daddi $t6,$0,texto		; guardo en t6 el inicio de la cadena 
	sd $t6,0($t2)					; cargo en DATA el inicio de la cadena 
	daddi $t7,$0,4					; guardo en t7 el valor 4 para imprimir caracteres 
	sd $t7,0($t1)					; imprimo
	
halt 
