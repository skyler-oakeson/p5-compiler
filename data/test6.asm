# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


addf:
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
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $ra, -12($sp)
# -- return
# -- params
li $t0 3
sw $t0, -20($sp)
li $t1 4
sw $t1, -24($sp)
addi $sp, $sp -24
jal addf
addi $sp, $sp 24
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $ra, -12($sp)
# -- assigns a
li $t2 5
sw $t2, 0($sp)
# -- assigns b
li $t3 2
sw $t3, 4($sp)
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $ra, -20($sp)
# -- return
# -- params
# -- loads a
lw $t4, 0($sp)
sw $t4, -28($sp)
# -- loads b
lw $t5, 4($sp)
sw $t5, -32($sp)
addi $sp, $sp -32
jal addf
addi $sp, $sp 32
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $ra, -20($sp)
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