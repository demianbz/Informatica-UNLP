;Definir 2 variables, A y B, con valores 4 y 5
;Definir una variable, C, sin un valor, cargar
;Los valores de A y B en registros, sumar los 
;valores y guardar el resultado en C, utilizar
;un desplazamiento desde A, para cargar B

.data
	A: .word 4 ; 00h
	B: .word 5 ; 08h
	C: .word 0 ; 10h (16 decimal)

.code	
	daddi r5, r0, 0 ; mov r2,0
 	ld r1, A(r5) ; mov r1, A
	daddi r5, r0, 8 ; mov r5, 8
	ld r2, A(r5) ; mov r2,A
	
	dadd r3, r1, r2 ; sumo r1(A),con r2(B) y guardo en r3
	
	daddi r5, r0, 16
	sd r3, A(r5) ; guardo la suma en C   
	
halt