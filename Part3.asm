
# Name: Hien Vo
# COMP3410
# Assigment 1
# Date: 2/11/15		
			
	.text	
	li $t0, 1
	li $t1, 0
	li $t3, 15
	add $t1, $t0, $t1

loop:	addi $t0, $t0, 2
	add $t1, $t0, $t1
	bne $t0, $t3, loop
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10   
        syscall
