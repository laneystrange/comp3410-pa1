COMP3410 Spring2015
Programming Assignment #1
Assigned: 4 February, 2015
Deadline: 11 February, 2015


GITHUB SUBMISSION GUIDELINES
1. Fork the assignment repository.
2. Update your work in your own branch regularly.
3. Create one .asm file for each part below (except part zero)
4. When you're ready to turn it in (i.e., your code is perfect and tested), submit a pull request to the original branch.
5. In your README file, provide a description of all the ways you've tested your code and the output that you saw. For example, for Part Two, you should include a summary of what you saw on the screen when you ran your program, something like this:

   Hello! This is PA#1 for COMP3410 and I am Elena Strange.
   Enter an integer: 4
   Enter another integer: 8
   Sum: 12
   Difference: -4
   Product: 32
   Thanks for playing! Goodbye.


PART ZERO. (0 points).

Download and install MARS: http://courses.missouristate.edu/KenVollmar/MARS/download.htm

We'll go over many of the MIPS instructions in class, but our textbook
is a good resource when you need help with syntax or getting access to
all the instrutions possible. Appendix A has a lot of information, and
there is a MIPS cheat-sheet in green paper in the very front.

Another MIPS resource: 
http://www2.engr.arizona.edu/~ece369/Resources/spim/MIPSReference.pdf


=========================================================

PART ONE. 30 points.

First, we'll get familiar with MARS and Assembly by working with an
existing source code file. Retrieve the fibonacci.asm file from the
GitHub repo.

1. Load it into MARS and run the program. 

2. Modify fibonacci.asm so that, instead of always printing 9
Fibonacci numbers, it prompts the user how many numbers to print. (You
can do this by keeping the array the same size, and limiting the user
to input sizes only up to 9.)

=======================================================

PART TWO. 40 points.

Write a MIPS Assembly program that performs the following tasks, in order:

1. Print an introduction that includes: your name, a title, and a brief description of the program.

2. Prompt the user for two numbers and save them in two different registers.

3. Perform 3 calculations (sum, difference, product) using these two numbers, and save each result in data memory.

4. For each computed result, retrieve it from memory and print it to the terminal.

5. Print a concluding message and exit.

======================================================

PART THREE. 30 points.

Write a MIPS Assembly program that performs the following task:

Calculate the sum of the odd integers between 1 and 15, inclusive.
(You may use a MIPS version of a while-loop to complete this task.)

Store each partial sum in memory as you go. I.e., store 1+3=5 in memory. Then store that result plus the next odd number (5+5=10, then 10+7=17), and so on.

Load the final result into a register and print the result to the terminal.


