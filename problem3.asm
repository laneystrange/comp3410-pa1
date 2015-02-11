# COMP3410 Program Template
# Author: Jay Murphy
# Assignment: PA[3]
# Date: 02/11/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# problem2.asm
# Input: none
# Output: Name, title, description of program, addito, subtraction, multiplication, and division of the two given numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
endvalue: .word 15 #the end goal in the while loop
odd:	.word   0 : 7         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
size:	.word  9              # create a single integer variable named "size" that indicates the length of the array
	
	
###############################################
# .text segment. Assembly instructions go here.
###############################################

	.text
	move $t0,$v0
	li $t1,7 #total number of odd numbers 
	li $s0,0 #counter
	li $t2,1 #starting value
	li $t3,0 #total value

	      
	start: bgt $t0,$t1,end #if t0 is less than keep doing start otherwise go to end
		add $t3,$t2,$t3 #add the curent number and the next number together
		sw $t3,0($gp)
		addi $t2,$t2,2 #produce the odd number to add next go around
		addi $t0,$t0,1 # increase the counter by one
		j start
		
		
	
	
	
	
	end:
		lw $a0, 0($gp)
		li $v0, 1	#prep system call for printing int
		syscall # print int
	
		# The program is finished. Exit.
	      	li   $v0, 10          # system call for exit
	      	syscall       