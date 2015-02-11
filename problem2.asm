# COMP3410 Program Template
# Author: Jay Murphy
# Assignment: PA[2]
# Date: D2/11/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# problem2.asm
# Input: two numbers form user
# Output: Name, title, description of program, addito, subtraction, multiplication, and division of the two given numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
	
#Strings for introduction for assigment 1 problem 2
space: .asciiz "\n"	#new line character
name: .asciiz "Jay Murphy" 	# string that stores my name
title: .asciiz "Chief operating Vice President of Lambda Chi Alpha and former Chief Financail Officer"		#title I made up for myself but it is a real title for myself
description: .asciiz "This program allows you to see the name and title of the programer, and takes in two numbers. Then does calculations on those numers."		#description of the program
instr: .asciiz "Enter a number" #instructions for input in string format
concluding: .asciiz "This program is finished have a nice day"	#Concluding message

###############################################
# .text segment. Assembly instructions go here.
###############################################

	.text
		#print the strings
		#print the name
		li $v0, 4	#prep system call for printing string
		la $a0, name	#pass the argument to the string
		syscall # print string
		
		#print a new line
		li $v0, 4	#prep system call for printing string
		la $a0, space	#pass the argument to the string
		syscall # print string
		
		#print the title
		li $v0, 4	#prep system call for printing string
		la $a0, title	#pass the argument to the string
		syscall # print string
		
		#print a new line
		li $v0, 4	#prep system call for printing string
		la $a0, space	#pass the argument to the string
		syscall # print string
		
		#print the description
		li $v0, 4	#prep system call for printing string
		la $a0, description	#pass the argument to the string
		syscall # print string
		
		#print the instructions
		li $v0, 4	#prep system call for printing string
		la $a0, instr	#pass the argument to the string
		syscall # print string
		
		
#################################################################################################################

		#inputs
		#input one
		li $v0, 5 #prep system call for user input
		syscall #ask for user input
		move $t0, $v0 #move value from v0 to t0
		
		#print the instructions
		li $v0, 4	#prep system call for printing string
		la $a0, instr	#pass the argument to the string
		syscall # print string
		
		#input two
		li $v0, 5 #prep system call for user input
		syscall #ask for user input
		move $t1, $v0 #move v0 to t1
           
		
		
#################################################################################################################


		#arthmetic
		
		#Making the calculations
		
		
		#adding the numers
		add $t2,$t0,$t1	#adding the two number and putting the result into $t2
		
		
		#Printing out the results
		
		#print a new line
		li $v0, 4	#prep system call for printing string
		la $a0, space	#pass the argument to the string
		syscall # print string
		
		move $a0, $t2 #move value to register to print
		li $v0, 1	#prep system call for printing int
		syscall # print int
		
		
		
		
#################################################################################################################
		
		#arthmetic
		
		#Making the calculations
		
		
		#subtracting the numers
		sub $t2,$t0,$t1	#adding the two number and putting the result into $t2
		
		
		#Printing out the results
		
		#print a new line
		li $v0, 4	#prep system call for printing string
		la $a0, space	#pass the argument to the string
		syscall # print string
		
		move $a0, $t2 #move value to register to print
		li $v0, 1	#prep system call for printing int
		syscall # print int
		
		
		
		
#################################################################################################################

#arthmetic
		
		#Making the calculations
		
		
		#mutiplying the numers
		mul  $t2,$t0,$t1	#adding the two number and putting the result into $t2
		
		
		#Printing out the results
		
		#print a new line
		li $v0, 4	#prep system call for printing string
		la $a0, space	#pass the argument to the string
		syscall # print string
		
		move $a0, $t2 #move value to register to print
		li $v0, 1	#prep system call for printing int
		syscall # print int
		
		
		
		
#################################################################################################################
		
		#arthmetic
		
		#Making the calculations
		
		
		#dividing the numers
		div  $t2,$t0,$t1	#adding the two number and putting the result into $t2
		
		
		#Printing out the results
		
		#print a new line
		li $v0, 4	#prep system call for printing string
		la $a0, space	#pass the argument to the string
		syscall # print string
		
		move $a0, $t2 #move value to register to print
		li $v0, 1	#prep system call for printing int
		syscall # print int
		
		
		
		
#################################################################################################################



		#print a new line
		li $v0, 4	#prep system call for printing string
		la $a0, space	#pass the argument to the string
		syscall # print string

		#print the instructions
		li $v0, 4	#prep system call for printing string
		la $a0, concluding	#pass the argument to the string
		syscall # print string


#################################################################################################################


		# The program is finished. Exit.
	      	li   $v0, 10          # system call for exit
	      	syscall               


		