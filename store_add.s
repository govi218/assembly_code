#add.s
#Program in Assemby to create four word-type variables
#vars X, Y, Z
.data
X:			.word			15
Y:			.word			5
Z:			.word			-13
result:		.word			0

.text
_start:
main:
		   #loading values
			lw $t0, X
			lw $t1, Y
			lw $t2, Z
			lw $t3, result

		   #perform addition
		    add $t3,$t2,$t1
		    add $t3,$t3,$t0

exit:	    li v0, 10
		    syscall