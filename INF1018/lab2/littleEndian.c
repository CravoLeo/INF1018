#include <stdio.h>

int is_little(){
    int x = 1;
    char* p= (char*)&x;
    return (*p == 1);
}

int main(){
    if(is_little()){
        printf("é little endian");
    }
    else{
        printf("não é little endian");
    }
    return 0;
}