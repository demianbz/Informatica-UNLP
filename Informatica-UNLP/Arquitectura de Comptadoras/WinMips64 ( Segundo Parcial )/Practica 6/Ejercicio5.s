; 5) Escriba un programa que calcule el resultado de elevar un valor en punto flotante a la potencia indicada por un 
; exponente que es un número entero positivo. Para ello, en el programa principal se solicitará el ingreso de la base (un 
; número en punto flotante) y del exponente (un número entero sin signo) y se deberá utilizar la subrutina 
; a_la_potencia para calcular el resultado pedido (que será un valor en punto flotante). Tenga en cuenta que 
; cualquier base elevada a la 0 da como resultado 1. Muestre el resultado numérico de la operación en la salida estándar 
; del simulador (ventana Terminal). 

.data
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008 
	resultado: .double 0.0 
	uno: .double 1.0

.code 
	ld $s0, DIR_CONTROL($0)
	ld $s1, DIR_DATA($0)
	
	daddi $t0,$0,8				; codigo para leer un numero
	daddi $t7,$0,3 				; codigo para imprimir un flotante 
	l.d f2,uno($0)				; cargo en f2 el valor uno para usarlo como inmediato 
	;BASE
	sd $t0,0($s0)				; mando el 8 a CONTROL para leer un numero 
	l.d f0,0($s1)				; cargo en f0 (con l.d porque es un flotante) la base ingresada 
	;EXPONENTE 
	sd $t0,0($s0)				; mando el 8 a CONTROL para leer un numero 
	ld $a0,0($s1)				; cargo en a0 el exponente ingresado 
	jal a_la_potencia			; llamo a la subrutina 
	s.d f2,0($s1)				; cargo lo que hay en f2 (resultado) en DATA 
	s.d f2,resultado($0)        ; cargo lo que hay en f2 en memoria 
	sd $t7,0($s0)				; mando el 3 a CONTROL pra imprimir el flotante (resultado)
	
halt


a_la_potencia: beqz $a0,fin 	     ; si el numero ingresado ( exponente ) es 0 salto a fin 
		 loop: mul.d $f2,f2,f0  	 ; sumo f2(1 la primera vez) + el numero flotante ingresado y lo guardo en f2
			   daddi $a0,$a0,-1		 ; decremento el exponente que es la cantidad de veces que voy a hacer el loop
			   bnez $a0,loop         ; mientras a0 no sea 0 salto al loop
			   
fin: jr $ra 