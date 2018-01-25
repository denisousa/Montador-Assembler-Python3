	.data

	//x is a 4-byte integer initialized to 0x110111 (1114385 decimal)
x:	.long	 0x110111

	.text

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x

	  // loads x = 1114385 into $a0
	lw	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print 1114385 
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x

	  //loads bottom half of x, namely 0x111 = 273 into $a0
	lh	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print 273
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing lb

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x


	  //loads bottom byte of x, namely 0x11 = 17 into $a0
	lb	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print 17
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing nor, andi
	nor	$t1,$0,$0  //sets $t1 to all 1's

	andi	$a0,$t1,345  //since $t1 is all 1's, $t0 = 345

	  //this code prints the int that is in $a0
	  //should print 345
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing xori 	note: a xor b xor a => b
	addi	$a0,$0,125  //$a0 = 125
	xori	$a0,$a0,99  //$a0 = $a0 xor 99
	xori	$a0,$a0,125  //$a0 = $a0 xor 125, should be 99

	  //this code prints the int that is in $a0
	  //should print 99
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing sll, by shifting $a0 left by 2. if $a0 contains 345, the result should be 1380
	addi	$a0,$0,345  //$a0 = 345
	sll	$a0, $a0, 2

	  //this code prints the int that is in $a0
	  //should print 1380
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing srl, by shifting $a0 right by 3. since $a0 contains 1380, the result should be 172
	srl	$a0, $a0, 3

	  //this code prints the int that is in $a0
	  //should print 172
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing sub, and sra. put -25 into $a0 and shift right by 2. the result should be -7
	  
	addi	$t2,$0, 25
	sub	$a0, $0, $t2 //$a0 = -25

	sra	$a0, $a0, 2 //now $a0 = -7 	rounds down

	  //this code prints the int that is in $a0
	  //should print -7
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	addi	$a0, $0, 7 // $a0 = 7
	addi	$t0, $0, 3 // t = 3, the shift amount
	  //testing sllv, by shifting $a0 left by $t0 	3. since $a0 contains 7, the result should be 56
	sllv	$a0, $a0, $t0

	  //this code prints the int that is in $a0
	  //should print 56
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing srl, by shifting $a0 right by 3. since $a0 contains 56, the result should be 14
	addi	$t0, $0, 2 // t = 2, the shift amount
	srlv	$a0, $a0, $t0

	  //this code prints the int that is in $a0
	  //should print 14
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing sub, and srav. put -25 into $a0 and shift right by 2. the result should be -7
	  
	addi	$t2,$0, 25
	sub	$a0, $0, $t2 //$a0 = -25

	srav	$a0, $a0, $t0 //now $a0 = -7 	rounds down

	  //this code prints the int that is in $a0
	  //should print -7
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   


	  //testing sh, writing 0x0020 to low half-word of x
	  //x should then be 0x110020 = 1114144 decimal
	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x


	addi	$t1,$0, 0x20
	sh	$t1, $t0, 0

	  //now loading all of x and printing it.
	lw	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print 1114144
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   


	  //testing sb, writing 0x00 to low byte of x 	although the register will contain 0xff20
	  //x should then be 0x110000 = 1114112 decimal

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x

	addi	$t1,$0, 0xff00
	sb	$t1, $t0, 0

	  //now loading all of x and printing it.
	lw	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print 1114112
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   


	  //testing lh and lhu.  set x = 0x0000ffff and perform lh and then lhu. lh should
	  //load a negative number 	-1, lhu should load a positive number 	65535

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x

	addi	$t3,$0,0xffff //just enough bits 	16 in the constant field

	sw	$t3, $t0, 0

	lh	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print -1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x
		

	lhu	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print 65535
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing lb and lbu.  set x = 0x000011ff and perform lh and then lhu. lh should
	  //load a negative number 	-1, lbu should load a positive number 	255

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x
	
	addi	$t3,$0,0x11ff //just enough bits 	16 in the constant field

	sw	$t3, $t0, 0

	lb	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print -1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	lui	$t0,x>>16  //loads top 16 bits of the address of x
	ori	$t0,$t0,x  //lower 16 bits of the address of x


	lbu	$a0, $t0, 0

	  //this code prints the int that is in $a0
	  //should print 255
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing lui.  load 2 into the upper word of $a0, printing 2^17 = 131072

	lui	$a0, 2

	  //this code prints the int that is in $a0
	  //should print 131072
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing slt.  setting $a0 = 	$t5 	-1 < $t6	200 = 1 

	addi	$t5, $0, 0xffff //sets $t5 = -1 	due to sign extension of 0xffff
	ori	$t6, $0, 200
	slt	$a0, $t5, $t6

	  //this code prints the int that is in $a0
	  //should print 1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //now reverse order of operands to slt, should print 0

	slt	$a0, $t6, $t5

	  //this code prints the int that is in $a0
	  //should print 0
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing slti.  setting $a0 = 	$t5 	-1 < 200 = 1 

	addi	$t5, $0, 0xffff //sets $t5 = -1 	due to sign extension of 0xffff
	slti	$a0, $t5, 200

	  //this code prints the int that is in $a0
	  //should print 1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing slti.  setting $a0 = 	$t5 	-1 < -2 = 0

	addi	$t5, $0, 0xffff //sets $t5 = -1 	due to sign extension of 0xffff
	slti	$a0, $t5, 0xfffe //0xfffe = -2

	  //this code prints the int that is in $a0
	  //should print 0
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing sltiu.  setting $a0 = 	$t5 	-1 < 200 = 0  	because -1 is interpreted as a large positive number

	addi	$t5, $0, 0xffff //sets $t5 = -1 	due to sign extension of 0xffff
	sltiu	$a0, $t5, 200

	  //this code prints the int that is in $a0
	  //should print 0
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing sltiu.  setting $a0 = 	$t5 	200 < -1 = 1  	because -1 is interpreted as a large positive number

	addi	$t5, $0, 200 //sets $t5 = 200
	sltiu	$a0, $t5, 0xffff // $a0 = 	200 < -1 =  1

	  //this code prints the int that is in $a0
	  //should print 1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing subu -- does the same thing as sub for our purposes 	normally doesn't set overflow flag
	  //$t5 holds 200, $t6 holds 200, so should get 0 as a result.
	subu	$a0, $t5, $t6

	  //this code prints the int that is in $a0
	  //should print 0
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //test mult 	with large result and mfhi.

	lui	$t1,0x4000  //sets the top 16 bits to 0x4000 	i.e. bit 30 is 1
	ori	$t1,$t1,10  //$t1 = $t1 | 10, so $t1 = 0x40000000 + 10 = 1073741834 	decimal

	add	$a0, $t1, $0  

	  //this code prints the int that is in $a0
	  //should print 1073741834
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	addi	$t2,$0,4  //$t2 = 4
	mult	$t1,$t2 //hi:lo = $t1 * $t2,  should set hi to 1 and lo to 40
	mfhi	$a0 
	  
	  //this code prints the int that is in $a0
	  //should print 1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	mflo	$a0
	  
	  //this code prints the int that is in $a0
	  //should print 40
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //test multu 	with negative number and mfhi.

	lui	$t1,-1  //sets the top 16 bits to 0xffff 
	ori	$t1, $t1, -1  //$t1 = $t1 -1, so $t1 = -1

	add	$a0, $t1, $0  

	  //this code prints the int that is in $a0
	  //should print -1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	addi	$t2,$0,2  //$t2 = 2
	multu	$t1,$t2 //hi:lo = $t1 * $t2,  should set hi to 1, lo to -2
	mfhi	$a0 
	  
	  //this code prints the int that is in $a0
	  //should print 1
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	mflo	$a0
	  
	  //this code prints the int that is in $a0
	  //should print -2
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   


	  //testing div
	addi	$t2,$0,237  //$t2 = 237
	addi	$t1,$0,-10  //$t2 = -10
	div	$t2,$t1  //lo = $t2/$t1 = -23, hi = $t2%$t1 = 7
	  
	mflo	$a0 //printing lo, should be -23

	  //this code prints the int that is in $a0
	  //should print -23
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	mfhi	$a0 //printing hi, should be 7

	  //this code prints the int that is in $a0
	  //should print 7
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   


	  //testing divu

	addi	$t2,$0,237  //$t2 = 237
	addi	$t1,$0,-10  //$t2 = -10 	which is interpreted as large postive number
	divu	$t2,$t1  //lo = $t2/$t1 = 0, hi = $t2%$t1 = 237
	  
	mflo	$a0 //printing lo, should be 0

	  //this code prints the int that is in $a0
	  //should print 0
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	mfhi	$a0 //printing hi, should be 237

	  //this code prints the int that is in $a0
	  //should print 237
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //testing and, or, and xor

	addi	$t1,$0, 0xff //$t1 = 0xff
	addi	$t2,$0, 0x34 //$t2 = 0x34
	and	$t1,$t1, $t2 //$t1 = $t1 & $t2 = 0x34
	addi	$t2,$0, 0x70 //now $t2 = 0x70
	or	$t1,$t1, $t2 //$t1 = $t1 or $t2 = 0x74

	add	$a0,$t1,$0 //$a0 = $t1 = 0x74 = 116 for printing

	  //this code prints the int that is in $a0
	  //should print 116
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	addi	$t2,$0, 0xf //now $t2 = 0xf 

	xor	$a0,$t1,$t2 //$a0 = $t1 ^ $t2 = 0x74 ^ 0xf = 0x7n = 123

	  //this code prints the int that is in $a0
	  //should print 123
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //---- exit ------
	addi	$v0, $0, 10 // $v0 = $0 + 10, for exit syscall.
	syscall 

