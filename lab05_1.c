#define STDIN_FD 0
#define STDOUT_FD 1

int read(int __fd, const void *__buf, int __n) {
    int ret_val;
    __asm__ __volatile__("mv a0, %1           # file descriptor\n"
                         "mv a1, %2           # buffer \n"
                         "mv a2, %3           # size \n"
                         "li a7, 63           # syscall write code (63) \n"
                         "ecall               # invoke syscall \n"
                         "mv %0, a0           # move return value to ret_val\n"
                         : "=r"(ret_val)                   // Output list
                         : "r"(__fd), "r"(__buf), "r"(__n) // Input list
                         : "a0", "a1", "a2", "a7");
    return ret_val;
}

void write(int __fd, const void *__buf, int __n) {
    __asm__ __volatile__("mv a0, %0           # file descriptor\n"
                         "mv a1, %1           # buffer \n"
                         "mv a2, %2           # size \n"
                         "li a7, 64           # syscall write (64) \n"
                         "ecall"
                         :                                 // Output list
                         : "r"(__fd), "r"(__buf), "r"(__n) // Input list
                         : "a0", "a1", "a2", "a7");
}

void exit(int code) {
    __asm__ __volatile__("mv a0, %0           # return code\n"
                         "li a7, 93           # syscall exit (64) \n"
                         "ecall"
                         :           // Output list
                         : "r"(code) // Input list
                         : "a0", "a7");
}

int len(char *s) {
    char *original = s;

    while (*s != '\n')
        s++;

    return (int)(s - original);
}

void hex_code(int val) {
    char hex[11];
    unsigned int uval = (unsigned int)val, aux;

    hex[0] = '0';
    hex[1] = 'x';
    hex[10] = '\n';

    for (int i = 9; i > 1; i--) {
        aux = uval % 16;
        if (aux >= 10)
            hex[i] = aux - 10 + 'A';
        else
            hex[i] = aux + '0';
        uval = uval / 16;
    }
    write(1, hex, 11);
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

int main() {
    char str[30];

    int n = read(STDIN_FD, str, 30);

    char val1[6] = {str[0], str[1], str[2], str[3], str[4], '\n'};
    char val2[6] = {str[6], str[7], str[8], str[9], str[10], '\n'};
    char val3[6] = {str[12], str[13], str[14], str[15], str[16], '\n'};
    char val4[6] = {str[18], str[19], str[20], str[21], str[22], '\n'};
    char val5[6] = {str[24], str[25], str[26], str[27], str[28], '\n'};

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

    int1 = int1 & 0x0000001F;
    int2 = int2 & 0x0000007F;
    int3 = int3 & 0x000001FF;
    int4 = int4 & 0x0000000F;
    int5 = int5 & 0x0000007F;

    int2 = int2 << 5;
    int3 = int3 << 12;
    int4 = int4 << 21;
    int5 = int5 << 25;

    int r = int1 | int2 | int3 | int4 | int5;
    // int r = int1;
    hex_code(r);

    return 0;
}

void _start() {
    int ret_code = main();
    exit(ret_code);
}
