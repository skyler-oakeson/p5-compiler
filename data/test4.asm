# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


main:
# -- enter scope
addi $sp, $sp, -8
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
li $t0, 3
sw $t0, 0($sp)
# -- assigns b
li $t0, 2
sw $t0, 4($sp)
# -- enter scope
addi $sp, $sp, -4
# -- symbols in scope
# a: 0
# println: null
# -- assigns a
li $t0, 5
sw $t0, 0($sp)
# -- println
# -- loads a
lw $t0, 0($sp)
# -- loads b
lw $t1, 8($sp)
add $t0, $t0, $t1
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- enter scope
addi $sp, $sp, -4
# -- symbols in scope
# println: null
# b: 0
# -- assigns b
li $t0, 9
sw $t0, 0($sp)
# -- assigns a
li $t0, 2
neg $t0 $t0
sw $t0, 4($sp)
# -- println
# -- loads a
lw $t0, 4($sp)
# -- loads b
lw $t1, 0($sp)
add $t0, $t0, $t1
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 4
# -- exit scope
# -- assigns b
li $t0, 4
sw $t0, 8($sp)
addi $sp, $sp, 4
# -- exit scope
# -- println
# -- loads a
lw $t0, 0($sp)
# -- loads b
lw $t1, 4($sp)
add $t0, $t0, $t1
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 8
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 7 7 7"
