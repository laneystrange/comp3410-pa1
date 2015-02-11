# COMP3410 Program Template
# Author: Ben Murphy
# Assignment: PA1
# Date: Feb 10
# part_two.asm
# Input: Integer n from keyboard
# Output: Print to terminal sum of odd numbers from 1 to n (or the odd number right below n if it's even)

.data
prompt:	.asciiz	"We're going to sum all odd numbers from 1 up to a stopping point.\nWhat's the number you want to be the ceiling?: "
head: 	.asciiz	"The sum of the odd numbers inclusive is: "
badin:	.asciiz	"The number must be positive and greater than zero. Please check your input.\n"

.text
top:
li $v0, 4		#we're going to print the prompt
la $a0, prompt		#this is it
syscall		#print it
li $v0, 5		#ready for input
syscall		#read it
blez $v0, error	#make sure it's a positive number, else go to the error part
j continue		#continue on your merry way

error:
li $v0, 4		#about to print a string
la $a0, badin		#the error message
syscall		#print it
j top			#start from the top

continue: 
move $s7, $v0		#store the entered number into a safe place
li $s0, 1		#first number is 1
sw $zero, 0($sp)	#first value in stack is 0, for safety's sake
loop:	lw $s1, 0($sp)	#load the partial sum
add $s1, $s1, $s0	#add the counter to the partial sum
addi $s0, $s0, 2	#increment the counter, odd numbers = add 2 every time
sw $s1, 0($sp)		#store the number back into memory
ble $s0, $s7, loop 	#loop until  the counter exceeds the chosen number
lw $s1, 0($sp)		#load the final sum in prep for printing
li $v0, 4		#about to print the head
la $a0, head
syscall		#printed
li $v0, 1		#time to print the actual number
move $a0, $s1
syscall		#printed
li $v0, 10
syscall		#we're done here
