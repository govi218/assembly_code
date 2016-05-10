.data 
	promp:	.asciiz	"Please enter a new string \n"
	null:	.byte 	10
	temp:	.word	0
	count:	.word 	0 
	head: 	.word 	0 
	cur: 	.word 	0 
	new: 	.word 	0 
	nxtptr:	.word 	0
	nxtnde: .word	0

.text 
_start: 
main: # Part 1

loop: jal getstr # Get input from the user

nnull: # The string is not null 
	jal make_node
	b loop

term: #Terminate 
	li $t0,0 
	lw $a0,head 
print: li $v0,4 #get the system ready to print 
	syscall #print the string 
	li	$t1,0
	addi $a0, $a0, 4 #access the pointer
	lw	$a0,($a0)
	bgt $a0,$t1,print	#checks if pointer is null

exit: li $v0,10 #Exit 
	syscall

getstr: # Part 2
	la $a0,promp #load up the string 
	li $v0,4 #get the system ready to print 
	syscall #print the prompt

	li $v0,9 # next sys call is: Allocate the memory 
	li $a0,256 # Size for the string 
	syscall #allocation complete 
	move $a0,$v0	#store the pointer in a0
	li	$a1,256	#length of string
	li $v0,8 # Get the string 
	syscall 
	lw $t0,null #check for empty string 
	sw	$a0,temp
	lw	$t1,($a0)
	move $t3,$a0	#store the pointer in a0
	bne $t1,$t0,nnull #jump if you need to. 
	b term #string is null so terminate.

make_node: # Part 3 
	li $v0, 9 # Allocate 8 bytes memory for node 
	li $a0, 8 # Set amount of bytes as 8 
	syscall 
	sw $v0,new # Setting cur to allocated memory 
	lw 	$a3,temp
	sw	$a3,($v0)	#Store the value of the string here
	addi	$a2,$v0,4	# Move to set the next node pointer
	li	$a1,0
	sw	$a1,($a2) #set next node to null
	la $a1,cur 
	addi $a1,$a1,4 
	sw $v0,($a1) # store the next pointer
	sw	$v0,cur
	lw $a1,count # Check if this is the head 
	li $a2, 0 
	ble $a1,$a2,head_set 
end: jr $ra

head_set: sw $v0,head # store the head 
	move $s0,$v0
 	li $a2,1 
	sw $a2,count # any following nodes are not head nodes 
	b end # keep going