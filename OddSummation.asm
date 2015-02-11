# COMP3410
# Author: Miguel Betances
# Assignment: PA[1]
# Date: Feb/11/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# OddSummation.asm
# Input: none
# Output: Print odd numbers summation from 1-15

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################
	.data

	head: .asciiz "\nMiguel Betances: Odd Summation\n"
		storeValue: .word 1	
		activeValue: .word 0
		addingValue:.word 1
		done: .asciiz "\nYour answer is\n"
							#Done 
###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	#Display welcome
	li $v0,4
	la $a0, head
	syscall
loop: 
	lw $t0,storeValue
	lw $t1,activeValue
	li $t2,2		#used to always multiply 2
	
	mul $t3,$t0,$t2
	add $t4,$t1,$t3
	sw $t4, activeValue
	lw $t5, addingValue
	move $t5,$t4
	
	sw $t5, addingValue
	li $t6,64
	j while

while:
	blt $t5,$t6,loop
	j exit

exit:

	li $v0,4
	la $a0, done
	 syscall
	li $v0,1
	move $a0,$t5
	 syscall
