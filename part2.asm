# Author: ENYIL PADILLA
# Assignment: PA1
# Date: 2/11/15

############################### TODO MEMORY VARIABLES ###############################
.data
name:	.asciiz "Enyil Padilla \nProblem Set 1, Part 2 \nProgram takes 2 integers to get the sum, difference, and product of the two \n"
msg:	.asciiz "Please enter first integer \n"
msg2:	.asciiz "Please enter second integer \n"
sum:	.asciiz "Sum: "
diff:	.asciiz "\nDifference: "
product:	.asciiz "\nProduct: "
answer: .word 0:3 #Array to store results
exit: .asciiz "\nThank You!"


############################### TODO ACTUAL PROGRAM ###############################
.text 
	li $v0, 4                 #prepares print statement     
	la $a0, name              #loads message into $a0     
	syscall 
	li $v0, 4                #prepares print statement     
	la $a0, msg        	 #loads message into $a0     
	syscall
	li $v0, 5 		 #Prepares statement
	syscall			 #Performs syscall
	move $s0, $v0		 #moves integer to register s5
	li $v0, 4                #prepares print statement     
	la $a0, msg2             #loads message into $a0     
	syscall 
	li $v0, 5 		#Prepares statement
	syscall			#Performs syscall
	move $s1, $v0		#moves integer to register s5
	la $s2, answer		#loads array from memory
	add $t0, $s0, $s1	#adds two integers
	sw $t0, 0($s2)		#stores sum to memory
	subu $t0, $s0, $s1	#substracts both integers
	sw $t0, 4($s2)		#stores difference to memory
	mul $t0, $s0, $s1	#multiplies both integers
	sw $t0, 8($s2)		#stores product to memory
	li $v0, 4            	#prepares print statement     
	la $a0, sum            	#loads message into $a0     
	syscall
	lw $a0, 0($s2)
	li $v0, 1
	syscall	
	li $v0, 4             	#prepares print statement     
	la $a0, diff           	#loads message into $a0     
	syscall
	lw $a0, 4($s2)		#loads into momery to print (Difference)
	li $v0, 1		#prepares statement to print
	syscall
	li $v0, 4            	#prepares print statement     
	la $a0, product         #loads message into $a0     
	syscall
	lw $a0, 8($s2)		#loads from memory to print
	li $v0, 1		#prepares print statement
	syscall
	li $v0, 4            	#prepares print statement     
	la $a0, exit          	#loads message into $a0     
	syscall
	li   $v0, 10          # system call for exit
	syscall
