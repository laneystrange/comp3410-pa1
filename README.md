# COMP3410 Program Template
# Author: Ben Murphy
# Assignment: PA1
# Date: Feb 10

##############
#  Part One
##############

The program prompts the user for input.
If it receives a negative value or zero as input, it prints an error message and prompts for input again, as there is no zeroth or negativeth Fibonacci number.
Upon receiving valid input, it allocates an array of the appropriate size and begins storing Fibonacci numbers into memory.
Once that is done, it prints from the beginning of the array.
Note that somewhere between 40 and 50 the size of the Fibonacci term exceeds the length of the 4-byte word, which gives an overflow error.

A sample run of the program designed to show off exactly how it works looks like this:

How many Fibonacci numbers would you like to calculate?: -1
That number is invalid. Please make sure the number is greater than zero.
How many Fibonacci numbers would you like to calculate?: 0
That number is invalid. Please make sure the number is greater than zero.
How many Fibonacci numbers would you like to calculate?: 12
The Fibonacci numbers are:
1 1 2 3 5 8 13 21 34 55 89 144 

##############
#  Part Two
##############

The program has a bit of textual flair to it. It prompts the user for two inputs, m and then n.
First it computes m+n, then m-n (order is important!), and finally m*n.
These results are printed in order.

A sample run of the program designed to show off exactly how it works looks like this:

You run the small program. A man named Ben Murphy greets you.
He says this is THE PROGRAM and that he will add, subtract, and multiply any two numbers of your choosing.
What do you choose as your first number?: 3
Interesting choice. How about the second number?: 2
The fabric of reality jitters for a moment.You can hear the sound of a few registers moving data.
The sum of the numbers appears before you. It reads 5.
As quickly as the sum appears, it vanishes. Moments later, another number appears.
Instead of the sum the difference of the two numbers now seems to be suspended in midair. It reads 1.
With a puff of smoke, the difference disappears. After a few hurried instructions you hear whispering in the background.
The product of the two numbers appears before you. It reads 6.

##############
#  Part Three
##############

The program prompts the user for input.
If it receives a negative value or zero as input, it prints an error message and prompts for input again, as the sum should go upwards from 1, not down.
Upon receiving valid input, it begins with a partial sum of 1 and then continually increments 1 by 2 until it hits the number ceiling.
The new number created is continually added to the partial sum, which is stored at the stack pointer.
It is VERY bad practice to not increment the stack pointer. However, this program is never storing more than that single number, the partial sum in memory, making it "safe" to do.
Upon calculating the final sum, it is printed.

A sample run of the program designed to show off exactly how it works looks like this:

We're going to sum all odd numbers from 1 up to a stopping point.
What's the number you want to be the ceiling?: -1
The number must be positive and greater than zero. Please check your input.
We're going to sum all odd numbers from 1 up to a stopping point.
What's the number you want to be the ceiling?: 0
The number must be positive and greater than zero. Please check your input.
We're going to sum all odd numbers from 1 up to a stopping point.
What's the number you want to be the ceiling?: 15
The sum of the odd numbers inclusive is: 64
