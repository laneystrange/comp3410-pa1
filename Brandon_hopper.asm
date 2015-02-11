# COMP3410 Program Template
# Author: Brandon Hopper
# Assignment: PA[X]
# Date: 02/11/2015

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

Ask_Input: .asciiz "\How many numbers would you like to print?\n" 
insert_into: .word 4 #Load word into memory
buffer: .space 80

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
		
	     la   $s0, fibs        # load address of array into $s0
		la   $s5, size        # load address of size variable into $s5
		
	      #                 ------------My code below-------------
	      #--------------------------------------------------------------------
	      
	      #Print message to ask for user input
	      li $v0, 4
	      la $a0, Ask_Input
	      syscall
		
	      #Prompt for user input
	      li $v0,5
	      syscall
              #move $s5, $v0
	      
	      #--------------------------------------------------------------------
	      
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
	      la   $a0, fibs        # first argument for print (array)
	      add  $a1, $zero, $s5  # second argument for print (size)
	      jal  print            # call print routine (note the 'print' label on line 68)
		
		j problem2
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


##########################################################
# .data segment for Problem 2
##########################################################
.data

Print_Info: .asciiz "\n\n####################\nStarting Problem 2\n##################\nName: Brandon Hopper\nTitle: Printing Program\nDescription: This program was designed to print stuff xD." 
Ask_input1: .asciiz "\nPlease enter a number for a: "
Ask_input2: .asciiz "\nPlease enter a number for b: "
Inser_data: .word 4 #Load word into memory


#---------------------------------------------------------
# Problem # 2
#---------------------------------------------------------
.text
	#Print the info to the screen
problem2: la $a0, Print_Info
	li $v0, 4
	syscall
	
	#Print message to ask for user input 1
	li $v0, 4
	la $a0, Ask_input1
	syscall
		
	#Prompt for user input 1
	li $v0,5
	syscall
        move $t0, $v0
        
	#Print message to ask for user input 2
	li $v0, 4
	la $a0, Ask_input2
	syscall
		
	#Prompt for user input 2
	li $v0,5
	syscall
        move $t1, $v0
        
        li $v0, 1
        li $t1, 4
	syscall
        
        add $t3,$zero,$t0 #set t3 to t1s value
        add $t4,$zero,$t1 #set t4 to t0s value
        
        #Multiply and save the results
mult:   add $t3,$t3,$t3
	addi $t4, $t4, -1     # decrement loop counter
	bgtz $t4, mult        # repeat while not finished
        
        #Add and set
	add $t5,$t1,$t0
	
	#Subtract and set
	sub $t6,$t1,$t0
                 
        move $a0, $t4
        #add $a0,$t1,$t0
        #print the values
        li $v0, 1
        li $a0, 4
	syscall
	
	#print the values
       # li $v0, 1
       # li $t5, 5
	#syscall
	
	#print the values
       # li $v0, 1
       # li $t1, 5
	#syscall
	
	j problem3
	      
	li   $v0, 10          # system call for exit
	syscall               
###############################################################


##########################################################
# .data segment for Problem 2
##########################################################
.data
Print_Info2: .asciiz "\n\n####################\nStarting Problem 3\n##################\n"

#---------------------------------------------------------
# Problem # 3
#---------------------------------------------------------
.text
	#Print info on screen for which problem your on
problem3:la $a0, Print_Info2
	li $v0, 4
	syscall
	
	addi $t0, $zero, 8
        addi $t1, $zero, 1
        addi $t2, $zero, 3
        #Add odd numbers
addodds:add $t1,$t1,$t2
	addi $t2, $t2, 2      # keep adding 2
	addi $t0, $t0, -1     # decrement loop counter
	bgtz $t0, addodds        # repeat while not finished

        #print the values
        li $v0, 1
        lw   $a0, 0($t1) 
	syscall
	
	
	          
	li   $v0, 10          # system call for exit
	syscall               
###############################################################
