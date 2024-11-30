.data
max_str:    .asciz "The largest number: "
min_str:    .asciz "The smallest number: "
.text
main:
    c.li a7, 5
    ecall
    c.mv t0, a0      # int n
    c.li t1, 0    # t1 = max
    c.li t2, 0    # t2 = min
gen:
    ecall
    blt a0, t1, not_max
    c.mv t1, a0   # new max
    not_max:
    bge a0, t2, skip
    c.mv t2, a0   # new min
    skip:
    c.addi t0, t0, -1
    c.bnez t0, gen
    
    c.li a7, 4
    la a0, max_str
    ecall
    c.li a7, 1
    la a0, t1
    ecall
    c.li a7, 11
    c.li a0, 10
    ecall
    c.li a7, 4
    la a0, min_str
    ecall
    c.li a7, 1
    la a0, t2
    ecall
    
    c.li a7, 10
    ecall