# COMP3410 Program Template
# Author: Warner Johnson
# Assignment: PA1
# Date: 2/5/2015
#
# fifteenOdd.asm
# Input: none
# Output: sum of the odd integers between one and fifteen

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      li $s0, 1
	      li $s2, 1
	      li $s3, 15
	    
popOdd:
	      addi $s2, $s2, 2
	      add  $s0, $s0, $s2
	      bne  $s2, $s3, popOdd
	      
	      la $a0, ($s0)
	      li $v0, 1
	      syscall
	      
	      li $v0, 10 #loads op code into $v0 to exit program
	      syscall #reads $v0 and exits program
