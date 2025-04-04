; 6) El siguiente programa produce una salida estableciendo el color de un punto de la pantalla gráfica (en la ventana 
; Terminal del simulador WinMIPS64). Modifique el programa de modo que las coordenadas y color del punto sean 
; ingresados por teclado. 


.data 
	coorX: .byte 0 					; coordenada X de un punto 
	coorY: .byte 0 					; coordenada Y de un punto 
	color: .byte 255, 0, 255, 0 		; color: máximo rojo + máximo azul => magenta 
	CONTROL: .word32 0x10000 
DATA: .word32 0x10008 
 
.text 
	lwu $s6, CONTROL($zero) 			; $s6 = dirección de CONTROL 
	lwu $s7, DATA($zero) 				; $s7 = dirección de DATA 
	
;INGRESO DE LAS COORDENADAS 
	
	;Coordenada X
	daddi $t1,$0,8						; cargo en t1 el valor 8 para leer un numero
	sd $t1,0($s6)						; mando el 8 a CONTROL
	ld $s0,0($s7)						; cargo en s0 el valor ingresado 
	sd $s0,coorX($0)					; mando el valor ingresado a coorX
	
	;Coordenada Y
	sd $t1,0($s6)						; mando el 8 a CONTROL para leer un num 
	ld $s1,0($s7)						; cargo en s1 el valor ingresado 
	sd $s1,coorY($0)					; mado el valor ingresado a coorY 
	
	
	
	daddi $t0, $zero, 7 				; $t0 = 7 -> función 7: limpiar pantalla gráfica 
	sd $t0, 0($s6) 						; CONTROL recibe 7 y limpia la pantalla gráfica 
	lbu $s0, coorX($zero)			 	; $s0 = valor de coordenada X 
	sb $s0, 5($s7) 						; DATA+5 recibe el valor de coordenada X 
	lbu $s1, coorY($zero) 				; $s1 = valor de coordenada Y 
	sb $s1, 4($s7) 						; DATA+4 recibe el valor de coordenada Y 
	lwu $s2, color($zero) 				; $s2 = valor de color a pintar 
	sw $s2, 0($s7) 						; DATA recibe el valor del color a pintar 
	daddi $t0, $zero, 5 				; $t0 = 5 -> función 5: salida gráfica 
	sd $t0, 0($s6) 						; CONTROL recibe 5 y produce el dibujo del punto 
halt