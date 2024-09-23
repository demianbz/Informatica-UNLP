;Pintar el pixel (24,10) de Violeta 

.data
	coordX: .byte 24 					; Coordenada X de un punto 
	coordY: .byte 10 		 			; Coordenada Y de un punto 
	color: .byte 255, 0, 255, 0 		; ROJO=255, VERDE=0, AZUL=255, Rojo + Azul = Violeta 
	DIR_CONTROL: .word 0x10000			
	DIR_DATA: .word 0x10008
	
.code 
	ld $t1,DIR_CONTROL($0) 
	ld $t2,DIR_DATA($0)
	
	lbu $s0,coordX($0)					; cargo en s0 la coordenada X
	sb $s0,5($t2)						; cargo en DATA+5 la coord X
	lbu $s1,coordY($0)					; cargo en s1 la coordenada Y
	sb $s1,4($t2)						; cargo en DATA+4 la coord Y
	lwu $s2, color($0)					; cargo en s2 el color 
	sw $s2,0($t2)						; cargo en DATA el color 
	daddi $s3,$0,5 						; cargo en s3 el 5 que es el codigo para pintar un pixel 
	sd $s3,0($t1)						; mando el 5 a CONTROL
halt