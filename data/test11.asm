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
# println: null
# i: 0
# -- assigns i
li $t0, 0
sw $t0, 0($sp)
# -- println
la $a0 datalabel0
li $v0, 4
syscall
la $a0 newline
li $v0, 4
syscall
datalabel1:
# -- while
# -- loads i
lw $t0, 0($sp)
li $t1, 10
slt $t0, $t0 $t1
bne $t0, 1 datalabel2
# -- enter scope
addi $sp, $sp, 0
# -- symbols in scope
# println: null
# -- println
# -- loads i
lw $t1, 0($sp)
move $a0, $t1
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
j datalabel1
datalabel2:
addi $sp, $sp, 4
# -- exit scope
# -- exiting program -- 
li $v0, 10
syscall

# All memory structures are placed after the
# .data assembler directive
.data

newline: .asciiz "\n"
datalabel0: .asciiz "This program prints 0 through 9."
