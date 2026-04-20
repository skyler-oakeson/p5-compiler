# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


identity:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- save return
# -- loads x
lw $t0, 0($sp)
move $v0, $t0
addi $sp, $sp, 0
# -- exit scope
jr $ra


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
move $v0, $t0
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
sw $ra, -4($sp)
# -- params
li $t0, 7
sw $t0, -8($sp)
addi $sp, $sp, -8
jal identity
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t0, $v0
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 3
sw $t0, -8($sp)
li $t0, 4
sw $t0, -12($sp)
addi $sp, $sp, -12
jal addf
addi $sp, $sp, 12
lw $ra, -4($sp)
move $t0, $v0
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
datalabel0: .asciiz "This program prints 7 7"
