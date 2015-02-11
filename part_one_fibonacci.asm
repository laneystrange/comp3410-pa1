# COMP3410 Program Template
# Author: Ben Murphy
# Assignment: PA1
# Date: TBD, but before or on the day it's due
# fibonacci.asm
# Input: Integer N from keyboard
# Output: Print to terminal N Fibonacci numbers

	.data #text for prompting for number of terms
	
prompt: .asciiz "How many Fibonacci numbers would you like to calculate?: "
invalid: .asciiz "That number is invalid. Please make sure the number is greater than zero.\n"

	.text
beginning:	
li $v0, 4			#we're about to print the prompt
la $a0, prompt			#prime the prompt
syscall				#print it
li $v0, 5			#prime reading input
syscall				#read it
blez $v0, retry
move $s7, $v0 			#size
mul $s6, $s7, 4 		#4 bytes per word, RAM is byte-accessible
li $v0, 9 			# 9 allocates $a0 bytes of RAM
move $a0, $s6 			#we will need to allocate this many bytes
syscall    			#allocated
move $s4, $v0 			#copy the starting address of the allocation to a safer spot. this one gets incremented so we will lose track of the initial value later
move $s5, $s4 			#keeping two references because I have the space for it and taking from RAM is a waste of time
j calculate			#skip over the retry section below

retry:				#only ever gets called if negative numbers or 0 are given for input.
li $v0, 4			#going to print something
la $a0, invalid			#the invalid message
syscall				#print it
j beginning			#start over from the top

#we get to cut out loading size from the register because we already have it stored nearby
calculate:
li $s0, 1 			# Initialize the Fibonacci numbers with value 1, stored in $s2
sw $s0, 0($s5) 			# Set fibs[0] to 1
sw $s0, 4($s5) 			# Set fibs[1] to 1
addi $s3, $s7, -2 		# Counter for loop, will execute (size-2) times
loop: lw $s0, 0($s4)		# Get value from array fibs[i-2]
lw $s1, 4($s4) 			# Get value from array fibs[i-1]
add $s2, $s0, $s1 		# fibs[i] = fibs[i-1] + fibs[i-2]
sw $s2, 8($s4) 			# Store newly computed fibs[i] in array
addi $s4, $s4, 4 		# increment address for next fibonacci entry
addi $s3, $s3, -1 		# decrement loop counter
bgt $s3, 0, loop 		# repeat while not finished
addi $s4, $s4, 4 		#increment one last time for the null
sw $zero, 4($s4)		#store 0 at fibs[i+1]

# Now the Fibonacci numbers are computed and stored in array. Print them.

jal print 			# call print routine (note the 'print' label on line 68)
				# The program is finished. Exit.
li $v0, 10 			# system call for exit
syscall
###############################################################
# Subroutine to print the numbers on one line. Another .data segment.
###########################################################
.data
space: .asciiz " " 		# Print a space between each pair of numbers
head: .asciiz "The Fibonacci numbers are:\n" # Print a little helpful intro
###########################################################
# Another .text segment, for printing
###########################################################
.text
print: add $t0, $zero, $s5 # starting address of array of data to be printed
la $a0, head 			# load address of the print heading string
li $v0, 4 			# specify that you're printing a string
syscall 			# print the heading string
out: lw $a0, 0($t0)	 	# load the integer to be printed (the current Fib. number)
li $v0, 1 			# specify that you're printing an integer
syscall 			# print fibonacci number
la $a0, space 			# load address of spacer for syscall
li $v0, 4 			# specify Print String service
syscall 			# print the spacer string
addi $t0, $t0, 4 		# increment address of data to be printed
add $s7, $s7, -1			# decrement counter
bgtz $s7, out 			# if the counter isn't done counting, continue looping
jr $ra 				# return from subroutine
				# End of subroutine to print the numbers on one line
###############################################################
