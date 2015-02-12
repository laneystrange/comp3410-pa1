#Justin Hiller
#Comp 3410
#PA[1] problem 3
#February 11, 2015
#This program calculates the sum of the odd integers(inclusive) between 1-15

	.data
intro:		.asciiz		"The sum of the odd integers between 1-15 inclusive is: "

	.text
	
	la $a0, intro		#Prints the introduction
	li $v0, 4
	syscall
	
	la $s0, 1		#loads the number 1 into s0
	add $s0, $s0, 3		#adds 1 + 3 = 4 into s0
	add $s0, $s0, 5		#adds 4 + 5 = 9 into s0
	add $s0, $s0, 7		#adds 9 + 7 = 16 into s0
	add $s0, $s0, 9		#adds 16 + 9 = 15 into s0
	add $s0, $s0, 11	#adds 25 + 11 = 36 into s0
	add $s0, $s0, 13	#adds 36 + 13 = 49 into s0
	add $s0, $s0, 15	#adds 49 + 15 = 64 into s0
	
	la $a0, ($s0)		#puts the value of s0(64) into a0
	li $v0, 1		#Prints out 64
	syscall
	
	li $v0, 10		#Exits
	syscall
	
