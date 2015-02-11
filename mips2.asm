# Omer Aldafari	
# Assembly
# 2/11/15
# Part 2




###############################################
# .text segment. Assembly instructions go here.
###############################################
.data

introduction:	 .asciiz "\ Omer \n Part II In First Assignment\n This program will calculate two numbers in different ways.\n"
prompt1: .asciiz "\n\n Please enter the first number:"
prompt2: .asciiz "Please enter the second number"
result1: .asciiz "Resut of sum:\n"
result2: .asciiz "\n Resut of difference:\n"
result3: .asciiz "\n Resut of product:\n"

.text

main:

    #t0-to hold first integer
    #t1-to hold second integer
    #t2- used to hold the sum of t$1 and t$2

        #Introduction:
	la $a0, introduction
	li $v0, 4
	syscall # call operating system to perform operation
	
	# First number
	
        li $v0, 4 #syscall to print string
        la $a0, prompt1  #call prompt1 above the introruction to print
        syscall # call operating system to perform operation

        li $v0, 5 #syscall to read an integer
        syscall

        move $t0, $v0  #move it into $t0

    	# Second number
        li $v0, 4
        la $a0, prompt2
        syscall

         li $v0,5        
         syscall
         
         move $t1, $v0

        add $t2, $t0, $t1 #compute the sum
        
        li $v0, 4
        la $a0, result1 
        syscall
        

    #print out sum of $t2
   # li $v0, 4       # load syscall print int into $v0
    move $a0, $t2   #move the number to print into $a0
    li $v0, 1
   # la $a0, result
    syscall
    
    sub $t3, $t0, $t1
    
        li $v0, 4
        la $a0, result2
        syscall
        


    move $a0, $t3   #move it to $a0
    li $v0, 1
    syscall
    
    mul  $t4, $t0, $t1
    
        li $v0, 4
        la $a0, result3
        syscall
        


    move $a0, $t4   #move it to $a0
    li $v0, 1
    syscall
    


    li $v0, 10    #exit
    syscall
	