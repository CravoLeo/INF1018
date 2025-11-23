struct exam { float val; int tipo; };

double inv (double val);

float boo (double d, float bias) {
    int i;
    struct exam temp[5];
    for (i=0; i<5; i++) {
        temp[i].val = inv(d);
        temp[i].tipo = i;
    }
    return temp[0].val + bias;
    }

.text
.globl boo
boo:

    pushq %rbp
    movq %rsp,%rbp
    subq $80, %rsp
    movq %r12, -8(%rbp)
    movq %r13,-16(%rbp)

    movsd %xmm0,-24(%rbp) #d
    movss %xmm1,-28(%rbp) #bias

    leaq -68(%rbp),%r13 #base da struct temp[0]

    movl $0, %r12d

    WHILE:
    cmpl $5, %r12d
    jge FORA_WHILE

    movl %r12d, %ecx //i2

    movsd -24(%rbp),%xmm0 
    call inv #ja esta no xmm0 e vai sair no xmm0
    CVTSD2SS %xmm0 , %xmm0 // converte para float 
    
    //calculando a posiçao de temp[i]
    imull $8, %ecx
    movslq %ecx,%rdx

    movq %r13, %rcx
    addq %rdx ,%rcx
    movss %xmm0, 0(%rcx)
    movl %ecx, 4(%rcx)    

    incl %r12d
    jmp WHILE

    FORA_WHILE:
    MOVSS (%r13),%xmm0
    MOVSS -28(%rbp),%xmm1
    ADDSS %xmm1, %xmm0
    movq -8(%rbp),%r12
    movq -16(%rbp),%r13
    leave 
    ret