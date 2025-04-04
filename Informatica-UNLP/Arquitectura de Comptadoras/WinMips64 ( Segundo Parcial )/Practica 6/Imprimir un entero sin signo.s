;Imprimir un entero sin Signo 

.data 
	DIR_CONTROL: .word 0x10000
	DIR_DATA: .word 0x10008
	num: .word 7
	
.code
	ld $t2,DIR_CONTROL($0)
	ld $t3, DIR_DATA($0)
	
	ld $t1,num($0) ; cargo el numero 
    sd $t1,0($t3) ; guardo en DATA el numero 
	daddi $t1,$0,1 ; cargo en t1 el valor 1 que es para imprimir un entero sin signo 
	sd $t1,0($t2) ; guardo en CONTROL el valor 1 para imprimir 
halt 
	