# Try rewrite the programs in Ex 4 and Ex 5 with instructions from the compact instruction set RV32C.

# Write a RISC-V assembly program to do the following:
# - Read an integer N from console.
# - Then read N integers from console.
# - Find and print the values of the smallest and largest number from the N integers that have been read.

.data
arr:	.space 400
max:	.space 4
min:	.space 4
str:	.asciz "Help"
.text
main:
	c.li a7, 4
	c.la a0, str
	c.ebreak