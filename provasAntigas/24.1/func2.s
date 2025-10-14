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
.text
.globl buba
buba:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $40, %rsp
    movq  %rbx, -8(%rbp)
    movq  %r12, -16(%rbp)
    movq  %r13, -24(%rbp)
    movq  %r14, -32(%rbp)
    movq  %r15, -40(%rbp)

    movl  $0, %ebx         # i = 0
    movl  $0, %r12d        # s = 0
    movl  %esi, %r13d      # n
    movq  %rdi, %r14       # v
    movb  %dl,  %r15b      # c

WHILE:
    cmpl  %r13d, %ebx      # i >= n ?
    jge   FORA_WHILE

    movslq %ebx, %rcx      # rcx = (long)i
    movq   %r14, %rax      # rax = v
    addq   %rcx, %rax      # rax = &v[i]

    cmpb  %r15b, (%rax)    # v[i] > c ?
    jg    CONT             # se sim, pula

    movzbl (%rax), %edi    # arg1: v[i] (zero/sign tanto faz; corta trata)
    movl   %r13d, %esi     # arg2: n
    call   corta
    addl   %eax, %r12d     # s += retorno

CONT:
    incl  %ebx             # i++
    jmp   WHILE

FORA_WHILE:
    movl  %r12d, %eax      # return s

    movq  -8(%rbp), %rbx
    movq  -16(%rbp), %r12
    movq  -24(%rbp), %r13
    movq  -32(%rbp), %r14
    movq  -40(%rbp), %r15
    leave
    ret