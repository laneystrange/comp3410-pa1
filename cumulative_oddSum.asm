# COMP3410 Program Template
# Author: Kendal Harris
# Assignment: PA[1]
# Date: 11 February 2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# cumulative_oddSum.asm
# Input: none
# Output: sum of the odd integers from 1-15. (result should read 64)

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data

result: .asciiz "The sum of the first fifteen odd numbers is: "

sums:	.word   0 : 15         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
###############################################
# .text segment. Assembly instructions go here.
###############################################

	     .text
	     la   $s0, sums        # load address of array into $s0
	     li $t0,0       #serve as loop counter
	     li $t1,1	#first odd number
	     li $t2,0	#cumulative sum initialized to zero


loop:	#Loop executes while the counter t0 is between 1-15
	add $t2, $t2, $t1	#add number into cumulative sum t2
	sw $t2, 0($s0) 		#store the sum in memory
	addi $s0,$s0,4		#progress to the next memory location
	addi $t0, $t0,2		#increment loop counter by 2
	addi $t1, $t1, 2	#progresses onto next odd number
	bleu, $t0, 15, loop	#continues executing loop for 1-15 inclusive 

	#Prep the system for string print then integer print
	li $v0,4	 #prep call for displaying string
	la $a0,result    #load propmt into address reg
	syscall 	#proceed with string display
	li $v0, 1	#Preps to print an integer
	la $a0,( $t2)	#Loads the $s0 total finished integer
	syscall		#Prints the total integer

	li $v0, 10	#Preps to exit
	syscall		#proceeds with exiting