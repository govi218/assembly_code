.data
x:	.word	10
y:	.word	5
z:	.byte	-5

.text
_start:
lw	$t1,x
lw	$t2,z
add	$t0,$t1,$t2
li	$v0,10
syscall
