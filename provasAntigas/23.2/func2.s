/*
(2,5 pontos)
struct S
{
int v;
struct S *prox;
};
extern int norma[];
int boo(struct S *s, int n)
{
int acum = 0;
while (s)
{
s->v = acerta(norma, n+acum);
acum += n;
s = s->prox;
}
return acum;
}
*/

/*
Dicionario
acum ebx
r12 s
r13d n
r14 norma
*/
.data
norma: .int 

.text
.globl boo
boo:

    pushq %rbp
    movq %rsp,%rbp
    subq $32,%rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)
    movq %r13, -24(%rbp)

    movl $0, %ebx
    movq %rdi, %r12
    movl %esi, %r13d

    WHILE:
    cmpq $0, %r12
    je FORA_WHILE

    movq $norma, %rdi
    movl %ebx, %esi
    addl %r13d, %esi
    call acerta
    movl %eax,(%r12)
    addl %r13d,%ebx
    movq 8(%r12),%r12
    jmp WHILE

    FORA_WHILE:
    movl %ebx,%eax
    movq -8(%rbp),%rbx
    movq -16(%rbp),%r12
    movq -24(%rbp), %r13
    leave
    ret