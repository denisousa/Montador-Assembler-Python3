
//These are the R-instructions implemented by the simulted MIPS processor

void add(uint32_t instruction);

void addu(uint32_t instruction); 

void sub(uint32_t instruction); 

void subu(uint32_t instruction); 

void mult(uint32_t instruction); 

void multu(uint32_t instruction); 

void div(uint32_t instruction); 

void divu(uint32_t instruction); 

void and(uint32_t instruction); 

void nor(uint32_t instruction); 

void or(uint32_t instruction); 

void xor(uint32_t instruction); 

void sll(uint32_t instruction); 

void sllv(uint32_t instruction); 

void srl(uint32_t instruction); 

void sra(uint32_t instruction); 

void srlv(uint32_t instruction); 

void srav(uint32_t instruction); 

void slt(uint32_t instruction); 

void sltu(uint32_t instruction); 

void jr(uint32_t instruction); 

void jalr(uint32_t instruction); 

void mfhi(uint32_t instruction); 

void mflo(uint32_t instruction); 

void syscall(uint32_t instruction);  //This is actually defined in syscall.c
