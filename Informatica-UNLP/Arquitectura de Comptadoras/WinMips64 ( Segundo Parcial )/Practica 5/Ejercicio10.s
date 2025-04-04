;10) Usando la subrutina escrita en el ejercicio anterior, escriir la subrutina CONTAR_VOC, que recibe una cadena 
;terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.

.data
	cadena: .asciiz 'holamundo'
	vocales: .asciiz 'AEIOUaeiou'
	result: .word 0
	
.code 
	daddi $sp,$0,0x400
    daddi $a0,$0,cadena 
	jal CONTAR_VOC
	sd $v1, result($zero)
halt
	

CONTAR_VOC: daddi $sp,$sp,-16
			sd $ra,0($sp)
			sd $s0,8($sp)
			dadd $s0,$a1,$0
	  loop: lbu $a0,0($s0)
			beq $a0,$0,fin
			jal es_vocal 
			beqz $v0, sig
			daddi $v1,$v1,1
	   sig: daddi $s0,$s0,1
			j loop 
	   fin: ld $ra,0($sp)
			ld $s0,8($sp)
			daddi $sp,$sp,16
			jr $ra 
		

es_vocal: dadd $v0, $0, $0
	      daddi $t0, $0, 0
  loop2: lbu $t1, vocales($t0)
		  beqz $t1, finvocal
		  beq $a0, $t1, si_es_voc
		  daddi $t0, $t0, 1
		  j loop2
si_es_voc: daddi $v0, $0, 1
finvocal: jr $ra