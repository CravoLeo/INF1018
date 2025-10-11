/*
void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i];
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
    }
  }
}*/

/*Dicionario
i ebx
s r12d
a[] rdx
i2 ecx
*/

.text 
.globl foo
foo:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %rbx,-8(%rbp)
    movq %r12, -16(%rbp)

    movl $0, %ebx
    movl $0, %r12d

    WHILE:
        cmpl %esi, %ebx
        jge FIM

        movq %rdi, %rdx
        movl %ebx, %ecx
        imull $4, %ecx
        movslq %ecx, %rcx
        addq %rcx, %rdx

        addl (%rdx),%r12d
        cmpl $0, (%rdx)
        jne PULA
        movl %r12d, (%rdx)
        movl $0, %r12d

    PULA:
        incl %ebx
        jmp WHILE

    FIM:
        movq -8(%rbp),%rbx
        movq -16(%rbp), %r12
        leave
        ret

