.globl _start

_start:
    li a0, 0
    li a1, 0
    li a2, 0
    li a3, 0
    li a4, 0
    li a5, 0
    li a6, 0
    li s0, 0
    li s1, 0
    li s2, 0
    li s3, 0

    jal openFile

    la a1, buffer
    li a2, 262159
    jal readFile

    mv s0, a0 # save the file descriptor
    mv t2, a1 # save the buffer

    li a0, 0
    li a1, 0

    addi t2, t2, 3 # skip the first 3 characters
    li t3, 0x20 # space character
    li t4, 1
    li t5, 10

    lbu t0, 1(t2)
    beq t0, t3, read_widht
    mul t4, t4, t5

    lbu t0, 2(t2)
    beq t0, t3, read_widht
    mul t4, t4, t5

read_widht:
    lbu t0, 0(t2)
    addi t2, t2, 1
    beq t0, t3, read_height

    addi t0, t0, -48
    mul t0, t0, t4
    add a0, a0, t0;
    div t4, t4, t5

    j read_widht

read_height:
    li t3, 0x0A # new line character
    li t4, 1

    lbu t0, 1(t2)
    beq t0, t3, read_height_loop
    mul t4, t4, t5

    lbu t0, 2(t2)
    beq t0, t3, read_height_loop
    mul t4, t4, t5

read_height_loop:
    lbu t0, 0(t2)
    addi t2, t2, 1
    beq t0, t3, read_gama

    addi t0, t0, -48
    mul t0, t0, t4
    add a1, a1, t0;
    div t4, t4, t5

    j read_height_loop

read_gama:
    li t3, 0x0A # new line character
    li t4, 1
    li s6, 0

    lbu t0, 1(t2)
    beq t0, t3, read_gama_loop
    mul t4, t4, t5

    lbu t0, 2(t2)
    beq t0, t3, read_gama_loop
    mul t4, t4, t5

read_gama_loop:
    lbu t0, 0(t2)
    addi t2, t2, 1
    beq t0, t3, print_canvas

    addi t0, t0, -48
    mul t0, t0, t4
    add s6, s6, t0;
    div t4, t4, t5

    j read_gama_loop

print_canvas:
    jal setCanvasSize

    mv s2, a0
    mv s3, a1

    li t0, 0
    li t6, 0

line_loop:
    beq t6, s3, fim
colum_loop:
    lbu a2, 0(t2)
    addi t2, t2, 1
    mv a0, t0
    mv a1, t6

    addi t0, t0, 1
    jal setPixel

    beq t0, s2, alter_line
    
    j colum_loop
    
alter_line:
    li t0, 0
    addi t6, t6, 1

    j line_loop

fim:
    li a0, 0
    li a7, 93 # exit
    ecall
    ret

setPixel: #a0 x coordinate, a1 y coordinate, a2 color
    slli a2, a2, 8 # shift color to the left by 8 bits
    slli t1, a2, 8 # shift color to the left by 8 bits
    or a2, a2, t1 # combine the color
    slli t1, t1, 8 # shift color to the left by 8 bits
    or a2, a2, t1 # combine the color
    or a2, a2, s6 # set the alpha channel to 0xFF

    li a7, 2200 # syscall setPixel (2200)
    ecall

    ret

openFile:
    la a0, input_file    # address for the file path
    li a1, 0             # flags (0: rdonly, 1: wronly, 2: rdwr)
    li a2, 0             # mode
    li a7, 1024          # syscall open 
    ecall

    ret

readFile: # a0 = file descriptor, a1 = buffer, a2 = size
    li a7, 63 # syscall read (1025)
    ecall

    ret

closeFile: # a0 = file descriptor
    li a7, 57 # syscall close (57)
    ecall

    ret

setCanvasSize: # a0 = width, a1 = height
    li a7, 2201 # syscall setCanvasSize (2201)
    ecall

    ret

.data
input_file: .asciz "image.pgm"
buffer: .skip 262159
