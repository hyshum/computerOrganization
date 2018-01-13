#Compute the nth fibonacci number

# C code
# int fib(int n){
#    if (n==0) return 0;
#    else if (n==1) return 1;
#    else return fib(n-1) + fib(n-2);}

.text
main:

#load the input n into $t2
lw $t2,var1

# Call function to get fibonnacci #n
move $a0,$t2
move $v0,$t2
jal fib     #call fib (n)
move $t3,$v0    #result is in $t3

# Output message and n
# Loads the string "F_" into a0.
# Service 4 in $v0 is to print a null-terminated string
# Read into the available services, which $v0 provides

la $a0,result   #Print F_
li $v0,4  #Ronnie: print ASCII
syscall

#TODO
#Load the input num into a0, and print it on the console
move $a0, $t2
li $v0, 1 #Ronnie :Print value
syscall

#TODO
#Load "=" into a0, and print it on the cosole
la $a0,equal
li $v0, 4
syscall


#TODO
#Load the answer into a0, and print it on the console
move $a0, $t3
li $v0, 1
syscall


#TODO
#Terminate execution
li $v0, 10
syscall


fib:
# Compute and return fibonacci number
beqz $a0,zero   #if n=0 return 0
beq $a0,1,one   #if n=1 return 1

#Calling fib(n-1)
sub $sp,$sp,4   #storing return address on stack
sw $ra,0($sp)

sub $a0,$a0,1   #n-1
jal fib     #fib(n-1)
add $a0,$a0,1

lw $ra,0($sp)   #restoring return address from stack
add $sp,$sp,4


sub $sp,$sp,4   #Push return value to stack
sw $v0,0($sp)


#TODO
#Call fib(n-2) and restore the return address from stack
sub $sp, $sp 4
sw $ra, 0($sp)

sub $a0, $a0, 2 #n-2
jal fib         #fib(n-2)
add $a0,$a0,2

lw $ra, 0($sp)
add $sp, $sp, 4


lw $s7,0($sp)   #Pop return value from stack
add $sp,$sp,4

add $v0,$v0,$s7 # f(n - 2)+fib(n-1)
jr $ra # decrement/next in stack

zero:
li $v0,0
jr $ra
one:
li $v0,1
jr $ra

.data
result: .asciiz "F_"
var1: .word 12
endl: .asciiz "\n"
equal: .asciiz "="
