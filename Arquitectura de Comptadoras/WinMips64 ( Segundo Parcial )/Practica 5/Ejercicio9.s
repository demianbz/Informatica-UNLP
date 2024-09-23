;9) Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no, ya sea mayúscula o minúscula. La rutina 
;debe recibir el carácter y debe retornar el valor 1 si el carácter es una vocal, o 0 en caso contrario

.data
	letra: .ascii 'O'
	vocales: .asciiz 'AEIOUaeiou'
	result: .word 0
.code 
    lbu $a0, letra($0)
	jal es_vocal
	sd $v0, result($zero)
	halt
	
es_vocal: dadd $v0, $0, $0
	      daddi $t0, $0, 0
		  loop: lbu $t1, vocales($t0)
		  beqz $t1, fin_vocal
		  beq $a0, $t1, si_es_voc
		  daddi $t0, $t0, 1
		  j loop
si_es_voc: daddi $v0, $0, 1
fin_vocal: jr $ra