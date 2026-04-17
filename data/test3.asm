# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


main:
# -- enter scope
addi $sp, $sp -8
# -- symbols in scope
# a: 0
# println: null
# b: 4
# -- println
la $a0 datalabel0
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
# -- assigns a
li $t0 3
sw $t0, 0($sp)
# -- assigns b
li $t1 4
sw $t1, 4($sp)
# -- println
# -- loads a
lw $t2, 0($sp)
# -- loads b
lw $t3, 4($sp)
add $t2, $t2 $t3
move $a0, $t2
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp 8
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints the number 7"