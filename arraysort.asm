.globl swap 
.globl selectionSort
 
selectionSort:
	addi	sp,	sp,	-16
	sw	ra,	12(sp)
	sw	s0,	8(sp)
	sw	s1,	4(sp)
	sw	s2,	0(sp)
	li	t0,	0			# int j
	mv	t1,	a1			# int min = i
for:	addi	t0,	a1,	1		# j = i + 1
forloop:bge	t0,	a2,	endfor		# if !(j < n) break	
if1:	slli	t2,	t0,	2
	add	t2,	t2,	a0
	lw	t2,	0(t2)			# arr[j]
	slli	t3,	t1,	2
	add	t3,	t3,	a0
	lw	t3,	0(t3)			# arr[min]
	bge	t2,	t3,	endif1		# if !(arr[j] < arr[min]) break
	mv	t1,	t0			# min = j; 
endif1:	addi	t0,	t0,	1		# j++
	b	forloop

endfor:	mv	s0,	a0
	mv	s1,	a1
	mv	s2,	a2
	mv	a1,	t1
	mv	a2,	s1
	jal	swap
if2:	addi	t0,	s1,	1
	bge	t0,	s2,	endif2		# if !(i + 1 < n) break
	mv	a0,	s0
	mv	a1,	t0
	mv	a2,	s2
	jal	selectionSort
endif2:	lw	ra,	12(sp)
	lw	s0,	8(sp)
	lw	s1,	4(sp)
	lw	s2,	0(sp)
	addi	sp,	sp,	16
	ret
 
swap: 	slli	a1,	a1,	2
	slli	a2,	a2,	2
	add	t0,	a0,	a1
	add	t1,	a0,	a2
	lw	t2,	0(t0)
	lw	t3,	0(t1)
	sw	t3,	0(t0)
	sw	t2,	0(t1)
	ret