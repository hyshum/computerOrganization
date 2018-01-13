#problem2.asm
#Hok Yin Shum
#C++ code


.data
my_array: .word 1, 4, 5, 7, 9, 12, 15, 17, 18, 20, 21, 30
array_size: .word 11

.text
main:

add $a1, $0, 15
jal binary_search
add $t7, $v0, $0

add $a1, $0, 4
jal binary_search
add $t8, $v0, $0

add $a1, $0, 30
jal binary_search
add $t9, $v0, $0

add $a1, $0, 0
jal binary_search
add $s6, $v0, $0

add $s3, $t7, $0
add $s4, $t8, $0
add $s5, $t9, $0

exit:
li $v0, 10
syscall

binary_search:
la $s0, my_array          # s0 = address of my_array.
lw $s1, array_size        #s1 = r
add $a0, $0, $0            # a0 = l
move $s2, $a1             # s2 = key

while_condition_check:
  beq $a0, $s1 while_loop
  sub $t0, $s1, $a0
  bgtz $t0, while_loop



while_loop:

add $s3, $a0, $s1  # s3 = l + r
sra $s3, $s3, 1 # s3 = l + r /2 = m

# if (key < A[m])

sll $t0, $s3, 2
add $t0, $t0, $s0         # t0 = address of A[m]
lw $s4, 0($t0)          #s4 = A[m]
slt $t5, $s2, $s4
bne $t5, $0, if         #t5 = if condition
slt $t5, $s4, $s2    # s5 =  A[m] < key
bne  $t5, $0, else_if
j else

if:
  addi $t6, $0, 1       #t6 = 1
  sub $s1, $s3, $t6      #s1 = m -1
  j while_condition_check

else_if:
  addi $a0, $s3, 1       # l = m  + 1
  j while_condition_check

else:
  final_check:
    sll $t1, $s3, 2
    add $t0, $s0, $t1
    lw $t0,0($t0)
    beq $t0, $s2, okay
    addi $v0, $0, -1
    jr $ra
  okay:
  add $v0, $0, $s3
  jr $ra
