# COMP3410 Program Template
# Author: Kevin Fisher
# Assignment: PA1

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# fibonacci.asm
# Input: None
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data

fibs:	.word   0 : 9         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
prompttext:	.asciiz "How many fibonacci numbers would you like to see?\n"
errortext:	.asciiz "Error- please only enter an amount from 1 to 9!\n"

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
begin:	      li   $v0, 4	    # syscall 4 = print string
	      la   $a0, prompttext  # store address of prompt string into a0
	      syscall		    # do the diddly
	      li   $v0, 5	    # syscall 5 = read int
	      syscall		    # v0 will hold result
	      # check if user input is allowed..
	      subi $s0, $v0, 10     # subtract input from 10 and store in s0
	      bgez $s0, invalidsize # if s0 >= 0, then it is not a valid size..
	      blez $v0, invalidsize # if the input is 0 or less, it is not valid.
	      
	      la   $s0, fibs        # load address of array into $s0
	      add $s5, $zero, $v0   # load desired amount into $s5

	      li   $s2, 1           # Initialize the Fibonacci numbers with value 1, stored in $s2
	      sw   $s2, 0($s0)      # Set fibs[0] to 1
	      sw   $s2, 4($s0)      # Set fibs[1] to 1
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
	      la   $a0, fibs        # first argument for print (array)
	      add  $a1, $zero, $s5  # second argument for print (size)
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
	    	
invalidsize:	
	      li   $v0, 4	    # syscall 4 = print string
	      la   $a0, errortext  # store address of error string into a0
	      syscall		    # do the diddly
	      j begin
	# End of subroutine to print the numbers on one line
	###############################################################
