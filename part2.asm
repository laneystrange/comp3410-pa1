# Author: Tam Duong
# Assignment: PA1
# Date: 2/11/15

	.data 
	
Intro:		.asciiz	"Tam Duong\nPA1 Part2\nPrompt user for 2 numbers and use them to calculate sum, diffencence and product then print the result\n"
Prompt: 	.asciiz "Enter 2 integer input:\n"
Conclusion:	.asciiz "\nConclusion: Calculate sum, difference and product of 2 inputs."
sum:		.asciiz "Sum of 2 inputs: "
Difference:	.asciiz "\nDifference of 2 inputs: "
Product:	.asciiz "\nProduct of 2 inputs: "
Result:		.word 	0 : 3	# array of variable r[0] = sum, r[1] = diff, r[2] = multi




	.text
	
		la 	$s2, Result			# load address of array result into $s2
	
#### print intro and prompt ######
		la	$a0, Intro
		li	$v0, 4
		syscall					# print intro
		la	$a0, Prompt
		li	$v0, 4
		syscall					# print prompt
		
#### read and store user inputs ####
		li	$v0, 5				
		syscall					# read user input
		add	$s0, $zero, $v0			# save input to register $s0
		li	$v0, 5				
		syscall					# read user 2nd input	
		add	$s1, $zero, $v0			# save 2nd input to $s1
	
#### calculate sum, difference, product of 2 inputs ####
		add	$t0, $s0, $s1			# sum of inputs into temp register $t0
		sw	$t0, 0($s2)			# store value from register $t0 in array[0]
		sub 	$t0, $s0, $s1			# overide $t0 with difference of 2 inputs
		sw	$t0, 4($s2)			# store value from register $t0 in array[1]
		mul	$t0, $s0, $s1
		sw	$t0, 8($s2)
			

#### retrieve and print results ####
		la	$a0, sum
		li	$v0, 4
		syscall					# print headline for sum
		lw	$a0, 0($s2)
		li	$v0, 1
		syscall					# print value of sum
		la	$a0, Difference
		li	$v0, 4
		syscall					# print headline for difference
		lw	$a0, 4($s2)
		li	$v0, 1
		syscall					# print value of difference
		la	$a0, Product
		li	$v0, 4
		syscall					# print headline for product
		lw	$a0, 8($s2)
		li	$v0, 1
		syscall					# print value for product

#### print conclusion ####
		li	$v0, 4
		la 	$a0, Conclusion
		syscall	
# The program is finished. Exit.
 		li   $v0, 10          # system call for exit
	      	syscall  				
		
