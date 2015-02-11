# COMP3410 Program Template
# Author: Michael Vance
# Assignment: PA[1]
# Date: 2/10/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# fibonacci.asm
# Input: 1 integer ( User Generated )
# Output: Print to terminal N Fibonacci numbers ( N = Input )

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data

fibs:	.word   0 : 9         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
size:	.word  9              # create a single integer variable named "size" that indicates the length of the array

userEntry:	.asciiz "Please enter how many Fibonacci numbers you want to see. (Up to 9 numbers only!)"

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	
# New Part! Created entryPrompt lable that loads and prints userEntry label!
entryPrompt:	la   $a0, userEntry	# Load address of the print userEntry string
	      	li   $v0, 4		# Specify that you're printing a string
	      	syscall			# Print the userEntry string

	      # Read integer user gave!	
	      li $v0, 5			# Read integer user entered
	      syscall
	      
	      # Check for validity of input and store input if satisfactory ( input <= 9 )
	      bgt $v0, 9, entryPrompt	# If input is over 9, ask for it again!
	      blt $v0, 0, entryPrompt	# If input is less than 0, ask for it again!
	      beqz $v0, zeroCase	# If input is 0, jump to zeroCase and just print nothing basically!
	      add   $s6, $zero, $v0	# Getting integer user entered and storing as $s6
	      	      
	      la   $s0, fibs        # load address of array into $s0
	      la   $s5, size        # load address of size variable into $s5
	      lw   $s5, 0($s5)      # load array size from its address in the register

	      li   $s2, 1           # Initialize the Fibonacci numbers with value 1, stored in $s2
	      sw   $s2, 0($s0)      # Set fibs[0] to 1
	      sw   $s2, 4($s0)      # Set fibs[1] to 1
	      
	      # No need to modify counter, because only concerned with what is printed, not solved.
	      addi $s1, $s5, -2     # Counter for loop, will execute (size-2) times

	      # Loop to compute each Fibonacci number using the previous two Fib. numbers.
	      # On line 37, "loop" is a label
loop:	 lw   $s3, 0($s0)      # Get value from array fibs[i-2]
	      lw   $s4, 4($s0)      # Get value from array fibs[i-1]
	      add  $s2, $s3, $s4    # fibs[i] = fibs[i-1] + fibs[i-2]
	      sw   $s2, 8($s0)      # Store newly computed fibs[i] in array
	      addi $s0, $s0, 4      # increment address for next fibonacci entry
	      addi $s1, $s1, -1     # decrement loop counter
	      bgtz $s1, loop        # repeat while not finished

	      # Now the Fibonacci numbers are computed and stored in array. Print them.
	      # zeroCase label allows us to jump to here if the user wishes to see no numbers!
zeroCase:     la   $a0, fibs        # first argument for print (array)
	      add  $a1, $zero, $s6  # MODIFIED: second argument for print (user input) No longer size, but rather how ever many numbers the user wants to see up to 9.
	      jal  print            # call print routine (note the 'print' label on line 68)

	      # The program is finished. Exit.
	      li   $v0, 10          # system call for exit
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
	      
print:	add  $t0, $zero, $a0  # starting address of array of data to be printed
	      add  $t1, $zero, $a1  # initialize loop counter to array size
	      la   $a0, head        # load address of the print heading string
	      li   $v0, 4           # specify that you're printing a string
	      syscall               # print the heading string

out:	  lw   $a0, 0($t0)      # load the integer to be printed (the current Fib. number)
	      li   $v0, 1           # specify that you're printing an integer
	      syscall               # print fibonacci number

	      la   $a0, space       # load address of spacer for syscall
	      li   $v0, 4           # specify Print String service
	      syscall               # print the spacer string

	      addi $t0, $t0, 4      # increment address of data to be printed
	      addi $t1, $t1, -1     # decrement loop counter
	      bgtz $t1, out         # repeat while not finished

	      jr   $ra              # return from subroutine
	# End of subroutine to print the numbers on one line
	###############################################################
