	.data
intro:		.asciiz "Hello, this is part 2 for comp3410 PA 1, and I am Frank Martino\n"
introTo: 	.asciiz "this program performs a calculation on 2 numbers you enter\n"
prompt: 	.asciiz "please enter 2 numbers\n"

pr:		.asciiz "the product of the input values is: "
sr:		.asciiz "the sum of the inputed values is: "
dr: 		.asciiz "the difference of the inputed values is: "

br: 		.asciiz "\n"

sum: 	   	.word	0
difference: 	.word	0
product: 	.word	0

	.text
	
	  la $a0,intro 	#load intro string into argument
	  li $v0,4	#setup syscall to print $a0	
	  syscall
	
	  la $a0,introTo 	#load introTo string into argument
	  li $v0,4	#setup syscall to print $a0	
	  syscall
	
	  la $a0,prompt 	#load introTo string into argument
	  li $v0,4	#setup syscall to print $a0	
	  syscall
	
	  li $v0,5	#set up syscall for input
	  syscall		#syscall to get input
	  la $s1,($v0)	#store user input 1 in s1
	
	  li $v0,5	#set up syscall for input
	  syscall		#syscall to get input
	  la $s2,($v0)	#store user input 2 in s2
	  
add:	  add $t1, $s1, $s2 #add the two user inputs and store them in $t1
	
	  la $a0, sr #load sum output string
	  li $v0, 4  #prepare syscall for printing string 
	  syscall	#print the string
	
	  la $a0, ($t1) #load sum to $a0
	  li $v0, 1 #prepare syscall for printing int 
	  syscall #print the sum integer
	
	  la $a0, br #load the line break
	  li $v0, 4  #prepare syscall for printing string 
	  syscall	#print the line break

subtract: sub $t1, $s1, $s2 #subtract s2 from s1 store result in t1

	  la $a0, dr #load difference output string
	  li $v0, 4  #prepare syscall for printing string 
	  syscall	#print the string
	
	  la $a0, ($t1) #load difference to $a0
	  li $v0, 1 #prepare syscall for printing int 
	  syscall #print the difference integer
	  
	  la $a0, br #load the line break
	  li $v0, 4  #prepare syscall for printing string 
	  syscall	#print the line break

	  addi $t1, $s1, 0 #prepare temp values for multiply operation
	  addi $t4, $s2, -1 #prepare temp values for the multiply operation
	
multiply: add $t1, $t1, $s1
	  addi $t4, $t4, -1
	  bgtz $t4, multiply
	  
	  la $a0, pr #load difference output string
	  li $v0, 4  #prepare syscall for printing string 
	  syscall	#print the string
	
	  la $a0, ($t1) #load difference to $a0
	  li $v0, 1 #prepare syscall for printing int 
	  syscall #print the difference integer

	  la $a0, br #load the line break
	  li $v0, 4  #prepare syscall for printing string 
	  syscall	#print the line break

exit:	  li $v0,10
	  syscall