;8) Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y 
;retorne la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe retornar -1.

.data
	cadena1: .asciiz "holaa"
	cadena2: .asciiz "holas"
	result: .word 0
.code
	daddi $a0, $0, cadena1
	daddi $a1, $0, cadena2
	jal compara
	sd $v0, result($zero)
 halt
	compara: dadd $v0, $0, $0
	loop: lbu $t0, 0($a0)
	lbu $t1, 0($a1)
	beqz $t0, fin_a0
	beqz $t1, final
	bne $t0, $t1, final
	daddi $v0, $v0, 1
	daddi $a0, $a0, 1
	daddi $a1, $a1, 1
	j loop
	fin_a0: bnez $t1, final
	daddi $v0, $0, -1
 final: jr $ra