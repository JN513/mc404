.global _start

_start:
    jal main
    li a0, 0
    li a7, 93 # exit
    ecall


main:
    addi sp, sp, -4;
    sw ra, 0(sp);

    call read;

    li a0, 0;
    li t1, 4;
    li t2, 5;
    la s1, input_address;
    la s4, result;

    call loop;

    li t0, 10;
    sw t0, -1(s4)

    call write;

    lw ra, 0(sp);
    addi sp, sp, 4;

    ret;

loop:
    lbu t3, 0(s1) # read numbers
    lbu t4, 1(s1)
    lbu t5, 2(s1)
    lbu t6, 3(s1)

    addi t3, t3, -48; # converte ascii to int
    addi t4, t4, -48;
    addi t5, t5, -48;
    addi t6, t6, -48;

    li a1, 10;
    mul t5, t5, a1;

    li a1, 100;
    mul t4, t4, a1;

    li a1, 1000;
    mul t3, t3, a1;

    add a0, t3, t4; # soma em a0
    add a0, t5, a0;
    add a0, t6, a0;

    addi sp, sp, -4;
    sw ra, 0(sp);

    call sqrt
    call num_to_ascii

    lw ra, 0(sp);
    addi sp, sp, 4;

    add s1, s1, t2;
    add s4, s4, t2;
    addi t1, t1, -1;

    beq t1, zero, fim;

    j loop

fim:
    ret;

sqrt:
    srai a1, a0, 1;
    li a2, 10;
sqrt_loop:
    div a3, a0, a1;
    add a1, a1, a3;
    srai a1, a1, 1;
    addi a2, a2, -1;

    bnez a2, sqrt_loop;

    ret;

num_to_ascii:
    # Primeiro dígito
    li t4, 1000
    div t3, a1, t4
    addi t5, t3, 48
    sw t5, 0(s4) # Armazena o primeiro dígito em a0

    # Segundo dígito
    mul t3, t3, t4
    sub a1, a1, t3
    li t4, 100
    div t3, a1, t4
    addi t5, t3, 48
    sw t5, 1(s4) # Armazena o segundo dígito em a0+4

    # Terceiro dígito
    mul t3, t3, t4
    sub a1, a1, t3
    li t4, 10
    div t3, a1, t4
    addi t5, t3, 48
    sw t5, 2(s4) # Armazena o terceiro dígito em a0+8

    # Quarto dígito
    mul t3, t3, t4
    sub a1, a1, t3
    addi a1, a1, 48
    sw a1, 3(s4) # Armazena o quarto dígito em a0+12

    li a1, 32;
    sw a1, 4(s4) # espaço

    ret

read:
    li a0, 0            # file descriptor = 0 (stdin)
    la a1, input_address # buffer
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


.bss

input_address: .skip 0x40  # buffer

result: .skip 0x40
