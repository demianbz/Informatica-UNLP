;definir 2 variables, A y B, con valores 4 y 5
;definir variables, C y D, sin un valor
;calcular C = A+2*B y D = C/A+1

.data
A: .word 4
B: .word 5 
C: .word 0
D: .word 0

.code

ld r1,A(r0) ; mov r1,A
ld rd,B(r0) ; mov r2,B

daddi r3,r0,2 ; r3 = 2
dmul r4,r3,r2 ; r4 = 2*B
dadd r5,r1,r4 ; r5 = A+2*B
sd r5,(r0) ; mov C,r5

ddiv r6,r5,r1 ; r6 = C/A
daddi r6,r6,1 ; r6 = r6+1
sd r6,D(r0) ; mov D,r6

halt