
.text
li $t0,1	#This is the first number that will not only be the starting point and the comparison to 15

loop:		#This is a while loop label that will be branched to everytime if the condition is true
	add $s0, $s0, $t0	#Adds $t0 to the total $s0 to be saved and used later
	addi $t0, $t0, 2	#Adds 2 to $t0 to show that it is going to the next odd number
	bleu, $t0, 15, loop	#Branch statement that executes if $t0 is less than 15 if it is true it jumps to loop
li $v0, 1	#Preps to print an integer
la $a0, ($s0)	#Loads the $s0 total finished integer
syscall		#Prints the total integer

li $v0, 10	#Preps to exit
syscall		#Exits the program