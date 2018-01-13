#Proof the Collatz conjecture
#Method:
#I can't really proof it.
#I will just show X_null = 0 to 100 converges 1.
#Therefore, it is reasonable to infer true for X_null > 0.

.data
comma: .asciiz ", "
period: .ascii "."
endl: .ascii "\n"

.text
main:

li  $v0, 5                  #read X_null.
syscall
add $t3, $v0, $0            # $t3 = X_null;
Loop:

add $s0, $t3, $0            # $s0 = $t3.

#cout << $s0;
  li $v0, 1
  add $a0, $s0, $0
  syscall

beq $s0, 1, exit

#cout << comma;
  li $v0, 4
  la $a0, comma
  syscall

check:
beq $s0, 1, exit            #if $s0 = 1, exit.
andi $t0, $s0, 1            # t0 = s0 & (2 - 1)
beq $t0, $0, even            # if mod = 0, divisible by 2.
j odd                        #else odd.

even:
sra $s0, $s0, 1             #s0 = s0 / 2
#cout << $s0;
  li $v0, 1
  add $a0, $s0, $0
  syscall
beq $s0, 1, getout
#cout << comma;
  li $v0, 4
  la $a0, comma
  syscall
getout:
j check


odd:
add $t0, $s0, $0
add $s0, $s0, $t0
add $s0, $s0, $t0
addi $s0, $s0, 1

#cout << $s0;
  li $v0, 1
  add $a0, $s0, $0
  syscall
#cout << comma;
  li $v0, 4
  la $a0, comma
  syscall

j check

exit:
#cout << period:
  li $v0, 4
  la $a0, period
  syscall

add $t4, $0, 1
sub $t3, $t3, $t4
bgtz $t3, Loop

#true exit.
li $v0,10
syscall
