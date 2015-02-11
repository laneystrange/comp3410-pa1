.data
	name:		.asciiz "Cletus Hatten"
	title:		.asciiz "\nMIPS Calculations"
	description:	.asciiz "\nThis program will perform 3 calculations (sum, difference, product) and print them."
	
	prompt:		.asciiz "\nEnter your first number for your calculations: "
	promptTwo: 	.asciiz "\nEnter your second number for your calculations: "
	
	multip:		.asciiz "\nMultiplication: "
	addit:		.asciiz "\nAddition: "
	subtr:		.asciiz "\nSubtraction: "
	
	output:		.asciiz "\nWe have been successful in our quest!! *Thor's Voice*"
	
.text
	li $v0, 4		#This will display Programmer's name
	la $a0, name
	syscall
	li $v0, 4		#This will display the title
	la $a0, title
	syscall
	li $v0, 4		#This will display the description
	la $a0, description
	syscall
	li $v0, 4		#This will display the first prompt
	la $a0, prompt
	syscall
	li $v0, 5		#Stores user's input
	syscall
	move $s0, $v0		#Stores $v0 into temporary file
	li $v0, 4		#This will display the second prompt
	la $a0, promptTwo
	syscall
	li $v0, 5		#Stores user's input
	syscall
	move $s1, $v0		#Stores $v0 into temporary file
	
	add $t0, $s0, $s1
	sub $t1, $s0, $s1
	mul $t2, $s0, $s1
	
	li $v0, 4		#Prints addition title
	la $a0, addit
	syscall
	li $v0, 1		#Prints addition solution
	move $a0, $t0
	syscall
	li $v0, 4		#Prints subtraction title
	la $a0, subtr
	syscall
	li $v0, 1		#Prints subtraction solution
	move $a0, $t1
	syscall
	li $v0, 4		#Prints multiplication title
	la $a0, multip
	syscall
	li $v0, 1		#Prints multiplication solution
	move $a0, $t3
	syscall
	
	li $v0, 4		#Prints output
	la $a0, output
	syscall