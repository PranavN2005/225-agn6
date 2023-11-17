.globl swap
.globl selectionSort
.globl printArray

# ASSIGNMENT 6 BY:
# SCOTT FRIZELL
# &
# PRANAV NALLAPERUMAL


# struct def'n for reference
# struct studentNode {
#   char name[6];
#   int studentid;
#   int coursenum;
# };


 
# void selectionSort(studentNode arr[], int i, int n)
selectionSort:
	addi    sp,	sp,	-16
	sw	ra,	12(sp)
	sw  	s0, 	8(sp)
	sw  	s1, 	4(sp)
	sw  	s2, 	0(sp)
	li  	t0, 	0           		# int j = 0
	mv 	t1, 	a1          		# int min = i
for1:	addi 	t0, 	a1, 	1
forloop1:
    	bge	t0,	a2,	endfor1 
if1:	slli	t2,	t0,	4
    	add 	t2,	t2,	a0
    	lw 	t2,	8(t2)
    	slli 	t3, 	t1,	4
    	add 	t3, 	t3, 	a0
    	lw 	t3, 	8(t3)
    	bge 	t2,	t3, 	endif1
    	mv 	t1,	t0			# min = j;    /* update the index of minimum element */
endif1:	addi	t0,	t0,	1
	b 	forloop1
    
endfor1:mv	s0,	a0
	mv	s1,	a1
	mv	s2,	a2
	mv	a2,	s1
	mv	a1,	t1
	jal 	swap
if2:	addi	t0,	s1,	1
	bge	t0,	s2,	endif2
	mv	a0,	s0
	mv	a1,	t0
	mv	a2,	s2
	jal selectionSort
endif2:	lw	ra,	12(sp)
	lw	s0,	8(sp)
	lw	s1,	4(sp)
	lw	s2,	0(sp)
	addi    sp,	sp,	16
	ret 



# void printArray(studentNode arr[], int n)
printArray:
	addi	sp,	sp,	-16
	sw	ra,	12(sp)
	sw	s0,	8(sp)
	sw	s1,	4(sp)
	sw	s2,	0(sp)
	mv	s0,	a0
	mv	s1,	a1
for2:	li	s2,	0 			# int i = 0
forloop2:
	bge	s2,	s1,	endfor2
	slli	t0,	s2,	4
	add	t0,	t0,	s0
	lw	a0,	8(t0)
	jal 	printint			# printf("%d ", arr[i].studentid);
	li	a0,	' '
	jal	printchar
	mv	a0,	t0
	jal	printstring			# printf("%s ", arr[i].name);
	li	a0,	' '
	jal	printchar
	lw	a0,	12(t0)
	jal	printint			# printf("%d\n", arr[i].coursenum);
	li	a0,	'\n'
	jal	printchar
	addi	s2,	s2,	1
	b	forloop2

endfor2:lw	ra,	12(sp)
	lw	s0,	8(sp)
	lw	s1,	4(sp)
	lw	s2,	0(sp)
	addi	sp,	sp,	16
	ret

# void swap(studentNode arr[], int i, int j)
swap:	slli	a1,	a1,	4
	slli    a2,	a2,	4
	add	t0,	a0,	a1
	add	t1,	a0,	a2
	lw	t2,	0(t0)
	lw	t3,	0(t1)
	sw	t3,	0(t0)
	sw	t2,	0(t1)
	lw	t2,	4(t0)
	lw	t3,	4(t1)
	sw	t3,	4(t0)
	sw	t2,	4(t1)
	lw	t2,	8(t0)
	lw	t3,	8(t1)
	sw	t3,	8(t0)
	sw	t2,	8(t1)
	lw	t2,	12(t0)
	lw	t3,	12(t1)
	sw	t3,	12(t0)
	sw	t2,	12(t1)
	ret

# void printchar(char a0)
printchar:
	li 	a7,	11
	ecall
	ret

# void printint(int a0)
printint:	
	li      a7,	1
        ecall
	ret
		
# void printint(string* a0)	
printstring:	
	li 	a7,	4
	ecall
	ret
