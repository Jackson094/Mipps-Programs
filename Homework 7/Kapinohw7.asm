#Jack Kapino
#Homework #7


	
	.data
size: .word 8
array: .word 23 , -12 , 45 , -32 , 52 , -72 , 8 , 13


	.text
		main:
		la $t0, array       # Base address
        li $t1, 0           # i counter =0
        lw $t2, size        #size
		addi $t3,$t3,0		#$t3 holds Max Element
		addi $t5,$t5,100	#$t5 holds smallest Element

		while:
		 lw   $t4, ($t0)              # array[i]
		 sll $0,$0,$0
		 add  $t1, $t1, 1             # Increment index
         add  $t0, $t0, 4             # next array element
		 sll $0,$0,0
		 slt $t6,$t4,$t5
		 sll $0,$0,0
		 beq $t6,1,min
		 sll $0,$0,0
		 here: 
			slt $s4,$t3,$t4
			sll $0,$0,0
			beq $s4, 1, max
		end0:
		blt  $t1, $t2, while  # continues until counter < size
		sll $0,$0,0
		j exit
		sll $0,$0,0
		
		min: 
			sll $0, $0,0
			move $t5,$t4
			j here
			
	    max: 
		   sll $0,$0,0
		   move $t3,$t4
		   j end0		
		
		exit:
			li $v0, 10             
			syscall            # Exit