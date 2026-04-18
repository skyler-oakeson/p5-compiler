# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


add:
# -- enter scope
addi $sp, $sp -4
# -- symbols in scope
# println: null
# i: 0
# -- println
# -- loads x
lw $t0, 4($sp)
# -- loads y
lw $t1, 8($sp)
add $t0, $t0 $t1
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp 4
# -- exit scope
jr $ra


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
addi $sp, $sp -12
sw $t0, 8($sp)
sw $t1, 4($sp)
sw $ra, 0($sp)
jal add
lw $t0, 8($sp)
lw $t1, 4($sp)
lw $ra, 0($sp)
addi $sp, $sp 12
# -- assigns a
li $t0 5
sw $t0, 0($sp)
# -- assigns b
li $t0 2
sw $t0, 4($sp)
addi $sp, $sp -12
sw $t0, 8($sp)
sw $t1, 4($sp)
sw $ra, 0($sp)
jal add
lw $t0, 8($sp)
lw $t1, 4($sp)
lw $ra, 0($sp)
addi $sp, $sp 12
addi $sp, $sp 8
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 7 7"