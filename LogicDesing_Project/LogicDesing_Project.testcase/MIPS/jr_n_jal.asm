.data 
	arr: .word 1, 2, 3, 4 , 5, 6, 7, 8, 9, 10
	len : .word 10
	result: .word 0
.text
.globl main

j main

cal:
loop:	slti $t3, $t1, 11
	beq $t3, $zero, out
	addi $t1, $t1, 1
	lw $t4, ($t0)
	addi $t0, $t0, 4
	add $t2, $t2, $t4
	j loop
out:	jr $ra

main:
	la $t0, arr
	addi $t1, $zero, 1
	addi $t2, $zero, 0
	jal cal
	sw $t2, result