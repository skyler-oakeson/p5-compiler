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
beq $t0, $zero datalabel0
# -- save return
li $t2, 1
sw $t2, 4($sp)
datalabel0:
# -- evaluate if
# -- loads i
lw $t3, 0($sp)
li $t4, 1
seq $t3, $t3 $t4
beq $t3, $zero datalabel1
# -- save return
li $t5, 1
sw $t5, 4($sp)
datalabel1:
# -- save return
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $ra, -28($sp)
# -- return
# -- params
# -- loads i
lw $t6, 0($sp)
li $t7, 1
sub $t6, $t6, $t7
sw $t6, -36($sp)
addi $sp, $sp, -36
jal fib
addi $sp, $sp, 36
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $ra, -28($sp)
lw $t0, -32($sp)
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
# -- loads i
lw $t1, 0($sp)
li $t2, 2
sub $t1, $t1, $t2
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
add $t0, $t0, $t0
sw $t0, 4($sp)
addi $sp, $sp, 0
# -- exit scope
jr $ra


main:
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
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 0
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 1
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 2
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 3
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 4
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 5
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 6
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 7
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 8
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 9
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $t0, -4($sp)
sw $t1, -8($sp)
sw $t2, -12($sp)
sw $t3, -16($sp)
sw $t4, -20($sp)
sw $t5, -24($sp)
sw $t6, -28($sp)
sw $t7, -32($sp)
sw $ra, -36($sp)
# -- return
# -- params
li $t1, 10
sw $t1, -44($sp)
addi $sp, $sp, -44
jal fib
addi $sp, $sp, 44
lw $t0, -4($sp)
lw $t1, -8($sp)
lw $t2, -12($sp)
lw $t3, -16($sp)
lw $t4, -20($sp)
lw $t5, -24($sp)
lw $t6, -28($sp)
lw $t7, -32($sp)
lw $ra, -36($sp)
lw $t0, -40($sp)
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
datalabel2: .asciiz "This program prints the first 11 numbers of the Fibonacci sequence"
