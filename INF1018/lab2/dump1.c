#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main (void) {
  int i = 100000;
  long int i2=10000;
  short int i3=10000;
  char c1= 'a';
  char c2 = 97;
  char p[] = "7509";
  dump(&i, sizeof(i));
  dump(&i2,sizeof(i2));
  dump(&i3,sizeof(i3));
  dump(&c1,sizeof(c1));
  dump(&c2,sizeof(c2));
  dump(p, sizeof(p));
  return 0;
}