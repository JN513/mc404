#define STDIN_FD  0
#define STDOUT_FD 1
 
int read(int __fd, const void *__buf, int __n){
    int ret_val;
  __asm__ __volatile__(
    "mv a0, %1           # file descriptor\n"
    "mv a1, %2           # buffer \n"
    "mv a2, %3           # size \n"
    "li a7, 63           # syscall write code (63) \n"
    "ecall               # invoke syscall \n"
    "mv %0, a0           # move return value to ret_val\n"
    : "=r"(ret_val)  // Output list
    : "r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
  );
  return ret_val;
}

void write(int __fd, const void *__buf, int __n)
{
  __asm__ __volatile__(
    "mv a0, %0           # file descriptor\n"
    "mv a1, %1           # buffer \n"
    "mv a2, %2           # size \n"
    "li a7, 64           # syscall write (64) \n"
    "ecall"
    :   // Output list
    :"r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
  );
}


void exit(int code)
{
  __asm__ __volatile__(
    "mv a0, %0           # return code\n"
    "li a7, 93           # syscall exit (64) \n"
    "ecall"
    :   // Output list
    :"r"(code)    // Input list
    : "a0", "a7"
  );
}





char num_to_charhex(unsigned int num){
	if(num < 10){
		return '0'+num;
	}
	return 'A' + num - 10;

}

int bin_to_hex(unsigned int bin, char result[33]){
	int len = 0;
	result[0] = '0';
	result[1] = 'x';
	for (; (bin / (1 << (len*4))) > 0  && len*4 < 32 ;len++);
	for(int i=0; i < len;i++){
		result[2+len-1-i] = num_to_charhex( (bin >> 4*i) & 0xF);
	}
	result[len+2] = '\n';
	return len+3;
}


void clear(char result[33]){
	for(int i=0; i< 33;i++){
		result[i] = 0;
	}
}
int to_int(char valor[30], int init, int end){
	int len = end - init;

	int resultado = 0;
	int escala = 1;
	for (int i = end; i > init;i--){
		resultado += (valor[i]-'0')*escala;
		escala *= 10;
	}
	if(valor[init] == '-'){
		resultado *= -1;
	}
	return resultado;
}
int extract(int bin, int len, int target){
	return  (((1 << len)-1) & bin)<< target;
}
int main(){
	char input[30];
	int batata = read(STDIN_FD, input, 30);
	int num = 0;
	int numeros[6] = {};
	numeros[0] = to_int(input, 0, 4);
	numeros[1] = to_int(input, 6, 10);
	numeros[2] = to_int(input, 12, 16);
	numeros[3] = to_int(input, 18, 22);
	numeros[4] = to_int(input, 24, 28);
	int n=0;
	char result[33];
	num = extract(numeros[0], 5, 0)
		| extract(numeros[1], 7, 5)
		| extract(numeros[2], 9, 12)
		| extract(numeros[3], 4, 21)
		| extract(numeros[4], 7, 25);
	clear(result);
	n = bin_to_hex(num, result);
	write(STDOUT_FD, result, n);
	return 0;

}

void _start()
{
  int ret_code = main();
  exit(ret_code);
}

