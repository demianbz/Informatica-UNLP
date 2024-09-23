;3) *Escribir un programa que calcule la superficie de un triángulo rectángulo de base 5,85 cm y altura 13,47 cm. 
;    Pista: la superficie de un triángulo se calcula como: 
;    Superficie = (base x altura) / 2

.data
	base: .double 5.85
	altura: .double 13.47
	num2: .double 2
	resultado: .double 0
	
.code
	l.d f1,base(r0)
	l.d f2,altura(r0)
	l.d f3,num2(r0)
	;Base x altura
	mul.d f4,f1,f2 
	;Base x altura / 2
	div.d f5,f4,f3
	;Guardo Resultado en resultado
	s.d f5,resultado(r0)
halt
	