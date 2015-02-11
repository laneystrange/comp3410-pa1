# Author: Tam Duong
# Assignment: PA1
# Date: 2/11/15

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
size:	.word  9              # create a single integer variable named "size" that indicates the length of the array

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      la   $s0, fibs        # load address of array into $s0
	      la   $s5, size        # load address of size variable into $s5
	      lw   $s5, 0($s5)      # load array size from its address in the register

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
	      la   $t0, fibs        # first argument for print (array)
	      add  $t1, $zero, $s5  # second argument for print (size)
	      jal  print            # call print routine (note the 'print' label on line 68)

	      # The program is finished. Exit.
	      li   $v0, 10          # system call for exit
	      syscall               

	###############################################################
	# Subroutine to print the numbers on one line. Another .data segment.
	###########################################################
	      .data
	      
space:	.asciiz  " "          				# Print a space between each pair of numbers
head:	 .asciiz  "The Fibonacci numbers are1:\n" 	# Print a little helpful intro
ask: 	.asciiz  "Fibonacci numbers to print (up to 9 only):\n"		# Print ask user how many # to print

###########################################################
# Another .text segment, for printing
###########################################################

	      .text
	      
print:	  la	$a0, ask		# load address of ask to $a0
		li   $v0, 4		# specify that you're printing a string
		syscall			# print the ask string
		li    $v0, 5		# specify that you're reading an int
		syscall			# get user input int
		add  $a1, $zero, $v0	# store user input to $a1
		blez $a1, print		# if user input <= 0 then ask again
		bgt  $a1, $t1, print	# if user input > 9 then ask again
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
	      addi $a1, $a1, -1     # decrement loop counter
	      bgtz $a1, out         # repeat while not finished

	      jr   $ra              # return from subroutine
	# End of subroutine to print the numbers on one line
	###############################################################
