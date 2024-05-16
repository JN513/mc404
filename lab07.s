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
    
    li s0, 4;
    li a0, 0;
    li t0, 2;
    la s1, input_address;
    la s2, save_data;
    la s4, result;

    call loop_leitura_coordenadas;

    call read;

    li t0, 4;

    call loop_leitura_tempos;

    la s2, save_data;

    # coloca \n

    #li t0, 10;
    #sw t0, -1(s4)

    #call write;

    lw ra, 0(sp);
    addi sp, sp, 4;

    ret;

calc_dist:


calc_y:
    nop
calc_x:
    nop
    
loop_leitura_coordenadas:
    lbu t2, 0(s1) # read numbers
    lbu t3, 1(s1)
    lbu t4, 2(s1)
    lbu t5, 3(s1)
    lbu t6, 4(s1)

    addi t3, t3, -48; # converte ascii to int
    addi t4, t4, -48;
    addi t5, t5, -48;
    addi t6, t6, -48;

    li t1, 10;
    mul t5, t5, t1;

    li t1, 100;
    mul t4, t4, t1;

    li t1, 1000;
    mul t3, t3, t1;

    add a0, t3, t4; # soma em a0
    add a0, t5, a0;
    add a0, t6, a0;

    li t1, 45; # verifica se é negativo

    bne t2, t1, positivo;

    li t1, -1;
    mul a0, a0, t1;

positivo:

    sw a0, 0(s2);

    add s2, s2, s0;

    addi t0, t0, -1;

    beq t0, zero, fim;

    j loop_leitura_coordenadas

loop_leitura_tempos:
    lbu t3, 0(s1)
    lbu t4, 1(s1)
    lbu t5, 2(s1)
    lbu t6, 3(s1)

    addi t3, t3, -48; # converte ascii to int
    addi t4, t4, -48;
    addi t5, t5, -48;
    addi t6, t6, -48;

    li t1, 10;
    mul t5, t5, t1;

    li t1, 100;
    mul t4, t4, t1;

    li t1, 1000;
    mul t3, t3, t1;

    add a0, t3, t4; # soma em a0
    add a0, t5, a0;
    add a0, t6, a0;

    sw a0, 0(s2);

    add s2, s2, s0;

    addi t0, t0, -1;

    beq t0, zero, fim;

    j loop_leitura_tempos

fim:
    ret;

sqrt: # retorna no a0, recebe no a0
    srai a1, a0, 1;
    li a2, 21;
sqrt_loop:
    div a3, a0, a1;
    add a1, a1, a3;
    srai a1, a1, 1;
    addi a2, a2, -1;

    bnez a2, sqrt_loop;

    mv a0, a1;

    ret;

num_to_ascii: # recebe no a0
    # Primeiro dígito
    li t4, 1000
    div t3, a0, t4
    addi t5, t3, 48
    sw t5, 0(s4) # Armazena o primeiro dígito em a0

    # Segundo dígito
    mul t3, t3, t4
    sub a0, a0, t3
    li t4, 100
    div t3, a0, t4
    addi t5, t3, 48
    sw t5, 1(s4) # Armazena o segundo dígito em a0+4

    # Terceiro dígito
    mul t3, t3, t4
    sub a0, a0, t3
    li t4, 10
    div t3, a0, t4
    addi t5, t3, 48
    sw t5, 2(s4) # Armazena o terceiro dígito em a0+8

    # Quarto dígito
    mul t3, t3, t4
    sub a0, a0, t3
    addi a0, a0, 48
    sw a0, 3(s4) # Armazena o quarto dígito em a0+12

    li a0, 32;
    sw a0, 4(s4) # espaço

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

input_address: .skip 0x60  # buffer
save_data: .skip 0x40 # 0, 4, 8, 12, 16, 20
result: .skip 0x40
