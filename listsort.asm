#ListSort by:
#PRANAV NALLAPERUMAL
#and
#SCOTT FRIZELL
.globl	recurSelectionSort
recurSelectionSort:

# s0 - head {0-5: name, 8-11: studentid, 12-15: coursenum, 16-19: next}
# t0 - head->next
# t1 - min
# t2 - beforeMin
# t3 - ptr
# t4 - ptr->next
# t5 - ptr->next->studentid
# t6 - min->studentid


#struct Node* recurSelectionSort(struct Node* head) {
	lw	t0,	16(a0)			# t0 = head->next
	bne	t0,	zero,	notNull		# if !(head->next == NULL) branch
	ret					# return head	
			
notNull:addi	sp,	sp,	-16
	sw	ra,	12(sp)
	mv	t1,	a0			# min = head
	mv	t2,	zero			# beforeMin = NULL
forinit:mv	t3,	a0			# ptr = head
forloop:lw	t4,	16(t3)			# t4 = ptr->next
	beq	t4,	zero,	if2		# if !(ptr->next != NULL) branch
if1:	lw	t5,	8(t4)			# t5 = ptr->next->studentid
	lw	t6,	8(t1)			# t6 = min->studentid
	bge	t5,	t6, 	endif1		# if !(ptr->next->studentid < min->studentid ) branch
	mv	t1,	t4			# min = ptr->next
	mv	t2,	t3			# beforeMin = ptr
endif1:	mv	t3,	t4			# ptr = ptr->next
	b	forloop

if2:	sw	a0,	8(sp)
	beq	t1,	a0,	endif2		# if !(min != head) branch	
	addi	a0,	sp,	8		# a0 = &head
	lw	a1,	8(sp)			# a1 = head
	mv	a2,	t1			# a2 = min
	mv	a3,	t2			# a3 = beforeMin
	jal	swapNodes			# swapNodes(&head, head, min, beforeMin)
	lw	a0,	8(sp)
endif2:	lw	a0,	16(a0)			# a0 = head->next
	jal	recurSelectionSort		# recurSelectionSort(head->next);
	lw	t0,	8(sp)
	sw	a0,	16(t0)			# head->next = a0
	lw	ra,	12(sp)
	lw	s0,	8(sp)
	addi	sp,	sp,	16
	ret					# return head
