.data
str1: .asciiz "Enter matrix elements for A: "
str2: .asciiz "Enter matrix elements for B: "
endline: .asciiz "\n"

A: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
B: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
C: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
main:

#input_A:
li $t0, 0                 #$t0 = 0
li $t1, 9                 #$t1 = 9
la $t2, A                 #Load address of A into $t2

loop:
  #do{}
  li $v0, 4
  la $a0, str1
  syscall                #print enter matrix A prompt

  li $v0, 5              #syscall for read int
  syscall                #read int into $v0
  sw $v0, 0($t2)              #store int into $t2

  addi, $t2, $t2, 4      #increment address of $t2
  addi $t0, $t0, 1       # ++$t0
  blt $t0, $t1, loop     #if($t0 < $t1) Branch to loop

#inputB:
li $t0, 0                 #$t0 = 0
li $t1, 9                 #$t1 = 9
la $t2, B                 #Load address of B into $t2

loop2:
  #do{}
  li $v0, 4
  la $a0, str2
  syscall                #print enter matrix B prompt

  li $v0, 5              #syscall for read int
  syscall                #read int into $v0
  sw $v0, 0($t2)              #store int into $t2

  addi, $t2, $t2, 4      #increment address of $t2
  addi $t0, $t0, 1       # ++$t0
  blt $t0, $t1, loop2     #if($t0 < $t1) Branch to loop


#Calculate C[0]
    la $a0, A
    la $a1, B
    la $a2, C

    lw $s0, 0($a0)
    lw $s1, 0($a1)
    multu $s0, $s1
    mflo $t0
    lw $s0, 4($a0)
    lw $s1, 12($a1)
    multu $s0, $s1
    mflo $t1
    lw $s0, 8($a0)
    lw $s1, 24($a1)
    multu $s0, $s1
    mflo $t2

    add $t0, $t0, $t1
    add $t0, $t0, $t2    #t0 = C[0]

    #test:
    li $v0, 1
    #test:
    add $a0, $t0, 0
    #test:
    syscall
    li $v0, 4
    la $a0, endline
    syscall

    sw $t0, 0($a2)

#Calculate C[1]:
  la $a0, A
  la $a1, B
  la $a2, C

  lw $s0, 0($a0)
  lw $s1, 4($a1)
  multu $s0, $s1
  mflo $t0
  lw $s0, 4($a0)
  lw $s1, 16($a1)
  multu $s0, $s1
  mflo $t1
  lw $s0, 8($a0)
  lw $s1, 28($a1)
  multu $s0, $s1
  mflo $t2

  add $t0, $t0, $t1
  add $t0, $t0, $t2    #t0 = C[0]

  #test:
  li $v0, 1
  #test:
  add $a0, $t0, 0
  #test:
  syscall
  li $v0, 4
  la $a0, endline
  syscall

  sw $t0, 4($a2)

#Calculate C[2]:

la $a0, A
la $a1, B
la $a2, C

lw $s0, 0($a0)
lw $s1, 8($a1)
multu $s0, $s1
mflo $t0
lw $s0, 4($a0)
lw $s1, 20($a1)
multu $s0, $s1
mflo $t1
lw $s0, 8($a0)
lw $s1, 32($a1)
multu $s0, $s1
mflo $t2

add $t0, $t0, $t1
add $t0, $t0, $t2    #t0 = C[2]

#test:
li $v0, 1
#test:
add $a0, $t0, 0
#test:
syscall
li $v0, 4
la $a0, endline
syscall

sw $t0, 8($a2)

#Calculate C[3]:

la $a0, A
la $a1, B
la $a2, C

lw $s0, 12($a0)
lw $s1, 0($a1)
multu $s0, $s1
mflo $t0
lw $s0, 16($a0)
lw $s1, 12($a1)
multu $s0, $s1
mflo $t1
lw $s0, 20($a0)
lw $s1, 24($a1)
multu $s0, $s1
mflo $t2

