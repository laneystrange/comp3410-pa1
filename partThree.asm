# COMP3410 Program Template
# Author: Michael Vance
# Assignment: PA[1]
# Date: 2/10/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# partThree.asm
# Input: none
# Output: Print to terminal 1 integer ( final result from summation )

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
	
odds:	.word	0 : 7					# Array to store partial sums
space:	.asciiz  " "          				# Print a space between each pair of numbers

###############################################
# .text segment. Assembly instructions go here.
###############################################

	.text
	
		la $s0, odds		# Load address for odds array
		li $s1, 1		# Minimum, starting point
		li $s2, 15		# Maximum, last number you want
		li $s3, 1		# Keeps track of next odd number
		
while:		addi $s3, $s3, 2	# Find next odd number
		add $s1, $s1, $s3	# Add that next odd number to the previous partial sum
		sw $s1, 0($s0)		# Store that partial sum into array "odds"
		addi $s0, $s0, 4	# Increment to the next spot in memory for next partial sum
		ble $s3, $s2, while	# Loop back if you haven't gone through all odd numbers including 15

		li $t1, 7		# Loop counter, should run 7 times because 1 - 15 has 7 odd numbers
		la $a0, odds		# Load address for odds array
		add  $t0, $zero, $a0	# Put starting address of array into $t0 register

out:		lw $a0, 0($t0)		# Load the integer to be printed		
		addi $t0, $t0, 4      # increment address of data to be printed
		addi $t1, $t1, -1     # decrement loop counter
		bgtz $t1, out         # repeat while not finished
		
		# Placed this part outside of loop, so that only the final result will print.
		li $v0, 1		# Prepare for printing
		syscall			# Print final result
		
		# The program is finished. Exit.
	      	li   $v0, 10          # system call for exit
		syscall 
