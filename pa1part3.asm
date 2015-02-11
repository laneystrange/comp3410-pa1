#Comp 3410
#programming assingment: 1, part 3
#Frank Martino
#02/10/2015

  .data
  
lastsum:	.word  0

  
  .text
  
  li $s1,1 #prepare s1 for loop by setting it to 1
  li $s2,15 #set s2 as limit for loop by setting it to 15
  la $s0,lastsum #load sums array into s0
 # li $s4,0 #prepare incrementer for array
  
  addi $t1,$s1,3
  sw $t1,($s0)
  addi $s1,$s1,4
 
  
  
loop: 	bgt $s1,$s2,end #branch if finished with loop
	lw $t1,($s0)
	add $t1,$t1,$s1
	sw $t1,($s0)
	addi $s1,$s1,2
	j loop

end: 	
	lw $a0,($s0)
	li $v0,1
	syscall
	
	li $v0, 10
	syscall
	
