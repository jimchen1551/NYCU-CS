.data
msg1:		.asciiz "The array before sort : "
msg2:		.asciiz "\nThe array after sort : "
msg3:		.asciiz " "
msg4:		.asciiz "\n"
n:		.word 10
data:		.word 5,3,6,7,31,23,43,12,45,1

.text
.globl main

main:		li $t0, 0		# $t0=i
		la $s0, data		# $s0=data
		lw $s1, n		# $s1=n
		
		li $v0, 4
		la $a0, msg1
		syscall			# print msg1
		
		jal print		# print data
		li $t0, 0		# reset i=0
		addi $s0, $s0, -40	# reset data
		
		jal bubblesort1		# bubble sort
		li $t0, 0		# reset i=0
		
		li $v0, 4
		la $a0, msg2
		syscall			# print msg2
		
		jal print		# print data
		li $t0, 0		# reset i=0
		addi $s0, $s0, -40	# reset data
		
		li $v0, 10
		syscall			# exit
.text
quit: 		jr $ra

print:		beq $t0, $s1, quit	# i<n
		
		li $v0, 1
		lw $a0, 0($s0)
		syscall			# print element
		
		li $v0, 4
		la $a0, msg3
		syscall			# print space
		
		addi $t0, $t0, 1	# i++
		addi $s0, $s0, 4	# next element
		j print			# for

bubblesort1:	beq $t0, $s1, quit	# i<n
		
		addi $t1, $t0, -1	# j=i-1
		
		addi $sp, $sp, -8	#########################
		sw $ra, 4($sp)		#			#
		sw $a0, 0($sp)		#			#
					#			#
		jal bubblesort2		# Nested procedure	#
					#			#
		lw $a0, 0($sp)		#			#
		lw $ra, 4($sp)		#			#
		addi $sp, $sp, 8	#########################
		
		addi $t0, $t0, 1	# i++
		j bubblesort1		# for

bubblesort2:	blt $t1, $zero, quit	# j>=0
		
		mul $t2, $t1, 4
		add $s0, $s0, $t2	# set data
		lw $t3, 0($s0)		# $t3=v[j]
		lw $t4, 4($s0)		# $t4=v[j+1]
		sub $s0, $s0, $t2	# reset data
		
		ble $t3, $t4, quit	# v[j]>v[j+1]
		
		addi $sp, $sp, -8	#########################
		sw $ra, 4($sp)		#			#
		sw $a0, 0($sp)		#			#
					#			#
		jal swap		# Nested procedure	#
					#			#
		lw $a0, 0($sp)		#			#
		lw $ra, 4($sp)		#			#
		addi $sp, $sp, 8	#########################
		
		addi, $t1, $t1, -1	# j--
		j bubblesort2		# for
swap:		add $s0, $s0, $t2	# set data
		sw $t4, 0($s0)		# v[j]=v[j+1]
		sw $t3, 4($s0)		# v[j+1]=v[j]
		sub $s0, $s0, $t2	#reset data
		j quit







