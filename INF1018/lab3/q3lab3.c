#include <stdio.h>


unsigned char switch_byte(unsigned char x){
    return (x << 4)|(x >> 4);
}
/*
unsigned char rotate_left(unsigned char x, int n){
    return (x<<n)|(x>>(8-n));

}*/
unsigned char rotate_left(unsigned char x, int n){
    int i;
    for(i=0;i<n;i++){
        unsigned char primeiroBit= (x & 0x80)? 1 : 0;
        x<<=1;
        x = x | primeiroBit;
    }
    return x;
}

int main(){
    unsigned char exemplo = 0xAB;
    unsigned char resultado = switch_byte(exemplo);
    unsigned char exemplo2 = 0x61;
    unsigned char resultadocirc1= rotate_left(exemplo2,1);
    unsigned char resultadoncirc2= rotate_left(exemplo2,2);
    printf("antes: %02x depois %02x\n",exemplo,resultado);
    printf("primeiro: %02x segundo: %02x terceiro: %02x\n",exemplo2,resultadocirc1,resultadoncirc2);
    return 0;
}