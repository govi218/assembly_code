#self_modify_1001877622.s
#MIPS-32 calculator that performs basic mathematic operations - updated version of b).
				.data
promp:			.asciiz			"Please select one of the following operations:\n1 - Add\n2 - Subtract\n3 - Multiply\n4 - Divide (a/b)\n5 - Min\n6 - Max\n7 - Exit"
prompa:			.asciiz			"Please enter the value for a:\n"
prompb:			.asciiz			"Please enter the value for b:\n"
prompres:		.asciiz			"The result is:\n"
nl:				.byte			"\n"

				.text
_start:
main:			la   $a0, prompa				#load prompa as an argument
				li   $v0, 4					    #prepare to prompt for val of a
				syscall

				li   $v0, 5						#prepare to accept input for a
				syscall

				move $v0, $t0					#store a for later use

				la   $a0, prompb				#load prompb as an argument
				li   $v0, 4						#prepare to prompt for val of b
				syscall

				li   $v0, 5						#prepare to accept input for b
				syscall

				move $v0, $t1					#store b for later use

				la   $a0, promp 				#load prompt for operation as an arg
				li   $v0, 4
				syscall

				move $v0, $t2					#store op for later use

				li   $t3, 0						#initialize  counter

				la   $a0, prompres				#load the result promp
				li   $v0, $4					#print result prompt
				syscall

				jal do_computation

print:			li   $v0, 1						#print result from above ops
				syscall		
				lb   $a0, nl					#print a new line
				li   $v0, a0
				syscall
				b main 							#restart



do_computation:	
				nop								#felt like I needed some nop
				nop
				nop
				nop
				nop
				nop
				nop
				addi $t3, 1						#increment counter

	if_:		bgt  $t2, $t3, else1			#recurse if greater op
				add  $t0, $t0, $t1				#a + b
				move $a0, $t0					#store as an arg
				jr   $ra						#send to print

	else1:		bgt  $t2, $t3, else2			#recurse if different op
				sub  $t0, $t0, $t1				#a - b
				move $a0, $t0					#store as an arg
				jr   $ra						#send to print

	else2:		bgt  $t2, $t3, else3			#recurse if different op
				mult $t0, $t1					#a * b
				mflo $a0						#mflo to a0 as an arg
				jr   $ra						#send to print

	else3:		bgt  $t2, $t3, else4			#recurse if different op
				div  $t0, $t0, $t1				#a / b
				mflo $a0						#mflo quotient to a0 as arg
				jr   $ra	

	else4:		la   $a0, prompinv				#load the invalid entry promp
				li   $v0, 4						#prepare to display
				syscall

exit:			
				li v0, 10						#func that exits program
				syscall
