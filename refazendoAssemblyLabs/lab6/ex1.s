/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  int sum = 0;
  for (i = 0, p = nums; i != 4; i++, p++)
    sum += *p;
  printf("%d\n", sum);
  return 0;
}
*/

/*
dicionario:
i ebx
nums r12
sum ecx
*/

.data 
nums: .int 10,-21,-30,45
s1: .string "%d\n" 

.text
.globl main
main:

    pushq %rbp 
    movq %rsp, %rbp
    subq $16,%rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)


    movl $0, %ebx
    movq $nums, %r12
    movl $0, %ecx

    WHILE:
        cmpl $4, %ebx
        je FORA_WHILE
        addl (%r12),%ecx
        incl %ebx
        addq $4, %r12

        jmp WHILE
    
    FORA_WHILE:
    movq $s1,%rdi
    movl %ecx,%esi
    movl $0, %eax
    call printf

    movl $0, %eax
    movq -8(%rbp),%rbx
    movq -16(%rbp),%r12
    leave
    ret