add $t0, $t0, $t1
add $t0, $t0, $t2    #t0 = C[2]

#test:
li $v0, 1
#test:
add $a0, $t0, 0
#test:
syscall
li $v0, 4
la $a0, endline
syscall

sw $t0, 12($a2)

#Calculate C[4]:

la $a0, A
la $a1, B
la $a2, C

lw $s0, 12($a0)
lw $s1, 4($a1)
multu $s0, $s1
mflo $t0
lw $s0, 16($a0)
lw $s1, 16($a1)
multu $s0, $s1
mflo $t1
lw $s0, 20($a0)
lw $s1, 28($a1)
multu $s0, $s1
mflo $t2

add $t0, $t0, $t1
add $t0, $t0, $t2    #t0 = C[4]

#test:
li $v0, 1
#test:
add $a0, $t0, 0
#test:
syscall
li $v0, 4
la $a0, endline
syscall

sw $t0, 16($a2)

#Calculate C[5]:

la $a0, A
la $a1, B
la $a2, C

lw $s0, 12($a0)
lw $s1, 8($a1)
multu $s0, $s1
mflo $t0
lw $s0, 16($a0)
lw $s1, 20($a1)
multu $s0, $s1
mflo $t1
lw $s0, 20($a0)
lw $s1, 32($a1)
multu $s0, $s1
mflo $t2

add $t0, $t0, $t1
add $t0, $t0, $t2    #t0 = C[2]

#test:
li $v0, 1
#test:
add $a0, $t0, 0
#test:
syscall
li $v0, 4
la $a0, endline
syscall
sw $t0, 20($a2)

#Calculate C[6]:

  la $a0, A
  la $a1, B
  la $a2, C

  lw $s0, 24($a0)
  lw $s1, 0($a1)
  multu $s0, $s1
  mflo $t0
  lw $s0, 28($a0)
  lw $s1, 12($a1)
  multu $s0, $s1
  mflo $t1
  lw $s0, 32($a0)
  lw $s1, 24($a1)
  multu $s0, $s1
  mflo $t2

  add $t0, $t0, $t1
  add $t0, $t0, $t2    #t0 = C[6]

  #test:
  li $v0, 1
  #test:
  add $a0, $t0, 0
  #test:
  syscall
  li $v0, 4
  la $a0, endline
  syscall
  sw $t0, 24($a2)

#Calculate C[7]:
  la $a0, A
  la $a1, B
  la $a2, C

  lw $s0, 24($a0)
  lw $s1, 4($a1)
  multu $s0, $s1
  mflo $t0
  lw $s0, 28($a0)
  lw $s1, 16($a1)
  multu $s0, $s1
  mflo $t1
  lw $s0, 32($a0)
  lw $s1, 28($a1)
  multu $s0, $s1
  mflo $t2

  add $t0, $t0, $t1
  add $t0, $t0, $t2    #t0 = C[7]

  #test:
  li $v0, 1
  #test:
  add $a0, $t0, 0
  #test:
  syscall
  li $v0, 4
  la $a0, endline
  syscall

  sw $t0, 28($a2)

#Calculate C[8]:

  la $a0, A
  la $a1, B
  la $a2, C

  lw $s0, 24($a0)
  lw $s1, 8($a1)
  multu $s0, $s1
  mflo $t0
  lw $s0, 28($a0)
  lw $s1, 20($a1)
  multu $s0, $s1
  mflo $t1
  lw $s0, 32($a0)
  lw $s1, 32($a1)
  multu $s0, $s1
  mflo $t2

  add $t0, $t0, $t1
  add $t0, $t0, $t2    #t0 = C[8]

  #test:
  li $v0, 1
  #test:
  add $a0, $t0, 0
  #test:
  syscall
  li $v0, 4
  la $a0, endline
  syscall
  sw $t0, 32($a2)


exit:
  li $v0, 10
  syscall
