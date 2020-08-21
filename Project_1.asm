.data
	Prompt:           .asciiz "Please insert an integer number:"
	Message1:	  .asciiz "\n The factorial of: " 
	Message2:          .asciiz "  is: "
	
	Number:  .word 0
	Ans:	  .word 0	
	
.text
	#.globl main
	main:
	
	#Read User Input
	
	li $v0, 4
	la $a0, Prompt
	syscall
	
	li $v0, 5
	syscall
	
	
	sw $v0, Number
	
	li $v0, 1
	lw $a0, Number
	syscall
	
	
	#Call factorial function
	
	lw $a0, Number
	jal fact
	sw $v0, Ans
	
	#Display Result
	
	li $v0, 4
	la $a0, Message1
	syscall
	
	li $v0, 1
	lw $a0, Number
	syscall
	
	 li $v0, 4
	 la $a0, Message2
	 syscall
	 
	 li $v0, 1
	 lw $a0, Ans
	 syscall  

	  li $v0, 10
	  syscall
	  	  
	  	  	  
fact: 
	addi $sp, $sp, -8 # adjust stack for 2 items
 	sw $ra, 4($sp) # save return address
  	sw $a0, 0($sp) # save argument 
  	slti $t0, $a0, 1 # test for n < 1 
  	beq $t0, $zero, L1 
	
  	addi $v0, $zero, 1 # if so, result is 1 
  	addi $sp, $sp, 8 # pop 2 items from stack 
  	jr $ra # and return 
 L1:
    
	addi $a0, $a0, -1 # else decrement n 
	jal fact # recursive call 
	lw $a0, 0($sp) # restore original n 
	lw $ra, 4($sp) # and return address 
	addi $sp, $sp, 8 # pop 2 items from stack 
	mul $v0, $a0, $v0 # multiply to get result 
	jr $ra # and return	  
	
		  	  	  	  
		  	  	  	  	  	  	  	  
		  	  	  	  	  	  	  	  	  	  	  	  
		  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  