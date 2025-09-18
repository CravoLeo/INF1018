#include <stdio.h>
#include "BigInt.h"

// imprime BigInt em hexa (MSB → LSB)
void dump_hex_be(BigInt x) {
    for (int i = (NUM_BITS/8) - 1; i >= 0; --i) {
        printf("%02X", x[i]);
    }
    puts("");
}

int main(void) {
    BigInt a, b, c;

    big_val(a, 1L);
    big_val(b, -2L);
    big_val(c, 0L);

    printf("1   = "); dump_hex_be(a);
    printf("-2  = "); dump_hex_be(b);
    printf("0   = "); dump_hex_be(c);

    return 0;
}