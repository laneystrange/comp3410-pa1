.data

introText: 	.asciiz "Hi! My name is Evan Black. This is part 2 of the 1st programming assignment for Comp 3410.\n"
firstIntText:	.asciiz "Enter one number: "
secondIntText:	.asciiz "Enter another number: "
sumText:	.asciiz "Sum: "
diffText:	.asciiz "\nDifference: "
prodText:	.asciiz "\nProduct: "
outroText:	.asciiz "\nIt's been fun. See you later."

.text
li $v0, 4		# we're gonna print strings!
la $a0, introText	# set the string to print to introText
syscall			# print
la $a0, firstIntText	# set the string to print to firstIntText
syscall			# print

li $v0,	5		# we're gonna read ints!
syscall			# read input
move $s0, $v0		# move input to s0

li $v0, 4		# we're gonna print strings!
la $a0, secondIntText	# set the string to print to secondIntText
syscall			# print

li $v0,	5		# we're gonna read ints!
syscall			# read input
move $s1, $v0		# move input to s1

add	$t0, $s0, $s1
sub	$t1, $s0, $s1
mul	$t2, $s0, $s1

li $v0, 4		# we're gonna print strings!
la $a0, sumText		# set the string to print to sumText
syscall			# print
li $v0, 1		# we're gonna print ints!
move $a0, $t0		# set the int to print to $t0
syscall			# print

li $v0, 4		# we're gonna print strings!
la $a0, diffText	# set the string to print to sumText
syscall			# print
li $v0, 1		# we're gonna print ints!
move $a0, $t1		# set the int to print to $t1
syscall			# print

li $v0, 4		# we're gonna print strings!
la $a0, prodText	# set the string to print to sumText
syscall			# print
li $v0, 1		# we're gonna print ints!
move $a0, $t2		# set the int to print to $t2
syscall			# print

li $v0, 4		# we're gonna print strings!
la $a0, outroText	# set the string to print to sumText
syscall			# print

li $v0, 10		#exit
syscall