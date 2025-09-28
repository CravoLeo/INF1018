/*
dicionario:
%r12 = nums = p
%ebx = i

*/
 .data
  nums: .int 3, -5, 7, 8, -2
  s1:   .string "%d\n"

  .text
  .globl main
  main:
  /* prologo */
     pushq %rbp
     movq  %rsp, %rbp
     subq  $16, %rsp
     movq  %rbx, -8(%rbp)
     movq  %r12, -16(%rbp)

  /* coloque seu codigo aqui */
    #int i
    #int *p = nums
    #int* p
    movq $nums, %r12
    movl $0,%ebx
#for( i=0;i<5;i++){
# i=0
WHILE:
    cmpl $5, %ebx
    jge FORA_WHILE

#printf("%d\n",filtro(*p,LIM)) <-- quebra em args menores
    # temp = filtro(*p,LIM)
    movl (%r12), %edi #1o arg
    movl $1, %esi #2o arg
    call filtro 

    # printf("%d\n",temp)
    movq $s1, %rdi
    movl %eax, %esi #o retorno da função está em eax
    movl $0, %eax # obrigatorio para print
    call printf

    #p++
    addq $4, %r12
    #i++
    incl %ebx
    jmp WHILE

FORA_WHILE:
    #return 0
    movl $0,%eax

  /* finalizacao */
     movq -8(%rbp), %rbx
     movq -16(%rbp), %r12
     leave
     ret