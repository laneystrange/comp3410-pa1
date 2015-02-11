# COMP 3410
# Author: Claire Skaggs
# Assignment: PA1
# Date: 02/11/15

.data
nwline: .asciiz "\n"								# new line character
myname: .asciiz "Hi! I am Claire Skaggs. I am fairly new to MIPS. "		# my name
dscrpt: .asciiz "This is PA1 for COMP 3410. It mostly just prints stuff."	# a short description of the program
prmpt1: .asciiz "Please enter an integer: "					# the first integer prompt
prmpt2: .asciiz "Please enter another integer: "				# the second integer prompt
sumint:	.asciiz "The sum of your integers is: "					# description of the integer sum
difint: .asciiz "The difference of your integers is: "				# description of the integer difference
prdint: .asciiz "The product of your integers is: "				# description of the integer product
fnlmsg: .asciiz "Well, that is all I do here. kthxbye."				# final message before program exit

.text
main:
la $a0, myname									# load myname string into register
li $v0, 4									# load syscall for print string
syscall	

la $a0, nwline									# load nwline string into register
li $v0, 4									# load syscall for print string
syscall									

la $a0, dscrpt									# load mydscrpt string into register
li $v0, 4									# load syscall for print string
syscall

la $a0, nwline									# load nwline string into register
li $v0, 4									# load syscall for print string
syscall

la $a0, prmpt1									# load prmpt1 string into register
li $v0, 4									# load syscall for print string
syscall

li $v0, 5									# load syscall for read integer
syscall
move $t0, $v0									# move the read integer into register

la $a0, prmpt2									# load prmpt2 string into register
li $v0, 4									# load syscall for print string
syscall

li $v0, 5									# load syscall for read integer
syscall
move $t1, $v0									# move the read integer into register

add $t2, $t0, $t1								# add the two integers and store the sum into register

la $a0, sumint									# load sumint string into register
li $v0, 4									# load syscall for print string
syscall

move $a0, $t2									# move the integer sum into register
li $v0, 1									# load syscall for print integer
syscall

sub $t2, $t0, $t1								# subtract the 2nd integer from 1st and store them into register

la $a0, nwline									# load nwline string into register
li $v0, 4									# load syscall for print string
syscall

la $a0, difint									# load difint string into register
li $v0, 4									# load syscall for print string
syscall

move $a0, $t2									# move the integer difference into register
li $v0, 1									# load syscall for print integer
syscall

mult $t0, $t1									# multiply the two integers
mflo $t2									# store the integer product into register

la $a0, nwline									# load nwline string into register
li $v0, 4									# load syscall for print string
syscall

la $a0, prdint									# load prdint string into register
li $v0, 4									# load syscall for print string
syscall

move $a0, $t2									# move the integer difference into register
li $v0, 1									# load syscall for print integer
syscall

la $a0, nwline									# load nwline string into register
li $v0, 4									# load syscall for print string
syscall

la $a0, fnlmsg									# load fnlmsg string into register
li $v0, 4									# load syscall for print string
syscall

li $v0, 10									# load syscall for exit
syscall