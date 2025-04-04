; 2) Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el 
; ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La 
; segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del 
; número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje 
; de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones 
; del cauce (ejercicio similar al ejercicio 6 de Práctica 2). 

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008 
	zero: .word 0
	msj: .asciiz "Ingrese un numero (de un digito): "
	msjNoDigito: .asciiz "No ingresaste un digito" 
	digitos: .word 0,1,2,3,4,5,6,7,8
	CERO: .asciiz "CERO"
	UNO: .asciiz "UNO"
	DOS: .asciiz "DOS"
	TRES: .asciiz "TRES"
	CUATRO: .asciiz "CUATRO"
	CINCO: .asciiz "CINCO"
	SEIS: .asciiz "SEIS"
	SIETE: .asciiz "SIETE"
	OCHO: .asciiz "OCHO"
	NUEVE: .asciiz "NUEVE"
	
	
.code 	
	;Inicializo CONTROL y DATA
	ld $a1,DIR_CONTROL($0)			; guardo DIR_CONTROL en $a1 para usarlo como pasaje de parametro a la subrutina	
	ld $a2,DIR_DATA($0)				; guardo DIR_DATA en $a2 para usarlo como pasaje de parametro a la subrutina
	
	;PASAJES DE PARAMETROS 
	daddi $a0,$0,8					; guardo el valor 8, que es el codigo para leer un numero, en a0
	daddi $a3,$0,4					; guardo en a3 el valor 4 que es el codigo para imprimir caracteres 
	
	;LLAMO A SUBRUTINA INGRESO
	jal ingreso 
	
	;ME FIJO SI EL CARACTER FUE UN DIGITO
	ld $t7,zero($0)					; cargo en t7 el valor 0
	beq $v1,$t7,hlt					; si v1 es igual a 0 significa que el caracter ingresado no fue un digito y salto a el final
		
	;PASAJES DE PARAMETROS 
	daddi $a0,$0,CERO            	; guardo la direccion de CERO en a0 para mandarlo a la subrutina
	daddi $a3,$0,digitos		    ; guardo la direccion de digitos en a3 para mandarlo a la subrutina
	
	;LLAMO A LA SUBRUTINA MUESTRA 
	jal muestra 
	
hlt: halt 

	ingreso: daddi $t0,$0,msj       ; guardo en t0 la direccion de msj para imprimir el mensaje 
			 sd $t0,0($a2) 			; guardo la direccion del mensaje en DATA 
			 sd $a3,0($a1)			; mando el valor 4 para imprimir 
			 sd $a0,0($a1)			; mando el valor 8 a CONTROL
			 ld $t1,0($a2)			; me guardo el valor ingresado, que se guarda en DATA, en t1	
			 slti $t3,$t1,1		    ; comparo el valor ingresado con 0, si es menor guardo 1 en t3
			 bnez $t3,no_es_dig		; si t3 no es igual a cero(1) el valor ingresado es menor a 1 (fuera de rango) salto a no es digito 
			 slti $t4,$t1,9		    ; comparo el valor ingresado con 10, si es menor guardo 1 en t3 
			 beqz $t4,no_es_dig		; si t4 es igual a cero, el valor ingresado es mayor a 10 (fuera de rango) salto a no es digito 
			 
			 ;Es un digito  	
			 dadd $v0,$0,$t1 		; si es un digito la subrutina retorna el digito en v0 y un 1 en v1
			 daddi $v1,$0,1
			 j fin 
			 
  no_es_dig: daddi $t5,$0,msjNoDigito
			 sd $t5,0($a2)
			 sd $a3,0($a1) 
			
		fin: jr $ra 
			 
			 
	
	muestra: daddi $t0,$0,0                     ; uso t0 para desplazarme en digitos e ir comparando
			 daddi $t1,$0,0	
			 daddi $t5,$0,10					; elementos de la cadena 
		     loop2: ld $t1,digitos($t0)	        ; cargo en t1,el numero 0 de digitos con desplazamiento $t0, despues el 1,2,3...
					beq $v0,$t1,imprimir        ; comparo el digito ingresado,con el valor de la cadena, si son iguales imprimo
					daddi $t0,$t0,8             ; aumento en 1 el registro que uso como desplazamiento para ir al siguiente elemento
					daddi $a0,$a0,8				; le sumo 8 a mi variable a0 que es donde tengo el comienzo de que valor a imprimir y sumandole ocho avanzo al siguiente
					daddi $t5,$t5,-1            ; decremento los elementos de la cadena
					bnez $t5,loop2              ; mientras t5 no sea 0 vuelvo al loop 
				
			;IMPRIMIR 
		  imprimir: sd $a0,0($a2) 				; guardo en DATA a0 que tiene la direccion de lo que voy a imprimir 
					daddi $t2,$0,4              ; guardo en t2 el codigo 4 para imprimir un caracter
					sd $t2,0($a1) 				; mando el codigo a CONTROL para imprimir 
			
			final: jr $ra