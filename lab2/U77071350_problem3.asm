#problem3.asm
#hok yin shum

.data
my_array: .word 1, 4, 5, 7, 9, 12, 15, 17, 18, 20, 21, 30
array_size: .word 11
key1: .word 7
key2: .word 21

.text
main:

initialization:
la $s0,my_array         #s0 = &array
lw $s1,array_size       #s1 = size

#1st trial:
add $a0,$s0, $0         #a0 = s0 = &array
lw $a1,key1             #a1 = key1 = 7
add $a2,$0,$0           #a2 = 0
add $a3,$s1,$0          #a3 = s1 = size = 11
move $t3,$ra            # call search, return to t3
jal search              #recursive call of search until my_array(mid)=key
move $s2,$t0            #store mid into $s2

#second trial:
lw $a1,key2             #load the second element into $a2
add $a2,$0,$0           #reset the initial low index
add $a3,$s1,$0          #reset the initial high index
jal search
move $s3,$t0            #store mid into $3

j exit

exit:
li $v0,10
syscall

search:

#pre-check:
slt $t0,$a3,$a2           #if hi < lo, error.
bne $t0, $0, error

#find t1 = A[mid]:
add $t0,$a2,$a3         #lo + hi
sra $t0,$t0,1           #t0 = mid = (lo + hi) / 2
sll $t1,$t0,2           #t1 = t0 *4
add $t1,$t1,$a0         # t1 = t1 +base adress
lw $t1,0($t1)           # t1= A[mid]

#comparison:
slt $t3,$a1,$t1         #if key<my_array(mid)
bgtz $t3, greater       #jump to greater
slt $t3,$t1,$a1         #else if my_array(mid)<key
bgtz $t3, less          #jump to less
jr $ra

greater:
add $t5, $0, 1
sub $a3,$t0,$t5            #hi = mid - 1
j search

less:
addi $a2,$t0,1           #low = mid + 1
j search

error:
add $t5, $0, 1
sub $v0, $0, $t5
li $v0,10
syscall
