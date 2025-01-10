.data
array: .word 10, 20, 30, 40, 50  
result: .word 0                 

.text
main:
    addi $t1, $0, 5
    addi $t2, $0, 10
    add $t0, $t1, $t2

    addi $t3, $t1, 15

    addiu $t4, $t2, 1000

    sub $t5, $t2, $t1

    subu $t6, $t2, $t1
    
    la $t8, array
    lw $t7, 8($t8)
    
    sw $t0, 4($t8)   

    lui $t9, 0x1234

    j jump1

beq1:
    addi $k1, $0, 999
    j continue

jump1:
    beq $t7, 5, beq1

    and $s0, $t1, $t2

    or $s1, $t1, $t2

    nor $s2, $t1, $t2

    andi $s3, $t2, 0xFF

    ori $s4, $t1, 0x0F

    slt $s5, $t1, $t2

    slti $s6, $t2, 20

    xor $s7, $t1, $t2

    xori $a0, $t1, 0x0A

    sltu $a1, $t2, $a0

    sll $a2, $t1, 2

    srl $a3, $t1, 1

    sra $k0, $t1, 1

    move $k0, $t0
    
    j beq1       

continue:
    
