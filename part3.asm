# Author: Tam Duong
# Assignment: PA1
# Date: 2/11/15

	.data

OddSum:		.asciiz	"Sum of odd numbers between 1 and 15 inclusive: "	# headline for the result
result:		.word 0:10		# array of length 10 to store each sum
	
	.text	

	li $s0, 1	# $s0 = start = 1
	li $s1, 15	# $s1 = end = 15
	li $t0, 2	# $t0 = 2
	la $s2, result	# $s2 = result index 
	sw $zero, 0($s2)	# result[0] = 0 let say it start with 0
	
loop:	bgt $s0, $s1, exit	# start > end then exit loop
	div $s0, $t0		# $s0 / 2 = start / 2
	mfhi $t1		# start%2
	beqz $t1, skip		# start%2 == 0 then skip this #
	lw $t1, 0($s2)		# $t1 = result[index]
	add $t1, $t1, $s0	# $t1 = start(current) + result[index]
	addi $s2, $s2, 4	# $s2 = current index++ = increment address for next result entry
	sw $t1, 0($s2)		# result[index] = $t1
	
skip:	add $s0, $s0, 1		# start++
	j loop			# jump to loop
	
exit:	# print oddsum content
	la $a0, OddSum
	li $v0, 4
	syscall
	# print final result
	lw $a0, 0($s2)
	li $v0, 1
	syscall
	# exit
	li $v0, 10
	syscall