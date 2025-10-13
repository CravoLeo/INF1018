/*
struct X {
  int val;
  struct X *next;
};

int add (struct X *x) {
  int a = 0;
  for (; x != NULL; x = x->next)
    a += x->val;
  return a;
}
*/

/*
Dicionario
a ebx

*/

.text
.globl add
add:
  pushq %rbp
  movq %rsp,%rbp
  subq $16,%rsp
  movq %rbx,-8(%rbp)

  movl $0, %ebx
  WHILE:
    cmpq $0,%rdi
    je FORA_WHILE

    addl (%rdi),%ebx
    movq 8(%rdi),%rdi
    jmp WHILE

  FORA_WHILE:
    movl %ebx,%eax
    movq -8(%rbp),%rbx
    leave
    ret