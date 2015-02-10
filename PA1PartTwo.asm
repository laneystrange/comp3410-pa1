# COMP3410 Program Template
# Author: Robert L. Edstrom
# Assignment: PA[1]
# Date: 

# PA1PartTwo.asm
# Input: two integers
# Output: introduction along with the sum, difference, and product of two integers
	
	.data

intro:	.asciiz	"Welcome, I am Robert Edstrom and this is PA1 part-two. \nInput: two integers, Output: sum, difference, & product\n"
msg0:	.asciiz	"Pick an integer: "
add2:	.asciiz	"Sum: "
sub2:	.asciiz	"\nDifference: "
mult2: 	.asciiz "\nProduct: "

	.text
		
		# Program setup
		la  $a0, intro		# Load the address of intro into $a0
		li  $v0, 4		# Setup for printing the intro
		syscall			# Syscall to print the intro
		
		la  $a0, msg0		# Load the address of msg0 into $a0
		li  $v0, 4		# Setup for printing msg0
		syscall 		# Syscall to print msg0 
		
		li  $v0, 5		# Setup for accepting an integer as user input
		syscall			# Syscall to prompt the user for an integer
		move $t0, $v0		# Move the integer from $v0 to $t0
		
		la  $a0, msg0		# Load the address of msg0 into $a0
		li  $v0, 4		# Setup for printing msg0 
		syscall			# Syscall to print msg0
		
		li  $v0, 5		# Setup for accepting a second integer as user input
		syscall			# Syscall to prompt the user for an integer
		move $t1, $v0		# Move the second integer from $v0 to $t0
		# End program setup
		
		jal addInts		# Jump to addInts to perform addition on the two integers
		jal subInts		# Jump to subInts to perform subtraction on the two integers
		jal multInts		# Jump to multInts to perfrom multiplication on the two integers
		
		li $v0, 10		# Setup for system exit
		syscall			# Syscall to exit
		
		
addInts: 	add $t2, $t0, $t1	# Add values stored in $t0 and $t1 and store the result in $t2
		la  $a0, add2		# Load address of add2 message into $a0
		li  $v0, 4		# Setup for printing add2 message
		syscall			# Syscall to print add2 message
		
		la $a0, ($t2)		# Load address of $t2
		li $v0, 1		# Setup for printing the sum of the two integers
		syscall			# Syscall to print the sum of the two integers
		
		jr $ra			# Returns to jal subInts
		
subInts: 	sub $t2, $t0, $t1	# Subtract the values store in $t0 and $t1 and store the result in $t2
		la $a0, sub2		# Load address of sub2 message into $a0
		li $v0, 4		# Setup for printing sub2 message
		syscall			# Syscall to print sub2 message
		
		la $a0, ($t2)		# Load address of $t2
		li $v0, 1		# Setup for printing the difference of the two integers
		syscall			# Syscall to print the difference of the two integers
		
		jr $ra			# Returns to jal multInts
		
multInts: 	mul $t2, $t0, $t1	# Multiply the values stores in $t0 and $t1 and store the result in $t2
		la $a0, mult2		# Load address of mult2 message into $a0
		li $v0, 4		# Setup for printing mult2 message
		syscall			# Syscall to print mult2 message
		
		la $a0, ($t2)		# Load address of $t2 into $a0
		li $v0, 1		# Setup for printing the product of the two integers
		syscall			# Syscall to print the product of the two integers
		
		jr $ra			# Returns to the next command - line 45
		
	

			
