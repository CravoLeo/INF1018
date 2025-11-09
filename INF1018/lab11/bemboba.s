.globl bemboba
bemboba:

    pushq %rbp
    movq %rsp,%rbp
    subq $32, %rsp

    # -32 .. -17 : local[4] (16 bytes, 4 ints)
    # -16 .. -13 : i        (4 bytes)
    # -12 ..  -9 : padding  (4 bytes)
    #  -8 ..  -1 : a        (8 bytes)


    movl  $0, -16(%rbp)
    leaq -32(%rbp),%rax
    movq %rax, -8(%rbp)

WHILE:  
    cmpl $4,-16(%rbp)
    jge FORA_WHILE

    movq -8(%rbp), %rax
    movl %edi, (%rax)
    
    addq $4, %rax;
    movq %rax, -8(%rbp)
    addl $1, -16(%rbp)
    jmp WHILE

FORA_WHILE:
    leaq -32(%rbp),%rdi
    movl $4,%esi
    call addl
    leave
    ret