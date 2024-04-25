#include <stdio.h>

int strdec_to_int(char *s, int len, int neg) {
    int r = 0;
    int mod = 1;

    for (int i = len - 1; i >= 0 + neg; i--) {
        r += (s[i] - '0') * (mod);
        mod *= 10;
    }

    return r;
}

int main() {
    char str[30] = "+0001 +0001 -0001 -0001 -0001";

    char val1[6] = {str[0], str[1], str[2], str[3], str[4], '\0'};
    char val2[6] = {str[6], str[7], str[8], str[9], str[10], '\0'};
    char val3[6] = {str[12], str[13], str[14], str[15], str[16], '\0'};
    char val4[6] = {str[18], str[19], str[20], str[21], str[22], '\0'};
    char val5[6] = {str[24], str[25], str[26], str[27], str[28], '\0'};

    int int1, int2, int3, int4, int5;

    if (val1[0] == '-')
        int1 = -1 * strdec_to_int(val1, 5, 1);
    else
        int1 = strdec_to_int(val1, 5, 1);

    if (val2[0] == '-')
        int2 = -1 * strdec_to_int(val2, 5, 1);
    else
        int2 = strdec_to_int(val2, 5, 1);

    if (val3[0] == '-')
        int3 = -1 * strdec_to_int(val3, 5, 1);
    else
        int3 = strdec_to_int(val3, 5, 1);

    if (val4[0] == '-')
        int4 = -1 * strdec_to_int(val4, 5, 1);
    else
        int4 = strdec_to_int(val4, 5, 1);

    if (val5[0] == '-')
        int5 = -1 * strdec_to_int(val5, 5, 1);
    else
        int5 = strdec_to_int(val5, 5, 1);

    printf("int 1: %d %s\n", int1, val1);

    int1 = int1 & 0x0000001F;
    int2 = int2 & 0x0000007F;
    int3 = int3 & 0x000001FF;
    int4 = int4 & 0x0000000F;
    int5 = int5 & 0x0000007F;

    int2 = int2 << 5;
    int3 = int3 << 12;
    int4 = int4 << 21;
    int5 = int5 << 25;

    int r;

    // int r = int1 | int2 | int3 | int4 | int5;
    r = int1;

    printf("out: 0x%08x\n", r);

    return 0;
}
