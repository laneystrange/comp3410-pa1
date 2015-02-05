.data

intro:	.asciiz "Hello. I am Nick Gordon. This program requests two integers.\nIt then does three calculations, and saves them to data.\nIt then prints those results.\n"
outro:	.asciiz "This was the program! Hope you have a good day!"
prompt1:	.asciiz "Please enter integer one: "
prompt2:	.asciiz "Please enter integer two: "
space:	.asciiz "\n" # because I have to use an entire word to store the newline :(
sum:		.word	0
sumstring:	.asciiz "Sum: "
diff:		.word	0
diffstring:	.asciiz "Diff: "
prod:		.word	0
prodstring: .asciiz "Prod: "

.text

la $s5, sum
la $s6, diff
la $s7, prod

la $a0, intro		# announces the introduction and purpose
li $v0, 4
syscall

la $a0, prompt1		# prints prompt for the first integer
li $v0, 4
syscall
li $v0, 5			# syscall to request the integer
syscall
add $s0, $s0, $v0		# placing the integer in register
				###
la $a0, prompt2		# prints the prompt for the second integer
li $v0, 4			
syscall			
li $v0, 5			# syscall to prompt
syscall
add $s1, $s1, $v0		# store it in registers
				###
add $s4, $s0, $s1		# does the addition part
sw $s4, 0($s5)
				###
sub $s4, $s0, $s1		# does the subtraction part
sw $s4, 0($s6)
				###
mul $s4, $s0, $s1		# does the multiplication part
sw $s4, 0($s7)
				###
la $a0, sumstring		# prints some nice formatted text
li $v0, 4
syscall
lw $a0, 0($s5)		# loads the sum variable to the arg register
li $v0, 1			# syscall variable to print integer
syscall
la $a0, space
li $v0 4
syscall
				###
la $a0, diffstring	# prints some more nice formatted text
li $v0, 4
syscall
lw $a0, 0($s6)		# loads the diff variable to the arg register
li $v0, 1			
syscall
la $a0, space
li $v0 4
syscall
				###
la $a0, prodstring	# prints yet more nice formatted text
li $v0, 4
syscall
lw $a0, 0($s7)		# loads the prod variable to the arg register
li $v0, 1
syscall
la $a0, space
li $v0 4
syscall
				###
la $a0, outro		# prints the outro
li $v0, 4
syscall

li $v0, 10
syscall



