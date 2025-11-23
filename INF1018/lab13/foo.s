/*
intfoo(int x){
    return x+1;
}
*/

.text
.globl foo
foo:
    pushq %rbp
    movq %rbp, %rsp

    movl %edi, %eax
    incl %eax

    leave 
    ret
