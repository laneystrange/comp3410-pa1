#Comp 3410
#Justin Hiller PA[1].2
#February 11, 2015
#This program should print an introduction and prompt the user for two integers
#and perform calculations and save them into memory and then pull these numbers
#from memory and print the results onto the screen.

	.data

name:			.asciiz		"Name: Justin Hiller\nSimple Calculator:\n"
introduction:		.asciiz		"This program takes two integers from the user and performs calculations on the numbers.:\n"
prompt:			.asciiz		"Enter a number: "
sum:			.asciiz		"\nThe sum of the numbers is: "
dif:			.asciiz		"\nThe difference of the numbers is: "
product:		.asciiz		"\nThe product of the numbers is: "
exit:			.asciiz		"\nThanks for playing! Goodbye"

	.text
	
	la $a0, name		#Prints out the name
	li $v0, 4
	syscall	
	
	la $a0, introduction	#Prints out the introduction section
	li $v0, 4
	syscall
	
	la $a0, prompt		#Prints out the prompt for the user to enter a number
	li $v0, 4
	syscall
	
	li $v0, 5		#Reads the user number
	syscall	
	
	move $s1, $v0		#Stores the user's number into the s1 register
		
	la $a0, prompt		#Prompts the user for the second number
	li $v0, 4
	syscall	
	
	li $v0, 5		#Reads the users second number
	syscall
	
	move $s2, $v0		#Moves the number into the s2 register
	
	add $s3, $s1, $s2	#Adding s1 and s2 into the s3 register
	sub $s4, $s1, $s2	#Subtraction on s1 and s2 into the s4 register
	mul $s5, $s1, $s2	#multiplication on s1 and s2 into s5 register
	
	la $a0, sum		#Prints out the text before the addition
	li $v0, 4
	syscall
	
	la $a0, ($s3)		#Prints out the integer from the addition
	li $v0, 1
	syscall
	
	la $a0, dif		#Prints out the text before the subtraction
	li $v0, 4
	syscall
	
	la $a0, ($s4)		#Prints out the result of the subraction
	li $v0, 1
	syscall
	
	la $a0, product		#Prints out the text before the production
	li $v0, 4
	syscall
	
	la $a0, ($s5)		#Prints out the production
	li $v0, 1
	syscall
	
	la $a0, exit		#Prints the exit string
	li $v0, 4
	syscall
	
	li $v0, 10		#Ends the program
	syscall
	
