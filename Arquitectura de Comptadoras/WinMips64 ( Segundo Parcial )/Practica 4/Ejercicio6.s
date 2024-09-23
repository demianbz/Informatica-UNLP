;6) Escribir un programa que lea tres números enteros A, B y C de la memoria de datos y determine cuántos de ellos son iguales 
;   entre sí (0, 2 o 3). El resultado debe quedar almacenado en la dirección de memoria D. 

.data
	A: .word 2
	B: .word 2
	C: .word 2
	D: .word 0

.code
;Cargo los valores A, B y C en r1,r2,r3 
	ld r1, A(r0)
	ld r2, B(r0)
	ld r3, C(r0)
	
;Inicializo el resultado en 0
	dadd r4,r0,r0
	
;Comparar A y B
	beq r1,r2,IGUALES
	
;Si no son iguales comparo A y C
	beq r1,r3, IGUALES 
	bne r1,r3, DESIGUALES 
	
IGUALES: daddi r4,r4,1 

;Comparo B y C 
DESIGUALES:	beq r2,r3, IGUALES2 
			bne r2,r3, fin 

IGUALES2: daddi r4,r4,1 
		 
;cargo el valor en D 
fin: sd r4, D(r0)

	
halt



	
	
	