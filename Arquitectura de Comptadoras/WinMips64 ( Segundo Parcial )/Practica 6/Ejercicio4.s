; 4) Escriba un programa que solicite el ingreso por teclado de una clave (sucesión de cuatro caracteres) utilizando la 
; subrutina char de ingreso de un carácter. Luego, debe comparar la secuencia ingresada con una cadena almacenada 
; en la variable clave. Si las dos cadenas son iguales entre si, la subrutina llamada respuesta mostrará el texto 
; “Bienvenido” en la salida estándar del simulador (ventana Terminal). En cambio, si las cadenas no son iguales, la 
; subrutina deberá mostrar “ERROR” y solicitar nuevamente el ingreso de la clave.

.data
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	clave: .asciiz "abcd"
	ingreso: .asciiz "...."
	msj: .asciiz "Ingrese la Clave ( De 4 Caracteres ) :" 
	bien: .asciiz "Bienvenido"
	mal: .asciiz "Error" 
	
.code
	; INICIALIZO CONTROL y DATA 	
	
	ld $a1,DIR_CONTROL($0)
	ld $a2,DIR_DATA($0) 
	
	; PASAJE DE PARAMETROS Y LLAMADA A LA SUBRUTINA 
	
	daddi $a0,$0,msj 					; cargo en a0 la direccion de comienzo del mensaje para mandarlo a la subrutina
	daddi $a3,$0,4						; cargo en a3 el codigo para imprimir un string 
	jal char 
	
	; COMPARACION CON LA CLAVE PREDEFINIDA

	daddi $t6,$0,0  							; inicializo mi contador en 0
	daddi $t0,$0,0								; inicializo mi desplazamiento 
	daddi $t1,$0,4								; inicializo la cantidad de elementos 
	
	loop2: lbu $t4,clave($t0) 					; cargo el caracter de la clave predefinifa en t4 
		   lbu $t5,ingreso($t0)					; cargo el caracter de la clave ingresada en t5 
		   bne $t5,$t4,sig						; comparo los caracteres, si no son iguales salto al siguiente caracter 
	       daddi $t6,$t6,1						; si son iguales sumo a mi contador 1 
      sig: daddi $t0,$t0,1						; avanzo en las cadenas	
	       daddi $t1,$t1,-1						; decremento la cantidad de elementos
	       bnez $t1,loop2						; mientras t1 no sea 0 salto a loop
	
	daddi $t7,$t7,4
	beq $t7,$t6,iguales 
	daddi $a3,$0,0
	jal respuesta 
	j hlt
	iguales: daddi $a3,$0,1
			 jal respuesta 
	 
hlt: halt 

char: daddi $t1,$0,4					; cantidad de elementos que voy a cargar
	  daddi $t2,$0,9					; codigo para leer caracteres 
      daddi $t0,$0,0					; regitro que voy a usar como desplazamiento 
	  sd $a0,0($a2) 
	  sd $a3,0($a1) 
	  
	  ; INGRESO DE LA CLAVE 
	  
	  loop1: sd $t2,0($a1) 				; mando el 9 a CONTROL para leer caracter 
			lbu $t3,0($a2)				; me guardo el caracter ingresado en t3 (con lbu en vez de ld porque es un caracter)
			sb $t3,ingreso($t0)			; cargo el valor ingresado en memoria, con desplazamiento t0 (con sb en vez de sd porque es un caracter)
			daddi $t0,$t0,1				; avanzo en la cadena 
			daddi $t1,$t1,-1			; decremento cantidad de elementos 
			bnez $t1,loop1				; mientras la cantidad de elementos no sea 0 salto a loop, si es 0 termino 
		
	jr $ra 
			

respuesta: beqz $a3,error 
		   daddi $t2,$0,bien
		   sd $t2,0($a2)
		   daddi $t3,$0,4
		   sd $t3,0($a1)
		   j final
		   
		   error: daddi $t2,$0,mal 
				  sd $t2,0($a2)
				  daddi $t3,$0,4
				  sd $t3,0($a1) 
				  j final
		
		final: jr $ra 