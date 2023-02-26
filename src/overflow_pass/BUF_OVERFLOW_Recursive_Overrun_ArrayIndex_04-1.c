#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int count = 0;

int fib(int i) {
    count++;
    if(i == 0) {
        return 0;
    }
    if(i == 1) {
        return 1;
    }
    return fib(i - 1) + fib(i - 2);
}

int main() {
	int buffer1[16];
	int buffer2[15];
    int i = 5;
    if(i >= 0) {
        fib(i);
		//count == 2 * fib(i + 1) - 1
		buffer1[15] = 1; //FP
        buffer2[15] = 1; //TP
    }
}
