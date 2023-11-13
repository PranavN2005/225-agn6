.text
.globl	printint		
printint:	
	li      a7,1           
        ecall
	ret
.globl	printstring
printstring:	
	li 	a7,	4
	ecall
	ret

.globl printchar
printchar:
	li 	a7,	11
	ecall
	ret

	
.globl readchar		
readchar:		
	li      a7,	12		          
        ecall
	ret
		
.globl	exit0
exit0:		
	li	a7,	10
	ecall

.globl readstring
readstring:	
	sw	ra,	svra,	t0
	sw	s0,	svs0,	t0
	mv	s0,	a0
while:	jal	readchar
	li	t0,	'\n'
	beq	a0,	t0,	eWhile
	sb	a0,	0(s0)
	addi	s0,	s0,	1
	b	while
	
eWhile:	sb	zero,	0(s0)
	lw	ra,	svra
	lw	s0,	svs0	
	ret
	
.data
svra:	.word	0
svs0:	.word	0
