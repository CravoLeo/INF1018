/*
long foo(int v[], int n)
{
int i;
long s = 0;
for (i=0; i<n; i++)
{
if (v[i] < 0)
v[i] = 0;

s += (long ) v[i];
}
return s;
}*/

/*
Dicionario
i -> ebx
s -> r12
n -> r13d
v -> r14
*/

.text
.globl foo
foo:

    pushq %rbp
    movq %rsp,%rbp
    subq $32,%rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)
    movq %r13, -24(%rbp)
    movq %r14,-32(%rbp)

    movl $0,%ebx #i
    movq $0,%r12 #s
    movl %esi,%r13d #n
    movq %rdi, %r14 #v

    WHILE:
    cmpl %r13d, %ebx
    jge FORA_WHILE

    movl %ebx,%ecx #i2
    imull $4, %ecx 
    movq %r14, %rax
    addq %rcx, %rax

    movl (%rax),%edx
    cmpl $0, %edx
    jge CONT
    movl $0,(%rax)
    movl $0,%edx

    CONT:
    movslq %edx,%rax
    addq %rax,%r12
    incl %ebx
    jmp WHILE

    FORA_WHILE:
    movq %r12,%rax
    movq -8(%rbp), %rbx
    movq -16(%rbp), %r12
    movq -24(%rbp), %r13
    movq -32(%rbp), %r14
    leave 
    ret



}
}