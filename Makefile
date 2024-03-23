all: lab02

lab02:
	riscv32-unknown-elf-gcc -march=rv32id -mabi=ilp32 -Wall lab02.c -nostartfiles -nostdinc -nostdlib

lab03:
	riscv32-unknown-elf-as -march=rv32i -g lab03.S -o lab03.o
	riscv32-unknown-elf-ld lab03.o -o lab03.x