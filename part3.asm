# COMP3410 Part 3
# Author: Kieran Blazier
# Assignment: PA[1]
# Date: 2/10/15

# part3.asm
# Input: Nothing
# Output: Print to terminal the sum of the odd numbers 1 through 15

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.include "macros.asm"
	.data
	
results: .word 0 : 8
size: .word 8

###############################################
# .text segment. Assembly instructions go here.
###############################################

	.text
	
	la $s0, results
	lw $s1, size
	
	li $t0, 1 # i = 1
	
	sw $t0, 0($s0) # results[0] = 1
	
loop:   mul $s3, $t0, 4 # i * 4
	add $s3, $s0, $s3 # &results[i]
	
	add $s4, $s3, -4 # &results[i-1]
	
	lw $t2, ($s4) # a = results[i-1]
	
	mul $t1, $t0, 2 #
	add $t1, $t1, 1 # b = 2 * i + 1
	
	add $t1, $t1, $t2 # c = a + b
	
	sw $t1, ($s3) # results[i] = c
	
	add $t0, $t0, 1 # i++
	blt $t0, $s1, loop # while i < size
	
	lw $a0, ($s3) # print results[i], i == size - 1
	print_int
	
	exit 	      # exit the program