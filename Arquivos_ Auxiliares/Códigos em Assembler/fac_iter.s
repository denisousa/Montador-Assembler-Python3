
.text
	addi	$t0,$0,7 // n: t0 = 0 + 7
	addi	$t1,$0,1 // running product: t1 = 1
L1:	
	beq	$t0,$0,DONE // if 	t0 = 0,jump to DONE
	mult	$t1,$t0 // lo = t1 * t0
	mflo	$t1  // t1 = lo  running product *= t0 	n
	addi	$t0,$t0,-1 //t0 = t0-1  	n--
	j	L1 //jump top of loop
DONE:	
	add	$a0,$0,$t1 // $a0 = t1,the result to print
	addi	$v0,$0,1 // v0 = $0 + 1,for print_int syscall.
	syscall 
	addi	$v0,$0,10 // v0 = $0 + 10,for exit syscall.
	syscall 
