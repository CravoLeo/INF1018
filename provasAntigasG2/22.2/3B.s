/*
#define TAM 5
struct S { short s; float f; };
double foo (struct S st[], float lim) {
    int i;
    double acc = 0.0;
    for (i=0; i<TAM; i++) {
        st[i].s = i;
        acc += boba(st[i].f, lim);
    }
    return acc;
}
*/

.text
.globl foo
foo:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp             # frame de 32 bytes, alinhado

    # salvar callee-saved
    movq  %r12, -8(%rbp)

    # salvar argumentos
    movq  %rdi, -16(%rbp)       # st
    movss %xmm0, -20(%rbp)      # lim (float)

    # double acc = 0.0;
    movl $0, %eax
    cvtsi2sd %eax, %xmm0        # xmm0 = 0.0 (double)
    movsd %xmm0, -32(%rbp)      # acc em -32(%rbp)

    # i = 0;
    movl  $0, %r12d

WHILE:
    cmpl  $5, %r12d
    jge   FORA_WHILE

    # calcular &st[i]
    movl  %r12d, %ecx           # i
    imull $8, %ecx              # i * sizeof(struct S)
    movslq %ecx, %rcx
    movq  -16(%rbp), %rdx       # base de st
    addq  %rcx, %rdx            # rdx = &st[i]

    # st[i].s = i;
    movw  %r12w, (%rdx)

    # boba(st[i].f, lim)
    movss 4(%rdx), %xmm0        # st[i].f
    movss -20(%rbp), %xmm1      # lim
    call  boba                  # float em xmm0

    # acc += (double)boba(...)
    cvtss2sd %xmm0, %xmm0       # double retorno
    movsd -32(%rbp), %xmm1      # xmm1 = acc
    addsd %xmm0, %xmm1          # xmm1 += retorno
    movsd %xmm1, -32(%rbp)      # acc = xmm1

    incl  %r12d
    jmp   WHILE

FORA_WHILE:
    movsd -32(%rbp), %xmm0      # return acc

    movq  -8(%rbp), %r12        # restaura r12
    leave
    ret
