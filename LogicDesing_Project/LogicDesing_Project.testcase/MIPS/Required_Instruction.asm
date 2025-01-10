.text
main:
    addi $a0, $zero, 5       # $a0 = 5
    addi $a1, $zero, 10      # $a1 = 10
    add  $a2, $a0, $a1       # $a2 = $a0 + $a1 (5 + 10 = 15)
    
    sub  $a3, $a2, $a1       # $a3 = $a2 - $a1 (15 - 10 = 5)
    
    beq  $a0, $a3, equal     # If $a0 == $a3, nhảy đến label "equal"
    addi $t0, $zero, -1      # $t0 = -1 (nếu không nhảy)
    
equal:
    addi $t0, $zero, 1       # $t0 = 1 (nếu nhảy)
    
    and  $t1, $a0, $a1       # $t1 = $a0 AND $a1
    or   $t2, $a0, $a1       # $t2 = $a0 OR $a1
    nor  $t3, $a0, $a1       # $t3 = NOT($a0 OR $a1)
    
    andi $t4, $a0, 0xF       # $t4 = $a0 AND 0xF
    ori  $t5, $t1, 0x1       # $t5 = $a1 OR 0x1
    
    slt  $t6, $a0, $a1       # $t6 = 1 nếu $a0 < $a1
    slti $t7, $a1, 15        # $t7 = 1 nếu $a1 < 15
    
    beq $t7, $zero, exit     # If $t7 == 0, nhảy đến label "equal"
    addi $s0, $zero, 1       # $s0 = 1 (nếu nhảy)
    
exit:      # nếu không nhảy thì không làm gì
	