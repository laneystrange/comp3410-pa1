# COMP3410 Program Template
# Author: Aaron Marshall
# Assignment: PA[1]
# Date: 2/10/14

	.data
input: .asciiz "Input two integers.\n"
subtext: .asciiz "\nSubtracting......\n"
addtext: .asciiz "\nAdding...........\n"
multitext: .asciiz "\nMultiplying......\n"
goodbye: .asciiz "\nBye..............\n"

	.text
  la $a0, input  #output of input text
  li $v0, 4
  syscall
  
  li $v0, 5 #it wants a number
  syscall
  add $s0, $zero, $v0 #adds number to register
  
  li $v0, 5 #get the second number
  syscall
  add $s1, $zero, $v0 #adds sec. to register
  
  la $a0, addtext #prints the addtext
  li $v0, 4
  syscall
  
  add $s2, $s0, $s1 # does the math then prints the result
  add $a0, $s2, $zero
  li $v0, 1
  syscall
  
  la $a0, subtext #prints the subtext
  li $v0, 4
  syscall
  
  sub $s3, $s0, $s1 #does subtraction and prints answer
  add $a0, $s3, $zero
  li $v0, 1
  syscall
  
  la $a0, multitext #prints multitext
  li $v0, 4
  syscall
  
  mul $s4, $s0, $s1 #multiplies and prints answer
  add $a0, $s4, $zero
  li $v0, 1
  syscall
  
  la $a0, goodbye #prints the bye message
  li $v0, 4
  syscall
  
  li $v0, 10 #exits
  syscall