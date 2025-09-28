/*
int add (int a, int b, int c) {
  return a+b+c;
}
*/

#nao tem .data

.text
.globl add
add:criar o RA da func chamada

#criar o RA da função chamada
    pushq %rbp #salva a base da func chamadora
    movq %rsp,%rbp
    subq $16,%rsp #abre espaço para o RA chamado

#salvar os valores dos registradores callee saved
# return a+b+c
# temp = c  c esta em edx(3o parametro)
    movl %edx,%r13d
#temp+b b esta em esi(2o parametro)
    addl %esi,%r13d
#temp+a a esta em edi(1o parametro)
    addl %edi,%r13d

#return temp
    movl %r13d,%eax

#restaurar o callesaved r13d
    movq -8(%rbp),%r13d
    leave
    ret