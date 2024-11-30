.data
str_a:    .asciz "enter a: "
str_b:    .asciz "enter b: "
str_c:    .asciz "a / b = "
avg_end:  .asciz "Both a and b are 0!"
.text
main:
    c.li t0, 0    # a + b
    c.li t1, 0    # a
    c.li t2, 0    # b
    c.li a7, 4
    la a0, str_a
    ecall
    c.li a7, 5
    ecall
    c.mv t1, a0
    c.add t0, t0, t1
    
    li a7, 4
    la a0, str_b
    ecall
    li a7, 5
    ecall
    c.mv t2, a0
    c.add t0, t0, a2
    c.bnez t1, avg
    c.bnez t2, avg
    j end
avg:
    li t3, 2
    li t4, 0
    fcvt.s.w f0, t0, dyn	# sum
    fcvt.s.w f1, t3, dyn
    fcvt.s.w f2, t4, dyn
    fdiv.s f3, f0, f1, dyn
    li a7, 4
    la a0, str3
    ecall
    li a7, 2
    fadd.s fa0, f2, f3, dyn
    ecall
    c.li a7, 11
    li a0, 10
    ecall
    j main
end:
    li a7, 4
    la a0, avg_end
    ecall
    
    li a7, 10
    ecall