/*
int add2 (struct X *x) {
  if (x == NULL) return 0;
  else return x->val + add2(x->next);
}
*/

/*
Dicionario
x-> val  ebx
*/


.text
.globl add2
add2:
  pushq %rbp
  movq %rsp, %rbp
  subq $16,%rsp
  movq %rbx, -8(%rbp)

  IF:
    cmpq $0, %rdi
    jne ELSE
    movl $0,%eax
    jmp FIM

  ELSE:
    movl (%rdi), %ebx
    movq 8(%rdi), %rdi
    call add2
    addl %ebx, %eax
    
  FIM:
    movq -8(%rbp), %rbx
    leave
    ret
