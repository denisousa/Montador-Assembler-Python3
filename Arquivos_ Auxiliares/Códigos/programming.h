
/***************************************************

IMPORTANT: DO NOT MODIFY THIS FILE UNLESS YOU *REALLY*  
           KNOW WHAT YOU ARE DOING.

           THIS FILE SHOULD ONLY BE USED FOR WRITING
           TEST MIPS ASSEMBLY PROGRAMS. DO NOT USE
           IT FOR IMPLEMENTING THE CPU.

***************************************************/


//I Instructions

#define ADDI_OPCODE (0x08)
#define ADDIU_OPCODE (0x09)
#define LW_OPCODE (0x23)
#define LH_OPCODE (0x21)
#define LHU_OPCODE (0x25)
#define LB_OPCODE (0x20)
#define LBU_OPCODE (0x24)
#define SW_OPCODE (0x2b)
#define SH_OPCODE (0x29)
#define SB_OPCODE (0x28)
#define LUI_OPCODE (0x0f)
#define ANDI_OPCODE (0x0c)
#define ORI_OPCODE (0x0d)
#define XORI_OPCODE (0x0e)
#define SLTI_OPCODE (0x0a)
#define SLTIU_OPCODE (0x0b)
#define BEQ_OPCODE (0x04)
#define BNE_OPCODE (0x05)


//I Instructions

//opcode (6) rs(5) rt(5) imm(16)
#define ADDI_INSTRUCTION(__rt, __rs, __C) ((ADDI_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define ADDIU_INSTRUCTION(__rt, __rs, __C) ((ADDIU_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define LW_INSTRUCTION(__rt, __rs, __C) ((LW_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define LH_INSTRUCTION(__rt, __rs, __C) ((LH_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define LHU_INSTRUCTION(__rt, __rs, __C) ((LHU_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define LB_INSTRUCTION(__rt, __rs, __C) ((LB_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define LBU_INSTRUCTION(__rt, __rs, __C) ((LBU_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define SW_INSTRUCTION(__rt, __rs, __C) ((SW_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define SH_INSTRUCTION(__rt, __rs, __C) ((SH_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define SB_INSTRUCTION(__rt, __rs, __C) ((SB_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) __(5) rt(5) imm(16)
#define LUI_INSTRUCTION(__rt,__C) ((LUI_OPCODE << 26) | ((__rt) << 16) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define ANDI_INSTRUCTION(__rt, __rs, __C) ((ANDI_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define ORI_INSTRUCTION(__rt, __rs, __C) ((ORI_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define XORI_INSTRUCTION(__rt, __rs, __C) ((XORI_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define SLTI_INSTRUCTION(__rt, __rs, __C) ((SLTI_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define SLTIU_INSTRUCTION(__rt, __rs, __C) ((SLTIU_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define BEQ_INSTRUCTION(__rt, __rs, __C) ((BEQ_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))

//opcode(6) rs(5) rt(5) imm(16)
#define BNE_INSTRUCTION(__rt, __rs, __C) ((BNE_OPCODE << 26) | ((__rt) << 16) | ((__rs) << 21) | ((__C) & 0xffff))


//J Instructions

#define J_OPCODE (0x02)
#define JAL_OPCODE (0x03)


//opcode(6) address(26)
#define J_INSTRUCTION(__addr) ((J_OPCODE << 26) | ((__addr) & 0x3ffffff))

//opcode(6) address(26)
#define JAL_INSTRUCTION(__addr) ((JAL_OPCODE << 26) | ((__addr) & 0x3ffffff))


//R Instructions

//Opcode for all R instructions is 0
#define R_INSTRUCTION_OPCODE (0x0)

//funct codes
#define ADD_FUNCT (0x20)
#define ADDU_FUNCT (0x21)
#define SUB_FUNCT (0x22)
#define SUBU_FUNCT (0x23)
#define MULT_FUNCT (0x18)
#define MULTU_FUNCT (0x19) 
#define DIV_FUNCT (0x1a)
#define DIVU_FUNCT (0x1b)
#define MFHI_FUNCT (0x10)
#define MFLO_FUNCT (0x12)
#define AND_FUNCT (0x24)
#define OR_FUNCT (0x25)
#define XOR_FUNCT (0x26)
#define NOR_FUNCT (0x27)
#define SLT_FUNCT (0x2A)
#define SLL_FUNCT (0x00)
#define SLLV_FUNCT (0x04) 
#define SRL_FUNCT (0x02)
#define SRLV_FUNCT (0x06) 
#define SRAV_FUNCT (0x07) 
#define SRA_FUNCT (0x03)
#define JR_FUNCT (0x08)
#define JALR_FUNCT (0x09) 
#define SYSCALL_FUNCT (0x0c)



//  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | ((__shamt) << 6) | ADD_FUNCT)

//opcode(6) rs(5) rt(5) rd(5) shamt(5) funct(6)
#define ADD_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | ADD_FUNCT)
#define ADDU_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | ADDU_FUNCT) 
#define SUB_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | SUB_FUNCT) 
#define SUBU_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | SUBU_FUNCT) 
#define MULT_INSTRUCTION(__rs,__rt) ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | MULT_FUNCT)
#define MULTU_INSTRUCTION(__rs,__rt) ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | MULTU_FUNCT)
#define DIV_INSTRUCTION(__rs,__rt) ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | DIV_FUNCT)
#define DIVU_INSTRUCTION(__rs,__rt) ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | DIVU_FUNCT)
#define MFHI_INSTRUCTION(__rd) ((R_INSTRUCTION_OPCODE << 26) | ((__rd) << 11)| MFHI_FUNCT)
#define MFLO_INSTRUCTION(__rd) ((R_INSTRUCTION_OPCODE << 26) | ((__rd) << 11)| MFLO_FUNCT)
#define AND_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | AND_FUNCT) 
#define OR_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | OR_FUNCT) 
#define XOR_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | XOR_FUNCT) 
#define NOR_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | NOR_FUNCT) 
#define SLT_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | SLT_FUNCT)
#define SLL_INSTRUCTION(__rd,__rt,__shamt) ((R_INSTRUCTION_OPCODE << 26) | ((__rt) << 16) | ((__rd) << 11) | ((__shamt) << 6) | SLL_FUNCT)
#define SLLV_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | SLLV_FUNCT) 
#define SRL_INSTRUCTION(__rd,__rt,__shamt) ((R_INSTRUCTION_OPCODE << 26) | ((__rt) << 16) | ((__rd) << 11) | ((__shamt) << 6) | SRL_FUNCT)
#define SRLV_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | SRLV_FUNCT) 
#define SRA_INSTRUCTION(__rd,__rt,__shamt) ((R_INSTRUCTION_OPCODE << 26) | ((__rt) << 16) | ((__rd) << 11) | ((__shamt) << 6) | SRA_FUNCT)
#define SRAV_INSTRUCTION(__rd,__rs,__rt)  ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | ((__rt) << 16) | ((__rd) << 11) | SRAV_FUNCT) 
#define JR_INSTRUCTION(__rs) ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | JR_FUNCT)
#define JALR_INSTRUCTION(__rs) ((R_INSTRUCTION_OPCODE << 26) | ((__rs) << 21) | JALR_FUNCT)


//Just the funct field
#define SYSCALL_INSTRUCTION SYSCALL_FUNCT
