# Write a RISC-V assembly program to do the following:
# - Input an integer from console (using the ecall instruction)
# - Calculate the sum of all digits of that integer
# - Print the calculated sum to console (using the ecall instruction)
.text
main:
	li a7, 5 		# read integer
	ecall
	mv t0, a0 		# int num;

	li t1, 0 		# int sum = 0;
	li t2, 10 		# int div = 10;
	bne t0, zero, sum_loop 	# while (num!=0)

sum_loop:
	rem t3, t0, t2		# t3 = num % 10;
	add t1, t1, t3		# sum += t3;
	div t0, t0, t2		# num / 10;
	bne t0, zero, sum_loop	# while (num!=0);

sum_done:
	li a7, 1		# print integer
	mv a0, t1		# set a0 to the contents of sum
	ecall