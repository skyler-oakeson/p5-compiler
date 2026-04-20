# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


main:
# -- enter scope
addi $sp, $sp, -4
# -- symbols in scope
# a: 0
# println: null
# -- assigns a
li $t0, 3
sw $t0, 0($sp)
# -- println
la $a0 datalabel0
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 4
slt $t0, $t0 $t1
beq $t0, $zero datalabel1
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel2
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel1:
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 4
sge $t0, $t0 $t1
beq $t0, $zero datalabel3
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel4
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel3:
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 4
sge $t0, $t0 $t1
beq $t0, $zero datalabel5
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel6
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel5:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel7
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 3
sle $t0, $t0 $t1
beq $t0, $zero datalabel8
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel9
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel8:
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 3
seq $t0, $t0 $t1
beq $t0, $zero datalabel10
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel11
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel10:
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 4
sgt $t0, $t0 $t1
beq $t0, $zero datalabel12
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel13
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel12:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel14
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
addi $sp, $sp, 4
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints [1..5] correct."
datalabel2: .asciiz "1 correct"
datalabel4: .asciiz "2 not correct"
datalabel6: .asciiz "2 not correct"
datalabel7: .asciiz "2 correct"
datalabel9: .asciiz "3 correct"
datalabel11: .asciiz "4 correct"
datalabel13: .asciiz "5 not correct"
datalabel14: .asciiz "5 correct"
