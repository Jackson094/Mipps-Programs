#Jack Kapino
#Homework 8

	.data
	large: .asciiz "Enter large Integer: "
	small: .asciiz "Enter small Integer: "
 greatest: .asciiz "GCD: "
		
	
	.globl main
	.text
	
	main:
		la $a0, large           # load large address into $a0
		li $v0, 4              
		syscall                
	
		li $v0, 5              
		syscall                # input integer  into $v0
		add $a1, $v0, $zero    # store large in $a1

		la $a0, small           # load small address into $a0
		li $v0, 4              
		syscall                

		li $v0, 5              
		syscall                # input into $v0
		add $a2, $v0, $zero    # store small in $a2
		
		
	gcd:
		move $t0,$a1		#$t0 = large
		move $t1,$a2		#$t1 = small
	loop:
		beq $t1,$0,done		#if small=0 then gcd = large
		div $t0,$t1
		move $t0,$t1		#previous small becomes large
		mfhi $t1			#remainder = small
		j loop
	done:
		li $v0, 4 
		la $a0,greatest
		syscall	       		#Display String
		
		li $v0, 1
		add $a0, $t0, $zero    	# $a0 = $t0; gcd result  
        syscall			   		# Display Integer

		
		li $v0, 10	 	#Exit program
		syscall	