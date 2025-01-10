.data
array	:	.word 	10, 5, 17, 3, 8, 15, 9, 11, 6, 2, 19, 14, 1, 20, 4, 12, 7, 16, 13, 18
length	:	.word 	20
space	:	.asciiz " "

.text
main:
    la $a0, array
    lw $t0, length

    li $t1, 0
    
outer_loop:
    bge $t1, $t0, end
    addi $t2, $t1, 1

inner_loop:
    bge $t2, $t0, next_i  

    lw $t3, ($a0)
    lw $t4, 4($a0)

    bge $t3, $t4, no_swap

    sw $t4, ($a0)
    sw $t3, 4($a0)

no_swap:
    addi $a0, $a0, 4
    addi $t2, $t2, 1
    j inner_loop

next_i:
    la $a0, array

    addi $t1, $t1, 1
    j outer_loop

end:
	
