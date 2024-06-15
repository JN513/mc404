.globl _start

_start:
    jal main
    li a0, 0
    li a7, 93 # exit
    ecall

main:
    addi sp, sp, -4;
    sw ra, 0(sp);

    call read;

    addi a0, a0, -1;
    mv t5, a0
    addi t5, t5, -1;

    la a1, input_address;

    lw t0, 0(a1);
    # lw in t1 '-' ascii code
    li s0, 0
    li t1, 45;
    li t2, 1;
    li t3, 1;
    li t4, 10;
    li t6, 0;
    bne t0, t1, positive;    

negative:
    addi t5, t5, -1;
    li t2, -1;
    li t6, 1;
positive:

mul_loop:
    beq t5, zero, fim;
    mul t3, t4, t3;
    addi t5, t5, -1;

    j mul_loop;
fim:

    add a1, a1, t6;
read_loop:
    lbu t0, 0(a1);
    addi t6, t6, 1;
    addi a1, a1, 1;
    addi t0, t0, -48;

    mul t0, t0, t3;
    add s0, s0, t0;
    div t3, t3, t4;

    beq t6, a0, fim_read_loop;

    j read_loop;

fim_read_loop:
    mul s0, s0, t2; // precisa concertar leitura negativa

read_head_node: // precisa achar endereço de head_node
    li t0, 0;
    lw t1, 0(t0);

    lw ra, 0(sp);
    addi sp, sp, 4;

    ret;


read:
    li a0, 0            # file descriptor = 0 (stdin)
    la a1, input_address # buffer
    li a2, 10           # size - Reads 20 bytes.
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
