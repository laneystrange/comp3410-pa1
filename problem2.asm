# COMP3410 Program Template
# Author: Jay Murphy
# Assignment: PA[2]
# Date: D2/11/2015

# Turn in one .asm file per assignment component
# Remember to submit it as a pull request to the GitHub repo for the assignment

# problem2.asm
# Input: None
# Output: Print to terminal N Fibonacci numbers

##########################################################
# .data segment. Constant and variable definitions go here.
##########################################################

	.data
	
#Strings for introduction for assigment 1 problem 2
space: .asciiz "\n"	#new line character
name: .asciiz "Jay Murphy" 	# string that stores my name
title: .asciiz "Chief operating Vice President of Lambda Chi Alpha and former Chief Financail Officer"		#title I made up for myself but it is a real title for myself
description: .asciiz "This program allows you to see the name and title of the programer, and takes in two numbers. Then does calculations on those numers."		#description of the program


###############################################
# .text segment. Assembly instructions go here.
###############################################