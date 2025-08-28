#include <ctype.h>
#include <stdio.h>

int string2num (char *s,int base) {
  int a = 0;
  for (; *s; s++)
    if(isdigit(*s)){
        a = a*base + (*s - '0');
    }
    else if(isupper(*s)){
        return -1;
    }
    else{
        a= a*base + (10+(*s-'a'));
    }
  return a;
}

int main (void) {
  printf("==> %d\n", string2num("1234",10));
  printf("==> %d\n", string2num("1234",10) + 1);
  printf("==> %d\n", string2num("1234",10) + string2num("1",10));
  printf("%d\n", string2num("10001", 2));
  printf("%d\n", string2num("777", 10));
  printf("%d\n", string2num("1a", 16));
  printf("%d\n", string2num("a09b", 16));
  printf("%d\n", string2num("z09b", 36));
  printf("%d\n", string2num("Z09b", 36));
  return 0;
}