/*
char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};
int main (void) {
  char *pc = S2;
  while (*pc)
    if(*pc != 123 or *pc !=125){
      printf ("%c", *pc++);
    }
  printf("\n");
  return 0;
}
*/

.data
S2:    .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf:  .string "%c"    /* primeira string de formato para printf */
Sf2: .string "\n"    /* segunda string de formato para printf */

.text
.globl  main
main:

    pushq %rbp
    movq %rsp,%rbp
    subq $16,%rsp
    movq %rbx, -8(%rbp)


    movq $S2, %rbx

    WHILE:
        cmpb $0, (%rbx)
        je FORA_WHILE
            cmpb $123, (%rbx)
            je PULAPRINT
            cmpb $125, (%rbx)
            je PULAPRINT
            movq $Sf, %rdi
            movsbl (%rbx), %esi
            movl $0, %eax
            call printf
    PULAPRINT:
        incq %rbx
        jmp WHILE

    FORA_WHILE:
    movq $Sf2,%rdi
    movl $0, %eax
    call printf

    movl $0, %eax
    movq -8(%rbp),%rbx
    leave
    ret