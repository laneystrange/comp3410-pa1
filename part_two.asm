.data

intro: .asciiz "You run the small program. A man named Ben Murphy greets you.\nHe says this is THE PROGRAM and that he will add, subtract, and multiply any two numbers of your choosing.\n"
prompt1: .asciiz "What do you choose as your first number?: "
prompt2: .asciiz "Interesting choice. How about the second number?: "
sumtext: .asciiz "With a small shift and the sound of a few registers moving data, the sum of the numbers appears before you. It reads "
difftext: .asciiz "Moments later, another number appears, but instead of the sum the difference of the two numbers now seems to be suspended in midair. It reads "
prodtext: .asciiz "Finally, with a small flourish, the difference disappears. After a few hurried instructions you can hear whispering in the background, the product of the two numbers appears before you. It reads "
newline: ".\n"

.text

li $v0, 4
la $a0, intro
syscall
li $v0, 4
la $a0, prompt1
syscall
li $v0, 5
syscall
move $s0, $v0
li $v0, 4
la $a0, prompt2
syscall
li $v0, 5
syscall
move $s1, $v0
add $s2, $s0, $s1
sub $s3, $s0, $s1
mul $s4, $s0, $s1
li $v0, 4
la $a0, sumtext
syscall
li $v0, 1
move $a0, $s2
syscall
li $v0, 4
la $a0, newline
syscall
li $v0, 4
la $a0, difftext
syscall
li $v0, 1
move $a0, $s3
syscall
li $v0, 4
la $a0, newline
syscall
li $v0, 4
la $a0, prodtext
syscall
li $v0, 1
move $a0, $s4
syscall
li $v0, 4
la $a0, newline
syscall
li $v0, 10
syscall