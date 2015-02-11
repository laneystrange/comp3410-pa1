# COMP3410
# Author: Miguel Betances
# Assignment: PA[1]
# Date: Feb/11/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# Calculator.asm
# Input: two integers
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################
	.data

	head: .asciiz "\nMiguel Betances: Assembly Aritmetic Calculator\n"

		input1: .asciiz 	"Enter first number: \n" 	#Ask user for input
		input2: .asciiz 	"Enter second number: \n" 	#Ask user for input
		result1: .asciiz 	"\nAddition result:  "
		result2: .asciiz	"\nSubstraction result:  "
		result3: .asciiz 	"\nProduct result :  "
		done:	.asciiz 	"\nDone\n" 			#Done 
###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	
	#Display welcome
		li $v0,4
		la $a0, head
		syscall
	#Asking for user input 
		li $v0,4
		la $a0, input1
		 syscall

		li $v0,5	#Store the user input
		syscall

		move $t0, $v0	#Move the user input value to temporary register t0
	#Asking user for input
		li $v0,4
		la $a0, input2
		syscall

		li $v0,5
		syscall

		move $t1, $v0	#Move the user input value to temporary register t1
		
	#Performing addition
		add $t2,$t0,$t1
		li $v0,4
		la $a0, result1	#Display message
		 syscall
		li $v0,1
		move $a0,$t2	#Move the user input value to temporary register t2
		 syscall

	#Performing substraction
		sub $t2,$t0,$t1
		li $v0,4
		la $a0, result2	#Display mesage
		 syscall
		li $v0,1
		move $a0,$t2	#Move the user input value to temporary register t2
		 syscall

	#Performing multiplication
		mul $t2,$t1,$t0
		li $v0,4
		la $a0, result3	#Display message
		 syscall
		li $v0,1
		move $a0,$t2	#Move the user input value to temporary register t2
		 syscall

	#Done message is displayed
		li $v0,4
		la $a0, done
		 syscall
#End
######################################################