.data
	TABLA: .word 2,12,6,9,25,3,17,32,1,50
	RES: .word 0
	X: .word 20
	CANT: .word 0
	LONG: .word 10
	
.code
	ld r2,CANT(r0)
	ld r3,LONG(r0)
	daddi r4,r4,0 
	ld r5,X(r0)
	daddi r7,r7,1
	daddi r8,r8,0
	loop: ld r1, TABLA(r4)
		  ;Comparo el elemento de la tabla(r1) con X(r5)
		  slt r6,r1,r5
		  ;compara si r1,es menor que r5,si es menor r6=1, sino r6=0
		  bnez r6,menor 
		  daddi r2,r2,1
		  sd r7,RES(r0)
		  menor: daddi r4,r4,8
				 daddi r3,r3,-1
				 sd r8,RES(r0)
				 bnez r3,loop
	
	;guardar el valor en CANT
	sd r2,CANT(r0)

halt
		  