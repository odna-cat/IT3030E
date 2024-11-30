# Ex 4. Write a RISC-V assembly program to do the following:
# - Read an integer N from console.
# - Then read N integers from console.
# - Find and print the values of the smallest and largest number from the N integers that have been read.
.globl main

.data
arr:	.space 400 # assumes array has max cap of 100 integers
max:	.space 4
min:	.space 4

maxstr:	.asciz "The largest number: "
minstr:	.asciz "The smallest number: "
.text
main:
	li a7, 5		# int n;
	ecall			# scanf("%d", n);
	mv t0, a0
	li t1, 0		# int index = 0;
	la t3, arr
	
	la a1, max
	la a2, min

generate_arr:
	beq t1, t0, start_max	# int inp;
	ecall			# scanf("%d", inp);
	slli t4, t1, 2		# offset
	add t4, t3, t4		# current memory address
	sw a0, 0(t4)		# arr[i] = inp;
	addi t1, t1, 1		# i++
	j generate_arr
start_max:
	li t1, 0		# reset to 0 for looping
	lw t6, 0(t3)		# int cur = arr[0];
find_max:
	beq t1, t0, start_min	# while(i!=n)
	slli t4, t1, 4
	add t4, t3, t4
	lw t5, 0(t4)		# int tmp = arr[i];
	blt t5, t6, not_max	# if (cur < tmp) goto not_max;
	add t6, x0, t5		# cur = tmp;
not_max:
	addi t1, t1, 1		
	j find_max
start_min:
	mv a1, t6		# int max = cur;
	li t1, 0
	lw t6, 0(t3)		# cur = arr[0];
find_min:
	beq t1, t0, end
	slli t4, t1, 4
	add t4, t3, t4
	lw t5, 0(t4)
	bgt t5, t6, not_min
	add t6, x0, t5
not_min:
	addi t1, t1, 1
	j find_min
end:
	mv a2, t6		# int min = cur;
	li a7, 4
	la a0, maxstr
	ecall
	li a7, 1
	mv a0, a1
	ecall
	li a7, 11
	li a0, 10
	ecall
	li a7, 4
	la a0, minstr
	ecall
	li a7, 1
	mv a0, a2
	ecall
	
	li a7, 10
	ecall
