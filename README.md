Denzel Young
Programming Assignment 1
Submitted 10 February, 2015

After following the guidelines for the assignment and gitHub submissions, along with completing the assignment itself, this first set is complete.

Part Zero speaks for itself and included me downloading and utilizing the software.

Part One was a simple edit of the existing fibonacci code. Here are the key changes:
- The variable size was deleted, as the length of the printed array is no longer set.
- A prompt was included in the first data section to be used later to ask the user how many Fibonacci numbers they would like to see.
- The initial text section prints the aforementioned prompt and moves the number that the user chose to $s5.
- This was done because the deleted size variable was mapped to $s5, so this instantly replaced all missing instances of size with the user inputted variable.

Part Two, titled "Intro to MIPS" was very simple and accomplishes the following.
-Prints an introduction with myname, the title of the program, and a brief summary of what it does.
-The data section contains 6 variables, all of them text to be printed in the program.
-The text section is split into 4 parts: Introduction, Addition, Subtraction, and Multiplication.

Part Three was done iteratively and, while long, does print the correct result of 64.
-The data section contains 1 variable, the text to precede the sum of the odd numbers.
-The text section is a series of add comments, all adding to $t0 which leaves it as the
holder of the sum of 1 - 15 odd only
