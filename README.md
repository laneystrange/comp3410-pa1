COMP3410 PA1

Problem One: Fibonacci 

	Input: Integer from user between 1 - 9 inclusive
	Output: Fibonacci numbers

	Output: 
		Enter the value for the Fibonacci Sequence: 0
		Enter the value for the Fibonacci Sequence: 10
		Enter the value for the Fibonacci Sequence: 9
		The Fibonacci number are: 
		1 1 2 3 5 8 21 34
		-- program is finished running--

	Summary:
		This program now accepts user input for the size of the fibonacci
		sequence. I changed the variable size to print out a message. Next 
		was setting up the program to take user input. After user input the value
		is then tested to make sure it's between 1 - 9 inclusive. If all checks 
		pass then the input is moved from $v0 into $s5.
		
		The problem that I had was verifying the user input to make sure it was
		between 1 - 9 inclusive. After class on 2/9/15 that problem was now 
		trival.


Problem Two: Introduction including the sum, difference, and product of two ints

	Input: Two integers
	Output: Introduction and the sum, difference, and product of two ints

	Output:
		Welcome, I am Robert Edstrom and this is PA1 part-two.
		Input: two integers, Output: sum, difference, & product
		Pick an integer: 5
		Pick an integer: 9
		Sum: 14
		Difference: -4
		Product: 45
		-- Program is finished running --

		Summary:
			This program will print out an introduction and prompt the user to 
			enter two integers. Once the user has choosen the two integers the
			program will print the sum, difference, and product of the two 
			integers. 

			When I first hacked this out the sum and product were working 
			correctly. The difference was printing a value that is not possible
			through the subtraction of two integers. The problem was fixed when 
			I tinkered with the registers on line 61.
			


Problem Three: Sum of the odd integers 1 - 15 inclusive
	
	Input: None
	Output: The sum of the odd integers 1 - 15 inclusive

	Output: 
		The sum of the odd integers 1 - 15 inclusive is: 64

	Summary: 
		Problem three will output the sum of the values between 1 - 15 inclusive.

		The problem I was having with this program was inside the loop. I was
		able to implement the calculation of the next odd integer, but figuring
		out what I needed to store and when was my problem. When I stored the 
		next odd number in the array along with the sum of the first two odd
		integers the output from the program was incorrect. The next step was 
		to tinker with the registers to see if I could get the expected output. 
		After coming back to this problem after a day or two I was able to figure
		out how to manipulate the registers to get the expected output. But now 
		the problem was to figure out how to break out of the loop. After class
		on 2/9/15 this problem was trival. 

