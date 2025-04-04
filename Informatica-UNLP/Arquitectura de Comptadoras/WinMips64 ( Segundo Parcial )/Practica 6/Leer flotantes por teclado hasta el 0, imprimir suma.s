;Leer flotantes por teclado hasta el 0, imprimir suma

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	cero: .double 0
	
.code 
;inicializo CONTROL y DATA
	ld $t1, DIR_CONTROL($0)
	ld $t2, DIR_DATA($0)
;me guardo el valor 8 en t0 para leer num 
	daddi $t0,$0,8 
;inicializo la suma en 0
	l.d f0,cero($0)
;inicializo valor para comparar 
	l.d f2,cero($0) 
	
	
	loop: sd $t0,0($t1) ; mando el 8 a CONTROL  
		  l.d f1,0($t2) ; me guardo el valor leido que quedo en DATA 
		  c.eq.d f2,f1 ; si el valor es 0 guardo el 1 en fp
		  bc1t fin ; si fp = 1 salto a fin
		  
		  add.d f0,f0,f1 ; hago la suma 
		  
		  j loop 
		  
	fin: s.d f0,0($t2) ; mando el valor a DATA 
		 daddi $t5,$0,3 ; guardo el 3 para imprimir flotantes 
		 sd $t5,0($t1) ; imprimo 
		 
halt