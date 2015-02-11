# COMP3410 Program Template
# Author: Gregory Lawrence
# Assignment: PA[X]
# Date: 2/10/15




###############################################
# .text segment. Assembly instructions go here.
###############################################
.data

introduction:	 .asciiz "\ Gregory Lawrence\n Calculations\ This will calculate two numbers given in three different ways and give a sum, difference, and product.\n"
prompt1: .asciiz "\n\n Enter the first integer please:"
prompt2: .asciiz "Enter the second integer please:"
result1: .asciiz "This is the Sum.\n"
result2: .asciiz "\nThis is the Difference.\n"
result3: .asciiz "\nThis is the Product.\n"

.text

main:

    #t0-to hold first integer
    #t1-to hold second integer
    #t2- used to hold the sum of t$1 and t$2

        #Print introduction

	la $a0, introduction
	li $v0, 4
	syscall
	
	#first number
	
        li $v0, 4 #syscall to print string
        la $a0, prompt1  #address of string to print
        syscall

        li $v0, 5 #syscall to read an integer
        syscall

        move $t0, $v0  #move the number to read into $t0

    #second number
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
        


    move $a0, $t3   #move the number to print into $a0
    li $v0, 1
    syscall
    
    mul  $t4, $t0, $t1
    
        li $v0, 4
        la $a0, result3
        syscall
        


    move $a0, $t4   #move the number to print into $a0
    li $v0, 1
    syscall
    


    li $v0, 10    #syscall to exit
    syscall
