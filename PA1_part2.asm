#Denzel Young
#Programming Assignment 1
#Part 2
#COMP 3410

.data

intro: .asciiz "Hello, my name is Denzel Young \n"
intro2: .asciiz "And this program is called 'Intro to MIPS' \n"
intro3: .asciiz "This program will add, multiply and subtract two numbers, then save the results \n"

addText: .asciiz "The sum of 34 and 10 is: "
subtractText: .asciiz "\nThe difference between 34 and 10 is: "
multiplyText: .asciiz "\nThe product of 34 and 10 is: "

.text

#The program completes the assignment in three stages, the first of which is the introduction
introduction: 
	li $v0, 4
	la $a0, intro
	syscall
	
	li $v0, 4
	la $a0, intro2
	syscall
	
	li $v0, 4
	la $a0, intro3
	syscall
	
#Next, the two numbers are loaded into $t1 and $t2, added and placed into register $a0 to print
addition:
	li $v0, 4
	la $a0, addText
	syscall
	
	li $t1, 34
	li $t2, 10
	add $a0, $t1, $t2
	
	li $v0, 1
	syscall

#Because the numbers are already loaded into $t1 and $tw, no loading is necessary.
#All that was done here is the subtraction and overwriting of $a0	
subtraction:
	li $v0, 4
	la $a0, subtractText
	syscall
	
	sub $a0, $t1, $t2
	li $v0, 1
	syscall
	
#Multiplication works slightly differently, as the numbers were multiplied but then stored in memory.
#Then, because MIPS designates most to least from left to right, we need the lowest 32 bits.
#After those are loaded, all that is needed is a print command.
multiplication:
	li $v0, 4
	la $a0, multiplyText
	syscall
	
	mult $t1, $t2
	mflo $a0
	li $v0, 1
	syscall
	
li $v0, 10
syscall
