#define TAM 5
struct S {
    char c;
    double d;
};

double corta (float f);

int indexa(int qtd);

double boba (float val, double *x, int n) {
    int i;
    struct S reg[TAM];
    while(n) {
        i = indexa(TAM);
        reg[i].c = i;
        reg[i].d = corta(val);
        n--
    }
return reg[0].d;
}

.text
.globl boba
boba:

    pushq %rbp
    movq %rsp,%rbp
    subq $ 112,%rsp
    
    movq %rbx, -8(%rbp)
    movss %xmm0, -16(%rbp)
    movl %esi, -20(%rbp)
    
    leaq -104(%rbp),%rbx
    movl -20(%rbp), %edx
    WHILE:
    cmpl $0,%edx
    je FORA_WHILE

    movl $5, %edi
    call indexa
    movl %eax, %ecx #i
    imull $16, %ecx
    movslq %ecx, %rcx

    movq %rbx, %rdx
    addq %rcx,%rdx

    movb %al, 0(%rdx)
    
    movss -16(%rbp),%xmm0 
    call corta
    movsd %xmm0, 8(%rdx)

    movl -20(%rbp),%edx
    decl %edx
    movl %edx, -20(%rbp)
    jmp WHILE

    FORA_WHILE:
    movsd 8(%rbx), %xmm0
    movq -8(%rbp),%rbx
    leave
    ret

