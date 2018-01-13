#P4.asm
.data
comma: .asciiz ", "
output: .asciiz "The sorted array is: \n"

.text
main:

#Load an Integer:
li $v0, 5
syscall
add $s0, $0, $v0    #s0 = size.
sll $a0, $v0, 2     #a0 = size * 4.
li  $v0, 9          #v0 = adress.
syscall
move $a1, $v0        #a1 = v0
move $a2, $0         #a2 = 0
add $t0, $0, $0     # t0 = i = 0
add $t7, $0, $0

#input_loop
loop_1:

    slt $t1, $t0, $s0
    beq $t1, $0, outterLoop
    li $v0, 5
    syscall

    sll $a2, $a2, 2
    add $a2, $a2, $a1
    sw $v0, 0($a2)
    sub $a2, $a2, $a1
    srl $a2, $a2, 2
    addi $a2, $a2, 1
    addi $t0, $t0, 1
    j loop_1

#sort of numbers.
outterLoop:
    add $t2, $0, $0           #t2 = 0
    add $a2, $0, $a1          #a2 = a1
    addi $t6, $0, 1           #t6= 1

    innerLoop:
        addi $t6, $t6, 1        #t6 = t6 + 1
        lw $t3, 0($a2)          
        lw $t4, 4($a2)
        slt $t5, $t3, $t4
        bne $t5, $0, continue
        add $t2, $0, 1
        sw  $t3, 4($a2)
        sw  $t4, 0($a2)



continue:
addi $a2, $a2, 4
bne  $t6, $s0, innerLoop
bne  $t2, $0, outterLoop

#getout of sort.
add $a2, $0, $0   #set a2 = 0,
sll $a2, $a2, 2   #, a2 = a2 * 4.
add $a2, $a2, $a1     #a2 = a2 + a1.
add $t0, $0, $0     #reset t0 = 0.

#output
la $a0, output
li $v0,4
syscall

loop_2:
slt $t1, $t0, $s0
beq $t1, $0, Exit

bnez $t7, khoma
j nullkhoma

khoma:
#output comma
la $a0,comma
li $v0,4
syscall

nullkhoma:
#output number
lw $a0, 0($a2)
li $v0,1
syscall

addi $a2, $a2, 4    #a2 -> next slot.
addi $t0, $t0, 1    #t0++
addi $t7, $t7, 1    #khoma++
j loop_2

Exit:
li $v0, 10
syscall
