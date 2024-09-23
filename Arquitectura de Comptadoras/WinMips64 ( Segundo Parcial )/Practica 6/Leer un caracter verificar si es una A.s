;Leer caracter verificar si es una "A"

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	cod_A: .ascii "A"
	msjIgual: .asciiz "Ingresaste una A" 
	msjDistinto: .asciiz "No Ingresaste una A"

.code 
	ld $t1,DIR_CONTROL($0)
	ld $t2,DIR_DATA($0)
	
	daddi $t0,$0,9 			; guardo en t0 el valor 9 para leer CARACTERES
	sd $t0,0($t1) 			; mando el 9 a CONTROL 
	lbu $t3,0($t2) 			; cargo el valor en $t3 con LBU
	lbu $t4,cod_A($0) 		; cargo el codigo ascii de la A en t4 
	bne $t3,$t4,distintos 	; si no son iguales salto a distintos
	daddi $t3,$0,msjIgual 	; si son iguales guardo la direccion de msjIgual en t3
	j imprimir 				; salto  a imprimir 
	distintos: daddi $t3,$0,msjDistinto ; si son distintos guardo la direccion de msjDistinto en t3
	imprimir: sd $t3,0($t2) ; guardo la direccion de la cadena en DATA
	daddi $t5,$0,4 			; guardo en t5 el valor 4 para imprimir caracteres 
	sd $t5,0($t1)			;imprimo 

halt
	
	
	
	