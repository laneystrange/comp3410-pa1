# oddadder.asm
# By Kevin Fisher
# PA1

.data
plustext: .asciiz " + "
equaltext: .asciiz " = "

.text
		li $s0, 1
mainloop:	subi $s7, $s0, 15	# s7 = s0 - 15
		bgtz $s7, finish 	# if s7 is >= 0, then finish
		
		li $v0, 1		# print int
		add $a0, $zero, $s1	# arg = s1
		syscall
		
		li $v0, 4		#print str
		la $a0, plustext	# arg = plustext
		syscall
		
		li $v0, 1		# print int
		add $a0, $zero, $s0	# arg = s0
		syscall
		
		add $s1, $s0, $s1	# s1 = s0 + s1
		
		li $v0, 4		# print str
		la $a0, equaltext	# arg = equaltext
		syscall
		
		li $v0, 1		# print int
		add $a0, $zero, $s1	# arg = s1
		syscall
		
		li $v0, 11		# print char
		li $a0, 10		# new line char
		syscall
		
		addi $s0, $s0, 2	# s0 += 2
		j mainloop
finish:
	