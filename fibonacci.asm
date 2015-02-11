# COMP3410 Fibonacci (Part 1)
# Author: Kieran Blazier
# Assignment: PA[1]
# Date: 2/10/15

# fibonacci.asm
# Input: A number N
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.include "macros.asm"

	.data

prompt: .asciiz "How many Fibonacci numbers to print? (1 or greater)\n"


###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      
input:	      la $a0, prompt #
	      print_str      # prompt the user for input
	         
	      read_int # get input
	      
	      ble $v0, $zero, input # if input is invalid (0 or negative), retry input      
	      
	      add  $a0, $zero, $v0  # argument for print N
	      jal  print            # call print routine (note the 'print' label on line 68)

	      # The program is finished. Exit.
	      exit            

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
	      
# Recursive fib(n) routine
fib:      addi $sp, $sp, -8 # reserve space for two words on the stack
 	  sw $ra, 4($sp)   # save $ra on stack
 	  
	  add $v0, $zero, $a0 # set the return value initially equal to n
	  blt $a0, 2, fib_return # if n < 2, return
	  
	  sw $a0, 0($sp) # save n on the stack

	  addi $a0, $a0, -1 # fib(n - 1)
          jal fib
          
          lw $a0, 0($sp) # restore n
          sw $v0, 0($sp) # save fib(n - 1) on the stack
          
          addi $a0, $a0, -2 # fib(n - 2)
          jal fib
          
          lw $v1, 0($sp) # restore fib(n - 1)
          
          add $v0, $v0, $v1 # set the return value equal to fib(n - 1) + fib(n - 2)
          
fib_return: lw $ra, 4($sp) # restore the $ra
	    addi $sp, $sp, 8 # restore the stack pointer
            jr $ra # return from subroutine
 
 
print:  addi $sp, $sp, -4 # reserve space for one word on the stack
 	sw $ra, 0($sp)   # save $ra on stack
 	  
        add $t0, $zero, $a0 # get number to print from argument
        li $t1, 1  # initialize loop counter to 1
	la $a0, head # load address of the print heading string
	print_str
	
out:    add $a0, $zero, $t1 # pass the loop counter to fib
        jal fib
        
        add $a0, $zero, $v0 # load the integer to be printed (the current Fib. number)
	print_int
	
	la $a0, space # load address of spacer for syscall
	print_str
	
	addi $t1, $t1, 1 # increment the loop counter
	ble $t1, $t0, out # repeat while not finished
	
	lw $ra, 0($sp) # restore the $ra
	addi $sp, $sp, 4 # restore the stack pointer
	jr $ra # return from subroutine
	
# End of subroutine to print the numbers on one line
###############################################################
