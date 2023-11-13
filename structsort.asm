.globl swap
.globl selectionSort
.globl printArray

#ASSIGNMENT 6 BY:
#SCOTT FRIZELL
#&
#PRANAV NALLAPERUMAL


#struct def'n for reference
#struct studentNode {
#   char name[6];
#   int studentid;
#   int coursenum;
#};


 

selectionSort:
#callee setup goes here
addi    sp, sp, -16
sw  ra, 12(sp)
sw  s0, 8(sp)
sw  s1, 4(sp)
sw  s2, 0(sp)
li  t0, 0           # int j
mv  t1, a1          # int min = i

for1:
    addi t0, a1, 1

forloop1:
    bge t0, a2, endfor1 

if1:
    slli t2,t0,4
    add t2,t2,a0
    lw t2,8(t2)
    slli t3, t1,4
    add t3, t3, a0
    lw t3, 8(t3)
    bge t2,t3, endif1
#            min = j;    /* update the index of minimum element */
    mv t1,t0

#        }
endif1:
addi t0,t0,1
b forloop1
    
endfor1:
mv s0, a0
mv s1, a1
mv s2,a2

mv a2,a1
mv a1,t1

jal swap

if2:
addi t3, s1, 1
bge t3, s2, endif2

mv a0, s0
mv a1,s1
mv a2,s2

addi a1,a1,1
jal selectionSort

endif2:
    
lw  ra, 12(sp)
lw  s0, 8(sp)
lw  s1, 4(sp)
lw  s2, 0(sp)
addi    sp, sp, 16
ret 



#void printArray(studentNode arr[], int n) {
printArray:
#callee setup goes here
li t1,0 #int i =1#

for2:
 mv s0,a0
mv s1,a1
mv s2, t1
forloop2:
bge t1, a1, endfor2
add t2,t1, 16
add t2,t2,s0
lw t2,8(t2)
#        printf("%d ", arr[i].studentid);
	jal printint
	li a0, ' '
	jal printchar
#        printf("%s ", arr[i].name);

	jal printstring
	li a0, ' '
	jal printchar
#        printf("%d\n", arr[i].coursenum);

	jal printstring
	
	li a0, '\n'
	jal printchar


    
endfor2:
 mv a0,s0
mv a1,s1
mv t1,s2
addi t1,t1, 1
swap:

`	slli	a1,a1,4
	slli    a2,a2,4
	add t0,	a0,a1
	add t1,	a0,a2
	lw t2,	0(t0)
	lw t3,	0(t1)
	sw t3,	0(t0)
	sw t2,	0(t1)
	lw t2,	4(t0)
	lw t3,	4(t1)
	sw t3,	4(t0)
	sw t2,	4(t1)
	lw t2,	8(t0)
	lw t3,	8(t1)
	sw t3,	8(t0)
	sw t2,	8(t1)
	lw t2,	12(t0)
	lw t3,	12(t1)
	sw t3,	12(t0)
	sw t2,	12(t1)
	ret
