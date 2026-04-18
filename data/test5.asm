# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


foo:
# -- enter scope
addi $sp, $sp 0
# -- symbols in scope
# println: null
# -- println
li $t0 7
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp 0
# -- exit scope
jr $ra


fum:
# -- enter scope
addi $sp, $sp -8
# -- symbols in scope
# a: 0
# println: null
# b: 4
# -- assigns a
li $t0 9
sw $t0, 0($sp)
# -- assigns b
li $t0 12
sw $t0, 4($sp)
# -- println
# -- loads b
lw $t0, 4($sp)
# -- loads a
lw $t1, 0($sp)
sub $t0, $t0 $t1
li $t2 4
add $t0, $t0 $t2
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp -4
sw $ra, 0($sp)
jal foo
lw $ra, 0($sp)
addi $sp, $sp 4
addi $sp, $sp 8
# -- exit scope
jr $ra


main:
# -- enter scope
addi $sp, $sp 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel0
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp -4
sw $ra, 0($sp)
jal foo
lw $ra, 0($sp)
addi $sp, $sp 4
addi $sp, $sp -4
sw $ra, 0($sp)
jal fum
lw $ra, 0($sp)
addi $sp, $sp 4
addi $sp, $sp 0
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 7 7 7"