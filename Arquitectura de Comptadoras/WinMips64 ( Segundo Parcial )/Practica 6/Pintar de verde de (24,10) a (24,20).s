;Pintar de verde de (24,10) a (24,20)

.data
	coordX: .byte 24 					; Coordenada X de un punto 
	coordY: .byte 10 		 			; Coordenada Y de un punto 
	color: .byte 0, 255, 0, 0 		; ROJO=0, VERDE=255, AZUL=0  
	DIR_CONTROL: .word 0x10000			
	DIR_DATA: .word 0x10008
	
.code 
	ld $t1,DIR_CONTROL($0) 
	ld $t2,DIR_DATA($0)
	
	;Cargo la coord X y el color 
	lbu $s0,coordX($0)					; cargo en s0 la coordenada X
	sb $s0,5($t2)						; cargo en DATA+5 la coord X
	lwu $s2, color($0)					; cargo en s2 el color 
	sw $s2,0($t2)						; cargo en DATA el color 
	daddi $t0,$0,5 						; cargo en s3 el 5 que es el codigo para pintar un pixel 

	;Coordenada Y
	lbu $s1,coordY($0)					; cargo en s1 la coordenada Y
	loop: sb $s1,4($t2)					; cargo en DATA +4 la coord Y
		  sd $t0,0($t1)					; mando el 5 a CONTROL para pintar un pixel 
		  daddi $s1,$s1,1				; aumento en 1 la coordenada Y
		  slti $s3,$s1,21				; comparo la coord Y con 21 si es menor guardo un 1 en s3, si es mayor un 0 en s3 
		  bnez $s3,loop					; mientras s3 no sea cero salto a el loop
	
halt