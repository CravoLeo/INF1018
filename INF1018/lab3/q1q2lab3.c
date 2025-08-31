#include <stdio.h>

int odd_ones(unsigned int x){
  int contador = 0;
  while(x>0){
    contador+= x&1;
    x>>=1;
  }
  return (contador&1);
}


int main(void) {
  unsigned int x = 0x87654321;
  //1000 0111 0110 0101 0010 0011 0010 0001
  //0000 0000 0000 0000 0000 0000 1111 1111
  //1111 1111 0000 0000 0000 0000 0000 0000
  unsigned int y, z;

  /* o byte menos significativo de x e os outros bits em 0 */
  y = x & 0xFF;

  /* o byte mais significativo com todos os bits em '1' 
     e os outros bytes com o mesmo valor dos bytes de x */
  z = x | 0xFF000000;

  printf("%08x %08x\n", y, z);
  printf("%x tem numero %s de bits\n",0x01010101,odd_ones(0x01010101) ? "impar":"par");
  printf("%x tem numero %s de bits\n",0x01030101,odd_ones(0x01030101) ? "impar":"par");
}