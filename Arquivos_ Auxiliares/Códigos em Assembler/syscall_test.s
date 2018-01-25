
	.data

prompt_num:
	.ascii  "Enter Number >"

prompt_str:
	.ascii  "Enter String >"

input_string:
	.space 80

	.text
	
	lui	$a0,prompt_num>>16 //load $a0 with the top half of the address of string
	ori	$a0,$a0,prompt_num // fill in the bottom half

	addi	$v0, $0, 4 // $v0 = $0 + 4, for print_string syscall.
	syscall 

	  //read_int test
	  
	addi	$v0, $0, 5 // $v0 = $0 + 5, for read_int, result is put in $v0
	syscall   
	add	$a0,$0,$v0 //$a0 = $v0, getting ready call print_int
	addi	$v0, $0, 1 // $v0 = 1, for print_int,
	syscall   

	  //printing string prompt

	lui	$a0,prompt_str>>16 //load $a0 with the top half of the address of string
	ori	$a0,$a0,prompt_str // fill in the bottom half
	addi	$v0, $0, 4 // $v0 = $0 + 4, for print_string syscall.
	syscall 

	  //read_string test
	  //read_string: $a0 = memory address of string input buffer
	  //             $a1 = length of string buffer 	n       

	addi	$v0, $0, 8 // $v0 = $8, for read_int, 

	lui	$a0,input_string>>16 //load $a0 with the top half of the address of buffer
	ori	$a0,$a0, input_string // fill in the bottom half

	addi	$a1, $0, 80 // $a1 = size of string buffer
	syscall  

	  //now print the string just read
	lui	$a0,input_string>>16 //load $a0 with the top half of the address of buffer
	ori	$a0,$a0, input_string // fill in the bottom half

	addi	$v0, $0, 4 // $v0 = $0 + 4, for print_string syscall.
	syscall 

	  //exit

	addi	$v0, $0, 10 // $v0 = $0 + 10, for exit syscall.
	syscall 
	