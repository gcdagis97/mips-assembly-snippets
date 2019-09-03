.data

prompt1: .asciiz "Enter first integer and press return: "
prompt2: .asciiz "Enter second integer and press return: " 
prompt3: .asciiz "Enter third integer and press return: "
max: "The largest integer is: "
.text

main:

    #Prints prompt1
    li $v0, 4
    la $a0, prompt1
    syscall

    #Read integer A and save it into $t1
    li $v0, 5   # service 5 is read integer
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
   
    #Prints prompt3
    li $v0, 4
    la $a0, prompt1
    syscall
 
    #Read integer C and save it into $t3
    li, $v0, 5  # service 5 is read intger
    syscall
    move $t3, $v0

    #Stores largest int in $t1
    bge $t1, $t0, largest
    move $t1, $t0

    #Gets largest int
    largest: 
    bge $t1, $t2, L1 
    move $t1, $t2 

    L1: 
    li $v0, 4
    la $a0, max 
    syscall
 
    #Print largest int
    li $v0, 1 # service 1 is print integer
    move $a0, $t1
    syscall
