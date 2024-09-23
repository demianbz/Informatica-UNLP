;while a > 0 do 
;begin 
; x := x + y; 
; a := a - 1; 
;end

.data
	a: .word 5
	x: .word 2
	y: .word 1
	
.code 
	ld r1,a(r0)
	ld r2,x(r0)
	ld r3,y(r0)
	beqz r1,fin
	loop: dadd r2,r2,r3
		  bnez r1,loop
		  daddi r1,r1,-1
	
fin: halt