.data
	prompt: 	.asciiz "How many numbers do you want to input? "
	message: 	.asciiz "\nThe number of inputs you have chosen is "
	spaceHere:	.asciiz "\n"
	
	fibs:   	.word 0:9
	sizelimit: 	.word 9

.text
	li $v0, 4		#Prompt user for input
	la $a0, prompt
	syscall 
	li $v0, 5		#Stores user's input
	syscall
	move $t0, $v0		#Stores user's input inside temporary file
	li $v0, 4		#Displays message
	la $a0, message
	syscall
	li $v0, 1		#Displays user's input
	move $a0, $t0		#Stores $t0 into an argument
	syscall
	move $s0, $a0		#Stores argument into a saved value
	li $v0, 4		#Creates space in between user's input and next prompt
	la $a0, spaceHere
	syscall
	la   $s1, fibs        	# load address of array into $s0
	la   $s2, sizelimit
	move $s6, $s2       	# load address of size variable into $s6
	lw   $s6, 0($s6)     	# load array size from its address in the register

	li   $s3, 1           	# Initialize the Fibonacci numbers with value 1, stored in $s2
	sw   $s3, 0($s1)      	# Set fibs[0] to 1
	sw   $s3, 4($s1)      	# Set fibs[1] to 1
	addi $s0, $s0, -2     	# Counter for loop, will execute (size-2) times

	# Loop to compute each Fibonacci number using the previous two Fib. numbers.
	# On line 37, "loop" is a label
	bgt $t0, $s6, exit	# Makes sure user input is less than 9
loop:	lw   $s4, 0($s1)      	# Get value from array fibs[i-2]
	lw   $s5, 4($s1)      	# Get value from array fibs[i-1]
	add  $s3, $s4, $s5   	# fibs[i] = fibs[i-1] + fibs[i-2]
	sw   $s3, 8($s1)      	# Store newly computed fibs[i] in array
	addi $s1, $s1, 4      	# increment address for next fibonacci entry
	addi $s0, $s0, -1     	# decrement loop counter
	bgtz $s0, loop        	# repeat while not finished

	# Now the Fibonacci numbers are computed and stored in array. Print them.
	la   $a0, fibs        	# first argument for print (array)
	add  $a1, $zero, $t0  	# second argument for print (size)
	jal  print            	# call print routine (note the 'print' label on line 68)

	# The program is finished. Exit.
exit:	li   $v0, 10          # system call for exit
	syscall               

	###############################################################
	# Subroutine to print the numbers on one line. Another .data segment.
	###########################################################
.data
	      
space:	.asciiz  " "          				# Print a space between each pair of numbers
head:	 .asciiz  "The Fibonacci numbers are:\n" 	# Print a little helpful intro

###########################################################
# Another .text segment, for printing
###########################################################

.text
	      
print:	add  $t0, $zero, $a0  	# starting address of array of data to be printed
	add  $t1, $zero, $a1  	# initialize loop counter to array size
	la   $a0, head        	# load address of the print heading string
	li   $v0, 4           	# specify that you're printing a string
	syscall               	# print the heading string

out:	lw   $a0, 0($t0)      	# load the integer to be printed (the current Fib. number)
	li   $v0, 1           	# specify that you're printing an integer
	syscall               	# print fibonacci number

	la   $a0, space       	# load address of spacer for syscall
	li   $v0, 4           	# specify Print String service
	syscall               	# print the spacer string

	addi $t0, $t0, 4      	# increment address of data to be printed
	addi $t1, $t1, -1     	# decrement loop counter
	bgtz $t1, out         	# repeat while not finished

	jr   $ra              	# return from subroutine
	# End of subroutine to print the numbers on one line
	###############################################################
