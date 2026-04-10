# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main
main:
# -- entering a new scope --
addi $sp $sp -0
# -- println
la $a0 datalabel0
li $v0 4
syscall
la $a0 newline
li $v0 4
syscall
# -- assign the value of a
li $t0 -4
add $t0 $t0 $sp
li $t1 3
sw $t1 0($t0)
# -- assign the value of b
li $t0 -8
add $t0 $t0 $sp
li $t1 4
sw $t1 0($t0)
# -- println
# -- load the value of a
li $t1 -4
add $t1 $t1 $sp
lw $t0 0($t1)
# -- load the value of b
li $t3 -8
add $t3 $t3 $sp
lw $t2 0($t3)
add $t0 $t0 $t2
move $a0 $t0
li $v0 1
syscall
la $a0 newline
li $v0 4
syscall
# -- symbols in table --
# -- exiting scope --
addi $sp $sp 0
# -- exiting program -- 
li $v0 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints the number 7"