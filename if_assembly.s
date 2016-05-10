.data
x:			.word			7
y:			.word			10
z:			.word			0

.text
_start:
main:		lw $t0,x
			lw $t1,y
			lw $t2,z
			li $t3,5

			add $t2,$t1,$t0

			sw $t2,z
			lw, $t2,z

			bgt $t2,$t3,part1

part2:		sw $t2,y
			b exit

part1:		sw $t2,x

exit:		li $v0, 10
			syscall