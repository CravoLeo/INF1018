/*
(b) (3,5 pontos)
int buba(char *v, int n, char c)
{
int i, s = 0;
for (i=0; i<n; i++)
{
if (v[i] <= c)
s += corta(v[i], n);
}
return s;
}
*/

/*
Dicionario
i ebx
s r12d
i2 ecx
v r13
n r14
*/

.text
.globl buba
buba:

    pushq %rbp
    movq %rsp,%rbp
    subq $32, %rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)
    movq %r13, -24(%rbp)
    movq %r14, -32(%rbp)

    movl $0 ,%ebx
    movl $0,%r12d
    movl %esi, %r14d
    movq %rdi, %r13 

    WHILE:
        cmpl %r14d,%ebx
        jge FORA_WHILE

        movslq %ebx,%rcx #i2
        movq %r13, %rax
        addq %rcx, %rax

        movsbl (%rax),%eax
        cmpl %edx,%eax
        jg INC

        movsbl (%rax),%edi
        movl %r14d, %esi
        call corta

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
    leave 
    ret