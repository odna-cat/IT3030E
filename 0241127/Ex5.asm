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
end:	.asciz "Both a and b are 0!"
.text
main:
	li t0, 0		# reset sum
	li a1, 0		# reset a and b
	li a2, 0		# for next loop
	
	li a7, 4
	la a0, str1
	ecall
	li a7, 5
	ecall			# t0 = sum;
	add a1, a1, a0		# int a;
	add t0, t0, a1		# int sum = a;
	
	li a7, 4
	la a0, str2
	ecall
	li a7, 5
	ecall
	add a2, a2, a0
	add t0, t0, a2		# sum += b;
	j check
check:
	bnez a1, avg		# if (a!=0 && b!=0) goto avg
	bnez a2, avg		# if line 31 fails, then a = 0
	j avg_end		# if line 32 fails, then a = b = 0 -> terminate program
avg_end:
	li a7, 4
	la a0, end
	ecall
	li a7, 10
	ecall
avg:
	li t1, 2
	li t2, 0
	
	fcvt.s.w f0, t0, dyn	# float(sum);
	fcvt.s.w f1, t1, dyn	# float(2);
	fcvt.s.w f2, t2, dyn	# float(0)
	
	fdiv.s f3, f0, f1, dyn
	li a7, 4
	la a0, str3
	ecall
	li a7, 2
	fadd.s fa0, f2, f3, dyn
	ecall
	li a7, 11
	li a0, 10
	ecall
	j main
