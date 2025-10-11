/*
int fat (int n) {
  if (n==0) return 1;
  else return n*fat(n-1);
}
*/
/*
Dicionario
n r12d
*/
.globl fat
fat:
    
    pushq %rbp
    movq %rsp,%rbp
    subq $16,%rsp
    movq %r12, -8(%rbp)

#n==0
    cmpl $0,%edi
    jne ELSE

    IF:
        movl $1, %eax
        jmp FIM
    ELSE:
        movl %edi,%r12d
        subl $1, %edi
        call fat
        imull %r12d, %eax

    FIM:
        movq -8(%rbp),%r12
        leave
        ret

