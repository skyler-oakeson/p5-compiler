# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main

j main
main:
# -- entering a new scope --
# -- symbols in table --
println: <println, null>
main: <main, null>
return: <return, null>
println: <println, null>
return: <return, null>

# -- exiting scope --
# All memory structures are placed after the
# .data assembler directive
.data

datalabel0: .asciiz "Hello world"