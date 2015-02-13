# COMP3410
# Author: Daniel Thompson
# Assignment: PA[1] Part 2
# Date: 2/12/15

#######################################
# .data segment
#######################################
.data

name: .asciiz "Daniel Thompson"
title: .asciiz "Welcome to Programming Assignment 1: Part 2"
desc: .asciiz "This program takes two numbers from user input and performs 3 calculations on them."

prompt: .asciiz "Enter two numbers."
num1: .word 0 # variable to hold the first number
num2: .word 0 # variable to hold the second number

space: .asciiz "\n" # used to space lines
######################################
# .text segment
######################################
.text

# print title, description, and name
li $v0, 4 # call to print to terminal
la $a0, title # load address to print title
syscall

la $a0, space # space between lines
syscall

li $v0, 4 # call to print to terminal
la $a0, desc # load address to print intro
syscall

la $a0, space # space between lines
syscall

li $v0, 4 # call to print to terminal
la $a0, name # load address to print name
syscall

la $a0, space # space between lines
syscall

# prompt user for input and save input in num1 and num2
li $v0, 4 # system call for printing string
la $a0, prompt # load address of prompt to print in $a0
syscall

la $a0, space # space between lines
syscall

li $v0, 5 # system call to read an integer input by user
syscall

sw $v0, num1

li $v0, 5 # system call to read an integer input by user
syscall

sw $v0, num2






li $v0, 10 # exit
syscall