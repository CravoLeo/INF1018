/*
int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}
*/

.data 
s1: .string "%d"
s2: .string "numero: "

.text 
.globl novonum
novonum:

    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    movq $s2,%rdi
    movl $0, %eax
    call printf

    movq $s1,%rdi
    leaq -4(%rbp),%rsi
    call scanf

    movl -4(%rbp), %eax
    leave 
    ret
