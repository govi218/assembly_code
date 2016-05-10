#for loop in assembly
#loop.s
.data
counter:	.byte	0	#counter for the loop

.text
_start:
main:		lb	$t1,counter
		
		li	$t2, 10		#loads constant to target immediately

loop:		addi $t1, $t1, 1	#adds constant to source, loads to target
		bne $t1, $t2, loop	#loops if $t1 =/= $t2

exit:		li $v0, l0
		syscall
