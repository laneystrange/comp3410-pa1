# COMP3410 Program Template
# Author: Warner Johnson
# Assignment: PA1
# Date: 2/4/2015
#
# fibonacci.asm
# Input: User input
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
	
prompt: .asciiz "\Please enter an integer:\n"
delimiter: .asciiz "\, "

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      la   $a0, prompt      # load address of prompt into first argument register
	      li   $v0, 4           # load print string call into first value register
	      syscall		    # make system call that prints string prompt
	      
	      li   $v0, 5	    # load user input integer call into first system register
	      syscall               # make system call that takes user input
	      
	      move $s0, $v0	    #move user input from first system register to save register one
	      li $s1, 1		    #place one in save register two
	      li $s2, 1		    #place one in save register three
	      li $s3, 1	            #place one in save register four
	      bgtz $s0, printOne    #branch to printOne if save register one has a value greater than zero
	      
printOne:     li $a0, 1		    #load one into the first argument register
	      li $v0, 1		    #load one into the first system register
	      syscall               #print one
	      subi $s0, $s0, 1      #subtract one from the first save register
	      jal delimit
	      bgtz $s0, loop	    #branch to loop if save register one is still greater than zero

loop:
	      la $a0, ($s3)	    #load address of save register four into argument register one
	      li $v0, 1             #load print int call into system register one
	      syscall               #print contents of save register four
	      jal delimit
	      
	      add $s3, $s1, $s2     #add save register two and one, place result into save register four
	      move $s1, $s2         #move contents of save register three into save register two
	      move $s2, $s3         #move contents of save register four into save register three
	      subi $s0, $s0, 1      #subtract one from the first save register	   
	      
	      bgtz $s0, loop	    #branch to loop if save register one is still greater than zero
	      blez $0, exit

delimit:
	      la   $a0, delimiter      # load address of delimiter into first argument register
	      li   $v0, 4           # load print string call into first value register
	      syscall		    # make system call that prints string prompt
	      jr   $ra
	  
exit:
	      li $v0, 10 #loads op code into $v0 to exit program
	      syscall #reads $v0 and exits program