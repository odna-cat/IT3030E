# Ex 5. Write a RISC-V assembly program to do the following:
# - Implement an AVG() function that accepts 2 integers as input, then calculate and return a 32-bit
# floating point number with the value equal to the average value of the two input.
# - Using the above AVG() function, write a program that continuously reads two integers A and B
# from console and print out the average value of these 2 integers.
# The process only finishes in case both values of A and B are 0.

.data
str1:	.asciz "enter a: "
str2:	.asciz "enter b: "
str3:	.asciz "a / b = "
.text
main:
	li a7, 4
	la a0, str1
	ecall
	li a7, 5
	ecall
	mv t0, a0	# int sum = 0;
	
	li a7, 4
	la a0, str2
	ecall
	li a7, 5
	ecall
	
	add t0, t0, a0	# sum = a + b;
	li t1, 2
	li t2, 0
avg:
	fcvt.s.w f0, t0, dyn	# f0 = sum;
	fcvt.s.w f1, t1, dyn	# f1 = 2;
	fcvt.s.w f3, t2, dyn	# f3 = 0;
	
	fdiv.s f2, f0, f1, dyn	# f2 = avg
	li a7, 2
	fadd.s fa0, f3, f2, dyn
	ecall
	
	