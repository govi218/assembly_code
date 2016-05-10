#declare an int array for 25 int vals 
#then, perform:
#for(i = 0; i < 25; i++){
#	array[i] = i
#}

.data
array:			.space			100
counter:		.byte			0

.text
_start:
main:			lb $t1, counter
				la $t3, array
				li $t0, 4
				li $t5, 25

loop:			mult $t0, $t1
				mflo $t4
				add $t3, $t3, $t4
				sw $t1, ($t3)
				addi $t1, $t1, 1
				beq $t1, $t5, exit
				b loop

exit:			li $v0, 10
				syscall

#Another way

loop2:			sw $t1, ($t3)
				addi $t1, 1
				addi $t0, 4
				blt $t1, $t5, loop2