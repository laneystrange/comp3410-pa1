.data

runsum:	.word	0
sumstring:	.asciiz "Sum: "

.text

	addi 	$s0, $s0, 15	# setting the threshold variable for the loop
	addi 	$s1, $s1, 1		# the current odd number
	la 	$s7, runsum

loop:	lw 	$s2, 0($s7)		# loading the current running total into register
	add	$t0, $s1, $s2	# does the summation
	sw	$t0, 0($s7)		# stores the cumulative sum
	addi	$s1, $s1, 2		# moves the current odd number up to the next odd
	ble	$s1, $s0, loop	# branch to keep going if you haven't gotten to 15 yet
	
last:	la	$a0, sumstring
	li	$v0, 4
	syscall
	lw	$a0, 0($s7)
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall
