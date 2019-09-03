.data
array: .word 2, 4, 3, 6, 1
length: .word 5 		# the length of the array is 10
sum: .word 0 			# the sum of the integers (in array) is 0
sumMessage: .asciiz "The sum of the array is: "
newLine: .asciiz "\n"
.text
main:
	li $t0, 0 		# load immediate 0 in register $t0 (sum)
	la $t3, array 		# load base addr. of array into $t3
	lw $t2, length 		# load length in register $t2
	addi $t2, $t2, -1 	# $t2 = length - 1
	li $t1, 0 		# initialize i in $t1 to 0
loop:
	bgt $t1, $t2, exit 	# exit loop when i > (length-1)
	mul $t4, $t1, 4 	# multiple i by 4 to get offset within array
	add $t4, $t3, $t4 	# add base addr. of array to $t4 to get addr. of array[i]
	lw $t4, 0($t4) 		# load value of array[i] from memory into $t4
	add $t0, $t0, $t4 	# update sum
	mul $t6, $t4, $t4 	# temp register %t6 
	addi $t1, $t1, 1 	# increment i
	j loop
exit:

# print sum message
li $v0, 4
la $a0, sumMessage
syscall 

# print value of sum
li $v0, 1
addi $a0,$t0,0
syscall

# print new line
li $v0, 4
la $a0, newLine
syscall 
