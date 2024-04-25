.global _start

_start:
    li a3, 0;
    jal main
    li a0, 0
    li a7, 93 # exit
    ecall

# left esquerda
main:
    mv ra, s0;
    call read

    la a0, input_adress
    mv a1, a0;
    addi a1, a1, 80;
    li a3, 0;
    li t4, 0;
    li t5, 5;

    li t2, 100000000000000;
    li t3, 10;

    mv t1, a3;
    mv t2, a3;
    mv t3, a3;
    mv t4, a3;

    slli t1, t1, 24;
    slli t2, t2, 16;
    slli t3, t3, 8;

    andi t1, t1, 0x000000FF; 
    andi t2, t2, 0x000000FF; 
    andi t3, t3, 0x000000FF; 
    andi t4, t4, 0x000000FF; 

    addi t5, zero, 10

    la t6, result;

    sb t1, 0(t6); 
    sb t2, 4(t6); 
    sb t3, 8(t6); 
    sb t4, 12(t6); 
    sb t5, 16(t6);

    call write;

    jalr zero, s0, 0;

read:
    li a0, 0            # file descriptor = 0 (stdin)
    la a1, input_adress # buffer
    li a2, 20           # size - Reads 20 bytes.
    li a7, 63           # syscall read (63)
    ecall
    ret

write:
    li a0, 1            # file descriptor = 1 (stdout)
    la a1, result       # buffer
    li a2, 20           # size - Writes 20 bytes.
    li a7, 64           # syscall write (64)
    ecall
    ret

pulo:
    li t4, 0;
    jal zero, get_number

get_number:
    lbu t1, 0(a0);
    addi t3, t3, 1;
    addi t4, t4, 1;

    beq t4, t5, pulo;
    
    addi a0, a0, 4;
    beq a1, a0, fim;

    addi t1, t1, -48;

    mul t1, t1, t2;
    div t2, t2, t3;

    add a3, a3, t1;

    jal zero, get_number

fim:
    ret;

.bss

input_address: .skip 0x20  # buffer

result: .skip 0x20