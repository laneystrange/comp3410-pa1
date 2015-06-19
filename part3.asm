.data
total:		.word	0
max:		.word	15
totalText:	.asciiz	"Total: "


.text
la $s1, max
lw $s1, 0($s1)

li $t0, 0		# loop counter
loop:
	addi $t0, $t0, 1	# add 1 to loop counter
	bgt $t0, $s1, exit	# if loop counter is greater than 15 exit
	rem $t1, $t0, 2		# find the remainder when dividing by 2 to determine if it's odd or even
	beqz $t1, loop		# if the remainder is zero, then it's an even number, and so we'll repeat the loop
	la $t2, total		# load the address of total into memory
	lw $t3, 0($t2)		# load the word from the address
	add $t3, $t3, $t0	# do the addition
	sw $t3, 0($t2)		# store result back in same location
	j loop			# loop back and do it again!

exit:
	li $v0, 4		# tell it we're gonna print strings
	la $a0, totalText	# set the argument to totalText
	syscall			# print totalText
	la $s0, total		# load the address of total
	lw $a0, 0($s0)		# load the word associated with the address to the argument
	li $v0, 1		# tell it we're gonna print ints
	syscall			# print the total
	
	li $v0, 10		# tell it we're gonna exit
	syscall			# exit