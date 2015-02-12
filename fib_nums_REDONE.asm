# COMP3410 Program Template
# Author: Kendal Harris
# Assignment: PA[1]
# Date: 11 February 2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# fib_num_REDONE.asm
# Input: single integer N (user input)
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
prompt: .asciiz "Please enter the amount of Fibonacci numbers you want to print out. (acceptable answers 1-9)\n" #prompt to obtain user input
fibs:	.word   0 : 9         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
#size was deleted because it will be entered by the user when the program starts.
confirm: .asciiz "You have chose to see the selected amount of Fibonacci Numbers: "
###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      la   $s0, fibs        # load address of array into $s0

#obtainInput WAS CREATED IN ORDER TO ASK THE USER FOR AN INTEGER 1-9. If greater than 9 obtainInput will repeat.
obtainInput: #Prompt usesr for input
	     li $v0,4 #prep call for displaying string
	     la $a0,prompt #load propmt into address reg
	     syscall #proceed with string display
	     
	     #Get user input
	     li $v0,5 #prep call for collecting an integer
	     syscall #proceed with obtaining user input
	    
	    #Store the collected integer into the original size address used in the automated Fib_nums
	     move $s5,$v0 #move user input size into $s5
	     bgt $s5,9,obtainInput #if the user has inputted an unacceptable input propmt again
	     
	     #Show a confirmation of the number selected
	     li $v0,4 #prep call for displaying string
	     la $a0,confirm #load in the confirmation message
	     syscall #proceed with string display
	     li $v0, 1 #prep call for displaying an integer
	     move $a0,$s5 #move integer into address reg (needed to display actual number instead of address)
	     syscall #proceed with display of integer

#THE REST OF THE PROGRAM REMAINS THE SAME AS THE ORIGINAL     	     
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
head:	 .asciiz  "\nThe Fibonacci numbers are:\n" 	# Print a little helpful intro

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