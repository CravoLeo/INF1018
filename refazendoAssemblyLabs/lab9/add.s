/*
int add (int a, int b, int c) {
  return a+b+c;
}*/

/*
Dicionario
*/

.text
.globl add
add:

    pushq %rbp
    movq %rsp,%rbp

    movl %edi,%ecx
    addl %esi,%ecx
    addl %edx, %ecx
    movl %ecx,%eax

    leave
    ret
