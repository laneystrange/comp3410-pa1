.data

firstLine:	.asciiz "Berkeley Willis, Part Two\nThis takes two numbers from the user and performs three calculations with these numbers and then prints it\n to each terminal as each loads and prints\nPlease enter your first number:"
promptTwo:	.asciiz "Please enter your second number:"
sum:		.asciiz "Sum:"
dif:		.asciiz "\nDifference:"
pro:		.asciiz "\nProduct:"
lastMessage:	.asciiz "\nThank you for using my program. Goodbye."

.text
li $v0, 4, #Prep syscall to print a string
la $a0, firstLine #pass the arguement for the string
syscall # Prints the introduction and prompts the user for the first number that the program is ready to recieve
li $v0, 5	#Prep to read a user's number for the operations
syscall	#Recieves the user's number and stores it in $v0
add $t0, $v0, $zero	#Uses the add to zero to store the number from the user
li $v0, 4	#Preps to print another string
la $a0, promptTwo	#Loads the string that will print in to register $a0
syscall	#Prints the second prompt for the user to know to enter a number
li $v0, 5	#Preps again to receive another number
syscall	#Recieves the user's number and stores it again in $v0
add $t1, $v0, $zero	#Uses the add method to store the second number in $$t1

#This section ins the sum part of the program in which it takes the two number and adds them together
li $v0, 4	#Preps to print a sring
la $a0, sum	#Loads string I want to print from data
syscall		#Prints the string
add $s0, $t0, $t1	#Adds the two numbers together and saves it to an s register
li $v0, 1	#Preps to print out an integer
la $a0, ($s0)	#Loads needed register, from the $s0, to $a0
syscall		#Prints out the reulting integer

#This section is the difference part of the program
li $v0, 4	#Preps to print a string
la $a0, dif	#Loads string I want to print from the data
syscall		#Prints said string
sub $s0, $t0, $t1	#Subrction and saved to the same register that is not needed any more because result has already been printed
li $v0, 1	#Preps to print out an integer
la $a0, ($s0)	#Loads needed register, from the $s0, to $a0
syscall		#Prints the result of the difference

#This section utilizes a loop system to find the product of the two numbers, but this will not work at the moment if the second number is negative but I could fix it
li $v0, 4	#Preps to print a string
la $a0, pro	#Loads the string that I desire to print in $a0
syscall		#Print the string
sub $s0, $s0, $s0	#Resets the value in $s0 to zero by subtracting from itself, incase it may interfere
loop:	#Label to restart loop later if the condition to break is not met, using for constant addition until the product of the two numbers is found
	add $s0, $t0, $s0	#Adds $t0 each time this runs 
	addi $t1, $t1, -1	#Subtracts one from $t1 and stores it back into itself
	bgtz $t1, loop		#Jumps back to loop if $t1 is greater than zero
li $v0, 1	#Preps to print out an integer
la $a0, ($s0)	#Loads the integer from $s0
syscall		#Prints out the last integer

li $v0, 4	#Preps to print the last message
la $a0, lastMessage	#Loads the last message from data
syscall		#Prints out the string

li $v0, 10 # Prep for exit
syscall	#Exits
