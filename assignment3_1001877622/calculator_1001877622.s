#calculator_1001877622.s
#MIPS-32 calculator that performs basic mathematic operations.
.data
promp:			.asciiz			"Please select one of the following operations:\n1 - Add\n2 - Subtract\n3 - Multiply\n4 - Divide (a/b)\n5 - Min\n6 - Max\n"
prompa:			.asciiz			"\nPlease enter the value for a:\n"
prompb:			.asciiz			"Please enter the value for b:\n"
prompinv:		.asciiz			"Enter valid input.\n"
prompres:		.asciiz 		"The result is: "

.text
_start:
main:			la   $a0, prompa				#load prompa as an argument
				li   $v0, 4					    #prepare to prompt for val of a
				syscall

				li   $v0, 5						#prepare to accept input for a
				syscall

				move $t0, $v0					#store a for later use

				la   $a0, prompb				#load prompb as an argument
				li   $v0, 4						#prepare to prompt for val of b
				syscall

				li   $v0, 5						#prepare to accept input for b
				syscall

				move $t1, $v0					#store b for later use

				la   $a0, promp 				#load prompt for operation as an arg
				li   $v0, 4
				syscall

				li   $v0, 5						#prepare to accept input for op
				syscall

				move $t2, $v0

				la   $a0, prompres				#load prompb as an argument
				li   $v0, 4						#prepare to prompt for val of b
				syscall

opselect:		li   $t3, 1						#Conditional branch for selecting operation func
				beq  $t2, $t3, Add
				li   $t3, 2
				beq  $t2, $t3, Sub
				li   $t3, 3
				beq  $t2, $t3, Mult
				li   $t3, 4
				beq  $t2, $t3, Div
				li   $t3, 5
				beq  $t2, $t3, a_less_b
				li   $t3, 6
				beq  $t2, $t3, a_grt_b

invalid:		la   $a0, prompinv				#load the invalid entry promp
				li   $v0, 4						#prepare to display
				syscall
				b main							#branch back to main

exit:			li $v0, 10						#func that exits program
				syscall

Add:			add  $t0, $t0, $t1				#a + b
				move $a0, $t0					#store as an arg
				b print							#send to print

Sub:			sub  $t0, $t0, $t1				#a - b
				move $a0, $t0					#store as an arg
				b print							#send to print

Mult:			mult $t0, $t1					#a * b
				mflo $a0						#mflo to a0 as an arg
				b print							#send to print

Div:			div  $t0, $t0, $t1				#a / b
				mflo $a0						#mflo quotient to a0 as arg
				b print							#send to print

a_less_b:		bgt  $t0, $t1, b_less_a			#if a > b, go to b_less_a
				move $a0, $t0					#else, store a as arg
				b print							#send to print

b_less_a:		move $a0, $t1					#store b as an arg
				b print							#send to print

a_grt_b:		blt  $t0, $t1, b_grt_a
				move $a0, $t0
				b print

b_grt_a:		move $a0, $t1
				b print

print:			li   $v0, 1						#print result from above ops
				syscall		
				b main 							#branch to exit
