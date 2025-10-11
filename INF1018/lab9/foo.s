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
}
*/

/*
    Dicionario:
    %rdi a[]
    %esi n
    %r12d i
    %r13d s
    %r14d i2
*/

.globl foo
foo:
  pushq %rbp
  movq %rsp, %rbp
  subq $32,%rsp
  movq %r12, -8(%rbp)
  movq %r13, -16(%rbp)
  movq %r14, -24(%rbp)

  #int i =0
  movl $0, %r12d
  #int s=0
  movl $0, %r13d

WHILE:
  
  cmpl %esi,%r12d
  jge FORA_WHILE

    movl %r12d, %r14d       # r14d = i
    imull $4, %r14d         # r14d = i * 4
    addq %rdi, %r14
    movl (%r14),%eax  # eax = a[i]
    addl %eax,%r13d #s+=a[i]

    cmpl $0,(%r14)
    jne CONT
    movl %r13d,(%r14)
    movl $0,%r13d

CONT:
  incl %r12d
  jmp WHILE

FORA_WHILE:
movq -24(%rbp),%r14
movq -16(%rbp),%r13
movq -8(%rbp),%r12
leave
ret




