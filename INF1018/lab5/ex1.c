#include <stdio.h>



void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main (void) {
  int i,j;
  short a[2][3];
  int b[2];

  for (i=0;i<2;i++) {
    b[i] = i;
    for (j=0;j<3;j++)
      a[i][j] = 3*i+j;
  }

  struct X {
  int a;
  short b;
  int c;
} x = {0xa1a2a3a4, 0xb1b2, 0xc1c2c3c4};

struct X1 {
  char c1;
  int i;
  char c2;
} x1= {0xa1,0xb1b2b3b4,0xc1};

struct X2 {
  long l;
  char c;
}x2={0xa1a2a3a4a5a6a7a8L,0xb1};

struct X3 {
  int i;
  char c1;
  char c2;
}x3={0xa1a2a3a4,0xb1,0xc1};

struct X4 {
  struct X2 x;
  char c;
}x4={{0xa1a2a3a4a5a6a7a8L, 0xb1},0xb1};

struct X5 {
  char c1;
  char c2;
  char c3;
}x5={0xa1,0xb1,0xc1};

struct X6 {
  short s1;
  int i;
  char c[3];
  short s2;
}x6={0xa1a2, 0xb1b2b3b4, {0xc1, 0xc2, 0xc3}, 0xd1d2};

union U1 {
  int i;
  char c[5];
}u1={0xa1a2a3a4};

union U2 {
  short s;
  char c[5];
}u2={0xa1a2};

  printf ("b: \n");
  dump (b, sizeof(b));
  printf ("a: \n");
  dump (a, sizeof(a));
  printf("x: \n");
  dump(&x,sizeof(x));
  printf("x1:\n");
  dump(&x1,sizeof(x1));
  printf("x2:\n");
  dump(&x2,sizeof(x2));
  printf("x3:\n");
  dump(&x3,sizeof(x3));
  printf("x4:\n");
  dump(&x4,sizeof(x4));
  printf("x5:\n");
  dump(&x5,sizeof(x5));
  printf("x6:\n");
  dump(&x6,sizeof(x6));
  printf("u1:\n");
  dump(&u1,sizeof(u1));
  printf("u2:\n");
  dump(&u2,sizeof(u2));

  return 0;
}