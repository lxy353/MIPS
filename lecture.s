.date
Prompt1: .asciiz"please enter integer 1\n"
Prompt2: .asciiz"please enter integer 2\n"
Result:.asciiz"the result is\n"

.text
main:
# prompt user for integer1
la $a0,prompt1                #print string
li $v0,4
sycall

# read integer1
li $v0,5
syscall

# move integer into another register
move $s1,$v0

# prompt the user for integer2
la $a0, Prompt2
li $v0, 4
syscall

#get integer2
li $v0,5                   #read int2
syscall

move $2,$v0               #move int2 into$s2

#computer integer1 + 8*integer2
sll $t1,$s2,3
add $t0,$s1,$t1

#display a result message
la $a0,Result
li $v0,4
syscall

#print the result value
move $a0,$t2
li $v0,1
syscall

#exit
li $v0,10
syscall
