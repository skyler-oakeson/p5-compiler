# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


fib:
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- evaluate if
# -- loads i
lw $t0, 0($sp)
li $t1, 0
seq $t0, $t0 $t1
bne $t0, $zero datalabel0
j datalabel1
datalabel0:
# -- save return
li $t1, 1
move $v0, $t1
jr $ra
datalabel1:
# -- evaluate if
# -- loads i
lw $t0, 0($sp)
li $t1, 1
seq $t0, $t0 $t1
bne $t0, $zero datalabel2
j datalabel3
datalabel2:
# -- save return
li $t1, 1
move $v0, $t1
jr $ra
datalabel3:
# -- save return
sw $ra, -4($sp)
# -- params
# -- loads i
lw $t0, 0($sp)
li $t1, 1
sub $t0, $t0, $t1
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $ra, -12($sp)
# -- params
# -- loads i
lw $t2, 0($sp)
li $t3, 2
sub $t2, $t2, $t3
sw $t2, -16($sp)
addi $sp, $sp, -16
jal fib
addi $sp, $sp, 16
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $ra, -12($sp)
move $t3, $v0
add $t1, $t1, $t3
move $v0, $t1
jr $ra
addi $sp, $sp, 0
# -- exit scope
jr $ra


main:
# -- enter scope
addi $sp, $sp, -4
# -- symbols in scope
# println: null
# i: 0
# -- assigns i
li $t0, 0
sw $t0, 0($sp)
# -- println
la $a0 datalabel4
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
datalabel5:
# -- while
# -- loads i
lw $t0, 0($sp)
li $t1, 12
slt $t0, $t0 $t1
bne $t0, 1 datalabel6
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
sw $t0, -4($sp)
sw $ra, -8($sp)
# -- params
# -- loads i
lw $t1, 0($sp)
sw $t1, -12($sp)
addi $sp, $sp, -12
jal fib
addi $sp, $sp, 12
lw $t0, -4($sp)
lw $ra, -8($sp)
move $t2, $v0
move $a0, $t2
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- assigns i
# -- loads i
lw $t0, 0($sp)
li $t1, 1
add $t0, $t0, $t1
sw $t0, 0($sp)
addi $sp, $sp, 0
# -- exit scope
j datalabel5
datalabel6:
addi $sp, $sp, 4
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel4: .asciiz "This program prints the first 12 numbers of the Fibonacci sequence."
