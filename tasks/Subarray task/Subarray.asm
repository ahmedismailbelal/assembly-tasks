\\\\\\\\\\\\\\\\\\\\\assembly code\\\\\\\\\\\\\\\\

.data
a : .word 2 4 5 7 6 8 9
size1 : .word 7
b : .word 8 9 10
size2: .word 3
index:.word
.text
#main class
main : 
la $a0 , a 
lw $a1, size1 
la $a2, b
lw $a3 , size2 
addi $s5, $zero ,0
la $s7 , index
lw $t8, 0($s7)

jal subarray

move $t8, $v1
sw $t8, 0($s7)

li $v0, 10 
syscall  


#fuction
subarray: 
addi $sp , $sp, -20
lw $t0, 0($sp)
lw $t1, 4($sp)
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2 , 16($sp)

#initialize the i and j
addi $t0, $zero ,0
addi $t1, $zero, 0

#move the address of first index from a0 to s2
move $s2, $a0

#start of the while loop
whileloop:

#condition of while loop
slt $t2, $t0, $a1 
slt $t3, $t1, $a3 
and $t4, $t2, $t3  
beq $t4, $zero, endwhile 

# a[i]
sll $t5, $t0, 2
add $t5, $t5, $s2
lw $s0, 0($t5)

#b[j]
sll $t6, $t1, 2
add $t6, $t6, $a2
lw  $s1, 0($t6)

#if a[i] == b[j]
bne $s0, $s1,else 
addi $t0 , $t0, 1
addi $t1, $t1, 1
sw $s0, 0($t5)
sw $s1, 0($t6)

#nasted if
bne $t1, $a3, endNastedIf

li $t7,4
sub $t8,$t5,$a0
div $t8,$t8,$t7
sub $t8,$t8,$a3
addi $v0,$t8,1

#sw $v0,index
j endif


endNastedIf:
j endif

endif:
j whileloop


else:
sub $t0,$t0,$t1
addi $t0, $t0, 1
addi $t1 , $zero , 0
j whileloop


endwhile:
addi $v1 , $zero, -1
bne $v0, $zero,print_value
li $v0, 1
add $a0 , $v1,$zero 
syscall 
j rest_while


print_value:
move $v1, $v0
li $v0, 1
move $a0 , $v1 
syscall
j rest_while

rest_while:
addi $sp , $sp, 20
sw $t0, 0($sp)
sw $t1, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
jr $ra

\\\\\\\\\\\\\\\\ID'S\\\\\\\\\\\\\\\\\

Ahmed Ismail Belal Abdullah ---> 20190016
Mahinaz Abdalla abdelghani ----> 20190411