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
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 0
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 1
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 2
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
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
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 4
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 5
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 6
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
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
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 8
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 9
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
sw $ra, -4($sp)
# -- params
li $t0, 10
sw $t0, -8($sp)
addi $sp, $sp, -8
jal fib
addi $sp, $sp, 8
lw $ra, -4($sp)
move $t1, $v0
move $a0, $t1
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
datalabel4: .asciiz "This program prints the first 11 numbers of the Fibonacci sequence"
