/*
struct S
{
 char a;
 int b;
 struct S *p;
};
long boo (struct S s[], int n)
{
 int i;
 long acc = 0;

 for (i = 0; i < n; i++)
 {
    s[i].a = i;
    acc += s[i].b;

     if (i!=0)
        s[i].p = &s[i-1];
    else
         s[i].p = 0;
 }

 return acc;
}*/

/*
DICIONARIO
i-> ebx
acc -> r12d
*/

.text
.globl boo
boo:

    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)
    movq %r13, -24(%rbp)
    movq %r14, -32(%rbp)

    movl $0, %ebx #i
    movq $0, %r12 #acc 
    movl %esi, %r13d
    movq %rdi, %r14

    WHILE:
    cmpl %r13d, %ebx
    jge FORA_WHILE

    movl %ebx, %ecx
    imull $16,%ecx
    movq %r14, %rax
    addq %rcx, %rax #posiciona &s[i]
 
    movb %bl, (%rax)
    movl 4(%rax), %edx
    movslq %edx, %rcx
    addq %rcx,%r12

    cmpl $0,%ebx
    je ELSE
    movl %ebx,%ecx
    subl $1, %ecx
    imull $16, %ecx
    movq %r14, %rdx
    addq %rcx, %rdx #&s[i-1]
    movq %rdx, 8(%rax)
    jmp CONTINUA

    ELSE:
    movq $0, 8(%rax)

    CONTINUA:
    incl %ebx
    jmp WHILE

    FORA_WHILE:
    movq %r12,%rax
    movq -8(%rbp),%rbx
    movq -16(%rbp),%r12
    movq -24(%rbp),%r13
    movq -32(%rbp),%r14
    leave
    ret


