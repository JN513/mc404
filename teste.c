#include <stdio.h>
#include <string.h>

int stroct_to_int(char *s, int len) {
    int val = 0;
    for (int i = 2; i < len; i++) {
        int byte = (int)s[i];

        byte = byte - '0';

        val = (val << 3) | (byte & 0x7);
    }
    return val;
}

int strhex_to_int(char *s, int len) {
    int val = 0;
    for (int i = 2; i < len; i++) {
        int byte = (int)s[i];
        if (byte >= '0' && byte <= '9')
            byte = byte - '0';
        else if (byte >= 'a' && byte <= 'f')
            byte = byte - 'a' + 10;
        else if (byte >= 'A' && byte <= 'F')
            byte = byte - 'A' + 10;

        val = (val << 4) | (byte & 0xF);
    }
    return val;
}

int strbin_to_int(char *s, int len) {
    int val = 0;

    printf("len: %d \n", len);

    for (int i = 2; i < len; i++) {
        int byte = (int)s[i];

        byte = byte - '0';

        val = (val << 1) | (byte & 0x1);
    }

    return val;
}

int strdec_to_int(char *s, int len, int neg) {
    int r = 0;
    int mod = 1;

    for (int i = len - 1; i >= 0 + neg; i--) {
        r += (s[i] - '0') * (mod);
        mod *= 10;
    }

    return r;
}

void int_to_bin(char *s, int n) {
    for (int j = 33; j > 1; j--) {
        s[j] = (n & 0x00000001) + '0';
        n = n >> 1;
    }

    s[34] = '\0';
    s[0] = '0';
    s[1] = 'b';

    printf("s: %s\n", s);
}

void int_to_hex(char *s, int n) {
    unsigned int i = 0, k = 0;
    char c;

    for (int j = 2; j <= 9; j++) {
        i = (n & 0xF0000000);

        i = i >> 28;
        n = n << 4;

        if (i == 0 && k == 0)
            continue;

        k++;

        if (i < 10)
            c = i + '0';
        else
            c = i - 10 + 'a';

        s[k + 1] = c;
    }

    s[k + 2] = '\0';
    s[0] = '0';
    s[1] = 'x';
}

void int_to_oct(char *s, int n) { // E - C
    unsigned int i = 0;
    char c;
    int k = 0;

    for (int j = 0; j <= 11; j++) {
        if (j != 0) {
            i = (n & 0xE0000000);
            i = i >> 29;
            n = n << 3;
        } else {
            i = (n & 0xC0000000);
            i = i >> 30;
            n = n << 2;
        }

        if (i == 0 && k == 0)
            continue;
        c = i + '0';

        s[k + 2] = c;
        k++;
    }

    s[k + 1] = '\0';
    s[0] = '0';
    s[1] = 'o';
}

void int_to_str(char *s, int n) {
    int i = 0;
    int is_negative = 0;

    if (n < 0) {
        is_negative = 1;

        n = n * -1;

        printf("n1: %d\n", n);
    }

    while (n) {
        char c = (n % 10) + '0';

        printf("c: %d\n", c);

        n = n / 10;

        s[i] = c;

        i++;
    }

    for (int j = 0; j < i / 2; j++) {
        char c = s[j];
        s[j] = s[i - j - 1];
        s[i - j - 1] = c;
    }

    s[i] = '\0';
}

int main(void) {
    char s[] = "0b10000000000000000000000000000000";

    int k = strlen(s);

    int w = strbin_to_int(s, k);

    printf("w: %d\n", w);
    printf("w: %d\n", 2 * w);

    char y[35];
    char z[11];
    char p[15];
    char pa[18];

    int_to_bin(y, w);
    int_to_hex(z, w);
    int_to_oct(p, w);
    int_to_str(pa, w);

    printf("s: %s\n", y);
    printf("s: %s\n", z);
    printf("s: %s\n", p);
    printf("s: %s\n", pa);

    return 0;
}