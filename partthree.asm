# COMP 3410
# Author: Claire Skaggs
# Assignment: PA1
# Date: 02/11/15

.text
main:
li $s0, 1									# ready the odd integer register
li $s1, 0									# ready the sum register
li $t0, 0									# ready the counter register

loop: 
bge $t0, 8, endloop								# end the loop after 8 passes, enough for all integers from 1 to 15
add $s1, $s0, $s1								# add the previous sum to the next odd integer
addi $s0, $s0, 2								# increment by two for the next odd integer
addi $t0, $t0, 1								# increment the counter register
j loop										# jump back to the start of loop

endloop:
move $a0, $s1									# move the sum into register	
li $v0, 1									# load syscall for print integer
syscall
	
li $v0, 10									# load syscall for exit
syscall									