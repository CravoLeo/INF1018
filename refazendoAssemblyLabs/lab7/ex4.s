/*
int nums[4] = {65, -105, 111, 34};

int main (void) {
  int i;
  int s = 0;

  for (i=0;i<4;i++)
    s = s+nums[i];

  printf ("soma = %d\n", s);

  return 0;
}
*/

/*
Dicionario
i ebx
s r12d
nums r13
i2 ecx
*/

.data 
nums: .int 65, -105, 111 ,34
S1: .string "soma = %d\n"

.text
.globl main
main:
  pushq %rbp
  movq %rsp,%rbp
  subq $32, %rsp
  movq %rbx, -8(%rbp)
  movq %r12, -16(%rbp)
  movq %r13, -24(%rbp)


  movl $0, %ebx
  movl $0, %r12d
  movq $nums, %r13

  WHILE:
    cmpl $4,%ebx
    jge FORA_WHILE

    movl %ebx,%ecx
    imull $4,%ecx
    movq %r13,%r10
    addq %rcx,%r10
    addl (%r10),%r12d

    incl %ebx
    jmp WHILE

  FORA_WHILE:
    movq $S1,%rdi
    movl %r12d, %esi
    movl $0,%eax
    call printf

    movl $0, %eax
    movq -8(%rbp),%rbx
    movq -16(%rbp),%r12
    movq -24(%rbp),%r13
    leave
    ret