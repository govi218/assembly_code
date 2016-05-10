#fibonaci.s
#Fill up an array with fibonacci numbers from 1 - 10, and print these numbers
.data
#declaring and initializing an array and a counter
array:		.space			100
i:			.word			2

.text
_start:
main:	    li $t4, 1				#load reqd variables
		    la $t0, array
		    lw $t1, i
		    li $t2, 4
		    sw $t4, ($t0)
		    sw $t4, 4($t0)


loop:	    mult $t2, $t1			#multiply counter and offset 
		    mflo $t3
		    add $t0, $t0, $t3
		    jal fib
		    li $t3, 25
		    addi $t1, $t1, 1
		    blt $t3, $t1, exit
		    b loop

fib:	    add $t0, $t0, $t2			#function that stores fib num for i in array
			add $t0, $t0, $t2
			add $t6, $t6, $t7
			sw $t6, (t0)
			jr $ra

exit:		li $v0, 10
			syscall
