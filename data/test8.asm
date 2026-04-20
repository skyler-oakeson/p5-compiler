# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


addf:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- save return
# -- loads x
lw $t0, 0($sp)
# -- loads y
lw $t1, 4($sp)
add $t0, $t0, $t1
sw $t0, 8($sp)
addi $sp, $sp, 0
# -- exit scope
jr $ra


add2:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- save return
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $ra, -12($sp)
# -- return
# -- params
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $ra, -12($sp)
# -- return
# -- params
# -- loads x
lw $t2, 0($sp)
sw $t2, -20($sp)
# -- loads y
lw $t0, 4($sp)
sw $t0, -24($sp)
addi $sp, $sp, -24
jal addf
addi $sp, $sp, 24
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $ra, -12($sp)
lw $t0, -16($sp)
sw $t0, -20($sp)
li $t0, 1
sw $t0, -24($sp)
addi $sp, $sp, -24
jal addf
addi $sp, $sp, 24
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $ra, -12($sp)
lw $t0, -16($sp)
sw $t0, 8($sp)
addi $sp, $sp, 0
# -- exit scope
jr $ra


main:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel0
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $ra, -16($sp)
# -- return
# -- params
li $t1, 2
sw $t1, -24($sp)
li $t0, 4
sw $t0, -28($sp)
addi $sp, $sp, -28
jal add2
addi $sp, $sp, 28
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $ra, -16($sp)
lw $t0, -20($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 7"
