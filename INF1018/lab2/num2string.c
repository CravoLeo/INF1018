#include <stdio.h>

void num2string(char *s, int num, int base){
    if(base<2||base>36){
        s[0]='\0';
        return ;
    }
    if(num==0){
        s[0]='0';
        s[1]='\0';
        return;
    }
    char digits[]="0123456789abcdefghijklmnopqrstuvwxyz";
    char buffer[65];
    int i=0;
    while(num>0){
        buffer[i++]=digits[num%base];
        num/=base;
    }

    int j=0;
    while(i>0){
        s[j++]=buffer[--i];
    }
    s[j]='\0';
}

int main(){
    char string[100];
    num2string(string, 26, 16);
    printf("26 em base 16 = %s\n", string);

    num2string(string, 255, 2);
    printf("255 em base 2 = %s\n", string);

    num2string(string, 1234, 10);
    printf("1234 em base 10 = %s\n", string);

    return 0;
}