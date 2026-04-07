# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main
main:
# -- entering a new scope --
# -- symbols in table --
# println
# main
# return
addi $sp $sp -0
la $a0 datalabel0
li $v0 4
syscall
la $a0 newline
syscall
li $t0 7
la $a0 null
li $v0 4
syscall
la $a0 newline
syscall
la $a0 null
li $v0 4
syscall
la $a0 newline
syscall
la $a0 null
li $v0 4
syscall
la $a0 newline
syscall
la $a0 null
li $v0 4
syscall
la $a0 newline
syscall
la $a0 null
li $v0 4
syscall
la $a0 newline
syscall
# -- exiting scope --
addi $sp $sp 0
# -- exiting program -- 
li $v0 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 7 7 7 7 7 (separated by newlines)"