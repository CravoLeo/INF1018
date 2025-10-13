 /*
 (2,5 pontos)
int acerta (int u[], int i)
{
return u[i];
}
*/

.text
.globl acerta
acerta:
    pushq %rbp
    movq %rsp, %rbp

    imull $4,%esi 
    movslq %esi,%rax
    addq %rdi, %rax
    movl (%rax),%eax
    leave
    ret