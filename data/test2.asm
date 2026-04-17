# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main
main:
# -- entering a new scope --
# -- symbols in table --
# println
#-- update the stack pointer
add $sp, $sp 0
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
li $v0 1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t0 3
li $t1 4
add $t0, $t0 $t1
move $a0, $t0
li $v0 1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t0 14
li $t1 2
div $t0 $t1
mflo $t0
move $a0, $t0
li $v0 1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t0 7
li $t1 1
mult $t0 $t1
mflo $t0
move $a0, $t0
li $v0 1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- println
li $t0 7
li $t1 2
mult $t0 $t1
mflo $t0
li $t2 2
div $t0 $t2
mflo $t0
move $a0, $t0
li $v0 1
li $v0, 1
syscall
la $a0 newline
li $v0, 4
syscall
# -- exiting scope --
add $sp, $sp 0
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 7 7 7 7 7 (separated by newlines)"