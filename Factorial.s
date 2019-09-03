.data 
msg_str: .asciiz "Please enter a number: "
.text
.globl main

main:
	la		$a0, msg_str		# print prompt
	li		$v0, 4
	syscall
	
	li		$v0, 5
	syscall
	
	move		$a0,$v0
	jal		factorial
	move	        $a0,$v0			# get result
	li		$v0,1			# print integer
	syscall
	
	li		$v0,10
	syscall
	
factorial:
	addi            $sp,$sp,-8
	sw		$s0,0($sp)
	sw		$ra,4($sp)

	#Start of procedure
	move            $s0,$a0
	li		$v0,0x00000001
	beq		$s0,$v0,L2		# end recursion
	addi            $a0,$s0,-1		
	jal		factorial		# recursive call*
	mult            $v0,$s0			# multiply
	mflo            $v0			# return result
	j		L3			# exit procedure
	
L2:
	li		$v0,0x00000001          # return value
	#Exit procedure
	
L3:
	lw		$ra,4($sp)
	lw		$s0,0($sp)
	addi            $sp,$sp,8
	jr		$ra			# return
