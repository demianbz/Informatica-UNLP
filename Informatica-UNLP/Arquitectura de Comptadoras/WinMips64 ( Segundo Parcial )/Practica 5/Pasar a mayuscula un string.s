;Pasar a Mayuscula una cadena de caracteres
.data
	cadena: .asciiz "Hola"
.code
	;Iniciar SP porque lo vamos a utilizar
	daddi $sp, $0, 0x400
	;Parametro: direccion de la cadena
	daddi $a0,$0,cadena
	JAL mayus
halt

;recibe 
;$a0: direcccion de comienzo

mayus: daddi $sp,$sp,-16 
	   sd $ra,0($sp) 
	   sd $s0,8($sp) 
	   dadd $s0,$a0,$0 
 loop: lbu $a0,0($s0) 
   	   beq $a0,$0,fin 
	   JAL mayusCar 
	   sb $v0,0($s0) 
	   daddi $s0,$s0,1 
	   j loop 
  fin: ld $ra, 0($sp) 
	   ld $s0,8($sp)
	   daddi $sp,$sp,16
	   jr $ra 
;recibe en $a0 caracter
;devuelve en $v0 caracter mayuscula 
;0x61 : ascii de "a"
;0x7b : ascii de "z"
;0x20 : distancia  entre mayusculas y minusculas 

mayusCar: dadd $v0,$a0,$0 
		  slti $t0,$v0, 0x61
		  bnez $t0, salir 
		  slti $t0,$v0,0x7b 
		  beqz $t0,salir 
		  daddi $v0,$v0,-0x20 
   salir: jr $ra 
	   
	   