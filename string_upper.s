#string_upper.s
#tutorial for stack
.data
buffer:			.byte			128
i:				.word			0

.text
_start:
main:			lb   $a0, buffer			#allocating buffer
				li   $v0, 9
				syscall


				move $a0, $v0				#$a0 = $v0
				lb   $a1, buffersize
				li   $v0, 8					#read string
				syscall

				lw   $t0, i					#load counter and offset for loop

loop:			
