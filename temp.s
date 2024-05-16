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