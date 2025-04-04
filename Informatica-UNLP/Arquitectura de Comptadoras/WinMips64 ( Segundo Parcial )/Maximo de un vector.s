;Definir un vector de 5 numeros V
;Calcular el maximo valor del vector y guardarlo en una variable C
; Asumir que V tiene los elementos 4,10,512,8,16 para probar el programa

.data
	V: .word 4, 10, 512, 8, 16
	C: .word 0
	
.code
	daddi r2,r0,0 ;maximo 
	daddi r3,r0,5 ; elementos del vector
	daddi r5,r0,0 ;desplazamiento
	loop: ld r1,V(r5)
		  slt r4,r1,r2 ; si r1 es menor que r2(el maximo)  => r4=1
		  bnez r4,min ; si r4 es 0 salto (osea es menor ,salto a seguir)
		  daddi r2,r1,0 ; r2 = r1
	min:  daddi r5,r5,8
		  daddi r3,r3,-1 ; r3=r3-1
		  bnez r3, loop
	
	sd r2, C(r0)
	
halt
		  