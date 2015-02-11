# COMP3410 Program Template
# Author: William C. Moyer
# Assignment: PA[X]
# Date: Date of submission

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# fibonacci.asm
# Input: None
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data

n1: .word 0 # first word gotten from user	
n2: .word 0 # second word gotten from user

name: .asciiz "Name: William C. Moyer\n" 
title: .asciiz "Title: My second MIPS program\n" 
description: .asciiz "Description: This program gets two integers from the user. Then, the program performs sum, difference, and product calculations on the two numbers. Each result is saved in memory. Each result is then retrieved from memory and printed to the terminal with a concluding message.\n" 
notif1: .asciiz "Enter a number\n" # notifications 1 and 2. 
notif2: .asciiz "Enter another number\n"
addA: .asciiz "\nX + X = " #print values
subA: .asciiz "\nX - X = " # print values
multA: .asciiz "\nX * X = " # print values
closingMessage: .asciiz "\nThanks for playing!" #closing message
	
		
###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
 	      #print out name title and description 		
	      li $v0, 4
              la $a0, name
              syscall
              #print title
              li $v0, 4
              la $a0, title
              syscall
              #print description
              li $v0, 4
              la $a0, description
              syscall
              #print the notification for asking for user input
              li $v0, 4
              la $a0, notif1
              syscall
              
              #get the first user input
	      li $v0, 5
              syscall
              move $s0, $v0 #  move the value gotten from the user into the s0 register
              #print out second notification to get the second user input
              li $v0, 4
              la $a0, notif2
              syscall
              #get the second user input
              li $v0, 5
              syscall
              move $s1, $v0 # move the value gotten from the user into the s1 register
              
              add $t1, $s0, $s1 # add the two values gotten from the user and store them in t1
              
              sub $t2, $s0, $s1 # subtract the two values gotten from the user and store them in t2
             
              mul $t3, $s0, $s1 # multiply the two values gotten from the user and store them in t3
              
              #print out the X + X string
              li $v0, 4
              la $a0, addA
              syscall
              #print out the integer that is the sum of the two numbers
              li $v0, 1 
              move $a0, $t1 
              syscall
              # print out the X - X string
              li $v0, 4
              la $a0, subA
              syscall
              #print out the integer that is the difference of two numbers
              li $v0, 1 
              move $a0, $t2
              syscall
              # print out the X * X string 
              li $v0, 4
              la $a0, multA
              syscall
              # print out the integer that is the product of the two numbers
              li $v0, 1 
              move $a0, $t3
              syscall
              # print out the closing message 
              li $v0, 4
              la $a0, closingMessage
              syscall
              #close the pogram 
              li $v0, 10
              syscall
             
              
              
              
