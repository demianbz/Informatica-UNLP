;Utilizar un registro como puntero ( no desplazamiento ) para acceder
;a los elementos del vector, guardar el resultado en una variable C
;Asumir que V tiene los elementos 2,4,9 para probar el programa

.data
	V: .word 2, 4, 9
	C: .word 0
	
.code
	daddi r2,r0,0 ;resultado
	daddi r3,r0,3 ; elementos del vector
	
	daddi r5,r0,V 
	loop: ld,r1,0(r5)
		  dadd r2,r2,r1 ; r2=r2+r1
		  daddi r5,r5,8
		  daddi r3,r3,-1 ; r3=r3-1
		  bnez r3, loop
	
	sd r2, C(r0)
	
halt
		  