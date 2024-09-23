;4) El índice de masa corporal (IMC) es una medida de asociación entre el peso y la talla de un individuo. 
;	Se calcula a partir del peso (expresado en kilogramos, por ejemplo: 75,7 kg) y la estatura (expresada en metros, 
;	por ejemplo 1,73 m), usando la fórmula: 
;	IMC = peso / (estatura)^2
;	De acuerdo al valor calculado con este índice, puede clasificarse el estado nutricional de una persona en:
;	Infrapeso (IMC < 18,5), Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30). 
;   Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde en la dirección 
;	etiquetada IMC. También deberá guardar en la dirección etiquetada estado un valor según la siguiente tabla:
;	Infrapeso = 1,  Normal = 2,  Sobrepeso = 3,  Obeso = 4

.data 
	peso: .double 79.5
	altura: .double 1.73
	IMC: .double 0
	ESTADO: .word 0
	num18: .double 18.5
	num25: .double 25
	num30: .double 30
	
.code
	;CARGAR EL PESO Y LA ESTATURA 
	
	l.d f1,peso(r0)
	l.d f2,altura(r0) 
	
	;CARGAR LAS CONSTANTES 
	
	l.d f3,num18(r0)
	l.d f4,num25(r0)
	l.d f5,num30(r0)
	daddi r1,r0,0 
	
	;CALUCLO EL IMC
	mul.d f2,f2,f2 ; altura ^2
	div.d f6,f1,f2 ; peso/altura^2 y lo guardo en f6 
	s.d f6,IMC(r0)
	
	;CLASIFICAR EL ESTADO 
	c.lt.d f6,f3 ; pone FP en 1 si el IMC es menor a 18.5 
	bc1t Infrapeso ; si FP = 1 salto a Infrapeso
	
	;NORMAL 
	daddi r1,r0,2
	c.lt.d f6,f4 ; pone FP en 1 si el IMC es menor a 25 
	bc1t fin ; si FP = 1 salto a fin (osea que ESTADO = NORMAL)
	
	;SOBREPESO 
	daddi r1,r0,3
	c.lt.d f6,f5 ; pone FP en 1 si el IMC es menor a 30
	bc1t fin ; si FP = 1 salto a fin (osea que ESTADO = SOBREPESO)
	
	;OBESO 
	daddi r1,r0,4 
	j fin 
	
	Infrapeso: daddi r1,r1,1
			   j fin		
			   
	fin: sd r1,ESTADO(r0)
halt
	