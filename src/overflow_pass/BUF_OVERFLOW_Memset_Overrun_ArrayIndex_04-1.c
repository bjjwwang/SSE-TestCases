#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[10];
	int a = 0;
    int b = 0;
    srand(time(0));
    int c = rand() % 11;
	//c = [0, 10]
    LOOP:
    if(a < c) {
        a++;
        b = b + 2;
        goto LOOP;
    }
    //a == c
    //b == a * 2
	memset(buffer, 'a', a); //FP
	memset(buffer, 'a', b); //TP
}
