.data
x:.word 10 77 0 8 6 3#x[0]--->a0
.text
main:
la $a0,x
li $a1,6
li $s1,1
li $t0,0#i=0
jal selectionsort
terminat:

li $v0,10
syscall

selectionsort:
slt $t1,$t0,$a1#i<n
beq $t1,$s1,selectionfor
j terminat

selectionfor:
jal min
addi $t2,$v0,0#idx=min(x,n,i)
jal swap
addi $t0,$t0,1#i++
j selectionsort


min:
addi $t3,$t0,0#idx=i

sll $t5,$t0,2
add $t5,$t5,$a0
#sw $t5,0($t5)
lw $t4,0($t5)#min=x[i]
addi $t6,$t0,0#j=i
for:
slt $s2,$t6,$a1#j<n
beq $s2,$s1,minfor
addi $v0,$t3,0
jr $ra
minfor:
sll $s3,$t6,2
add $s3,$s3,$a0
lw $s3,0($s3)#x[j]
slt $s4,$s3,$t4#if(x[j]<min)
beq $s4,$s1,ifbody
addi $t6,$t6,1
j for
ifbody:
addi $t4,$s3,0#min=x[j]
addi $t3,$t6,0
addi $t6,$t6,1
j for

swap:
sll $s6,$t2,2
add $s6,$s6,$a0#address of x[idx]
lw $s7,0($s6)
addi $s5,$s7,0#temp=x[idx]
sll $t7,$t0,2
add $t7,$t7,$a0#address of x[i]
lw $t8,0($t7)#x[i]
sw $t8,0($s6)
sw $s5,0($t7)
jr $ra









