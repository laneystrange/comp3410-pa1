# COMP3410 Program Template
# Author: Michael Vance
# Assignment: PA[1]
# Date: 2/10/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# partTwo.asm
# Input: 2 integers ( User Generated )
# Output: Print to terminal introduction, 3 integers, and concluding message

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
	
introOne:	.asciiz "Hello, my name is Michael Vance!"
introTwo:	.asciiz "This is PART TWO of PA[1]! The basic funciton of this problem is to perform simple operations."
introThree:	.asciiz "Based on your numeric input, I will show the sum, difference, and product of those numbers!"
entryOne:	.asciiz "Please enter the first number."
entryTwo:	.asciiz "Please enter the second number."
space:		.asciiz  " "          	# Print a space between each pair of numbers
newLine:	.asciiz  " \n "          	# Print a space between each pair of numbers

calculations:	.word 0 : 3	# Create an array variable named calculations of 3 word-length elements.

###############################################
# .text segment. Assembly instructions go here.
###############################################

	.text
	
		# The following lines load addresses for string printing, 
		# specify a string is being printed and finally print the specified string.
		
		# This set of lines handles the printing of the introduction.
		la   $a0, introOne	# Load address of the introOne string
	      	li   $v0, 4		# Specify that you're printing a string
	      	syscall			# Print the introOne string
		
		# newline
		la   $a0, newLine       # load address of spacer for syscall
		li   $v0, 4           # specify Print String service
		syscall               # print the spacer string
	      	
	      	la   $a0, introTwo	# Load address of the introTwo string
	      	li   $v0, 4		# Specify that you're printing a string
	      	syscall			# Print the introTwo string
		
		# newline
		la   $a0, newLine       # load address of spacer for syscall
		li   $v0, 4           # specify Print String service
		syscall               # print the spacer string
	      	
	      	la   $a0, introThree	# Load address of the introThree string
	      	li   $v0, 4		# Specify that you're printing a string
	      	syscall			# Print the introThree string
		
		# newline
		la   $a0, newLine       # load address of spacer for syscall
		li   $v0, 4           # specify Print String service
		syscall               # print the spacer string
	      	
	      	# This set of lines handles the printing and storing of the user inputs.
	      	# Printing statement to ask for input one:
		la   $a0, entryOne	# Load address of the entryOne string
	      	li   $v0, 4		# Specify that you're printing a string
	      	syscall			# Print the entryOne string
		
		# Loading input one:
		li $v0, 5		# Load the first number given.
		syscall
		
		# Storing input one:
		add $s0, $zero, $v0	# Store the first number given into $s0.
		
		# newline
		la   $a0, newLine       # load address of spacer for syscall
		li   $v0, 4           # specify Print String service
		syscall               # print the spacer string
		
		# Printing statement to ask for input two:
	      	la   $a0, entryTwo	# Load address of the entryTwo string
	      	li   $v0, 4		# Specify that you're printing a string
	      	syscall			# Print the entryTwo string
	      	
	      	# Loading input two:
 	    	li $v0, 5		# Load the second number given.
		syscall
		
		# Storing input two:
		add $s1, $zero, $v0	# Store the second number given into $s1.
		
		la $s2, calculations	# Load address of array into $s2.
		
		# Calculations performed in following lines:
		# Adding inputs:
		add $t0, $s0, $s1	# Adding inputs and storing in temp.
		sw $t0, 0($s2)		# Storting sum into memory.
		
		# Subtracting inputs:
		sub $t0, $s0, $s1	# Subtracting inputs and storing in temp.
		sw $t0, 4($s2)		# Storing differnce into memory.
		
		# Multiplying inputs:
		# Multiplication is tricky. I made input "A" add to itself for input "B" times.
		addi $t1, $s1, -1		# We want the counter to run one less than input "B" times. I.E. 2*3 can also mean 2 + 2 + 2. So we want to jump back to label only once.
		li $t0, 0			# Reset $t0 to 0 for correct multiplication.
		add $t0, $t0, $s0		# Add input "A" to temp and store there.
		beq $s0, 1, oneCase		# If multiplying by one, skip multiplicaiton. Result is itself.
		beq $s1, 1, oneCaseTwo		# If multiplying by one, skip multiplicaiton. Result is itself.
		beq $s1, 0, zeroCase		# If multiplying by zero, result is zero.
multiply:	add $t0, $t0, $s0		# Add input "A" to itself ( a.k.a temp ) and store there.
		addi $s3, $s3, 1		# Counter to keep track of how many times other input is being added to itself.
		bne $s3, $t1, multiply		# If counter != other input jump back and "multiply" again. Basically add the input to itself again.
		sw $t0, 8($s2)			# Storing product into memory.
		j target			# Need jump to skip over one and zero cases if they aren't caught earlier.
oneCase:	sw $s1, 8($s2)			# Simply store input "B" if input "A" is 1 ( Because B * 1 = B ).
oneCaseTwo:	sw $s0, 8($s2)			# Simply store input "A" if input "B" is 1 ( Because A * 1 = A ).
zeroCase:	sw $s1, 8($s2)			# Simply store zero if either input is zero.
		
		# Print calculation results:
		# Sum:
target:		lw $a0, 0($s2)		# Load integer to be printed.
		li $v0, 1		# Specify printing an integer.
		syscall			# Print sum.
		
		la   $a0, space       # load address of spacer for syscall
		li   $v0, 4           # specify Print String service
		syscall               # print the spacer string
		
		# Difference:
		lw $a0, 4($s2)		# Load integer to be printed.
		li $v0, 1		# Specify printing an integer.
		syscall			# Print difference.
		
		la   $a0, space       # load address of spacer for syscall
		li   $v0, 4           # specify Print String service
		syscall               # print the spacer string
		
		# Product:
		lw $a0, 8($s2)		# Load integer to be printed.
		li $v0, 1		# Specify printing an integer.
		syscall			# Print product.
		
		# The program is finished. Exit.
	      	li   $v0, 10          # system call for exit
		syscall 
