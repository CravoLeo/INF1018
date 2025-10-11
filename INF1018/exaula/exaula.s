/*
    struct S{
        int a;
        int *p;
        int b;
    }

int buba(struct S *p,int n){
    int soma=0;
    for(i=0;i<n;i++){
        printf("%d",p[i].b);
        if(p[i].p!=NULL)soma+=p[i].a;
    }
    return soma;
}
*/
/*
Dicionario:

*/

.data
s1: .string "%d\n"

.text
.globl buba
buba:

    pushq %rbp
    movq %rbp,%rsp
    subq $32,%rsp

    movl $0,%r12d
    movl $0, %r13d

    WHILE:
    compl %esi,%r13d
    jge FORA_WHILE


    movl %r13d,%r14d
    imull $16, %r14d
    subq %r14d, %rdi
    movq %rdi, %r15

    #argumentos printf
    movq $s1,%rdi
    movq %r15, %rsi
    movq %rax, %rsi
    movl $0, %eax
    call printf

    IF:
        movl %r13d,%r14d
        imull $8, %r14d
        movq %rdx,%rdi
        subq %r14d,%rdx
        cmpq $0, %rdx 
    je WHILE:
        movl %r13d,%r14d
        movq %
        ad

    
    FORA_WHILE:
