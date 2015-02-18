# COMP3410
# Author: Daniel Thompson
# Assignment: PA[1] Part 2
# Date: 2/12/15

#######################################
# .data segment
#######################################
.data

name: .asciiz "by Daniel Thompson"
title: .asciiz "Welcome to Programming Assignment 1: Part 2."
desc: .asciiz "This program takes two numbers from user input and performs 3 calculations on them."
bye: .asciiz "The end."

prompt: .asciiz "Enter two numbers:"
num1: .word 0 # variable to hold the first number
num2: .word 0 # variable to hold the second number

sum: .word # holds the sum of the two integers
difference: .word # holds the difference of the two integers
product: .word # holds the product of the two integers

space: .asciiz "\n" # used to space lines

######################################
# .text segment
######################################
.text


##### print title, description, and name #####
li $v0, 4 # call to print string to terminal
la $a0, title # load address to print title
syscall

la $a0, space # space between lines
syscall

li $v0, 4 # call to print string to terminal
la $a0, desc # load address to print intro
syscall

la $a0, space # space between lines
syscall

li $v0, 4 # call to print string to terminal
la $a0, name # load address to print name
syscall

la $a0, space # space between lines
syscall


##### prompt user for input and save input in num1 and num2 #####
li $v0, 4 # system call for printing string
la $a0, prompt # load address of prompt to print in $a0
syscall

la $a0, space # space between lines
syscall

li $v0, 5 # system call to read an integer input by user
syscall

sw $v0, num1 # store the first integer in memory
la $t0, num1 # load the first integer into $t0 register

li $v0, 5 # system call to read an integer input by user
syscall

sw $v0, num2 # store the second integer in memory
la $t1, num2 # load the second integer into $t1 register


##### perform the calculations and print to terminal #####
add $s0, $t0, $t1 # add the two integers and store in $s0
sw $s0, sum # store the result in sum

li $v0, 1 # call to print int to terminal
la $a0, ($s0)
syscall

la $a0, space # space between lines
syscall

sub $s1, $t0, $t1 # subtract the second integer from the first and store in $s1
sw $s1, difference # store the result in difference

li $v0, 1 # call to print int to terminal
la $a0, ($s1)
syscall

la $a0, space # space between lines
syscall

mul $s2, $t0, $t1 # multiply the two integers
sw $s2, product # store the result in product

li $v0, 1 # call to print int to terminal
la $a0, ($s2)
syscall

la $a0, space # space between lines
syscall

##### print concluding message #####
li $v0, 4 # call to print string to terminal
la $a0, bye
syscall

##### exit the program #####
li $v0, 10 # exit
syscall