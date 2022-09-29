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
		
		li $t1, 0		# $t1=a
		li $t2, 1		# $t2=b
		li $t3, 1		# $t3=c
		li $t4, 2		# $t4=i
		
		addi $sp, $sp, -8	#########################
		sw $ra, 4($sp)		#			#
		sw $a0, 0($sp)		#			#
					#			#
		jal loop		# Nested procedure	#
					#			#
		lw $a0, 0($sp)		#			#
		lw $ra, 4($sp)		#			#
		addi $sp, $sp, 8	#########################
		j quit
		
zero:		li $v0, 0		# return 0
		j quit

one:		li $v0, 1		# return 1
		j quit
		
loop:		bgt $t4, $s0, finish	# i<=k

		add $t3, $t1, $t2	# c=a+b
		move $t1, $t2		# a=b
		move $t2, $t3		# b=c
		addi $t4, $t4, 1	# i++
		j loop

finish:		move  $v0, $t3		# return c
		j quit







