/*
int corta(char c1, int b)
{
return c1 + b;
}
*/

.text
.globl corta
corta:

    pushq %rbp
    movq %rsp, %rbp
    
    movsbl %dil,%edi
    movl $0, %eax
    addl %edi, %eax
    addl %esi, %eax
    leave
    ret

    



