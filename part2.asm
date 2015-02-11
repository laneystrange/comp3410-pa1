# COMP3410 Part 2
# Author: Kieran Blazier
# Assignment: PA[1]
# Date: 2/10/15

# part2.asm
# Input: Two numbers A and B
# Output: Print to terminal A + B, A - B, A * B

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.include "macros.asm"

	.data

intro: .asciiz "Salutations. I'm Kieran Blazier, and this is PA#1 for COMP3410.\n"

prompt0: .asciiz "\nEnter an integer: "

prompt1: .asciiz "\nEnter another integer: "

sum: .asciiz "\nSum: "

diff: .asciiz " Difference: "

prod: .asciiz " Product: "

conclusion: .asciiz "\nStop. Hammertime!"

results: .word 0 : 3
size: .word 3

###############################################
# .text segment. Assembly instructions go here.
###############################################

	.text
	
	la $s0, results # load address of array into $s0
	la $s1, size # load address of size variable into $s1
	
	la $a0, intro #
	print_str     # print the introduction
	
	la $a0, prompt0 #
	print_str       # print the first prompt
	
	read_int # get user input
	
	add $t0, $zero, $v0 # a = input
	
	la $a0, prompt1 #
	print_str       # print the second prompt
	
	read_int # get user input
	
	add $t1, $zero, $v0 # b = input
	
	add $s2, $t0, $t1 #
	sw $s2, 0($s0)    # resutls[0] = a + b
	
	sub $s2, $t0, $t1 #
	sw $s2, 4($s0)    # results[1] = a - b
	
	mul $s2, $t0, $t1 #
	sw $s2, 8($s0)    # results[2] = a * b
	
	la $a0, sum #
	print_str   # print "Sum: " 
	
	lw $a0, 0($s0) #
	print_int      # print results[0] 
	
	la $a0, diff #
	print_str    # print "Difference: " 
	
	lw $a0, 4($s0) #
	print_int      # print results[1]
	
	la $a0, prod #
	print_str    # print "Product: " 
	
	lw $a0, 8($s0) #
	print_int      # print results[2]
	
	la $a0, conclusion #
	print_str          # print conclusion
	
	exit # exit the program