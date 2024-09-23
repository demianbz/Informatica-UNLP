.data
	control: .word 0x10000
	data: .word 0x10008
	color: .byte 128,128,128,0

.text
	ld $s6,control($0)
	ld $s7,data($0)
	daddi $sp,$sp,0x400     ;incializar 
	jal ingreso
	dadd $a0,$0,$v0
	jal representar_num
halt

	#Leer y guardar ascii
	ingreso: daddi $t0,$0,9 ;funcion 9(leer ascii)
	sd $t0,0($s6)           ;control = funcion 9
	lbu $v0,0($s7)          ;$v0 = ascii leido
	daddi $v0,$v0,-0x30

	##verificar que es un numero
	slti $t0,$v0,0          ;si $v0 < 0 => $t0 = 1 sino $t0 = 0
	bnez $t0,no_num         ;si $t0 = 1 salta sino sigue
	slti $t0,$v0,10         ;si $v0 < 10 => $t0 = 1 sino $t0 = 0
	beqz $t0,no_num         ;si $t0 = 0 salta sino sigue
	j fin

	##si no fue un numero => $v0 = -1
	no_num: daddi $v0,$0,-1
	fin: jr $ra

	representar_num: daddi $sp,$sp,-32  ;pushear registros
	sd  $s0,0($sp)
	sd  $s1,8($sp)
	sd  $s2,16($sp)
	sd  $s3,24($sp)

	##si $a0 = -1 entonces finaliza
	daddi $t1,$0,-1    ;$t1 = -1
	beq $t1,$a0,finaliza                ;si $t1 = $a0 finaliza
	daddi $t0,$0,0                      ;$t0 = 0
	lw $s0,color($0)                    ;guardar el color en $s0
	sw $s0,0($s7)                       ;data = color
	daddi $s0,$0,0
	daddi $t3,$0,5                      ;funcion 5(imprimir pixel)
	##pregunta si es igual a 0
	beqz $a0,cero
	##pregunta si es igual a 1
	daddi $t0,$t0,1
	beq $t0,$a0,passuno
	##pregunta si es igual a 2
	daddi $t0,$t0,1
	beq $t0,$a0,dos
	##pregunta si es igual a 3
	daddi $t0,$t0,1
	beq $t0,$a0,tres
	##pregunta si es igual a 4
	daddi $t0,$t0,1
	beq $t0,$a0,cuatro
	##pregunta si es igual a 5
	daddi $t0,$t0,1
	beq $t0,$a0,cinco
	##pregunta si es igual a 6
	daddi $t0,$t0,1
	beq $t0,$a0,seis
	##pregunta si es igual a 7
	daddi $t0,$t0,1
	beq $t0,$a0,siete
	##pregunta si es igual a 8
	daddi $t0,$t0,1
	beq $t0,$a0,ocho
	##pregunta si es igual a 9
	daddi $t0,$t0,1
	beq $t0,$a0,nueve

	cero: daddi $t9,$0,1    ;flag = 1 si fue cero
	j passcero

	dos: daddi $t7,$0,1     ;flag = 1 si fue dos
	j passdos

	tres: daddi $t6,$0,1    ;flag = 1 si fue tres
	j passtres

	cuatro: daddi $t5,$0,1  ;flag = 1 si fue cuatro
	j passcuatro

	cinco: daddi $t2,$0,1
	j passcinco

	seis: daddi $s0,$0,1
	j passseis

	siete: daddi $s1,$0,1
	j passsiete

	ocho: daddi $s2,$0,1
	j passocho

	nueve: daddi $s3,$0,1
	j passnueve

	num:
	##primera x(x de abajo)
	passocho: passseis: passcinco: passtres: passdos: passcero: daddi $t0,$0,2        ;x = 2
	daddi $t1,$0,1                  ;y = 1
	sb $t1,4($s7)                   ;data+4 = coordenada y
	loopx1: sb $t0,5($s7)           ;data+5 = coordenada x
	sd $t3,0($s6)                   ;control = funcion 5
	daddi $t0,$t0,1                 ;x+1
	slti $t4,$t0,5                  ;si x < 5 => $t4 = 1 si no $t4 = 0
	bnez $t4,loopx1                 ;salta si $t4 = 1
	#comprobar cero
	bnez $t9,sigcero                ;si flag = 1 salta

	#segunda x(x del medio)
	passnueve: passcuatro: daddi $t1,$0,5                  ;y = 5
	daddi $t0,$0,4                  ;x = 4
	sb $t1,4($s7)                   ;data+4 = y
	loopx2: sb $t0,5($s7)           ;data+5 = x
	sd $t3,0($s6)                   ;control = funcion 5
	daddi $t0,$t0,-1                ;x-1
	slti $t4,$t0,2                  ;si x < 1 => $t4 = 1 si no $t4 = 0
	beqz $t4,loopx2                 ;salta si $t4 = 0
	bnez $t5,sigcuatro1             ;si $t5 = 1 salta

	#tercera x(x superior)
	passsiete: sigcero: daddi $t0,$0,2          ;x = 2
	daddi $t1,$0,8                  ;y = 8
	sb $t1,4($s7)                   ;data+4 = y
	loopx3: sb $t0,5($s7)           ;data+5 = x
	sd $t3,0($s6)                   ;control = funcion 5
	daddi $t0,$t0,1                 ;x+1
	slti $t4,$t0,5                  ;si $t0 < 5 => $t4 = si no $t4 = 0
	bnez $t4,loopx3                 ;salta si $t4 = 1
	bnez $t6,sigtres                ;si $t6 = 1 salta
	bnez $t2,sigcinco1              ;si $t2 = 1 salta
	bnez $s1,sigsiete               ;si $s1 = 1 salta
	bnez $s3,signueve               ;si $s3 = 1 salta


	##dibujar y
	#primera y(y izquierda abajo)
	daddi $t0,$0,1                  ;x = 1
	daddi $t1,$0,2                  ;y = 2
	sb $t0,5($s7)                   ;data+5 = x
	loopy1: sb $t1,4($s7)           ;data+4 = y
	sd $t3,0($s6)                   ;control = funcion 5
	daddi $t1,$t1,1                 ;y+1
	slti $t4,$t1,5                  ;si $t1 < 5 => $t4 = 1 si no $t4 = 0
	bnez $t4,loopy1                 ;si $t4 = 1 salta
	bnez $t7,sigdos                 ;si $t7 = 1 salta

	#segunda y(y izquierda arriba)
	signueve: sigcinco1: sigcuatro1: daddi $t1,$0,6                  ;y = 6
	daddi $t0,$0,1                  ;x = 1
	sb $t0,5($s7)                   ;data+5 = x
	loopy2: sb $t1,4($s7)           ;data+4 = y
	sd $t3,0($s6)                   ;control = funcion 5
	daddi $t1,$t1,1                 ;y+1
	slti $t4,$t1,8                  ;si $t1 < 8 => $t4 = 1 si no $t4 = 0
	bnez $t4,loopy2                 ;salta si $t4 = 1
	bnez $t2,sigcinco2              ;si $t2 = 1 salta
	bnez $s0,sigseis                ;si $s0 = 1 salta

	#tecera y(y derecha arriba)
	sigsiete: sigtres: sigdos: passuno: daddi $t0,$0,5                  ;x = 5
	daddi $t1,$0,7                  ;y = 7
	sb $t0,5($s7)                   ;data+5 = x
	loopy3: sb $t1,4($s7)           ;data+4 = y
	sd $t3,0($s6)                   ;control = funcion 5
	daddi $t1,$t1,-1                ;y-1
	slti $t4,$t1,6                  ;si $t1 < 5 => $t4 = 1 si no $t4 = 0
	beqz $t4,loopy3                 ;salta si $t4 = 0
	bnez $t7,finaliza               ;si $t7 = 1 salta

	#cuarta y(y derecha abajo)
	sigseis: sigcinco2: daddi $t1,$0,4       ;y = 4
	daddi $t0,$0,5                  ;x = 5
	sb $t0,5($s7)                   ;data+5 = x
	loopy4: sb $t1,4($s7)           ;data+4 = y
	sd $t3,0($s6)                   ;control = funcion 5
	daddi $t1,$t1,-1                ;y-1
	slti $t4,$t1,2                  ;si $t1 < 2 => $t4 = 1 si no $t4 = 0
	beqz $t4,loopy4                 ;salta si $t4 = 0

	finaliza: ld  $s3,24($sp)	;recuperar registros
	ld  $s2,16($sp)
	ld  $s1,8($sp)
	ld  $s0,0($sp)       
	daddi $sp,$sp,32
	jr $ra
