/*
struct X {
  int val1;
  int val2;
};

int f(int i, int v);

void boo (struct X *px, int n, int val) {
  while (n--) {
    px->val2 = f(px->val1, val);
    px++;
  }
}
*/

.text
.globl boo
boo:
  pushq %rbp
  movq %rsp, %rbp


  WHILE:
  cmpl $0, %esi
  je FIM

  movl (%rdi),%rdi
  movl %edx, %esi
  call f 
  movl eax, %4(%rdi)
  addq $8, %rdi


  FIM:
  leave
  ret