/*
void foo (double *vd, int n) {
    while (n--) {
        *vd = 0.0;
        vd++;
    }
}*/

.text
.globl foo
foo:

    pushq %rbp
    movq %rsp,%rbp

    movl $0,%eax
    CVTSI2SD %eax,%xmm0
    LOOP:
    cmpl $0,%esi
    je FORA_LOOP

    movsd %xmm0, (%rdi)
    addq $8, %rdi


    decl %esi
    jmp LOOP

    FORA_LOOP:
    leave
    ret
