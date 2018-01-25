
	.text
SUM_LOOP:
	addi	$t0,$0,20 // $t0 = 0 + 20
	addi	$t1,$0,0 // $t1 = 0
L1:	
	beq	$t0,$0,DONE // if ($t0==0) jump 3 instructions ahead of next one
	addu	$t1,$t1,$t0 // $t1 = $t1 + $t0
	addi	$t0,$t0,-1 //$t0 = $t0-1
	j	L1  //jump to top of loop
DONE:	
	add	$a0,$0,$t1 // $a0 = $t1,the result to print
	addi	$v0,$0,1 // $v0 = $0 + 1,for print_int syscall.
	syscall
	addi	$v0,$0,10 // $v0 = $0 + 10,for exit syscall.
	syscall
