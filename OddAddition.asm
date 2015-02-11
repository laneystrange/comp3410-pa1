.data
	prompt:		.asciiz "Lets make some odd addition!!"
	
	integers:	.word 0:7		#This is to hold all the odd numbers
	counter:	.word 6			#Holds our count
	odd:		.word 0:8		#Holds our answers
	odd:		.word 8
.text
	la $s0, integers			#load integers address into $s0
	la $s1, counter				#load counter address into $s1
	la $s2, odd				#load odd number address into $s2
	la $s3, 
	
	li $s3, 1				#loads 1 into $s3
	sw $s3, 0($s2)				#stores word value into odd number array
	li $s4, 3				#loads 3 into $s4
	sw $s4, 4($s2)				#stores word value into odd number array
	add $s5, $s3, $s4			#adds $s3 with $s4 and stores it into $s5
	sw  $s5, 0($s0)				#stores $s5 value into integer array
	
	#START OF LOOP
loop:	addi $s4, $s4, 2			#This should increment our last odd number by 2			
	sw   $s4, 8($s2)			#stores word value into odd number array
	add  $t0, $s4, $s5			#adds $s4 with $s5 and stores it into $s6
	sw   $t0, 4($s0)			#stores word value into integer array
	addi $s0, $s0, 4			#increment the position of integer array
	addi $s1, $s1, -1			#decrement the counter
	addi $s2, $s2, 4			#increment the position of odd array
	bgt $s1, 				#checks our counter
		
