# COMP3410 Program Template
# Author: Jay Murphy
# Assignment: PA[1]
# Date: D2/11/2015

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
instr:	.asciiz 	"How many numbers of the fibonacci sequence do you want"	#String to ask the user the qeustion of how many 
											#how many number he would like to print
											
usernum: .word	0		#the number items to print out. By ddefault zero and will change once user inputs data




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
	      
	      #ask for the user input and store it
	      jal input #jump to the input label to ask for input
	      

	      # Now the Fibonacci numbers are computed and stored in array. Print them.
	      la   $a0, fibs        # first argument for print (array)
	      add  $a1, $zero, $t0  # second argument for print (size)
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

###########################################################
# Another .text segment, for asking for user input
###########################################################
	.text
	#instructions for printing the string that ask users for number
	input:	li $v0, 4	#prep system call for printing string
		la $a0, instr	#pass the argument to the string
		syscall # print strin
		

		
		li $v0, 5 #prep system call for user input
		syscall #ask for user input
		
		bge $v0, $s5, input #if value is greater than the size of the array then ask for value again
		move $t0, $v0 # moves register v0 to t0
		
		#return to sub routine
		jr $ra
