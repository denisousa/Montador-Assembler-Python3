	.txt
	j	MAIN     //  jump to main

	
FAC_REC:  //this computes fac(n), where n is in $a0	
	bne	$a0, $0, RECURSIVE   // if $a0 != 0, jump to RECURSIVE
	addi	$v0, $0, 1   // otherwise, set $v0 (the return value) to 1
	j	DONE         //            and jump to DONE
RECURSIVE: 
	addiu	sp,sp,-8    //make room to save $ra and $a0 on the stack before the call
	sw	ra,sp,4     //store $ra at [$sp + 4]
	sw	$a0,sp,0     //store $a0 at [$sp]
	addiu	$a0,$a0,-1    // $a0 = $a0-1 , to pass n-1 as the argument 
	jal	FAC_REC     //call FAC_REC recursively, 
	lw	$a0,sp,0    //restore $a0 from [$sp]
	lw	ra,sp,4     //restore $ra from [$sp+4]
	addiu	sp,sp,8     //remove the space from the stack
	mult	$v0,$a0     //multiply $v0 (the result of the recursive call) by $a0
	mflo	$v0     // put the result of the multiplication into $v0
DONE:	
	jr	ra     // return, buy jumping to the return address in $ra
MAIN:	
	addi	$a0,$0,6    // $a0 = 6, the initial value for n
	lui	$t4, FAC_REC>>16   //put upper 16 bits of target address into $t4
	ori	$t4,$t4, FAC_REC   //insert lower 16 bits into $t4
	jalr	$t4    //call to the address in $t4
	add	$a0,$0,$v0    // $a0 = $v0, the result to print
	addi	$v0, $0, 1    // $v0 = $0 + 1, for print_int syscall.
	syscall 
	addi	$v0, $0, 10    // v0 = $0 + 10, for exit syscall.
	syscall
