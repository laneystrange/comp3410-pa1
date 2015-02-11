# COMP3410 Program Template
# Author: William C. Moyer
# Assignment: PA[X]
# Date: Date of submission

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# fibonacci.asm
# Input: None
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################
.data
firstValue: .word 1 #value of the odd integer being added
currentValue: .word 1 # partial sum value being held in memory

#secondValue: .word 1

totalSum: .word 0   # total sum. This is the location that the total sum for each 
space: .asciiz "\n" #creates a line break
oddNum: .word 1 # odd number value
###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	addi $k0 , $k0, 1 #sets k0 to 1 this is a counter 
	
start: 		bge $k0, 8, EXIT # branch when greater than or equal to 8 
		
		
		la $t0, currentValue #load current value
		lw $t0, 0($t0)
		
		la $t1, firstValue #first value
		lw $t1, 0($t1) 
		
		addi $t2, $t1, 2 #add 2 to the odd integer (first Value). This signifies the odd value to add currentValue by.
		
		add $s0, $t0, $t2 # adds the two integers together for a final answer 
		
		sw $s0, currentValue # save the partial sum to currentValue
		sw $t2, firstValue # save the current odd int to firstValue
		
	
		addi $k0 , $k0, 1 #k0++
		
		la   $a0, currentValue        # load address of currentValue
		lw   $a0, 0($a0) # loads the content of a0 into the address 
	      	li   $v0, 1           # specify that you're printing an integer
	      	syscall
		
		la $a0 , space # print out a line break
		li $v0, 4
		syscall 
		
		
		j start # jump to start while not finished 
		
EXIT:	li $v0, 10 #exit and close the program
	syscall	
		
