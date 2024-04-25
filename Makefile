all: lab02

lab02:
	riscv32-unknown-elf-gcc -march=rv32id -mabi=ilp32 -Wall lab02.c -nostartfiles -nostdinc -nostdlib

lab03:
	riscv32-unknown-elf-as -march=rv32i -g lab03.S -o lab03.o
	riscv32-unknown-elf-ld lab03.o -o lab03.x

lab04:
	riscv32-unknown-elf-gcc -march=rv32g -mabi=ilp32d -Wall lab04.c -nostartfiles -nostdinc -nostdlib -o lab04.x

lab05:
	riscv32-unknown-elf-gcc -march=rv32g -mabi=ilp32d -Wall lab05.c -nostartfiles -nostdinc -nostdlib -o lab05.x

lab06:
	riscv32-unknown-elf-as -march=rv32im -g lab06.S -o lab06.o
	riscv32-unknown-elf-ld lab06.o -o lab06.x
# clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lab04.c -c -o lab04.o

riscv:
	as lab06.S -o lab06.o
	ld lab06.o -o lab06.x