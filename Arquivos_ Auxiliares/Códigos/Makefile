
CC=gcc
CFLAGS=-m32

all:	cpu


cpu:	cpu.o r_instructions.o i_instructions.o j_instructions.o syscall.o utilities.o loader.o main.o
		$(CC) $(CFLAGS) -o cpu cpu.o r_instructions.o i_instructions.o j_instructions.o syscall.o utilities.o loader.o main.o

assembler:	assembler.o
	$(CC) $(CFLAGS) -o assem assembler.o

	
