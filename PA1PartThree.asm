# COMP3410 PA1PartThree
# Author: Robert L. Edstrom
# Assignment: PA[1]
# Date: 2/7/15

# PA1PartThree.asm
# Input: none
# Output: sum of all the odd integers from 1 to 15 inclusive

	.data

msg:   .asciiz  "The sum of the odd integers from 1 to 15 inclusive is: "
array: .word	0:8	# Array to store the sum of the odd numbers between 1 and 15 inclusive
count: .word	8	# Total number of odd number between 1 and 15 inclusive. This will be decremented to terminate the loop when count == 0

	.text
		
		la $s0, array		# Loaded the address of the array into $s0
		li $t0, 1		# Stored 1 in $t0
		li $t1, 1		# Stored 1 in $t1
		sw $t1, 0($s0)		# Set array[0] to $t1 (1)
		sw $t0, 4($s0)		# Set array[4] to $t0 (1)
		
loop:
		lw   $s1, 0($s0)	# Loaded the value from array[0] into $s1
		addi $t0, $t0, 2	# Increment $t0 by two for the next odd number and store it in $t0
		add  $t1, $t1, $t0	# Store the sum of the odd integers $t1 and $t0 in $t1
		sw   $t1, 4($s0)	# Set array[1] to $t1 to store the sum of the odd integers
		addi $s0, $s0, 4 	# Increment the address of the array for the sum of the odd integers
		bne  $t0, 15, loop	# Exits the loop when $t0 is equal to 15
		
		j print			# Jump to the print label 
		
print: 
		la $a0, msg		# Loaded the address of msg into $a0
		li $v0, 4		# Setup for printing msg
		syscall			# Syscall to print msg
		
		lw $a0, 0($s0)		# Loaded the sum of the odd integers between 1 and 15 inclusive
		li $v0, 1		# Setup for printing an integer
		syscall			# Syscall to print the sum
		
		j exit			# Jump to exit label

exit:
		li $v0, 10		# Setup for system exit
		syscall			# Syscall and exit


		
		
