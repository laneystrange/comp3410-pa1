# COMP3410 Program Template 
# Author: Berkeley
# Assignment: PA1
# Date: 2/10/2015 
 
 
# Turn in one .asm file per assignment component 
# Remember to submit it as a pull request to the GitHub repo for the assignment  
 
# fibonacci.asm 
# Input: User Input on size of  
# Output: Print to terminal N Fibonacci numbers 
  
########################################################## 
# .data segment. Constant and variable definitions go here. 
##########################################################  

	.data
userPrompt: .asciiz	"Enter the number of Fibonacci numbers you wish to see, keep it 9 and below. If it is more than 9 this loop will repeat\nInput:"	#Prompts the user for input of how many they wish to see
fibs:	.word   0 : 9         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	#Certain parts were deleted because they would interfere with code later and it is not needed and works without it
	      la   $s0, fibs        # load address of array into $s0

#This is the instrucitons that obtain the user's input and will use it in the program further down to decide how many numbers it will print
userInput: #Prompt usesr for input
	     li $v0,4	#Preps for printing
	     la $a0,userPrompt	#Loads the string that I wish it to print
	     syscall	#Prints the string
	     li $v0,5 #Prep for taking in an integer from the user
	     syscall #Takes in the integer from the user in the command line
	    
	     move $s5,$v0	#Moves the user input to $s5for 
	     bgt $s5,9,userInput #if the user has inputted an unacceptable input propmt again

############################################### 
# The original .text segment. Assembly instructions go here. 
############################################### 
	       li   $s2, 1           # Initialize the Fibonacci numbers with value 1, stored in $s2
	      sw   $s2, 0($s0)      # Set fibs[0] to 1
	      sw   $s2, 4($s0)      # Set fibs[1] to 1
	      addi $s1, $s5, -2     # Counter for loop, will execute (size-2) times
	      # Loop to compute each Fibonacci number using the previous two Fib. numbers. 
	      # On line 37, "loop" is a label 
loop:		lw   $s3, 0($s0)      # Get value from array fibs[i-2] 
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
 	# End of subroutine to print the numbers on one line 
 	############################################################### 
