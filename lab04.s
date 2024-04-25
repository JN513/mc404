	.file	"lab04.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	read
	.type	read, @function
read:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	lw	a3,-44(s0)
 #APP
# 6 "lab04.c" 1
	mv a0, a5           # file descriptor
mv a1, a4           # buffer 
mv a2, a3           # size 
li a7, 63           # syscall write code (63) 
ecall               # invoke syscall 
mv a5, a0           # move return value to ret_val

# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	read, .-read
	.align	2
	.globl	write
	.type	write, @function
write:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	sw	a2,-28(s0)
	lw	a5,-20(s0)
	lw	a4,-24(s0)
	lw	a3,-28(s0)
 #APP
# 19 "lab04.c" 1
	mv a0, a5           # file descriptor
mv a1, a4           # buffer 
mv a2, a3           # size 
li a7, 64           # syscall write (64) 
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	write, .-write
	.align	2
	.globl	exit
	.type	exit, @function
exit:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
 #APP
# 30 "lab04.c" 1
	mv a0, a5           # return code
li a7, 93           # syscall exit (64) 
ecall
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	exit, .-exit
	.align	2
	.globl	len
	.type	len, @function
len:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	j	.L6
.L7:
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
.L6:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,10
	bne	a4,a5,.L7
	lw	a4,-36(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	len, .-len
	.align	2
	.globl	stroct_to_int
	.type	stroct_to_int, @function
stroct_to_int:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	li	a5,2
	sw	a5,-24(s0)
	j	.L10
.L11:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	addi	a5,a5,-48
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	slli	a4,a5,3
	lw	a5,-28(s0)
	andi	a5,a5,7
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L10:
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L11
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	stroct_to_int, .-stroct_to_int
	.align	2
	.globl	strhex_to_int
	.type	strhex_to_int, @function
strhex_to_int:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	li	a5,2
	sw	a5,-24(s0)
	j	.L14
.L18:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sw	a5,-28(s0)
	lw	a4,-28(s0)
	li	a5,47
	ble	a4,a5,.L15
	lw	a4,-28(s0)
	li	a5,57
	bgt	a4,a5,.L15
	lw	a5,-28(s0)
	addi	a5,a5,-48
	sw	a5,-28(s0)
	j	.L16
.L15:
	lw	a4,-28(s0)
	li	a5,96
	ble	a4,a5,.L17
	lw	a4,-28(s0)
	li	a5,102
	bgt	a4,a5,.L17
	lw	a5,-28(s0)
	addi	a5,a5,-87
	sw	a5,-28(s0)
	j	.L16
.L17:
	lw	a4,-28(s0)
	li	a5,64
	ble	a4,a5,.L16
	lw	a4,-28(s0)
	li	a5,70
	bgt	a4,a5,.L16
	lw	a5,-28(s0)
	addi	a5,a5,-55
	sw	a5,-28(s0)
.L16:
	lw	a5,-20(s0)
	slli	a4,a5,4
	lw	a5,-28(s0)
	andi	a5,a5,15
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L14:
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L18
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	strhex_to_int, .-strhex_to_int
	.align	2
	.globl	strbin_to_int
	.type	strbin_to_int, @function
strbin_to_int:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	li	a5,2
	sw	a5,-24(s0)
	j	.L21
.L22:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	addi	a5,a5,-48
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	slli	a4,a5,1
	lw	a5,-28(s0)
	andi	a5,a5,1
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L21:
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L22
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	strbin_to_int, .-strbin_to_int
	.align	2
	.globl	strdec_to_int
	.type	strdec_to_int, @function
strdec_to_int:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	addi	a5,a5,-1
	sw	a5,-28(s0)
	j	.L25
.L26:
	lw	a5,-28(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a4,a5,-48
	lw	a5,-24(s0)
	mul	a5,a4,a5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addi	a5,a5,-1
	sw	a5,-28(s0)
.L25:
	lw	a4,-28(s0)
	lw	a5,-44(s0)
	bge	a4,a5,.L26
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	strdec_to_int, .-strdec_to_int
	.align	2
	.globl	int_to_bin
	.type	int_to_bin, @function
int_to_bin:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,33
	sw	a5,-20(s0)
	j	.L29
.L30:
	lw	a5,-40(s0)
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a4,a5,0xff
	lw	a5,-20(s0)
	lw	a3,-36(s0)
	add	a5,a3,a5
	addi	a4,a4,48
	andi	a4,a4,0xff
	sb	a4,0(a5)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
.L29:
	lw	a4,-20(s0)
	li	a5,1
	bgt	a4,a5,.L30
	lw	a5,-36(s0)
	addi	a5,a5,34
	li	a4,10
	sb	a4,0(a5)
	lw	a5,-36(s0)
	li	a4,48
	sb	a4,0(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	li	a4,98
	sb	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	int_to_bin, .-int_to_bin
	.align	2
	.globl	int_to_hex
	.type	int_to_hex, @function
int_to_hex:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-32(s0)
	sw	zero,-20(s0)
	li	a5,2
	sw	a5,-28(s0)
	j	.L32
.L37:
	lw	a4,-40(s0)
	li	a5,-268435456
	and	a5,a4,a5
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	srli	a5,a5,28
	sw	a5,-32(s0)
	lw	a5,-40(s0)
	slli	a5,a5,4
	sw	a5,-40(s0)
	lw	a5,-32(s0)
	bne	a5,zero,.L33
	lw	a5,-20(s0)
	beq	a5,zero,.L38
.L33:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a4,-32(s0)
	li	a5,9
	bgtu	a4,a5,.L35
	lw	a5,-32(s0)
	andi	a5,a5,0xff
	addi	a5,a5,48
	sb	a5,-21(s0)
	j	.L36
.L35:
	lw	a5,-32(s0)
	andi	a5,a5,0xff
	addi	a5,a5,87
	sb	a5,-21(s0)
.L36:
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,-21(s0)
	sb	a4,0(a5)
	j	.L34
.L38:
	nop
.L34:
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L32:
	lw	a4,-28(s0)
	li	a5,9
	ble	a4,a5,.L37
	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	li	a4,10
	sb	a4,0(a5)
	lw	a5,-36(s0)
	li	a4,48
	sb	a4,0(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	li	a4,120
	sb	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	int_to_hex, .-int_to_hex
	.align	2
	.globl	int_to_oct
	.type	int_to_oct, @function
int_to_oct:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	sw	zero,-28(s0)
	j	.L40
.L45:
	lw	a5,-28(s0)
	beq	a5,zero,.L41
	lw	a4,-40(s0)
	li	a5,-536870912
	and	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,29
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,3
	sw	a5,-40(s0)
	j	.L42
.L41:
	lw	a4,-40(s0)
	li	a5,-1073741824
	and	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,30
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,2
	sw	a5,-40(s0)
.L42:
	lw	a5,-20(s0)
	bne	a5,zero,.L43
	lw	a5,-24(s0)
	beq	a5,zero,.L46
.L43:
	lw	a5,-20(s0)
	andi	a5,a5,0xff
	addi	a5,a5,48
	sb	a5,-29(s0)
	lw	a5,-24(s0)
	addi	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,-29(s0)
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	j	.L44
.L46:
	nop
.L44:
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L40:
	lw	a4,-28(s0)
	li	a5,11
	ble	a4,a5,.L45
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	li	a4,10
	sb	a4,0(a5)
	lw	a5,-36(s0)
	li	a4,48
	sb	a4,0(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	li	a4,111
	sb	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	int_to_oct, .-int_to_oct
	.align	2
	.globl	int_to_str
	.type	int_to_str, @function
int_to_str:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	lw	a5,-40(s0)
	bge	a5,zero,.L49
	li	a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	neg	a5,a5
	sw	a5,-40(s0)
	j	.L49
.L50:
	lw	a4,-40(s0)
	li	a5,10
	rem	a5,a4,a5
	andi	a5,a5,0xff
	addi	a5,a5,48
	sb	a5,-30(s0)
	lw	a4,-40(s0)
	li	a5,10
	div	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,-30(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L49:
	lw	a5,-40(s0)
	bne	a5,zero,.L50
	lw	a5,-24(s0)
	beq	a5,zero,.L51
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	li	a4,45
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L51:
	sw	zero,-28(s0)
	j	.L52
.L53:
	lw	a5,-28(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-29(s0)
	lw	a4,-20(s0)
	lw	a5,-28(s0)
	sub	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-36(s0)
	add	a4,a4,a5
	lw	a5,-28(s0)
	lw	a3,-36(s0)
	add	a5,a3,a5
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lw	a4,-20(s0)
	lw	a5,-28(s0)
	sub	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,-29(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L52:
	lw	a5,-20(s0)
	srli	a4,a5,31
	add	a5,a4,a5
	srai	a5,a5,1
	mv	a4,a5
	lw	a5,-28(s0)
	blt	a5,a4,.L53
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	li	a4,10
	sb	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	int_to_str, .-int_to_str
	.align	2
	.globl	uint_to_str
	.type	uint_to_str, @function
uint_to_str:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L55
.L56:
	lw	a4,-40(s0)
	li	a5,10
	remu	a5,a4,a5
	andi	a5,a5,0xff
	addi	a5,a5,48
	sb	a5,-26(s0)
	lw	a4,-40(s0)
	li	a5,10
	divu	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,-26(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L55:
	lw	a5,-40(s0)
	bne	a5,zero,.L56
	sw	zero,-24(s0)
	j	.L57
.L58:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-25(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sub	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-36(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	lw	a3,-36(s0)
	add	a5,a3,a5
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sub	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,-25(s0)
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L57:
	lw	a5,-20(s0)
	srli	a4,a5,31
	add	a5,a4,a5
	srai	a5,a5,1
	mv	a4,a5
	lw	a5,-24(s0)
	blt	a5,a4,.L58
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	li	a4,10
	sb	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	uint_to_str, .-uint_to_str
	.align	2
	.globl	inverted_endness
	.type	inverted_endness, @function
inverted_endness:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	andi	a5,a5,255
	sw	a5,-20(s0)
	lw	a4,-36(s0)
	li	a5,65536
	addi	a5,a5,-256
	and	a5,a4,a5
	sw	a5,-24(s0)
	lw	a4,-36(s0)
	li	a5,16711680
	and	a5,a4,a5
	sw	a5,-28(s0)
	lw	a4,-36(s0)
	li	a5,-16777216
	and	a5,a4,a5
	sw	a5,-32(s0)
	lw	a5,-20(s0)
	slli	a5,a5,24
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,8
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	srai	a5,a5,8
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	srai	a5,a5,24
	sw	a5,-32(s0)
	lw	a4,-20(s0)
	li	a5,-16777216
	and	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	li	a5,16711680
	and	a5,a4,a5
	sw	a5,-24(s0)
	lw	a4,-28(s0)
	li	a5,65536
	addi	a5,a5,-256
	and	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	andi	a5,a5,255
	sw	a5,-32(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	or	a4,a4,a5
	lw	a5,-28(s0)
	or	a4,a4,a5
	lw	a5,-32(s0)
	or	a5,a4,a5
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	inverted_endness, .-inverted_endness
	.align	2
	.globl	get_type
	.type	get_type, @function
get_type:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,45
	bne	a4,a5,.L62
	li	a5,4
	j	.L63
.L62:
	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,48
	bne	a4,a5,.L64
	lw	a5,-20(s0)
	addi	a5,a5,1
	lbu	a5,0(a5)
	li	a4,120
	beq	a5,a4,.L65
	li	a4,120
	bgt	a5,a4,.L64
	li	a4,98
	beq	a5,a4,.L66
	li	a4,111
	beq	a5,a4,.L67
	j	.L64
.L66:
	li	a5,1
	j	.L63
.L65:
	li	a5,3
	j	.L63
.L67:
	li	a5,2
	j	.L63
.L64:
	li	a5,0
.L63:
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	get_type, .-get_type
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-160
	sw	ra,156(sp)
	sw	s0,152(sp)
	addi	s0,sp,160
	addi	a5,s0,-56
	li	a2,20
	mv	a1,a5
	li	a0,0
	call	read
	sw	a0,-24(s0)
	addi	a5,s0,-56
	mv	a0,a5
	call	get_type
	sw	a0,-28(s0)
	addi	a5,s0,-56
	mv	a0,a5
	call	len
	sw	a0,-32(s0)
	lw	a4,-28(s0)
	li	a5,4
	bgtu	a4,a5,.L69
	lw	a5,-28(s0)
	slli	a4,a5,2
	lui	a5,%hi(.L71)
	addi	a5,a5,%lo(.L71)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L71:
	.word	.L75
	.word	.L74
	.word	.L73
	.word	.L72
	.word	.L70
	.text
.L75:
	addi	a5,s0,-56
	li	a2,0
	lw	a1,-32(s0)
	mv	a0,a5
	call	strdec_to_int
	sw	a0,-20(s0)
	j	.L69
.L74:
	addi	a5,s0,-56
	lw	a1,-32(s0)
	mv	a0,a5
	call	strbin_to_int
	sw	a0,-20(s0)
	j	.L69
.L73:
	addi	a5,s0,-56
	lw	a1,-32(s0)
	mv	a0,a5
	call	stroct_to_int
	sw	a0,-20(s0)
	j	.L69
.L72:
	addi	a5,s0,-56
	lw	a1,-32(s0)
	mv	a0,a5
	call	strhex_to_int
	sw	a0,-20(s0)
	j	.L69
.L70:
	addi	a5,s0,-56
	li	a2,1
	lw	a1,-32(s0)
	mv	a0,a5
	call	strdec_to_int
	mv	a5,a0
	neg	a5,a5
	sw	a5,-20(s0)
	nop
.L69:
	lw	a0,-20(s0)
	call	inverted_endness
	mv	a5,a0
	sw	a5,-36(s0)
	addi	a5,s0,-92
	lw	a1,-20(s0)
	mv	a0,a5
	call	int_to_bin
	addi	a5,s0,-104
	lw	a1,-20(s0)
	mv	a0,a5
	call	int_to_hex
	addi	a5,s0,-120
	lw	a1,-20(s0)
	mv	a0,a5
	call	int_to_oct
	addi	a5,s0,-140
	lw	a1,-20(s0)
	mv	a0,a5
	call	int_to_str
	addi	a5,s0,-160
	lw	a1,-36(s0)
	mv	a0,a5
	call	uint_to_str
	addi	a5,s0,-92
	li	a2,35
	mv	a1,a5
	li	a0,1
	call	write
	addi	a5,s0,-140
	li	a2,17
	mv	a1,a5
	li	a0,1
	call	write
	addi	a5,s0,-160
	li	a2,35
	mv	a1,a5
	li	a0,1
	call	write
	addi	a5,s0,-104
	li	a2,12
	mv	a1,a5
	li	a0,1
	call	write
	addi	a5,s0,-120
	li	a2,15
	mv	a1,a5
	li	a0,1
	call	write
	li	a5,0
	mv	a0,a5
	lw	ra,156(sp)
	lw	s0,152(sp)
	addi	sp,sp,160
	jr	ra
	.size	main, .-main
	.align	2
	.globl	_start
	.type	_start, @function
_start:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	call	main
	sw	a0,-20(s0)
	lw	a0,-20(s0)
	call	exit
	.size	_start, .-_start
	.ident	"GCC: (g2ee5e430018) 12.2.0"
