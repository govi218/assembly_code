#stack.s
#a MIPS-32 function that deals with pushing and popping in the program stack
.data

.text
_start:

push:		addi $sp, $sp, -4
			sw   $r3, ($sp)
			jr   $ra

pop:		sw   $v0, ($sp)
			addi $sp, $sp, 4
main:


