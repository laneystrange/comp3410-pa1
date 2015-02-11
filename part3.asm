# Author: ENYIL PADILLA
# Assignment: PA1
# Date: 2/11/15

############################### TODO MEMORY VARIABLES ###############################
.data
total: .word 0:7
msg: .asciiz "Total sum odd numbers between 1 and 15: "

############################### TODO ACTUAL PROGRAM ###############################
.text
li $s1, 15	#Starts at 15
li $s2, 1	#alternates between sums
li $s3, 0	#keep count of the sum
la $s4, total 	#loads memory for total numbers
while:
     bgtz $s2, sum	#greater than zero then jump to sum
     mul $s2, $s2, -1	 #sum next time
resume:     
     sub $s1, $s1, 1    #substracts 1 from s1, until it reaches 0
     bgtz $s1, while	#if s1 > 0 then keep the while loop
     la	$a0, msg	#load msg to screen
     li	$v0, 4		#prepare statement to print
     syscall		#calls sys to print msg
     lw $a0, 0($s4)	#loads from memory to print
     li $v0, 1		#prepares print statement
     syscall		#prints the total number
     li $v0, 10          # system call for exit
     syscall		#finishes program

sum:
	add $s3, $s3, $s1
	sw $s3, 0($s4)
	mul $s2, $s2, -1	 #don't sum next time
	j resume

