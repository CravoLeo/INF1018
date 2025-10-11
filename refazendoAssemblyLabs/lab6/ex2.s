/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  for (i = 0, p = nums; i != 4; i++, p++)
    if ((*p % 2) == 0)
      printf("%d\n", *p);
  return 0;
}
*/

/*
DICIONARIO

*/

.data
nums: .int 10,-21,-30,45
s1: .string "%d\n"

.text 
.globl main
main:

  pushq %rbp
  movq %rsp,%rbp
  subq $16,%rsp
  movq %rbx, -8(%rbp)
  movq %r12, -16(%rbp)

  movl $0, %ebx
  movq $nums, %r12

  WHILE:
  cmpl $4, %ebx
  je FORA_WHILE
    movl (%r12),%edx
    andl $1,%edx
    cmpl $0,%edx
    jne SKIP_PRINT

    movq $s1, %rdi
    movl (%r12d), %esi
    movl $0,%eax
    call printf    

SKIP_PRINT:
  incl %ebx
  addq $4, %r12
  jmp WHILE

  FORA_WHILE:
    movl $0, %eax
    movq -8(%rbp),%rbx
    movq -16(%rbp),%r12
    leave 
    ret

  