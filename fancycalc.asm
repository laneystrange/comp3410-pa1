# COMP3410 Program Template
# Author: Kevin Fisher
# Assignment: PA1

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# ffancycalc.asm
# Input: None

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data

introductiontext: .asciiz "Hello, and welcome to Kevin Fisher's fancycalc. Give me two inputs and I'll preform some mad arithmetic on them.\n"
requesttext: .asciiz "Please input two numbers:\n"
resultAText: .asciiz "The result of adding these is:\n"
resultBText: .asciiz "The result of subtracting these is:\n"
resultCText: .asciiz "The result of multiplying these is:\n"
goodbyeText: .asciiz "Have a nice day!"
resultA: .word 0
resultB: .word 0
resultC: .word 0

###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
begin:	      li   $v0, 4	    	# syscall 4 = print string
	      la   $a0, introductiontext # store address of prompt string into a0
	      syscall		    	# do the diddly
	      li $v0, 4			# print string syscall value
	      la $a0, requesttext	# store address of text into a0
	      syscall			# do the doodly
	      li $v0, 5			# syscall 5 = get int
	      syscall			# do the poodly
	      add $s0, $v0, $zero	# store first int into s0
	      li $v0, 5			# syscall 5 = get int
	      syscall			# do the toodly
	      add $s1, $zero, $v0	# store second int into s1
arithmatic:   add $s2, $s0, $s1		# s2 = s0 + s1
	      sub $s3, $s0, $s1		# s3 = s0 - s1
	      mul $s4, $s0, $s1		# s4 = s0 * s1
	      la $s5, resultA
	      la $s6, resultB
	      la $s7, resultC
	      sw $s2, 0($s5)
	      sw $s3, 0($s6)
	      sw $s4, 0($s7)
results:      li $v0, 4			# syscall 4 = print string
	      la $a0, resultAText	# load the result label into a0
	      syscall
	      li $v0, 1			# syscall 1 = print int
	      add $a0, $s2, $zero	# a0 = s2
	      syscall
	      li $v0, 11		# syscall 11 = print character
	      li $a0, 10		# 13 = line break
	      syscall
	      
	      li $v0, 4			# syscall 4 = print string
	      la $a0, resultBText	# load the result label into a0
	      syscall
	      li $v0, 1			# print int
	      add $a0, $s3, $zero	# a0 = s3
	      syscall
	      li $v0, 11		# print char
	      li $a0, 10		# new line
	      syscall
	      
	      li $v0, 4			# print str
	      la $a0, resultCText	# load result label into a0
	      syscall
	      li $v0, 1			# print int
	      add $a0, $s4, $zero	# a0 = s4
	      syscall
	      li $v0, 11		# print char
	      li $a0, 10		# line break
	      syscall
	      
	      li $v0, 4		 	# print str
	      la $a0, goodbyeText	# arg = goodbye text
	      syscall
	      
	      