# COMP3410 Program Template
# Author: Aaron Marshall
# Assignment: PA[1] part 3
# Date: 2/10/14
#adds odd 1-15
	.text
  
  li $s0, 1 #1
  addi $s1, $s0, 2 #3
loop:
	add $s0, $s1, $s0 # s0 + s1
	addi $s1, $s1, 2 #s1+2
	ble $s1, 15, loop # starts loop if <= 15
	
  add $a0,$zero, $s0 #prints final answer
  li $v0, 1
  syscall
  
  li $v0, 10 #exits
  syscall
