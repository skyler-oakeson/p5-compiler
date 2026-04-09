# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main
main:
# -- entering a new scope --
addi $sp $sp -0
la $a0 datalabel0
li $v0 4
li $v0 11
syscall
la $a0 newline
li $v0 4
syscall
li $t0 3
sw $t0 0($t0)
li $t1 4
sw $t1 0($t0)
add null null null
li $v0 1
syscall
la $a0 newline
li $v0 4
syscall
# -- symbols in table --
# a
# println
# b
# main
# -- exiting scope --
addi $sp $sp 0
# -- exiting program -- 
li $v0 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints the number 7"