#Jack Kapino
#Homework 9

	.data
prompt: .asciiz "\nEnter Temperature in celcisus (C): "
result: .asciiz "Fahrenheit: "

	
	.text
main:	
		li $v0,4
		la $a0,prompt
		syscall
		li $v0,5
		syscall
		addi $s1,$zero,-55
		addi $s2,$zero,55
		beq $v0,$s2,exit
		nop
		beq $v0,$s1,exit
		nop
		jal subroutine
		nop
		j main
		nop	
subroutine: 
				li $t0,9
				li $t1,5
				mul $t0,$v0,$t0
				div $t0,$t1
				mflo $t0
				addiu $t0,$t0,32	#$t0 holds c*(9/5)+32
	
				li $v0,4
				la $a0,result
				syscall
	
				li $v0,1
				move $a0,$t0
				syscall
	
				sll $0,$0,0
				jr $ra

	
	
	exit: sll $0,$0,0
		  li $v0,10		#end program 
		  syscall	