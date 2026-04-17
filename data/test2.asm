# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main


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
# -- println
li $t0 7
move $a0, $t0
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t1 3
li $t2 4
add $t1, $t1 $t2
move $a0, $t1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t3 14
li $t4 2
div $t3 $t4
mflo $t3
move $a0, $t3
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t5 7
li $t6 1
mult $t5 $t6
mflo $t5
move $a0, $t5
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t7 7
li $t8 2
mult $t7 $t8
mflo $t7
li $t9 2
div $t7 $t9
mflo $t7
move $a0, $t7
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
addi $sp, $sp 0
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 7 7 7 7 7 (separated by newlines)"