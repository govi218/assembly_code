#Template, a sample Assembly program
#template.s
	.data	#variable declarations
x:	.word	4
y:	.word	5
z:	.word	46565

	.text

_start:
main:
	lw	$a0, x
	lw	$a1, y
	lw	$a2, z
	add	$t0,$a0,$a1
	add	$t1,$t0,$a2
	sw	$t2,z
	li	$v0,10
	syscall