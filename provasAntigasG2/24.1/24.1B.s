/*
int calcula(float f);
double boba (float val) {
    int i;
    int pos;
    double d[5];
    for (i=0; i<5; i++) {
        pos = calcula(val);
        d[pos] += val;
    }
    return d[0];
}*/

.text
.globl boba

boba:
    pushq %rbp
    movq %rsp,%rbp
    subq $80 , %rsp
    
    movq %r12 , -8(%rbp) #i
    movq %r13 , -16(%rbp) #pos
    movss %xmm0 , -20(%rbp) #val
    movq %r14 ,-28(%rbp) 

    leaq -68(%rbp), %r14
    movl $0, %r12d

    WHILE:
    cmpl $5, %r12d
    jge FORA_WHILE

    movss -20(%rbp),%xmm0
    call calcula
    movl %eax, %r13d
    imull $8, %r13d
    movslq %r13d, %r13

    movq %r14, %rcx

    movss -20(%rbp),%xmm0
    CVTSS2SD %xmm0, %xmm0
    addq %r13, %rcx
    MOVSD (%rcx),%xmm1
    ADDSD %xmm0, %xmm1
    MOVSD %xmm1, (%rcx)

    incl %r12d
    jmp WHILE

    FORA_WHILE:
    movsd (%r14),%xmm0
    movq -8(%rbp),%r12
    movq -16(%rbp),%r13
    movq -28(%rbp),%r14
    leave
    ret
