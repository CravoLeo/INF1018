/*
int foo(int a)
{
 if (a == 1 || a == 0)
 return a;
 return foo(a-1) + foo(a-2);
}
*/

.text
.globl foo
foo:

    pushq %rbp
    movq %rsp,%rbp
    subq $16, %rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)

    movl %edi,%eax

    cmpl $1,%eax
    jg CASO2
    movq -8(%rbp),%rbx
    movq -16(%rbp),%r12
    leave
    ret

CASO2:
    movl %eax, %ebx
    subl $1,%ebx
    movl %ebx,%edi
    call foo
    movl %eax,%r12d #salva o primeiro call em edx
    subl $1, %ebx 
    movl %ebx, %edi
    call foo
    addl %r12d, %eax #somo o outro call de foo no primeiro
    movq -8(%rbp),%rbx
    movq -16(%rbp),%r12
    leave 
    ret



