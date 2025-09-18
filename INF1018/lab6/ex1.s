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

#Seguimento de dados(inicializados)
.data
nums:  .int  10, -21, -30, 45
Sf:  .string "%d\n"    # string de formato para printf
/*
ebx = i
nums = r12
ecx= soma
*/
#Seguimento de texto(instruções)
.text
#definição de um simbolo global
.globl  main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)
/********************************************************/

  movl  $0, %ebx  /* ebx = 0; ebx como variável i*/
  movq  $nums, %r12  /* r12 = &nums r12 é variável p*/
  movl $0, %ecx 

L1:
  cmpl  $4, %ebx  /* if (ebx == 4) ? */
  je  L2          /* goto L2 */

  addl  (%r12), %ecx /* ecx+=nums ;sum+=p*/
  addl  $1, %ebx  /* ebx += 1; i++*/
  addq  $4, %r12  /* r12 += 4; p++*/
  jmp  L1         /* goto L1; */

L2:  
  movl %ecx,%eax 
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/