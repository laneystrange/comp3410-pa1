# COMP3410 Program Template
# Author: Kendal Harris
# Assignment: PA[1]
# Date: 11 February 2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# integer_operations.asm
# Input: two integers M and N (user input)
# Output: introduction to program followed by the sum,difference, and product of the two entered numbers, and a goodbye

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
begin: .asciiz " What's up home skillet! My name is Kendal Harris.\n I am a student of computer engineering and computer science at the University of Memphis.\n This program will perform three operations (addition, subtraction, and multiplication) on two numbers of your choosing.\n"
prompt1: .asciiz "Please enter an integer to perform a calculation with. " #prompt to obtain user input
prompt2: .asciiz "Please enter another integer. "
sum: .asciiz "Sum: "
difference: .asciiz "	Difference: "
product: .asciiz "	Product: "
goodbye: .asciiz "\nThank you for entertaining me! Love Peace and Happiness!!"

values:	.word   0 : 2         # create an array variable named "fibs" of 9 word-length elements (4 bytes each)
###############################################
# .text segment. Assembly instructions go here.
###############################################
	.text
	      la   $s0, values        # load address of array into $s0
	      
	      #DISPLAY INTRODUCTION
intro:	     li $v0,4 #prep call for displaying string
	     la $a0,begin #load propmt into address reg
	     syscall #proceed with string display
	     	     
	     #obtainInput WAS CREATED IN ORDER TO ASK THE USER FOR TWO INTEGERS TO PERFORM OPERATIONS TO.
obtainInput: #Obtain the first integer
	     li $v0,4 #prep call for displaying string
	     la $a0,prompt1 #load propmt into address reg
	     syscall #proceed with string display
	     #Get user input
	     li $v0,5 #prep call for collecting an integer
	     syscall #proceed with obtaining user input
	     #Store the first integer into s1
	     move $s1,$v0 #move first integer into $s1
	     
	     #Repeat process for the second integer
	     li $v0,4 #prep call for displaying string
	     la $a0,prompt2 #load propmt into address reg
	     syscall #proceed with string display
	     #Get user input
	     li $v0,5 #prep call for collecting an integer
	     syscall #proceed with obtaining user input
	     #Store the second integer into s2
	     move $s2,$v0 #move second integer into $s2 
	    
operate:     add $t0,$s1,$s2 #store SUM in t0
	     sub $t1,$s1,$s2 #store DIFFERENCE (int1-int2) in t1
	     la $a0,($s1)
	     la $a1,($s2)
	     mult $a0,$a1 #store PRODUCT in 10
	     mflo $t2 #store product in t2
	     
displayResults: li $v0,4 #prep call for displaying string
	        la $a0,sum #load propmt into address reg
	        syscall #proceed with string display
	        li $v0, 1 #prep call for displaying an integer
	        move $a0,$t0 #move integer into address reg (needed to display actual number instead of address)
	        syscall #proceed with display of integer
		#REPEAT FOR DIFFERENCE
		li $v0,4 #prep call for displaying string
	        la $a0,difference #load propmt into address reg
	        syscall #proceed with string display
	        li $v0, 1 #prep call for displaying an integer
	        move $a0,$t1 #move integer into address reg (needed to display actual number instead of address)
	        syscall #proceed with display of integer
		#REPEAT FOR PRODUCT
		li $v0,4 #prep call for displaying string
	        la $a0,product #load propmt into address reg
	        syscall #proceed with string display
	        li $v0, 1 #prep call for displaying an integer
	        move $a0,$t2 #move integer into address reg (needed to display actual number instead of address)
	        syscall #proceed with display of integer 	
	       
commence: li $v0,4 #prep call for displaying string
	     la $a0,goodbye #load propmt into address reg
	     syscall #proceed with string display
	     
	     li $v0, 10	#Preps to exit
	     syscall	#proceeds with exiting