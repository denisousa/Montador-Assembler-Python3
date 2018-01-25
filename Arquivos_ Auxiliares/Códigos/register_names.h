
//These are convenient for writing test MIPS programs. These
//are not used for implementing any instructions within the CPU.


#define REG_ZERO (registers[0]) //constant zero
#define REG_AT (registers[1]) 	//assembler temporary

#define REG_V0 (registers[2])  //values for function returns and expression evaluation
#define REG_V1 (registers[3]) 	

#define REG_A0 (registers[4])  //function arguments
#define REG_A1 (registers[5])
#define REG_A2 (registers[6])
#define REG_A3 (registers[7])

#define REG_T0 (registers[8])  //temporaries (caller-saved)
#define REG_T1 (registers[9]) 
#define REG_T2 (registers[10]) 
#define REG_T3 (registers[11]) 
#define REG_T4 (registers[12]) 
#define REG_T5 (registers[13]) 
#define REG_T6 (registers[14]) 
#define REG_T7 (registers[15]) 


#define REG_S0 (registers[16])  //saved temporaries (callee-saved)
#define REG_S1 (registers[17]) 
#define REG_S2 (registers[18]) 
#define REG_S3 (registers[19]) 
#define REG_S4 (registers[20]) 
#define REG_S5 (registers[21]) 
#define REG_S6 (registers[22]) 
#define REG_S7 (registers[23]) 

#define REG_T8 (registers[24]) //temporaries (caller-saved)
#define REG_T9 (registers[25]) 


#define REG_K0 (registers[26])  //reserved for OS kernel
#define REG_K1 (registers[27]) 

#define REG_GP 	(registers[28])  //global pointer
#define REG_SP 	(registers[29])  //stack pointer 
#define REG_FP 	(registers[30])  //frame pointer 
#define REG_RA 	(registers[31])  //return address


//Just the indexes
#define ZERO 0 //constant zero
#define AT 1 	//assembler temporary

#define V0 2  //values for function returns and expression evaluation
#define V1 3 	

#define A0 4  //function arguments
#define A1 5
#define A2 6
#define A3 7

#define T0 8  //temporaries caller-saved
#define T1 9 
#define T2 10 
#define T3 11 
#define T4 12 
#define T5 13 
#define T6 14 
#define T7 15 


#define S0 16  //saved temporaries callee-saved
#define S1 17 
#define S2 18 
#define S3 19 
#define S4 20 
#define S5 21 
#define S6 22 
#define S7 23 

#define T8 24 //temporaries caller-saved
#define T9 25 


#define K0 26  //reserved for OS kernel
#define K1 27 

#define GP 28  //global pointer
#define SP 29  //stack pointer 
#define FP 30  //frame pointer 
#define RA 31  //return address
