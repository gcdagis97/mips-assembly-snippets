.data 
prompt1: .asciiz "Please enter your first number: "
prompt2: .asciiz "Please enter your second number: "
print_msgo: .asciiz "\nHere is the first number you entered: "
print_msgo2: .asciiz "\nHere is the second number you entered: "
print_swap: .asciiz  "\nPerforming swap procedure..."
print_swapdone: .asciiz "\nDone!"
print_msgn: .asciiz "\nHere is your new first number: "
print_msgn2: .asciiz "\nHere is your new second number: "
.text
.globl main

main:
	#Prints prompt1
	li $v0, 4
	la $a0, prompt1
	syscall

	#Read integer A and save it into $t1
	li $v0, 5 # service 5 is read integer
	syscall
	move $t1, $v0

	#Prints prompt2
	li $v0, 4
	la $a0, prompt2
	syscall

	#Read integer B and save it into $t2
	li, $v0, 5  # service 5 is read integer
	syscall
	move $t2, $v0
	
	#States first number entered prompt
	li $v0, 4
	la $a0, print_msgo
	syscall
	
	 #Prints that integer
    	li $v0, 1 # service 1 is print integer
    	move $a0, $t1
    	syscall 
	
	#States second number entered prompt
	li $v0, 4
	la $a0, print_msgo2
	syscall
	
	#Print that integer
    	li $v0, 1 # service 1 is print integer
    	move $a0, $t2
    	syscall 
	
	#Tells user swap is happening
	li $v0, 4
	la $a0, print_swap
	syscall
	
	#Swap procedure
	move $t0, $t1		#int a to temp
	move $t1, $t2		#int b to a
	move $t2, $t0		#temp to int b
	
	#Tells user swap is done
	li $v0, 4
	la $a0, print_swapdone
	syscall
	
	#Prints "here is your new first number"
	li $v0, 4
	la $a0, print_msgn
	syscall
	
	 #Print new first int
    	li $v0, 1 # service 1 is print integer
    	move $a0, $t1
    	syscall 

	#Prints "here is your new second number"
	li $v0, 4
	la $a0, print_msgn2
	syscall
	
	#Print new second int
    	li $v0, 1 # service 1 is print integer
    	move $a0, $t2
    	syscall 

	#Terminate program
	li $v0, 10 # service 10 is shutdown
	syscall
