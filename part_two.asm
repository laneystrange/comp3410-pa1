# COMP3410 Program Template
# Author: Ben Murphy
# Assignment: PA1
# Date: Feb 10
# part_two.asm
# Input: Integers m and n from keyboard
# Output: Print to terminal sum, difference, and product of m and n (m - n, not n - m. Order matters!)

.data

intro: .asciiz "You run the small program. A man named Ben Murphy greets you.\nHe says this is THE PROGRAM and that he will add, subtract, and multiply any two numbers of your choosing.\n"
prompt1: .asciiz "What do you choose as your first number?: "
prompt2: .asciiz "Interesting choice. How about the second number?: "
sumtext: .asciiz "The fabric of reality jitters for a moment.You can hear the sound of a few registers moving data.\nThe sum of the numbers appears before you. It reads "
difftext: .asciiz "As quickly as the sum appears, it vanishes. Moments later, another number appears.\nInstead of the sum the difference of the two numbers now seems to be suspended in midair. It reads "
prodtext: .asciiz "With a puff of smoke, the difference disappears. After a few hurried instructions you hear whispering in the background.\nThe product of the two numbers appears before you. It reads "
newline: ".\n"

.text

#I have a soft spot for textual descriptions.
li $v0, 4
la $a0, intro
syscall
li $v0, 4
la $a0, prompt1
syscall
li $v0, 5		#time to read input
syscall
move $s0, $v0
li $v0, 4
la $a0, prompt2	#i just really like it, okay?
syscall
li $v0, 5		#read the other input
syscall
move $s1, $v0
add $s2, $s0, $s1	#add them
sub $s3, $s0, $s1	#subtract them
mul $s4, $s0, $s1	#multiply them
li $v0, 4
la $a0, sumtext	#flavor
syscall		#printed
li $v0, 1
move $a0, $s2		#sum
syscall		#printed
li $v0, 4
la $a0, newline
syscall
li $v0, 4
la $a0, difftext	#flavor
syscall		#printed
li $v0, 1
move $a0, $s3		#difference
syscall		#printed
li $v0, 4
la $a0, newline
syscall
li $v0, 4
la $a0, prodtext	#flavor
syscall		#printed
li $v0, 1
move $a0, $s4		#product
syscall		#printed
li $v0, 4
la $a0, newline	#Gotta get that trailing period
syscall
li $v0, 10		#exit
syscall
