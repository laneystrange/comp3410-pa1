#Denzel Young
#Programming Assignment 1
#Part 3
#COMP 3410

.data

message: .asciiz "The sum of all odd numbers between 1 and 15 (inclusive) is: "
.text

#Because I am not very comfortable with loops, I will do this iteratively

long_way:
#Appropriately titled, this string of code adds 1, 3, 5 and so on to the register $t0
	li $t1, 1
	li $t2, 3
	add $t0, $t1, $t2
	addi $t0, $t0, 5
	addi $t0, $t0, 7
	addi $t0, $t0, 9
	addi $t0, $t0, 11
	addi $t0, $t0, 13
	addi $t0, $t0, 15
	
	#Once the adding is done, my message is printed first.
	li $v0, 4
	la $a0, message
	syscall
	
	#Then, the sum is loaded to $a0 so it can be printed.
	la $a0, ($t0)
	li $v0, 1
	syscall
	
li $v0, 10
syscall 

	
