/*
(a) int gera(char c1, char c2);
int foo(int n, char c, char *v)
{
    int i, s = 0;
    for (i=0; i<n; i++)
    {
        if (v[i] >= c)
        s += gera(v[i], c);
    }
    return s;
}
*/

/*
Dicionario
ebx i
r12d s
r13d n
r14b c
r15 v
*/

.text
.globl foo
foo:

    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp
    movq %rbx,-8(%rbp)
    movq %r12,-16(%rbp)
    movq %r13,-24(%rbp)
    movq %r14,-32(%rbp)
    movq %r15, -40(%rbp)

    movl $0, %ebx
    movl $0, %r12d
    movl %edi, %r13d
    movb %sil, %r14b
    movq %rdx, %r15

    WHILE:

    cmpl %r13d, %ebx
    jge FORA_WHILE


    movslq %ebx,%rax #i2 extendido
    movq %r15,%rcx 
    addq %rax, %rcx
    movsbl (%rcx), %edi
    movsbl %r14b, %esi
    cmpl %esi,%edi
    jl INC
    call gera
    addl %eax, %r12d

    INC:
    incl %ebx
    jmp WHILE

    FORA_WHILE:
    movl %r12d, %eax
    movq -8(%rbp), %rbx
    movq -16(%rbp), %r12
    movq -24(%rbp), %r13
    movq -32(%rbp), %r14
    movq -40(%rbp), %r15

    leave
    ret