# COMP3410 Program Template
# Author: Warner Johnson
# Assignment: PA1
# Date: 2/4/2015
#
# Print an introduction that includes: your name, a title, and a brief description of the program.
# Prompt the user for two numbers and save them in two different registers.
# Perform 3 calculations (sum, difference, product) using these two numbers, and save each result in data memory.
# For each computed result, retrieve it from memory and print it to the terminal.
# Print a concluding message and exit.

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
	
intro: .asciiz "\Hi! I'm Warner.\nThis program is going to take two numbers from you, perform three magic calculations and print the results to the console.\n"
first: .asciiz "\Please enter your first number: "
second: .asciiz "\Please enter your second number: "
sum: .asciiz "\The sum of your two numbers is: "
difference: .asciiz "\The difference between your two numbers is: "
product: .asciiz "\The product of your two numbers is: "
linebreak: .asciiz "\n"
outro: .asciiz "buhbye"

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      la   $a0, intro      # load address of intro into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      
	      la   $a0, first      # load address of first into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      
	      li   $v0, 7          # load double input call into first value register
	      syscall              # make system call to accept double input
	      
	      mov.d   $f2, $f0     # move double in f0 to f2
	      
	      la   $a0, second     # load address of second into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      
	      li   $v0, 7	   # load double input call into first value register
	      syscall              # make system call to accept double input
	      
	      mov.d   $f4, $f0     # move double in f0 to f2
	      
	      add.d   $f6, $f2, $f4    # add doubles in f2 and f4, put result in f6
	      sub.d   $f8, $f2, $f4    # subtract double in f4 from double in f2, put result in f8
	      mul.d   $f10, $f2, $f4   # multiply the doubles in f2 and f4, put result in f10
	      
	      la   $a0, sum      # load address of intro into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      jal breakline
	      
	      mov.d $f12, $f6
	      li   $v0, 3
	      syscall
	      jal breakline
	      
	      la   $a0, difference      # load address of intro into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      jal breakline
	      
	      mov.d $f12, $f8
	      li   $v0, 3
	      syscall
	      jal breakline
	      
	      la   $a0, product      # load address of intro into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      jal breakline
	      
	      mov.d $f12, $f10
	      li   $v0, 3
	      syscall
	      
	      la   $a0, outro      # load address of outro into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      
	      li $v0, 10 #loads op code into $v0 to exit program
	      syscall #reads $v0 and exits program
	      
breakline:
	      la   $a0, linebreak  # load address of intro into first argument register
	      li   $v0, 4          # load print string call into first value register
	      syscall		   # make system call that prints string prompt
	      jr $ra


	      
	      
	      
	      
	
