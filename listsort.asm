#ListSort by:
#PRANAV NALLAPERUMAL
#and
#SCOTT FRIZELL
.globl	recurSelectionSort
recurSelectionSort:

# s0 - head {0-5: name, 8-11: studentid, 12-15: coursenum, 16-19: next}
# t0 - head->next | min
# t1 - beforeMin
# t2 - ptr
# t3 - ptr->next
# t4 - ptr->next->studentid
# t5 - min->studentid


#struct Node* recurSelectionSort(struct Node* head) {
	lw	t0,	16(a0)			# t0 = head->next
	bne	t0,	zero,	notNull		# if !(head->next == NULL) branch
	ret					# return head	
			
notNull:addi	sp,	sp,	-16
	sw	ra,	12(sp)
	mv	t0,	a0			# min = head
	mv	t1,	zero			# beforeMin = NULL
forinit:mv	t2,	a0			# ptr = head
forloop:lw	t3,	16(t2)			# t3 = ptr->next
	beq	t3,	zero,	if2		# if !(ptr->next != NULL) branch
if1:	lw	t4,	8(t3)			# t5 = ptr->next->studentid
	lw	t5,	8(t0)			# t6 = min->studentid
	bge	t4,	t5, 	endif1		# if !(ptr->next->studentid < min->studentid ) branch
	mv	t0,	t3			# min = ptr->next
	mv	t1,	t2			# beforeMin = ptr
endif1:	mv	t2,	t3			# ptr = ptr->next
	b	forloop

if2:	sw	a0,	8(sp)	
	beq	t0,	a0,	endif2		# if !(min != head) branch
	addi	a0,	sp,	8		# a0 = &head
	lw	a1,	8(sp)			# a1 = head
	mv	a2,	t0			# a2 = min
	mv	a3,	t1			# a3 = beforeMin
	jal	swapNodes			# swapNodes(&head, head, min, beforeMin)
endif2:	lw	t0,	8(sp)			# t0 = head
	lw	a0,	16(t0)			# a0 = head->next
	jal	recurSelectionSort		# recurSelectionSort(head->next);
	lw	t0,	8(sp)
	sw	a0,	16(t0)			# head->next = a0
	lw	ra,	12(sp)
	mv	a0,	t0
	addi	sp,	sp,	16
	ret					# return head
