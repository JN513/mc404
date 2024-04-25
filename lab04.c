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

    s[34] = '\n';
    s[0] = '0';
    s[1] = 'b';
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

    s[k + 2] = '\n';
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

    s[k + 1] = '\n';
    s[0] = '0';
    s[1] = 'o';
}

void int_to_str(char *s, int n) {
    int i = 0;
    int is_negative = 0;

    if (n < 0) {
        is_negative = 1;

        n = n * -1;
    }

    while (n) {
        char c = (n % 10) + '0';

        n = n / 10;

        s[i] = c;

        i++;
    }

    if (is_negative) {
        s[i] = '-';
        i++;
    }

    for (int j = 0; j < i / 2; j++) {
        char c = s[j];
        s[j] = s[i - j - 1];
        s[i - j - 1] = c;
    }

    s[i] = '\n';
}

void uint_to_str(char *s, unsigned int n) {
    int i = 0;

    while (n) {
        char c = (n % 10) + '0';

        n = n / 10;

        s[i] = c;

        i++;
    }

    for (int j = 0; j < i / 2; j++) {
        char c = s[j];
        s[j] = s[i - j - 1];
        s[i - j - 1] = c;
    }

    s[i] = '\n';
}

int inverted_endness(int n) {
    int b1 = n & 0x000000FF;
    int b2 = n & 0x0000FF00;
    int b3 = n & 0x00FF0000;
    int b4 = n & 0xFF000000;

    b1 = b1 << 24;
    b2 = b2 << 8;
    b3 = b3 >> 8;
    b4 = b4 >> 24;

    b1 = b1 & 0xFF000000;
    b2 = b2 & 0x00FF0000;
    b3 = b3 & 0x0000FF00;
    b4 = b4 & 0x000000FF;

    return (unsigned int)b1 | b2 | b3 | b4;
}

int get_type(char *s) {
    if (s[0] == '-') {
        return 4;
    } else if (s[0] == '0') {
        switch (s[1]) {
        case 'b':
            return 1;
            break;
        case 'x':
            return 3;
            break;
        case 'o':
            return 2;
            break;
        }
    }

    return 0;
}

int main() {
    char str[20];
    /* Read up to 20 bytes from the standard input into the str buffer */
    int n = read(STDIN_FD, str, 20);

    int type = get_type(str);
    int _len = len(str);
    int val;

    switch (type) {
    case 0:
        val = strdec_to_int(str, _len, 0);
        break;
    case 1:
        val = strbin_to_int(str, _len);
        break;
    case 2:
        val = stroct_to_int(str, _len);
        break;
    case 3:
        val = strhex_to_int(str, _len);
        break;
    case 4:
        val = -1 * strdec_to_int(str, _len, 1);
        break;
    }

    char binary[35];
    char hex[12];
    char octal[15];
    char decimal[17];
    char invertendless[17];

    unsigned int a = inverted_endness(val);

    int_to_bin(binary, val);
    int_to_hex(hex, val);
    int_to_oct(octal, val);
    // int_to_str(decimal, val);
    uint_to_str(invertendless, a);

    int overflow = 0;
    if (val == -2147483648) {
        val++;
        overflow = 1;
    }
    int_to_str(decimal, val);

    if (overflow == 1) {
        decimal[10] = '8';
    }

    write(STDOUT_FD, binary, 35);
    write(STDOUT_FD, decimal, 17);
    write(STDOUT_FD, invertendless, 15);
    write(STDOUT_FD, hex, 12);
    write(STDOUT_FD, octal, 15);
    return 0;
}

void _start() {
    int ret_code = main();
    exit(ret_code);
}
