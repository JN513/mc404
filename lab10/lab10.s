.global _start

_start:
    j exit

gets:
    mv a1, a0           # buffer
    li a0, 0            # file descriptor = 0 (stdin)
    li a2, 10           # size - Reads 20 bytes.
    li a7, 63           # syscall read (63)
    ecall

    mv a0, a1           # buffer
    ret

puts:
    mv a1, a0           # buffer
    li a0, 1            # file descriptor = 1 (stdout)
    li a2, 20           # size - Writes 20 bytes.
    li a7, 64           # syscall write (64)
    ecall
    ret

exit:
    li a0, 0
    li a7, 93 # exit
    ecall
