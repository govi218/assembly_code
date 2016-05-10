#reverse_1001877622.s
#MIPS-32 program that reads a string, reverses and then prints it
		.data
prompt:			.asciiz				"Enter the string to be reversed:\n"
i:				.word				0
		.text
_start:
main:
			la   $a0, prompt		#load the prompt as an arg
			li   $v0, 4				#print the prompt
			syscall

			la   $a0, 1024			#load buffer as arg
			li   $v0, 9				#load buffer space after syscall
			syscall

			move $a0, $v0			#store the created memory as an arg
			li   $a1, 1024
			li   $v0, 8	   			#read the string from the user
			syscall	

			move $t0, $a0			#store string 
			lw   $t3, i


loop:		lb   $t1, ($t0)	    	#store value at position
			addi $t0, $t0, 1		#increment string position
			addi $t3, $t3, 1		#increment counter
			bnez $t1, loop			#break if \0 is reached

			addi $t0, $t0, -2
			addi $t3, $t3, -1

rev_str:	lb   $a0, ($t0)
			li   $v0, 11
			syscall
			addi $t0, $t0, -1
			addi $t3, $t3, -1
			bnez $t3, rev_str

exit:		li   $v0, 10
			syscall
