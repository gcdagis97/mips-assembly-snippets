# Helloworld test program

        .data
msg:   	.asciiz "Hello world!"
	
        .text
        .globl main
main:   li $v0, 4       # syscall 4 (print_str)
        la $a0, msg     # argument: string
        syscall         # print the string
                
        li $v0, 10      # syscall 10 (exit)
        syscall         # call operating system
