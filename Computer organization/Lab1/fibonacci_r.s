.data
msg1:		.asciiz "Please input i : "
msg2:		.asciiz "th Fibonacci numbers is "
msg3:		.asciiz ".\n"

.text
.globl main
main:		li $v0, 4
		la $a0, msg1
		syscall			# print msg1
		
		li $v0, 5
		syscall
		move $s0, $v0		# $s0=n
		
		jal fibonacci
		move $t0, $v0		# $t0=fibonacci(n)
		
		li $v0, 1
		move $a0, $s0
		syscall			# print n
		
		li $v0, 4
		la $a0, msg2
		syscall			# print msg2
		
		li $v0, 1
		move $a0, $t0
		syscall			# print fibonacci(n)
		
		li $v0, 4
		la $a0, msg3
		syscall			# print msg3
		
		li $v0, 10
		syscall			# exit
.text
quit: 		jr $ra

fibonacci:	beq $s0, 0, zero
		beq $s0, 1, one
		
		sub $sp, $sp, 4		#########################
		sw $ra, 0($sp)		#			#
					#			#
		sub $s0, $s0, 1		# Nested procedure	#
		jal fibonacci		#			#
		add $s0, $s0, 1		# F(n-1)		#
					#			#
		lw $ra, 0($sp)		#			#
		add $sp, $sp, 4		#########################
		
		sub $sp, $sp, 4		#########################
		sw $v0, 0($sp)		#			#
		sub $sp, $sp, 4		#			#
		sw $ra, 0($sp)		#			#
					#			#
		sub $s0, $s0, 2		# Nested procedure	#
		jal fibonacci		#			#
		add $s0, $s0, 2		# F(n-2)		#
					#			#
		lw $ra, 0($sp)		#			#
		add $sp, $sp, 4		#			#
		lw $v1, 0($sp)		#			#
		add $sp, $sp, 4		#########################
		
		add $v0, $v0, $v1	# F(n)=F(n-1)+F(n-2)
		j quit
		
zero:		li $v0, 0		# return 0
		j quit

one:		li $v0, 1		# return 1
		j quit