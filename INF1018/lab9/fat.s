/*
int fat (int n) {
  if (n==0) return 1;
  else return n*fat(n-1);
}*/
/*Dicionario:
reg variável
edi   n
*/


#sem .data
#int fat(int n)
.globl fat
fat:   
    pushq %rbp #salva a base do RA da func chamadora
    movq %rsp,%rbp #cria a base do RA para a func chamadora
    subq $16, %rsp #abre espaço para o RA da func da chamada

    #TO DO: salvar registradores calleesaved usados na func chamada
    movq %r15,-8(%rbp)
#if n==0
    cmpl $0 %edi
    jne ELSE

#return 1
    movl $1,%eax
    jmp RETORNA

#else
ELSE:
#return n*fat(n-1)
    /*
    temp = n
    temp = temp-1
    result = fat(temp)
    result = result * n
    return result
    */
    movl %edi,%r15d # temp =n callee saved
    #temp = temp -1    
    decl %r15d
    #result = fat(temp)
    #salvar registradores caller saved antes de chamar a função
    movl %edi, -12(%rbp)

    #chamar a função
    #parametro
    movl %r15d, %edi
    call fat

    #restaurar os registradores caller saved salvos
    movl -12(%rbp),%edi

    #result = result * n em eax está o valor retornado
    imull %edi,%eax

    #return result
    #mover o valor de result para eax
    #mas ja está em eax
RETORNA:
    #restaurar os calle saved
    movq -8(%rbp),%r15
    #destruir o RA
    leave
    
    #retornar
    ret

