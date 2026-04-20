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
bne $t0, $zero datalabel1
j datalabel2
datalabel1:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel3
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel2:
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 4
sge $t0, $t0 $t1
bne $t0, $zero datalabel4
j datalabel5
datalabel4:
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
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 4
sge $t0, $t0 $t1
bne $t0, $zero datalabel7
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
j datalabel8
datalabel7:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel10
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
sle $t0, $t0 $t1
bne $t0, $zero datalabel11
j datalabel12
datalabel11:
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
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 3
seq $t0, $t0 $t1
bne $t0, $zero datalabel14
j datalabel15
datalabel14:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel16
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel15:
# -- evaluate if
# -- loads a
lw $t0, 0($sp)
li $t1, 4
sgt $t0, $t0 $t1
bne $t0, $zero datalabel17
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel19
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
j datalabel18
datalabel17:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
la $a0 datalabel20
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp, 0
# -- exit scope
datalabel18:
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
datalabel3: .asciiz "1 correct"
datalabel6: .asciiz "2 not correct"
datalabel9: .asciiz "2 correct"
datalabel10: .asciiz "2 not correct"
datalabel13: .asciiz "3 correct"
datalabel16: .asciiz "4 correct"
datalabel19: .asciiz "5 correct"
datalabel20: .asciiz "5 not correct"
