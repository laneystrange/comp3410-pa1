# COMP3410 Program Template
# Author: Enyil Padilla
# Assignment: PA[1]
# Date: 2/11/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# fibonacci.asm
# Input: Integer from user, from 1 to 9, N.
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data

fibs:	.word   0 : 9         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
msg: .asciiz "Please enter number of iterations (0-9): "

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      jal input
	      la   $s0, fibs        # load address of array into $s0
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
	      j finish       	    #Finish program        

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
############################### TODO HOMEWORK CODE ###############################
#Gets user input!
input: 	
	li $v0, 4                         #prepares print statement     
	la $a0, msg                   #loads message into $a0     
	syscall                           #shows message
	li $v0, 5 #Prepares statement
	syscall	#Performs syscall
	bgt $v0, 9, input	#if input bigger than 9, loop
	bltz $v0, input		#if input less than 0, loops again
	beqz $v0, finish	#if input equal zero, finish program
	move $s5, $v0		#moves integer to register s5
	jr $ra			#Goes back to the main program
#Finishes program
finish:
	li   $v0, 10          # system call for exit
	syscall
	
	###############################################################
